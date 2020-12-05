<?php
namespace app\model;

use think\Model;

class MongoStu extends Model
{
    protected $table = 'stu';
    // 设置当前模型的数据库连接
    protected $connection = 'db_mongo';

}