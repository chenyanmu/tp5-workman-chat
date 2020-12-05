<?php
namespace app\api\controller;

use think\Controller;
use think\Db;

class Chat extends Controller
{
    //接收者消息列表
    public function get_list(){
        if (request()->isAjax()){
            $fromid = request()->post('id');
            $list = Db::name('communication')->whereOr(['toid'=>$fromid,'fromid'=>$fromid])->field('fromid,toid')->select();
            foreach ($list as $v){
                if ($v['fromid'] != $fromid) $ids[] = $v['fromid'];
                if ($v['toid'] != $fromid) $ids[] = $v['toid'];
            }
            $ids = array_unique($ids);
            $rows = [];
            foreach ($ids as $key => $toid){
                $rows[$key]['fromid'] = $toid;
                $rows[$key]['toid'] = $fromid;
                $rows[$key]['fromname'] = getUserName($toid);
                $rows[$key]['head_url'] = getUserHead($toid);
                $rows[$key]['noReadCount'] = self::get_no_read_count($fromid,$toid);
                $rows[$key]['lastMessage'] = self::get_last_message($fromid,$toid);
            }
            return $rows;
        }
    }

    //获取未读数量
    public function get_no_read_count($fromid,$toid){
        return Db::name('communication')->where(['fromid'=>$toid,'toid'=>$fromid,'to_read'=>0])->count();
    }
    //获取最后一条信息
    public function get_last_message($fromid,$toid){
        $where = [
            'fromid1'=>$fromid,
            'toid1'=>$toid,
            'fromid2'=>$toid,
            'toid2'=>$fromid,
        ];
        return Db::name('communication')
            ->where('(fromid=:fromid1 and toid=:toid1) or (fromid=:fromid2 and toid=:toid2)',$where)
            ->order('id desc')->find();
    }

    //更新未读消息
    public function chang_read(){
        if (request()->isAjax()){
            $data = request()->post();
            $where = [
                'fromid'=>$data['toid'],
                'toid'=>$data['fromid'],
                'to_read'=>0
            ];
            Db::name('communication')->where($where)->update(['to_read'=>1]);
        }
    }
    //发送者保存数据
    public function save_message()
    {
        if (request()->isAjax()){
            $data = request()->post();

            $add = [
                'fromid' => $data['fromid'],
                'fromname' => getUserName($data['fromid']),
                'toid' => $data['toid'],
                'toname' => getUserName($data['toid']),
                'content' => $data['msg'],
                'time' => $data['time'],
                'from_read' => 1,
                'to_read' => 0,
                'type' => 1,
            ];
            Db::name('communication')->insert($add);
        }
    }
    //获取用户头像
    public function get_head(){
        if (request()->isAjax()){
            $fromid = input('fromid');
            $toid = input('toid');
            $from_head = Db::name('user')->where(['id'=>$fromid])->value('headimgurl');
            $to_head = Db::name('user')->where(['id'=>$toid])->value('headimgurl');
            return json(['from_head' => $from_head,'to_head' => $to_head]);
        }
    }

    //获取用户名称
    public function get_name(){
        if (request()->isAjax()){
            $toid = input('toid');
            $to_name = Db::name('user')->where(['id'=>$toid])->value('nickname');
            return json(['to_name' => $to_name]);
        }
    }

    //加载聊天信息
    public function message_load() {
        if (request()->isAjax()){
            $fromid = input('fromid');
            $toid = input('toid');
            $where = [
                'fromid1'=>$fromid,
                'toid1'=>$toid,
                'fromid2'=>$toid,
                'toid2'=>$fromid,
            ];
            $list = Db::name('communication')
                ->where('(fromid=:fromid1 and toid=:toid1) or (fromid=:fromid2 and toid=:toid2)',$where)
                ->order('id desc')->limit(10)->column('*','id');
            sort($list);
            return $list;

        }
    }

    //上传图片
    public function uploadImg(){
        if (request()->isAjax()){
            $file = request()->file('file');
            $data = request()->post();

            $info = $file->getInfo();
            $suffix = strrchr($info['name'],'.');

            $path = './uploads';
            $savename = 'chat_img_'.time().$suffix;
            $res = $file->move($path,$savename);
            if ($res){
                $add = [
                    'fromid' => $data['fromid'],
                    'fromname' => getUserName($data['fromid']),
                    'toid' => $data['toid'],
                    'toname' => getUserName($data['toid']),
                    'content' => $path.'/'.$savename,
                    'time' => time(),
                    'from_read' => 1,
                    'to_read' => 0,
                    'type' => 2,
                ];
                $info = Db::name('communication')->insert($add);
                if ($info){
                    return json(['status'=>1,'msg'=>'上传成功','img'=>$add['content']]);
                }else{
                    return json(['status'=>-1,'msg'=>'上传失败']);
                }

            }
        }
    }


}
