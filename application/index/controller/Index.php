<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        $p = session('name', '', 'think');
        $fromid = input('fromid');
        $toid = input('toid');
        $this->assign('fromid',$fromid);
        $this->assign('toid',$toid);
        $this->assign('toname',getUserName($toid));
        return $this->fetch();
    }

    public function lists(){

        $fromid = input('fromid');
        $this->assign('fromid',$fromid);
        $this->assign('fromname',getUserName($fromid));
        return $this->fetch();
    }

    public function session(){
        session('name', '你好', 'think');
    }

}
