/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : message

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2019-01-18 14:14:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_response`
-- ----------------------------
DROP TABLE IF EXISTS `tb_response`;
CREATE TABLE `tb_response` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `w_id` int(11) NOT NULL,
  `re_name` varchar(255) NOT NULL COMMENT '回复者',
  `re_message` text NOT NULL COMMENT '回复内容',
  `re_time` date NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_response
-- ----------------------------
INSERT INTO `tb_response` VALUES ('12', '9', '笔芯', '你好，留言留言', '2018-03-23');
INSERT INTO `tb_response` VALUES ('14', '3', '笔芯', '你好，小蜜蜂，我是笔芯', '2018-03-26');
INSERT INTO `tb_response` VALUES ('15', '15', '笔芯', '你好，广石化。我是笔芯', '2018-03-29');
INSERT INTO `tb_response` VALUES ('18', '6', '笔芯', '你好，苹果，我是笔芯', '2018-03-29');
INSERT INTO `tb_response` VALUES ('19', '13', '笔芯', '你好，搜狗。很高兴认识你，我是笔芯', '2018-03-29');
INSERT INTO `tb_response` VALUES ('20', '4', '笔芯', '你好，小百合', '2018-03-29');

-- ----------------------------
-- Table structure for `tb_writer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_writer`;
CREATE TABLE `tb_writer` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `w_name` varchar(255) NOT NULL COMMENT '留言人',
  `w_email` varchar(255) DEFAULT NULL COMMENT '留言者邮箱',
  `w_theme` varchar(255) NOT NULL COMMENT '留言主题',
  `w_message` text NOT NULL COMMENT '留言内容',
  `w_time` date NOT NULL COMMENT '留言时间',
  `answer` varchar(255) NOT NULL COMMENT '是否已回复',
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_writer
-- ----------------------------
INSERT INTO `tb_writer` VALUES ('3', '小蜜蜂', '7889@qq.com', '小蜜蜂打招呼', '小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂，小蜜蜂', '2018-03-20', '是');
INSERT INTO `tb_writer` VALUES ('4', '小百合', '455@qq.com', '小百合打招呼', '小百合小百合小百合小百合小百合小百合小百合小百合小百合小百合小百合小百合小百合小百合', '2018-03-20', '是');
INSERT INTO `tb_writer` VALUES ('6', '苹果', '785@qq.com', '苹果打招呼', '苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果', '2018-03-21', '是');
INSERT INTO `tb_writer` VALUES ('9', '留言', '44@qq.com', '留言打招呼', '留言留言留言留言留言留言留言留言留言留言留言留言留言', '2018-03-21', '是');
INSERT INTO `tb_writer` VALUES ('10', '企鹅', '15315@qq.com', '企鹅打招呼', '企鹅，企鹅，企鹅，企鹅，企鹅，企鹅，企鹅，企鹅，企鹅，企鹅，企鹅，企鹅', '2018-03-26', '否');
INSERT INTO `tb_writer` VALUES ('11', '花朵', '588585@qq.com', '花朵花朵花朵花朵花朵花朵花朵花朵花朵', '花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵花朵', '2018-03-29', '否');
INSERT INTO `tb_writer` VALUES ('12', '谷歌', '15315@qq.com', '谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌', '谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌谷歌', '2018-03-29', '否');
INSERT INTO `tb_writer` VALUES ('13', '搜狗', '85225@qq.com', '搜狗搜狗搜狗搜狗搜狗', '搜狗搜狗搜狗搜狗搜狗搜狗搜狗搜狗搜狗搜狗搜狗搜狗搜狗', '2018-03-29', '是');
INSERT INTO `tb_writer` VALUES ('14', '校园', '15315@qq.com', '校园校园校园校园校园', '校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园校园', '2018-03-29', '否');
INSERT INTO `tb_writer` VALUES ('15', '广石化', '588585@qq.com', '广石化广石化', '广石化广石化广石化广石化广石化广石化广石化广石化广石化广石化', '2018-03-29', '否');
INSERT INTO `tb_writer` VALUES ('16', '沙漏', '85225@qq.com', '你好沙漏沙漏', '沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏沙漏', '2018-03-29', '否');
INSERT INTO `tb_writer` VALUES ('17', '溜溜', '85225@qq.com', '溜溜溜溜', '溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜溜', '2018-03-29', '否');
