<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Db;

if (!function_exists('p')){
    // 应用公共文件
    function p($param){
        echo '<pre>';
        if (is_array($param)) {
            print_r($param);
        }elseif (is_object($param)){
            print_r($param->toArray());
        }else{
            echo $param;
        }
        exit;
    }

}


if (!function_exists('getUserName')) {
    //获取用户名称
    function getUserName($id)
    {
        return Db::name('user')->where(['id' => $id])->value('nickname');
    }
}


if (!function_exists('getUserHead')) {
    //获取用户名称
    function getUserHead($id)
    {
        return Db::name('user')->where(['id' => $id])->value('headimgurl');
    }
}