/*
 Navicat Premium Data Transfer

 Source Server         : 3306
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : chat

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 05/12/2020 19:57:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_communication
-- ----------------------------
DROP TABLE IF EXISTS `chat_communication`;
CREATE TABLE `chat_communication`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromid` int(5) NOT NULL,
  `fromname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `toid` int(5) NOT NULL,
  `toname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(10) NOT NULL,
  `shopid` int(5) NULL DEFAULT NULL,
  `from_read` tinyint(2) NULL DEFAULT 0,
  `to_read` tinyint(2) NULL DEFAULT 0,
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '1是普通文本，2是图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_communication
-- ----------------------------
INSERT INTO `chat_communication` VALUES (110, 87, '白熊', 85, '小仙女', '小仙女在吗', 1602258215, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (111, 85, '小仙女', 87, '白熊', '干啥', 1602259406, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (112, 87, '白熊', 85, '小仙女', '没呢', 1602259487, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (113, 87, '白熊', 85, '小仙女', '？', 1602259507, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (114, 87, '白熊', 85, '小仙女', '怎么就没了呢/', 1602259519, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (115, 87, '白熊', 85, '小仙女', 'sd ', 1602259573, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (116, 87, '白熊', 85, '小仙女', '123', 1602259586, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (117, 87, '白熊', 85, '小仙女', '保存了下', 1602259728, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (118, 87, '白熊', 85, '小仙女', '现在呢', 1602259736, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (119, 87, '白熊', 85, '小仙女', '你现在应该不在聊天页中吧', 1602259762, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (120, 85, '小仙女', 87, '白熊', '好的', 1602260021, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (121, 87, '白熊', 85, '小仙女', '干嘛', 1602305248, NULL, 1, 1, 1);
INSERT INTO `chat_communication` VALUES (122, 86, '小肥宅', 85, '小仙女', '11', 1602305364, NULL, 1, 1, 1);

-- ----------------------------
-- Table structure for chat_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_user`;
CREATE TABLE `chat_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `subscribe` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关注',
  `subscribe_time` int(10) NULL DEFAULT NULL COMMENT '关注时间',
  `unsubscribe_time` int(10) NULL DEFAULT NULL COMMENT '取消关注时间',
  `relname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `signature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个性签名',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `is_bind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否绑定',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用语言',
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `group_id` int(10) NULL DEFAULT 0 COMMENT '分组ID',
  `groupid` int(11) NOT NULL DEFAULT 0 COMMENT '公众号分组标识',
  `tagid_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `score` int(10) NULL DEFAULT 0 COMMENT '积分',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金钱',
  `latitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `location_precision` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '精度',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0:公众号粉丝1：注册会员',
  `unionid` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'unionid字段',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `last_time` int(10) NULL DEFAULT 586969200 COMMENT '最后交互时间',
  `parentid` int(10) NULL DEFAULT 1 COMMENT '非扫码用户默认都是1',
  `isfenxiao` int(8) NULL DEFAULT 0 COMMENT '是否为分销，默认为0，1,2,3，分别为1,2,3级分销',
  `totle_earn` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '挣钱总额',
  `balance` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '分销挣的剩余未提现额',
  `fenxiao_leavel` int(8) NULL DEFAULT 2 COMMENT '分销等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号粉丝表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_user
-- ----------------------------
INSERT INTO `chat_user` VALUES (85, 1, 'oYxpK0bPptICGQd3YP_1s7jfDTmE', '小仙女', '/static/newcj/img/zhangsan.jpg', 1, 1, 1517280919, 1517280912, NULL, NULL, NULL, 0, 'zh_CN', '中国', '江西', '赣州', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 1517478028, 1, 0, 26.00, 26.00, 2);
INSERT INTO `chat_user` VALUES (86, 1, 'oYxpK0W2u3Sbbp-wevdQtCuviDVM', '小肥宅', '/static/newcj/img/lisi.jpg', 2, 1, 1507261446, NULL, NULL, NULL, NULL, 0, 'zh_CN', '中国', '河南', '焦作', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 586969200, 1, 0, 0.00, 0.00, 2);
INSERT INTO `chat_user` VALUES (87, 1, 'oYxpK0RsvcwgS9DtmIOuyb_BgJbo', '白熊', '/static/newcj/img/wangwu.jpg', 1, 1, 1508920878, NULL, NULL, NULL, NULL, 0, 'zh_CN', '中国', '河南', '商丘', '', 0, 0, '[]', 0, 0.00, NULL, NULL, NULL, 0, NULL, NULL, 586969200, 1, 0, 0.00, 0.00, 2);

SET FOREIGN_KEY_CHECKS = 1;
