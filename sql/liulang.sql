/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : liulang

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 19/03/2023 16:49:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_animal
-- ----------------------------
DROP TABLE IF EXISTS `app_animal`;
CREATE TABLE `app_animal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动物id',
  `sid` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动物名字',
  `sex` bit(1) NOT NULL DEFAULT b'0' COMMENT '动物性别',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物头像',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `year` tinyint(2) NULL DEFAULT NULL COMMENT '动物年龄',
  `s1` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展1',
  `s2` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动物信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_animal
-- ----------------------------
INSERT INTO `app_animal` VALUES (4, 1, 'das', b'0', '11', '2023-03-08 00:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for app_animal_state
-- ----------------------------
DROP TABLE IF EXISTS `app_animal_state`;
CREATE TABLE `app_animal_state`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` bigint(20) NOT NULL COMMENT '动物id',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '动物领养人id',
  `bid` bigint(20) NULL DEFAULT NULL COMMENT '救助基地id',
  `hid` bigint(20) NULL DEFAULT NULL COMMENT '动物医院id',
  `s1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `foreign_key_animal_id`(`aid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动物状态关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_animal_state
-- ----------------------------
INSERT INTO `app_animal_state` VALUES (2, 4, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for app_animal_state_data
-- ----------------------------
DROP TABLE IF EXISTS `app_animal_state_data`;
CREATE TABLE `app_animal_state_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物状态标题',
  `s1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动物状态信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_animal_state_data
-- ----------------------------
INSERT INTO `app_animal_state_data` VALUES (1, '正在流浪', NULL);
INSERT INTO `app_animal_state_data` VALUES (2, '正在救助', NULL);
INSERT INTO `app_animal_state_data` VALUES (3, '生病中', NULL);
INSERT INTO `app_animal_state_data` VALUES (4, '已被救助', NULL);
INSERT INTO `app_animal_state_data` VALUES (5, '已有家', NULL);

-- ----------------------------
-- Table structure for app_collection
-- ----------------------------
DROP TABLE IF EXISTS `app_collection`;
CREATE TABLE `app_collection`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `pid` bigint(20) NOT NULL COMMENT '帖子id',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of app_collection
-- ----------------------------
INSERT INTO `app_collection` VALUES (3, 1, 5, '2023-03-18 19:42:51');

-- ----------------------------
-- Table structure for app_comments
-- ----------------------------
DROP TABLE IF EXISTS `app_comments`;
CREATE TABLE `app_comments`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `to_id` bigint(20) NULL DEFAULT NULL COMMENT '被评论id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '被评论帖子id',
  `content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `image` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `aid` bigint(20) NULL DEFAULT NULL COMMENT '动物id',
  `like_number` int(11) NULL DEFAULT NULL COMMENT '点赞数量',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `fk_post_id`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comments
-- ----------------------------
INSERT INTO `app_comments` VALUES (1, NULL, 1, '<p>sasas</p>', NULL, 100, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for app_comments_like
-- ----------------------------
DROP TABLE IF EXISTS `app_comments_like`;
CREATE TABLE `app_comments_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` bigint(20) NULL DEFAULT NULL COMMENT '评论id',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论点赞表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of app_comments_like
-- ----------------------------

-- ----------------------------
-- Table structure for app_concern
-- ----------------------------
DROP TABLE IF EXISTS `app_concern`;
CREATE TABLE `app_concern`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `to_uid` bigint(20) NULL DEFAULT NULL COMMENT '被关注用户id',
  `to_aid` bigint(20) NULL DEFAULT NULL COMMENT '被关注动物id',
  `to_tid` int(11) NULL DEFAULT NULL COMMENT '被关注的话题',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of app_concern
-- ----------------------------
INSERT INTO `app_concern` VALUES (2, 100, 1, NULL, NULL, '2023-03-17 15:22:54');
INSERT INTO `app_concern` VALUES (4, 100, 115, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for app_donation
-- ----------------------------
DROP TABLE IF EXISTS `app_donation`;
CREATE TABLE `app_donation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '捐赠id',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `to_uid` bigint(20) NULL DEFAULT NULL COMMENT '被捐赠用户id',
  `amount` float NULL DEFAULT NULL COMMENT '金额',
  `create_date` datetime NULL DEFAULT NULL COMMENT '捐赠时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '捐赠表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_donation
-- ----------------------------

-- ----------------------------
-- Table structure for app_head
-- ----------------------------
DROP TABLE IF EXISTS `app_head`;
CREATE TABLE `app_head`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT 'postid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of app_head
-- ----------------------------
INSERT INTO `app_head` VALUES (1, 6);
INSERT INTO `app_head` VALUES (2, 8);
INSERT INTO `app_head` VALUES (3, 9);
INSERT INTO `app_head` VALUES (4, 12);

-- ----------------------------
-- Table structure for app_like
-- ----------------------------
DROP TABLE IF EXISTS `app_like`;
CREATE TABLE `app_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `pid` bigint(20) NOT NULL COMMENT '动态id',
  `create_date` datetime NULL DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点赞表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of app_like
-- ----------------------------
INSERT INTO `app_like` VALUES (13, 100, 6, '2023-03-17 16:38:05');
INSERT INTO `app_like` VALUES (18, 1, 5, '2023-03-18 19:41:21');
INSERT INTO `app_like` VALUES (22, 100, 7, '2023-03-18 19:58:15');
INSERT INTO `app_like` VALUES (21, 100, 5, '2023-03-18 19:58:12');
INSERT INTO `app_like` VALUES (23, 1, 7, '2023-03-19 10:38:53');
INSERT INTO `app_like` VALUES (20, 1, 10, '2023-03-18 19:41:29');

-- ----------------------------
-- Table structure for app_message
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message`  (
  `id` bigint(20) NOT NULL COMMENT '消息id',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `to_uid` bigint(20) NULL DEFAULT NULL COMMENT '收消息用户id',
  `content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '帖子id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型id',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_message
-- ----------------------------

-- ----------------------------
-- Table structure for app_message_type
-- ----------------------------
DROP TABLE IF EXISTS `app_message_type`;
CREATE TABLE `app_message_type`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_message_type
-- ----------------------------

-- ----------------------------
-- Table structure for app_post
-- ----------------------------
DROP TABLE IF EXISTS `app_post`;
CREATE TABLE `app_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 动态id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动态标题',
  `content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '动态内容',
  `image` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '动态图片',
  `video` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '动态视频',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `tid` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `aid` bigint(20) NULL DEFAULT NULL COMMENT '动物id',
  `location` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '具体位置',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `urgent` int(1) NULL DEFAULT NULL COMMENT '紧急程度',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '动态类型',
  `like_number` int(11) NULL DEFAULT 0 COMMENT '点赞数量',
  `collection_number` int(11) NULL DEFAULT 0 COMMENT '收藏数量',
  `comments_number` int(11) NULL DEFAULT 0 COMMENT '评论数量',
  `url` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '链接',
  `s1` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_post
-- ----------------------------
INSERT INTO `app_post` VALUES (6, '测试', '<p>DASDA</p>', '/profile/upload/2023/03/10/profile_20230310165750A005.jpg', '/profile/upload/2023/03/10/hh.mp4', NULL, NULL, 100, 1, 4, NULL, NULL, 0, 1, 1, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (5, '测试测试', '<p>啊哈哈的哈</p>', '/profile/upload/2023/03/10/4caa248fedb54959bfb062bb22c1f534_20230310165738A004.png', '/profile/upload/2023/03/10/hh1.mp4', '2023-03-06 00:00:00', '2023-03-06 00:00:00', 100, NULL, NULL, NULL, NULL, 0, 1, 2, 1, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (7, 'DADASFS', '<p><br></p>', '/profile/upload/2023/03/10/profile_20230310165750A005.jpg', '/profile/upload/2023/03/10/hh.mp4', NULL, NULL, 115, NULL, NULL, NULL, NULL, 0, 1, 2, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (8, 'DASDFDGF', '<p>DSSD</p>', '/profile/upload/2023/03/10/4caa248fedb54959bfb062bb22c1f534_20230310165738A004.png', '/profile/upload/2023/03/10/hh1.mp4', NULL, NULL, 100, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (9, 'DASDADVFDF', '<p>DASDA</p>', '/profile/upload/2023/03/10/profile_20230310165750A005.jpg', '/profile/upload/2023/03/10/hh2.mp4', NULL, NULL, 115, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (10, '测试', '<p>DASDA</p>', '/profile/upload/2023/03/10/4caa248fedb54959bfb062bb22c1f534_20230310165738A004.png', '/profile/upload/2023/03/10/hh3.mp4', NULL, NULL, 115, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (11, '测试测试', '<p>啊哈哈的哈</p>', '/profile/upload/2023/03/10/profile_20230310165750A005.jpg', NULL, '2023-03-06 00:00:00', '2023-03-06 00:00:00', 115, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (12, 'DADASFS', '<p><br></p>', '/profile/upload/2023/03/10/profile_20230310165750A005.jpg', NULL, NULL, NULL, 115, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (13, 'DASDFDGF', '<p>DSSD</p>', '/profile/upload/2023/03/10/4caa248fedb54959bfb062bb22c1f534_20230310165738A004.png', NULL, NULL, NULL, 115, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL);
INSERT INTO `app_post` VALUES (14, 'DASDADVFDF', '<p>DASDA</p>', '/profile/upload/2023/03/10/profile_20230310165750A005.jpg', NULL, NULL, NULL, 115, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for app_post_type
-- ----------------------------
DROP TABLE IF EXISTS `app_post_type`;
CREATE TABLE `app_post_type`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动态类型名字',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态类型id',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动态类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_post_type
-- ----------------------------
INSERT INTO `app_post_type` VALUES ('求助', 1, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('晒图', 2, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('提问', 3, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('求助', 4, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('晒图', 5, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('求助', 6, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('晒图', 7, '/profile/upload/2023/02/24/sharpicons_Bee.png');
INSERT INTO `app_post_type` VALUES ('求助', 8, '/profile/upload/2023/02/24/sharpicons_Bee.png');

-- ----------------------------
-- Table structure for app_topic
-- ----------------------------
DROP TABLE IF EXISTS `app_topic`;
CREATE TABLE `app_topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_topic
-- ----------------------------
INSERT INTO `app_topic` VALUES (1, '哈哈哈');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'app_animal_state_data', '动物状态信息表', NULL, NULL, 'AppAnimalStateData', 'crud', 'com.ruoyi.app', 'app', 'animal_state_data', '动物状态信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-02-28 15:45:58', '', '2023-03-16 15:25:38', NULL);
INSERT INTO `gen_table` VALUES (4, 'app_collection', '收藏表', NULL, NULL, 'AppCollection', 'crud', 'com.ruoyi.app', 'app', 'collection', '收藏', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:57', NULL);
INSERT INTO `gen_table` VALUES (5, 'app_comments', '评论表', NULL, NULL, 'AppComments', 'crud', 'com.ruoyi.app', 'app', 'comments', '评论', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12', NULL);
INSERT INTO `gen_table` VALUES (6, 'app_comments_like', '评论点赞表', NULL, NULL, 'AppCommentsLike', 'crud', 'com.ruoyi.app', 'app', 'comments_like', '评论点赞', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:26', NULL);
INSERT INTO `gen_table` VALUES (7, 'app_concern', '关注表', NULL, NULL, 'AppConcern', 'crud', 'com.ruoyi.app', 'app', 'concern', '关注', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33', NULL);
INSERT INTO `gen_table` VALUES (8, 'app_donation', '捐赠表', NULL, NULL, 'AppDonation', 'crud', 'com.ruoyi.app', 'app', 'donation', '捐赠', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41', NULL);
INSERT INTO `gen_table` VALUES (9, 'app_like', '点赞表', NULL, NULL, 'AppLike', 'crud', 'com.ruoyi.app', 'app', 'like', '点赞', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:12', NULL);
INSERT INTO `gen_table` VALUES (10, 'app_message', '消息表', NULL, NULL, 'AppMessage', 'crud', 'com.ruoyi.app', 'app', 'message', '消息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57', NULL);
INSERT INTO `gen_table` VALUES (11, 'app_message_type', '信息类型表', NULL, NULL, 'AppMessageType', 'crud', 'com.ruoyi.app', 'app', 'message_type', '信息类型', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:12', NULL);
INSERT INTO `gen_table` VALUES (12, 'app_post', '动态表', NULL, NULL, 'AppPost', 'crud', 'com.ruoyi.app', 'app', 'post', '动态', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18', NULL);
INSERT INTO `gen_table` VALUES (14, 'app_topic', '话题表', NULL, NULL, 'AppTopic', 'crud', 'com.ruoyi.app', 'app', 'topic', '话题', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:39', NULL);
INSERT INTO `gen_table` VALUES (15, 'user_data', '用户数据扩展表', NULL, NULL, 'UserData', 'crud', 'com.ruoyi.app', 'app', 'user_data', '用户数据扩展', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51', NULL);
INSERT INTO `gen_table` VALUES (16, 'user_type', '用户类型表', NULL, NULL, 'UserType', 'crud', 'com.ruoyi.app', 'app', 'user_type', '用户类型', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:49:01', NULL);
INSERT INTO `gen_table` VALUES (17, 'app_animal', '动物信息表', NULL, NULL, 'AppAnimal', 'crud', 'com.ruoyi.app', 'app', 'animal', '动物信息', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35', NULL);
INSERT INTO `gen_table` VALUES (18, 'app_animal_state', '动物状态关联表', NULL, NULL, 'AppAnimalState', 'crud', 'com.ruoyi.app', 'app', 'animal_state', '动物状态关联', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21', NULL);
INSERT INTO `gen_table` VALUES (19, 'app_post_type', '动态类型表', NULL, NULL, 'AppPostType', 'crud', 'com.ruoyi.app', 'app', 'post_type', '动态类型', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-14 19:14:21', '', '2023-03-14 19:15:56', NULL);
INSERT INTO `gen_table` VALUES (20, 'app_head', '公告', NULL, NULL, 'AppHead', 'crud', 'com.ruoyi.app', 'app', 'head', '公告', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-03-16 09:03:19', '', '2023-03-16 09:04:02', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (16, '3', 'id', '状态id', 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-03-16 15:25:38');
INSERT INTO `gen_table_column` VALUES (17, '3', 'title', '动物状态标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-03-16 15:25:38');
INSERT INTO `gen_table_column` VALUES (18, '3', 's1', '扩展1', 'varchar(255)', 'String', 's1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-03-16 15:25:38');
INSERT INTO `gen_table_column` VALUES (19, '4', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:57');
INSERT INTO `gen_table_column` VALUES (20, '4', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:57');
INSERT INTO `gen_table_column` VALUES (21, '4', 'pid', '帖子id', 'bigint(20)', 'Long', 'pid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:57');
INSERT INTO `gen_table_column` VALUES (22, '4', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:57');
INSERT INTO `gen_table_column` VALUES (23, '5', 'id', '评论id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (24, '5', 'to_id', '被评论id', 'bigint(20)', 'Long', 'toId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (25, '5', 'pid', '被评论帖子id', 'bigint(20)', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (26, '5', 'content', '内容', 'tinytext', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (27, '5', 'image', '图片', 'tinytext', 'String', 'image', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 5, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (28, '5', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (29, '5', 'aid', '动物id', 'bigint(20)', 'Long', 'aid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (30, '5', 'like_number', '点赞数量', 'int(11)', 'Long', 'likeNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (31, '5', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:12');
INSERT INTO `gen_table_column` VALUES (32, '6', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:26');
INSERT INTO `gen_table_column` VALUES (33, '6', 'cid', '评论id', 'bigint(20)', 'Long', 'cid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:26');
INSERT INTO `gen_table_column` VALUES (34, '6', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:26');
INSERT INTO `gen_table_column` VALUES (35, '7', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33');
INSERT INTO `gen_table_column` VALUES (36, '7', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33');
INSERT INTO `gen_table_column` VALUES (37, '7', 'to_uid', '被关注用户id', 'bigint(20)', 'Long', 'toUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33');
INSERT INTO `gen_table_column` VALUES (38, '7', 'to_aid', '被关注动物id', 'bigint(20)', 'Long', 'toAid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33');
INSERT INTO `gen_table_column` VALUES (39, '7', 'to_tid', '被关注的话题', 'int(11)', 'Long', 'toTid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33');
INSERT INTO `gen_table_column` VALUES (40, '7', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:33');
INSERT INTO `gen_table_column` VALUES (41, '8', 'id', '捐赠id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41');
INSERT INTO `gen_table_column` VALUES (42, '8', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41');
INSERT INTO `gen_table_column` VALUES (43, '8', 'to_uid', '被捐赠用户id', 'bigint(20)', 'Long', 'toUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41');
INSERT INTO `gen_table_column` VALUES (44, '8', 'amount', '金额', 'float', 'Long', 'amount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41');
INSERT INTO `gen_table_column` VALUES (45, '8', 'create_date', '捐赠时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41');
INSERT INTO `gen_table_column` VALUES (46, '8', 'title', '说明', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:41');
INSERT INTO `gen_table_column` VALUES (47, '9', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:12');
INSERT INTO `gen_table_column` VALUES (48, '9', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:12');
INSERT INTO `gen_table_column` VALUES (49, '9', 'pid', '动态id', 'bigint(20)', 'Long', 'pid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:12');
INSERT INTO `gen_table_column` VALUES (50, '9', 'create_date', '点赞时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-03-01 16:11:12');
INSERT INTO `gen_table_column` VALUES (51, '10', 'id', '消息id', 'bigint(20)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (52, '10', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (53, '10', 'to_uid', '收消息用户id', 'bigint(20)', 'Long', 'toUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (54, '10', 'content', '内容', 'tinytext', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (55, '10', 'pid', '帖子id', 'bigint(20)', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (56, '10', 'type_id', '类型id', 'int(11)', 'Long', 'typeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (57, '10', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:47:57');
INSERT INTO `gen_table_column` VALUES (58, '11', 'id', 'id', 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:12');
INSERT INTO `gen_table_column` VALUES (59, '11', 'name', '名字', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:12');
INSERT INTO `gen_table_column` VALUES (60, '12', 'id', ' 动态id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (61, '12', 'title', '动态标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (62, '12', 'content', '动态内容', 'tinytext', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (63, '12', 'image', '动态图片', 'tinytext', 'String', 'image', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (64, '12', 'video', '动态视频', 'tinytext', 'String', 'video', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (65, '12', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (66, '12', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (67, '12', 'uid', '用户id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (68, '12', 'tid', '话题id', 'int(11)', 'Long', 'tid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (69, '12', 'aid', '动物id', 'bigint(20)', 'Long', 'aid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (70, '12', 'location', '具体位置', 'tinytext', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (71, '12', 'city', '城市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (72, '12', 'urgent', '紧急程度', 'int(1)', 'Integer', 'urgent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (73, '12', 'type_id', '动态类型', 'int(11)', 'Long', 'typeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (74, '12', 'like_number', '点赞数量', 'int(11)', 'Long', 'likeNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (75, '12', 'collection_number', '收藏数量', 'int(11)', 'Long', 'collectionNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (76, '12', 'comments_number', '评论数量', 'int(11)', 'Long', 'commentsNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (77, '12', 'url', '链接', 'tinytext', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 18, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (78, '12', 's1', '扩展1', 'tinytext', 'String', 's1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 19, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:18');
INSERT INTO `gen_table_column` VALUES (81, '14', 'id', '话题id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:39');
INSERT INTO `gen_table_column` VALUES (82, '14', 'title', '话题名字', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:39');
INSERT INTO `gen_table_column` VALUES (83, '15', 'uid', 'user_id', 'bigint(20)', 'Long', 'uid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51');
INSERT INTO `gen_table_column` VALUES (84, '15', 'desc', '描述', 'varchar(255)', 'String', 'desc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51');
INSERT INTO `gen_table_column` VALUES (85, '15', 'year', '年龄', 'int(2)', 'Integer', 'year', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51');
INSERT INTO `gen_table_column` VALUES (86, '15', 'to_uid', '属于某用户', 'int(11)', 'Long', 'toUid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51');
INSERT INTO `gen_table_column` VALUES (87, '15', 's1', '扩展1', 'tinytext', 'String', 's1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51');
INSERT INTO `gen_table_column` VALUES (88, '15', 's2', '扩展2', 'tinytext', 'String', 's2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:48:51');
INSERT INTO `gen_table_column` VALUES (89, '16', 'id', 'id', 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:49:01');
INSERT INTO `gen_table_column` VALUES (90, '16', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-28 15:45:58', '', '2023-02-28 15:49:01');
INSERT INTO `gen_table_column` VALUES (91, '17', 'id', '动物id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (92, '17', 'sid', '动物状态id', 'bigint(20)', 'Long', 'sid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (93, '17', 'name', '动物名字', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (94, '17', 'sex', '动物性别', 'bit(1)', 'Integer', 'sex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (95, '17', 'icon', '动物头像', 'varchar(255)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (96, '17', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (97, '17', 'year', '动物年龄', 'tinyint(2)', 'Integer', 'year', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (98, '17', 's1', '扩展1', 'tinytext', 'String', 's1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (99, '17', 's2', '扩展2', 'tinytext', 'String', 's2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:25:35');
INSERT INTO `gen_table_column` VALUES (100, '18', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21');
INSERT INTO `gen_table_column` VALUES (101, '18', 'aid', '动物id', 'bigint(20)', 'Long', 'aid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21');
INSERT INTO `gen_table_column` VALUES (102, '18', 'uid', '动物领养人id', 'bigint(20)', 'Long', 'uid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21');
INSERT INTO `gen_table_column` VALUES (103, '18', 'bid', '救助基地id', 'bigint(20)', 'Long', 'bid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21');
INSERT INTO `gen_table_column` VALUES (104, '18', 'hid', '动物医院id', 'bigint(20)', 'Long', 'hid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21');
INSERT INTO `gen_table_column` VALUES (105, '18', 's1', '扩展1', 'varchar(255)', 'String', 's1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-01 09:24:35', '', '2023-03-01 09:26:21');
INSERT INTO `gen_table_column` VALUES (106, '19', 'name', '动态类型名字', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 1, 'admin', '2023-03-14 19:14:21', '', '2023-03-14 19:15:56');
INSERT INTO `gen_table_column` VALUES (107, '19', 'id', '动态类型id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2023-03-14 19:14:21', '', '2023-03-14 19:15:56');
INSERT INTO `gen_table_column` VALUES (108, '19', 'icon', '头像', 'varchar(255)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-14 19:14:21', '', '2023-03-14 19:15:56');
INSERT INTO `gen_table_column` VALUES (109, '20', 'id', 'id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-16 09:03:19', '', '2023-03-16 09:04:02');
INSERT INTO `gen_table_column` VALUES (110, '20', 'pid', 'postid', 'bigint(20)', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-16 09:03:19', '', '2023-03-16 09:04:02');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-28 15:42:01', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-28 15:42:01', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-02-28 15:42:01', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-02-28 15:42:01', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-02-28 15:42:01', 'admin', '2023-03-02 11:44:22', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-02-28 15:42:01', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '动物管理', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-28 15:41:58', 'admin', '2023-03-01 10:08:40');
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '基地管理', 0, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-01 10:09:04', 'admin', '2023-03-01 10:09:41');
INSERT INTO `sys_dept` VALUES (111, 100, '0,100', '普通用户', 1, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-01 10:09:56', '', NULL);
INSERT INTO `sys_dept` VALUES (112, 100, '0,100', '动物医院', 2, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-01 10:10:23', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-02-28 15:42:01', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-02-28 15:42:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-02-28 15:42:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-02-28 15:42:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'asd12300', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-28 15:43:07');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-28 15:43:20');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-28 15:59:47');
INSERT INTO `sys_logininfor` VALUES (103, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-28 15:59:57');
INSERT INTO `sys_logininfor` VALUES (104, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 09:23:39');
INSERT INTO `sys_logininfor` VALUES (105, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-01 09:23:46');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 09:23:56');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 11:01:17');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 14:16:00');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 15:12:28');
INSERT INTO `sys_logininfor` VALUES (110, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 15:48:14');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '10.1.65.75', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 15:59:07');
INSERT INTO `sys_logininfor` VALUES (112, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-01 16:10:42');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-01 16:10:49');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 11:43:34');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 11:46:49');
INSERT INTO `sys_logininfor` VALUES (116, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 11:54:04');
INSERT INTO `sys_logininfor` VALUES (117, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '对不起，您的账号：17554222337 已停用', '2023-03-02 11:54:49');
INSERT INTO `sys_logininfor` VALUES (118, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '对不起，您的账号：17554222337 已停用', '2023-03-02 11:55:08');
INSERT INTO `sys_logininfor` VALUES (119, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-02 14:04:32');
INSERT INTO `sys_logininfor` VALUES (120, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:04:40');
INSERT INTO `sys_logininfor` VALUES (121, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 14:04:58');
INSERT INTO `sys_logininfor` VALUES (122, '19863735857', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:16:53');
INSERT INTO `sys_logininfor` VALUES (123, '19863735857', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '对不起，您的账号：19863735857 已停用', '2023-03-02 14:23:08');
INSERT INTO `sys_logininfor` VALUES (124, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-02 14:26:21');
INSERT INTO `sys_logininfor` VALUES (125, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-02 14:26:23');
INSERT INTO `sys_logininfor` VALUES (126, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-03-02 14:26:50');
INSERT INTO `sys_logininfor` VALUES (127, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:27:05');
INSERT INTO `sys_logininfor` VALUES (128, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 14:27:12');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-02 14:27:23');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:27:30');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 14:28:30');
INSERT INTO `sys_logininfor` VALUES (132, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:28:35');
INSERT INTO `sys_logininfor` VALUES (133, '19843735857', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:28:55');
INSERT INTO `sys_logininfor` VALUES (134, '19843735546', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:37:18');
INSERT INTO `sys_logininfor` VALUES (135, '10843735546', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:37:43');
INSERT INTO `sys_logininfor` VALUES (136, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '对不起，您的账号：17554222337 已停用', '2023-03-02 14:38:26');
INSERT INTO `sys_logininfor` VALUES (137, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:39:46');
INSERT INTO `sys_logininfor` VALUES (138, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 14:39:53');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:39:57');
INSERT INTO `sys_logininfor` VALUES (140, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:41:05');
INSERT INTO `sys_logininfor` VALUES (141, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:43:49');
INSERT INTO `sys_logininfor` VALUES (142, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:48:32');
INSERT INTO `sys_logininfor` VALUES (143, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:48:54');
INSERT INTO `sys_logininfor` VALUES (144, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:54:29');
INSERT INTO `sys_logininfor` VALUES (145, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 14:59:50');
INSERT INTO `sys_logininfor` VALUES (146, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 15:00:55');
INSERT INTO `sys_logininfor` VALUES (147, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 15:03:05');
INSERT INTO `sys_logininfor` VALUES (148, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 15:03:48');
INSERT INTO `sys_logininfor` VALUES (149, '17554222337', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2023-03-02 15:08:48');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 15:09:01');
INSERT INTO `sys_logininfor` VALUES (151, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 15:09:05');
INSERT INTO `sys_logininfor` VALUES (152, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 15:41:59');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 15:42:03');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 15:42:10');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 15:53:02');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 15:53:20');
INSERT INTO `sys_logininfor` VALUES (157, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 15:53:42');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 15:37:43');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 15:39:21');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2023-03-07 15:39:30');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '密码输入错误1次', '2023-03-07 15:39:30');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 15:39:36');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:09:46');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:10:17');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:10:26');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:10:34');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:44:37');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:44:43');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:44:45');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:53:08');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 16:53:13');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 22:28:22');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-07 22:34:10');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 22:39:24');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 09:43:42');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 14:21:48');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 19:30:52');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 19:33:21');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 19:33:40');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 19:35:38');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 19:51:13');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 19:52:36');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-08 20:00:56');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-09 10:56:29');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-09 11:02:17');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-09 11:03:39');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-10 13:51:49');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:06:54');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:07:05');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:07:14');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:07:21');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:07:41');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:07:54');
INSERT INTO `sys_logininfor` VALUES (194, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-10 16:08:15');
INSERT INTO `sys_logininfor` VALUES (195, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-10 16:08:15');
INSERT INTO `sys_logininfor` VALUES (196, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-03-10 16:08:17');
INSERT INTO `sys_logininfor` VALUES (197, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-10 16:08:17');
INSERT INTO `sys_logininfor` VALUES (198, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-03-10 16:08:20');
INSERT INTO `sys_logininfor` VALUES (199, 'chen', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-10 16:08:20');
INSERT INTO `sys_logininfor` VALUES (200, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-10 16:08:29');
INSERT INTO `sys_logininfor` VALUES (201, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-10 16:08:29');
INSERT INTO `sys_logininfor` VALUES (202, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:08:31');
INSERT INTO `sys_logininfor` VALUES (203, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:09:51');
INSERT INTO `sys_logininfor` VALUES (204, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:10:06');
INSERT INTO `sys_logininfor` VALUES (205, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:10:39');
INSERT INTO `sys_logininfor` VALUES (206, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:11:01');
INSERT INTO `sys_logininfor` VALUES (207, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:11:54');
INSERT INTO `sys_logininfor` VALUES (208, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:12:28');
INSERT INTO `sys_logininfor` VALUES (209, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:14:40');
INSERT INTO `sys_logininfor` VALUES (210, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:14:50');
INSERT INTO `sys_logininfor` VALUES (211, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:15:37');
INSERT INTO `sys_logininfor` VALUES (212, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:30:02');
INSERT INTO `sys_logininfor` VALUES (213, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:31:11');
INSERT INTO `sys_logininfor` VALUES (214, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:43:59');
INSERT INTO `sys_logininfor` VALUES (215, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-14 19:13:39');
INSERT INTO `sys_logininfor` VALUES (216, '17554222337', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-14 19:13:45');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-14 19:13:55');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-14 19:13:55');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-14 19:13:59');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-16 09:03:04');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:43:42');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:02');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:23');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:31');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:46');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:51');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:54');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:45:57');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:04');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:09');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:15');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:20');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:25');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:30');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:35');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:39');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:43');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:50');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:47:58');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-16 09:48:09');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-16 15:24:25');
INSERT INTO `sys_logininfor` VALUES (242, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2023-03-17 11:19:02');
INSERT INTO `sys_logininfor` VALUES (243, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '密码输入错误1次', '2023-03-17 11:19:02');
INSERT INTO `sys_logininfor` VALUES (244, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2023-03-17 11:19:14');
INSERT INTO `sys_logininfor` VALUES (245, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '密码输入错误2次', '2023-03-17 11:19:14');
INSERT INTO `sys_logininfor` VALUES (246, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-17 11:19:23');
INSERT INTO `sys_logininfor` VALUES (247, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-17 15:13:52');
INSERT INTO `sys_logininfor` VALUES (248, 'chen', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-17 15:54:54');
INSERT INTO `sys_logininfor` VALUES (249, 'chen', '10.1.65.80', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-17 16:30:29');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '192.168.196.105', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-18 19:40:58');
INSERT INTO `sys_logininfor` VALUES (251, 'chen', '192.168.196.105', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-18 19:52:58');
INSERT INTO `sys_logininfor` VALUES (252, 'chen', '192.168.196.105', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-18 19:57:33');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-03-19 10:38:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-02-28 15:41:59', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-28 15:41:59', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-02-28 15:41:59', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-02-28 15:41:59', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-02-28 15:41:59', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-02-28 15:41:59', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-02-28 15:41:59', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-02-28 15:41:59', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-02-28 15:41:59', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-02-28 15:41:59', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-02-28 15:41:59', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-02-28 15:41:59', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-02-28 15:41:59', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-02-28 15:41:59', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-02-28 15:41:59', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-02-28 15:41:59', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-02-28 15:41:59', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-02-28 15:41:59', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-02-28 15:41:59', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-02-28 15:41:59', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-02-28 15:41:59', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-02-28 15:41:59', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-02-28 15:41:59', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-02-28 15:41:59', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '流浪动物管理', 0, 0, 'app', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'chart', 'admin', '2023-02-28 15:43:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '动物状态信息', 2000, 1, 'animal_state_data', 'app/animal_state_data/index', NULL, 1, 0, 'C', '0', '0', 'app:animal_state_data:list', '#', 'admin', '2023-02-28 15:52:21', '', NULL, '动物状态信息菜单');
INSERT INTO `sys_menu` VALUES (2002, '动物状态信息查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state_data:query', '#', 'admin', '2023-02-28 15:52:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '动物状态信息新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state_data:add', '#', 'admin', '2023-02-28 15:52:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '动物状态信息修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state_data:edit', '#', 'admin', '2023-02-28 15:52:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '动物状态信息删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state_data:remove', '#', 'admin', '2023-02-28 15:52:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '动物状态信息导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state_data:export', '#', 'admin', '2023-02-28 15:52:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '动物状态关联', 2000, 1, 'animal_state', 'app/animal_state/index', NULL, 1, 0, 'C', '0', '0', 'app:animal_state:list', '#', 'admin', '2023-02-28 15:52:28', '', NULL, '动物状态关联菜单');
INSERT INTO `sys_menu` VALUES (2008, '动物状态关联查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state:query', '#', 'admin', '2023-02-28 15:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '动物状态关联新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state:add', '#', 'admin', '2023-02-28 15:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '动物状态关联修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state:edit', '#', 'admin', '2023-02-28 15:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '动物状态关联删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state:remove', '#', 'admin', '2023-02-28 15:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '动物状态关联导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal_state:export', '#', 'admin', '2023-02-28 15:52:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '动物信息', 2000, 1, 'animal', 'app/animal/index', NULL, 1, 0, 'C', '0', '0', 'app:animal:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '动物信息菜单');
INSERT INTO `sys_menu` VALUES (2014, '动物信息查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '动物信息新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '动物信息修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '动物信息删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '动物信息导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:animal:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '收藏', 2000, 1, 'collection', 'app/collection/index', NULL, 1, 0, 'C', '0', '0', 'app:collection:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '收藏菜单');
INSERT INTO `sys_menu` VALUES (2020, '收藏查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:collection:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '收藏新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:collection:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '收藏修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:collection:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '收藏删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:collection:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '收藏导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:collection:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '评论点赞', 2000, 1, 'comments_like', 'app/comments_like/index', NULL, 1, 0, 'C', '0', '0', 'app:comments_like:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '评论点赞菜单');
INSERT INTO `sys_menu` VALUES (2026, '评论点赞查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments_like:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '评论点赞新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments_like:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '评论点赞修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments_like:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '评论点赞删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments_like:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '评论点赞导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments_like:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '评论', 2000, 1, 'comments', 'app/comments/index', NULL, 1, 0, 'C', '0', '0', 'app:comments:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '评论菜单');
INSERT INTO `sys_menu` VALUES (2032, '评论查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '评论新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '评论修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '评论删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '评论导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:comments:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '关注', 2000, 1, 'concern', 'app/concern/index', NULL, 1, 0, 'C', '0', '0', 'app:concern:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '关注菜单');
INSERT INTO `sys_menu` VALUES (2038, '关注查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:concern:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '关注新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:concern:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '关注修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:concern:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '关注删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:concern:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '关注导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:concern:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '捐赠', 2000, 1, 'donation', 'app/donation/index', NULL, 1, 0, 'C', '0', '0', 'app:donation:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '捐赠菜单');
INSERT INTO `sys_menu` VALUES (2044, '捐赠查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:donation:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '捐赠新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:donation:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '捐赠修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:donation:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '捐赠删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:donation:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '捐赠导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:donation:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '点赞', 2000, 1, 'like', 'app/like/index', NULL, 1, 0, 'C', '0', '0', 'app:like:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '点赞菜单');
INSERT INTO `sys_menu` VALUES (2050, '点赞查询', 2049, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:like:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '点赞新增', 2049, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:like:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '点赞修改', 2049, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:like:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '点赞删除', 2049, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:like:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '点赞导出', 2049, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:like:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '信息类型', 2000, 1, 'message_type', 'app/message_type/index', NULL, 1, 0, 'C', '0', '0', 'app:message_type:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '信息类型菜单');
INSERT INTO `sys_menu` VALUES (2056, '信息类型查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message_type:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '信息类型新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message_type:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '信息类型修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message_type:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '信息类型删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message_type:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '信息类型导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message_type:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '消息', 2000, 1, 'message', 'app/message/index', NULL, 1, 0, 'C', '0', '0', 'app:message:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '消息菜单');
INSERT INTO `sys_menu` VALUES (2062, '消息查询', 2061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '消息新增', 2061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '消息修改', 2061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '消息删除', 2061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '消息导出', 2061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:message:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '动态类型', 2000, 1, 'post_type', 'app/post_type/index', NULL, 1, 0, 'C', '0', '0', 'app:post_type:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '动态类型菜单');
INSERT INTO `sys_menu` VALUES (2068, '动态类型查询', 2067, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post_type:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '动态类型新增', 2067, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post_type:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '动态类型修改', 2067, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post_type:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '动态类型删除', 2067, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post_type:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '动态类型导出', 2067, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post_type:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '动态', 2000, 1, 'post', 'app/post/index', NULL, 1, 0, 'C', '0', '0', 'app:post:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '动态菜单');
INSERT INTO `sys_menu` VALUES (2074, '动态查询', 2073, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '动态新增', 2073, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '动态修改', 2073, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '动态删除', 2073, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '动态导出', 2073, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:post:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '话题', 2000, 1, 'topic', 'app/topic/index', NULL, 1, 0, 'C', '0', '0', 'app:topic:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '话题菜单');
INSERT INTO `sys_menu` VALUES (2080, '话题查询', 2079, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:topic:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '话题新增', 2079, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:topic:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '话题修改', 2079, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:topic:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '话题删除', 2079, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:topic:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '话题导出', 2079, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:topic:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '用户数据扩展', 2000, 1, 'user_data', 'app/user_data/index', NULL, 1, 0, 'C', '0', '0', 'app:user_data:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '用户数据扩展菜单');
INSERT INTO `sys_menu` VALUES (2086, '用户数据扩展查询', 2085, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_data:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '用户数据扩展新增', 2085, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_data:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '用户数据扩展修改', 2085, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_data:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '用户数据扩展删除', 2085, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_data:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '用户数据扩展导出', 2085, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_data:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '用户类型', 2000, 1, 'user_type', 'app/user_type/index', NULL, 1, 0, 'C', '0', '0', 'app:user_type:list', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '用户类型菜单');
INSERT INTO `sys_menu` VALUES (2092, '用户类型查询', 2091, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_type:query', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '用户类型新增', 2091, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_type:add', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2094, '用户类型修改', 2091, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_type:edit', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '用户类型删除', 2091, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_type:remove', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '用户类型导出', 2091, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:user_type:export', '#', 'admin', '2023-02-28 15:54:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '公告', 2000, 1, 'head', 'app/head/index', NULL, 1, 0, 'C', '0', '0', 'app:head:list', '#', 'admin', '2023-03-16 09:05:44', '', NULL, '公告菜单');
INSERT INTO `sys_menu` VALUES (2098, '公告查询', 2097, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:head:query', '#', 'admin', '2023-03-16 09:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '公告新增', 2097, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:head:add', '#', 'admin', '2023-03-16 09:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '公告修改', 2097, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:head:edit', '#', 'admin', '2023-03-16 09:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '公告删除', 2097, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:head:remove', '#', 'admin', '2023-03-16 09:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '公告导出', 2097, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'app:head:export', '#', 'admin', '2023-03-16 09:05:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-02-28 15:42:01', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-02-28 15:42:01', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流浪动物管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"app\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:43:57', 23);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"app_animal_state_data,app_post_type,app_animal_state,app_post,user_type,app_animal,app_message_type,user_data,app_message,app_like,app_donation,app_concern,app_comments_like,app_comments,app_collection,app_topic\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:45:58', 369);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal\",\"className\":\"AppAnimal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"动物id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"动物名字\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"动物性别\",\"columnId\":3,\"columnName\":\"sex\",\"columnType\":\"bit(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"动物头像\",\"columnId\":4,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"icon\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:46:19', 34);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal_state\",\"className\":\"AppAnimalState\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Aid\",\"columnComment\":\"动物id\",\"columnId\":10,\"columnName\":\"aid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"aid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sid\",\"columnComment\":\"动物状态\",\"columnId\":11,\"columnName\":\"sid\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sid\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"动物领养人id\",\"columnId\":12,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:46:38', 24);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal_state_data\",\"className\":\"AppAnimalStateData\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"状态id\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"动物状态标题\",\"columnId\":17,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"S1\",\"columnComment\":\"扩展1\",\"columnId\":18,\"columnName\":\"s1\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"s1\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"动物状态信息\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"动物状态信息表\",\"tableId\":3,\"tableName\":\"app_animal_state_data\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:46:56', 20);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"collection\",\"className\":\"AppCollection\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":19,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":20,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"帖子id\",\"columnId\":21,\"columnName\":\"pid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateDate\",\"columnComment\":\"创建时间\",\"columnId\":22,\"columnName\":\"create_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"createDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:05', 18);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comments\",\"className\":\"AppComments\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评论id\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToId\",\"columnComment\":\"被评论id\",\"columnId\":24,\"columnName\":\"to_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"toId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"被评论帖子id\",\"columnId\":25,\"columnName\":\"pid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":26,\"columnName\":\"content\",\"columnType\":\"tinytext\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"E', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:12', 77);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comments_like\",\"className\":\"AppCommentsLike\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Cid\",\"columnComment\":\"评论id\",\"columnId\":33,\"columnName\":\"cid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":34,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"评论点赞\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"评论点赞表\",\"tableId\":6,\"tableName\":\"app_comments_like\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:26', 14);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"concern\",\"className\":\"AppConcern\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":35,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":36,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToUid\",\"columnComment\":\"被关注用户id\",\"columnId\":37,\"columnName\":\"to_uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"toUid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToAid\",\"columnComment\":\"被关注动物id\",\"columnId\":38,\"columnName\":\"to_aid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"toAid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:33', 20);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"donation\",\"className\":\"AppDonation\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"捐赠id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":42,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToUid\",\"columnComment\":\"被捐赠用户id\",\"columnId\":43,\"columnName\":\"to_uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"toUid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"金额\",\"columnId\":44,\"columnName\":\"amount\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"amount\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"req', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:41', 21);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"like\",\"className\":\"AppLike\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":47,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":48,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"动态id\",\"columnId\":49,\"columnName\":\"pid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateDate\",\"columnComment\":\"点赞时间\",\"columnId\":50,\"columnName\":\"create_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"createDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:49', 14);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message\",\"className\":\"AppMessage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"消息id\",\"columnId\":51,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":52,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToUid\",\"columnComment\":\"收消息用户id\",\"columnId\":53,\"columnName\":\"to_uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"toUid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":54,\"columnName\":\"content\",\"columnType\":\"tinytext\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:47:57', 24);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message_type\",\"className\":\"AppMessageType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":58,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名字\",\"columnId\":59,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"信息类型\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"信息类型表\",\"tableId\":11,\"tableName\":\"app_message_type\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:48:12', 10);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"post\",\"className\":\"AppPost\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\" 动态id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"动态标题\",\"columnId\":61,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"动态内容\",\"columnId\":62,\"columnName\":\"content\",\"columnType\":\"tinytext\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"动态图片\",\"columnId\":63,\"columnName\":\"image\",\"columnType\":\"tinytext\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"q', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:48:19', 39);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"post_type\",\"className\":\"AppPostType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"动态类型id\",\"columnId\":79,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"动态类型名字\",\"columnId\":80,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"动态类型\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"动态类型表\",\"tableId\":13,\"tableName\":\"app_post_type\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:48:31', 12);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"topic\",\"className\":\"AppTopic\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"话题id\",\"columnId\":81,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"话题名字\",\"columnId\":82,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"话题\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"话题表\",\"tableId\":14,\"tableName\":\"app_topic\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:48:39', 14);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user_data\",\"className\":\"UserData\",\"columns\":[{\"capJavaField\":\"Uid\",\"columnComment\":\"user_id\",\"columnId\":83,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Desc\",\"columnComment\":\"描述\",\"columnId\":84,\"columnName\":\"desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"desc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Year\",\"columnComment\":\"年龄\",\"columnId\":85,\"columnName\":\"year\",\"columnType\":\"int(2)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"year\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToUid\",\"columnComment\":\"属于某用户\",\"columnId\":86,\"columnName\":\"to_uid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"toUid\",\"javaType\":\"Long\",\"list\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:48:51', 20);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user_type\",\"className\":\"UserType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":89,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":90,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"用户类型\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"用户类型表\",\"tableId\":16,\"tableName\":\"user_type\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:49:01', 11);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_animal,app_animal_state,app_animal_state_data,app_collection,app_comments,app_comments_like,app_concern,app_donation,app_like,app_message,app_message_type,app_post,app_post_type,app_topic,user_data,user_type\"}', NULL, 0, NULL, '2023-02-28 15:49:20', 567);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_animal,app_animal_state,app_animal_state_data,app_collection,app_comments,app_comments_like,app_concern,app_donation,app_like,app_message,app_message_type,app_post,app_post_type,app_topic,user_data,user_type\"}', NULL, 0, NULL, '2023-02-28 15:49:32', 331);
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-02-28 15:41:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:55:12', 32);
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', NULL, 1, '普通角色已分配,不能删除', '2023-02-28 15:55:17', 13);
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:55:23', 23);
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:55:26', 26);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2049,2055,2061,2067,2073,2079,2085,2091,2001,2007,2013,2019,2025,2031,2037,2043,2050,2051,2053,2056,2062,2063,2064,2065,2068,2074,2075,2076,2077,2080,2081,2086,2087,2088,2089,2092,2002,2008,2009,2010,2011,2014,2015,2016,2017,2020,2021,2023,2026,2027,2029,2032,2033,2034,2035,2038,2039,2041,2044,2045],\"params\":{},\"roleId\":100,\"roleKey\":\"uuser\",\"roleName\":\"普通用户\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:58:32', 47);
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"chen\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"chen\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-28 15:59:41', 100);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:24:30', 38);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"app_animal,app_animal_state\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:24:35', 87);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal\",\"className\":\"AppAnimal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"动物id\",\"columnId\":91,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sid\",\"columnComment\":\"动物状态id\",\"columnId\":92,\"columnName\":\"sid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"动物名字\",\"columnId\":93,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"动物性别\",\"columnId\":94,\"columnName\":\"sex\",\"columnType\":\"bit(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Integer\",\"list\":true,\"params\":{},\"pk\":false,\"qu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:25:35', 34);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal_state\",\"className\":\"AppAnimalState\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":100,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Aid\",\"columnComment\":\"动物id\",\"columnId\":101,\"columnName\":\"aid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"aid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"动物领养人id\",\"columnId\":102,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Bid\",\"columnComment\":\"救助基地id\",\"columnId\":103,\"columnName\":\"bid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-01 09:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:26:21', 23);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_animal,app_animal_state\"}', NULL, 0, NULL, '2023-03-01 09:26:34', 65);
INSERT INTO `sys_oper_log` VALUES (131, '动物信息', 1, 'com.ruoyi.app.controller.AppAnimalController.add()', 'POST', 1, 'admin', NULL, '/app/animal', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-07\",\"icon\":\"hhhhhhhhhhhhh\",\"id\":1,\"name\":\"小豆\",\"year\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:28:23', 6);
INSERT INTO `sys_oper_log` VALUES (132, '动物信息', 3, 'com.ruoyi.app.controller.AppAnimalController.remove()', 'DELETE', 1, 'admin', NULL, '/app/animal/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:29:08', 20);
INSERT INTO `sys_oper_log` VALUES (133, '动物信息', 1, 'com.ruoyi.app.controller.AppAnimalController.add()', 'POST', 1, 'admin', NULL, '/app/animal', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-09\",\"icon\":\"sss\",\"id\":2,\"name\":\"大大\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:29:20', 11);
INSERT INTO `sys_oper_log` VALUES (134, '动物信息', 3, 'com.ruoyi.app.controller.AppAnimalController.remove()', 'DELETE', 1, 'admin', NULL, '/app/animal/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:29:25', 7);
INSERT INTO `sys_oper_log` VALUES (135, '动物状态信息', 1, 'com.ruoyi.app.controller.AppAnimalStateDataController.add()', 'POST', 1, 'admin', NULL, '/app/animal_state_data', '127.0.0.1', '内网IP', '{\"title\":\"正在流浪\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\Java\\ruoyi\\ruoyi-app\\target\\classes\\mapper\\app\\AppAnimalStateDataMapper.xml]\r\n### The error may involve com.ruoyi.app.mapper.AppAnimalStateDataMapper.insertAppAnimalStateData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app_animal_state_data          ( title )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-03-01 09:48:04', 67);
INSERT INTO `sys_oper_log` VALUES (136, '动物状态信息', 1, 'com.ruoyi.app.controller.AppAnimalStateDataController.add()', 'POST', 1, 'admin', NULL, '/app/animal_state_data', '127.0.0.1', '内网IP', '{\"title\":\"正在流浪\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:49:13', 11);
INSERT INTO `sys_oper_log` VALUES (137, '动物状态信息', 1, 'com.ruoyi.app.controller.AppAnimalStateDataController.add()', 'POST', 1, 'admin', NULL, '/app/animal_state_data', '127.0.0.1', '内网IP', '{\"title\":\"正在救助\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:49:34', 3);
INSERT INTO `sys_oper_log` VALUES (138, '动物状态信息', 1, 'com.ruoyi.app.controller.AppAnimalStateDataController.add()', 'POST', 1, 'admin', NULL, '/app/animal_state_data', '127.0.0.1', '内网IP', '{\"title\":\"生病中\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:49:47', 3);
INSERT INTO `sys_oper_log` VALUES (139, '动物状态信息', 1, 'com.ruoyi.app.controller.AppAnimalStateDataController.add()', 'POST', 1, 'admin', NULL, '/app/animal_state_data', '127.0.0.1', '内网IP', '{\"title\":\"已被救助\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:50:02', 3);
INSERT INTO `sys_oper_log` VALUES (140, '动物状态信息', 1, 'com.ruoyi.app.controller.AppAnimalStateDataController.add()', 'POST', 1, 'admin', NULL, '/app/animal_state_data', '127.0.0.1', '内网IP', '{\"title\":\"已有家\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:50:14', 3);
INSERT INTO `sys_oper_log` VALUES (141, '动物信息', 1, 'com.ruoyi.app.controller.AppAnimalController.add()', 'POST', 1, 'admin', NULL, '/app/animal', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-01\",\"id\":3,\"name\":\"豆豆\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 09:50:36', 13);
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-03-01 10:00:20', 10);
INSERT INTO `sys_oper_log` VALUES (143, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:24', 14);
INSERT INTO `sys_oper_log` VALUES (144, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:26', 17);
INSERT INTO `sys_oper_log` VALUES (145, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:27', 19);
INSERT INTO `sys_oper_log` VALUES (146, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:30', 13);
INSERT INTO `sys_oper_log` VALUES (147, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:32', 14);
INSERT INTO `sys_oper_log` VALUES (148, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:35', 10);
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-03-01 10:00:38', 6);
INSERT INTO `sys_oper_log` VALUES (150, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:00:42', 9);
INSERT INTO `sys_oper_log` VALUES (151, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-03-01 10:08:24', 11);
INSERT INTO `sys_oper_log` VALUES (152, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:08:25', 16);
INSERT INTO `sys_oper_log` VALUES (153, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:08:28', 13);
INSERT INTO `sys_oper_log` VALUES (154, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"动物管理\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:08:40', 16);
INSERT INTO `sys_oper_log` VALUES (155, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"基地管理\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:09:04', 11);
INSERT INTO `sys_oper_log` VALUES (156, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":110,\"deptName\":\"基地管理\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"动物管理\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:09:41', 21);
INSERT INTO `sys_oper_log` VALUES (157, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"普通用户\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:09:56', 10);
INSERT INTO `sys_oper_log` VALUES (158, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"动物医院\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 10:10:23', 11);
INSERT INTO `sys_oper_log` VALUES (159, '动物信息', 3, 'com.ruoyi.app.controller.AppAnimalController.remove()', 'DELETE', 1, 'admin', NULL, '/app/animal/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 14:16:13', 14);
INSERT INTO `sys_oper_log` VALUES (160, '动物状态关联', 3, 'com.ruoyi.app.controller.AppAnimalStateController.remove()', 'DELETE', 1, 'admin', NULL, '/app/animal_state/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 14:16:17', 5);
INSERT INTO `sys_oper_log` VALUES (161, '动物信息', 1, 'com.ruoyi.app.controller.AppAnimalController.add()', 'POST', 1, 'admin', NULL, '/app/animal', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-08\",\"icon\":\"1\",\"name\":\"sas\",\"sid\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'aid\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\Java\\ruoyi\\ruoyi-app\\target\\classes\\mapper\\app\\AppAnimalStateMapper.xml]\r\n### The error may involve com.ruoyi.app.mapper.AppAnimalStateMapper.insertAppAnimalState-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into app_animal_state          ( bid )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'aid\' doesn\'t have a default value\n; Field \'aid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'aid\' doesn\'t have a default value', '2023-03-01 14:17:33', 21129);
INSERT INTO `sys_oper_log` VALUES (162, '动物信息', 1, 'com.ruoyi.app.controller.AppAnimalController.add()', 'POST', 1, 'admin', NULL, '/app/animal', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-08\",\"icon\":\"11\",\"id\":4,\"name\":\"das\",\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 14:21:24', 29);
INSERT INTO `sys_oper_log` VALUES (163, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-02-28 15:58:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2049,2055,2061,2067,2073,2079,2085,2091,2001,2007,2013,2019,2025,2031,2037,2043,2050,2051,2056,2062,2063,2064,2065,2068,2074,2075,2076,2077,2080,2081,2086,2087,2088,2089,2092,2002,2008,2009,2010,2011,2014,2015,2016,2017,2020,2021,2026,2027,2032,2033,2034,2035,2038,2039,2044,2045],\"params\":{},\"roleId\":100,\"roleKey\":\"uuser\",\"roleName\":\"普通用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 15:13:45', 42);
INSERT INTO `sys_oper_log` VALUES (164, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, 'admin', NULL, '/app/post', '10.1.65.75', '内网IP', '{\"content\":\"<p>hhhhhh</p>\",\"id\":1,\"title\":\"hhhhh\",\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:00:03', 13);
INSERT INTO `sys_oper_log` VALUES (165, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p>sssss</p>\",\"id\":2,\"title\":\"ssssss\",\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:00:26', 4);
INSERT INTO `sys_oper_log` VALUES (166, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>hhhhhhss</p>\",\"id\":1,\"likeNumber\":0,\"title\":\"hhhhh\",\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:00:57', 7);
INSERT INTO `sys_oper_log` VALUES (167, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>hhhhhhsssss</p>\",\"id\":1,\"likeNumber\":0,\"title\":\"hhhhh\",\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:01:11', 6);
INSERT INTO `sys_oper_log` VALUES (168, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>hhhhhhsssss</p>\",\"id\":1,\"likeNumber\":0,\"title\":\"hhhhhsss\",\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:01:25', 8);
INSERT INTO `sys_oper_log` VALUES (169, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>hhhhhhssssssssaa</p>\",\"id\":1,\"likeNumber\":0,\"title\":\"hhhhhsss\",\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:02:46', 36695);
INSERT INTO `sys_oper_log` VALUES (170, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>hhhhhhssssssssaa</p>\",\"id\":1,\"likeNumber\":0,\"title\":\"hhhhhsss\",\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-01 16:03:57', 21);
INSERT INTO `sys_oper_log` VALUES (171, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, 'chen', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>hhhhhhssssssssaa</p>\",\"id\":1,\"likeNumber\":0,\"title\":\"hhhhhsssasa\",\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-01 16:04:08', 4);
INSERT INTO `sys_oper_log` VALUES (172, '评论', 1, 'com.ruoyi.app.controller.AppCommentsController.add()', 'POST', 1, 'chen', NULL, '/app/comments', '127.0.0.1', '内网IP', '{\"content\":\"<p>sasas</p>\",\"id\":1,\"pid\":1,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:06:15', 7);
INSERT INTO `sys_oper_log` VALUES (173, '评论', 2, 'com.ruoyi.app.controller.AppCommentsController.edit()', 'PUT', 1, 'admin', NULL, '/app/comments', '10.1.65.75', '内网IP', '{\"content\":\"<p>sasasdddd</p>\",\"id\":1,\"pid\":1,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-01 16:08:22', 10);
INSERT INTO `sys_oper_log` VALUES (174, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '127.0.0.1', '内网IP', '{\"id\":1,\"toUid\":1,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:10:02', 12);
INSERT INTO `sys_oper_log` VALUES (175, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '127.0.0.1', '内网IP', '{\"toUid\":1,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-01 16:10:12', 7);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"like\",\"className\":\"AppLike\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":47,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:47:49\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":48,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:47:49\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"动态id\",\"columnId\":49,\"columnName\":\"pid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:47:49\",\"usableColumn\":false},{\"capJavaField\":\"CreateDate\",\"columnComment\":\"点赞时间\",\"columnId\":50,\"columnName\":\"create_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:11:12', 45);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_like\"}', NULL, 0, NULL, '2023-03-01 16:11:22', 41);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"collection\",\"className\":\"AppCollection\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":19,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:47:05\",\"usableColumn\":false},{\"capJavaField\":\"Uid\",\"columnComment\":\"用户id\",\"columnId\":20,\"columnName\":\"uid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"uid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:47:05\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"帖子id\",\"columnId\":21,\"columnName\":\"pid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:47:05\",\"usableColumn\":false},{\"capJavaField\":\"CreateDate\",\"columnComment\":\"创建时间\",\"columnId\":22,\"columnName\":\"create_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:11:57', 18);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_collection,app_like\"}', NULL, 0, NULL, '2023-03-01 16:12:05', 54);
INSERT INTO `sys_oper_log` VALUES (180, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"id\":1,\"pid\":1,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:13:05', 5);
INSERT INTO `sys_oper_log` VALUES (181, '点赞', 3, 'com.ruoyi.app.controller.AppLikeController.remove()', 'DELETE', 1, 'admin', NULL, '/app/like/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-01 16:13:08', 9);
INSERT INTO `sys_oper_log` VALUES (182, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:42:01\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 11:44:22', 19);
INSERT INTO `sys_oper_log` VALUES (183, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, 'admin', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p>ssss</p>\",\"id\":3,\"title\":\"hhhh\",\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 22:39:46', 15);
INSERT INTO `sys_oper_log` VALUES (184, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, 'admin', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"aid\":1,\"content\":\"<p>saasa</p>\",\"createDate\":\"2023-03-07\",\"id\":4,\"tid\":1,\"title\":\"sas\",\"uid\":1,\"updateDate\":\"2023-03-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 22:40:54', 6);
INSERT INTO `sys_oper_log` VALUES (185, '动态', 3, 'com.ruoyi.app.controller.AppPostController.remove()', 'DELETE', 1, '17554222337', NULL, '/app/post/1,2,3,4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 16:50:04', 30);
INSERT INTO `sys_oper_log` VALUES (186, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, '17554222337', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p>啊哈哈的哈</p>\",\"createDate\":\"2023-03-06\",\"id\":5,\"image\":\"/profile/upload/2023/03/10/4caa248fedb54959bfb062bb22c1f534_20230310165027A001.png\",\"title\":\"测试测试\",\"uid\":115,\"updateDate\":\"2023-03-06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 16:50:53', 22);
INSERT INTO `sys_oper_log` VALUES (187, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, '17554222337', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p>DASDA</p>\",\"id\":6,\"image\":\"/profile/upload/2023/03/10/profile.473f5971_20230310165719A002.jpg\",\"title\":\"DAAD\",\"uid\":115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 16:57:23', 10);
INSERT INTO `sys_oper_log` VALUES (188, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, '17554222337', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p><br></p>\",\"id\":7,\"image\":\"/profile/upload/2023/03/10/profile_20230310165729A003.jpg\",\"title\":\"DADASFS\",\"uid\":115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 16:57:31', 8);
INSERT INTO `sys_oper_log` VALUES (189, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, '17554222337', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p>DSSD</p>\",\"id\":8,\"image\":\"/profile/upload/2023/03/10/4caa248fedb54959bfb062bb22c1f534_20230310165738A004.png\",\"title\":\"DASDFDGF\",\"uid\":115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 16:57:42', 6);
INSERT INTO `sys_oper_log` VALUES (190, '动态', 1, 'com.ruoyi.app.controller.AppPostController.add()', 'POST', 1, '17554222337', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"content\":\"<p>DASDA</p>\",\"id\":9,\"image\":\"/profile/upload/2023/03/10/profile_20230310165750A005.jpg\",\"title\":\"DASDADVFDF\",\"uid\":115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 16:57:55', 6);
INSERT INTO `sys_oper_log` VALUES (191, '动态', 2, 'com.ruoyi.app.controller.AppPostController.edit()', 'PUT', 1, '17554222337', NULL, '/app/post', '127.0.0.1', '内网IP', '{\"collectionNumber\":0,\"commentsNumber\":0,\"content\":\"<p>DASDA</p>\",\"id\":6,\"image\":\"/profile/upload/2023/03/10/profile.473f5971_20230310165719A002.jpg\",\"likeNumber\":0,\"title\":\"测试\",\"uid\":115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 17:03:21', 6);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-14 19:14:16', 63);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"app_post_type\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-14 19:14:21', 47);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"AppPostType\",\"columns\":[{\"capJavaField\":\"Name\",\"columnComment\":\"动态类型名字\",\"columnId\":106,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-14 19:14:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Id\",\"columnComment\":\"动态类型id\",\"columnId\":107,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-14 19:14:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"头像\",\"columnId\":108,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-14 19:14:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"icon\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"动态类型\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"动态类型表\",\"tableId\":19,\"tableName\":\"app_post_type\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-14 19:15:42', 26);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"post_type\",\"className\":\"AppPostType\",\"columns\":[{\"capJavaField\":\"Name\",\"columnComment\":\"动态类型名字\",\"columnId\":106,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-14 19:14:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2023-03-14 19:15:42\",\"usableColumn\":false},{\"capJavaField\":\"Id\",\"columnComment\":\"动态类型id\",\"columnId\":107,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-14 19:14:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2023-03-14 19:15:42\",\"usableColumn\":false},{\"capJavaField\":\"Icon\",\"columnComment\":\"头像\",\"columnId\":108,\"columnName\":\"icon\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-14 19:14:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"icon\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"updateTime\":\"2023-03-14 19:15:42\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"动态类型\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":\\\"2000\\\"}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":\"2000\"},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"动态类型表\",\"tableId\":19,\"tableName\":\"app_post_type\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-14 19:15:56', 12);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_post_type\"}', NULL, 0, NULL, '2023-03-14 19:16:02', 286);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"app_head\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-16 09:03:19', 76);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"head\",\"className\":\"AppHead\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":109,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-16 09:03:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"postid\",\"columnId\":110,\"columnName\":\"pid\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-16 09:03:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"公告\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"公告\",\"tableId\":20,\"tableName\":\"app_head\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-16 09:04:02', 26);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"app_head\"}', NULL, 0, NULL, '2023-03-16 09:04:08', 304);
INSERT INTO `sys_oper_log` VALUES (200, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-02-28 15:58:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2049,2055,2061,2067,2073,2079,2085,2091,2097,2001,2007,2013,2019,2025,2031,2037,2043,2050,2051,2056,2062,2063,2064,2065,2068,2074,2075,2076,2077,2080,2081,2086,2087,2088,2089,2092,2098,2002,2008,2009,2010,2011,2014,2015,2016,2017,2020,2021,2026,2027,2032,2033,2034,2035,2038,2039,2044,2045],\"params\":{},\"roleId\":100,\"roleKey\":\"uuser\",\"roleName\":\"普通用户\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-16 09:09:09', 75);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal_state_data\",\"className\":\"AppAnimalStateData\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"状态id\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:46:56\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"动物状态标题\",\"columnId\":17,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:46:56\",\"usableColumn\":false},{\"capJavaField\":\"S1\",\"columnComment\":\"扩展1\",\"columnId\":18,\"columnName\":\"s1\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"s1\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-02-28 15:46:56\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"动物状态信息\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":\\\"2000\\\"}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":\"2000\"},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"动物状态信息表\",\"tableId\":3,\"tableName\":\"app_ani', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-16 15:24:40', 62);
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"animal_state_data\",\"className\":\"AppAnimalStateData\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"状态id\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-16 15:24:40\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"动物状态标题\",\"columnId\":17,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-16 15:24:40\",\"usableColumn\":false},{\"capJavaField\":\"S1\",\"columnComment\":\"扩展1\",\"columnId\":18,\"columnName\":\"s1\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-28 15:45:58\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"s1\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-16 15:24:40\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"动物状态信息\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"app\",\"options\":\"{\\\"parentMenuId\\\":\\\"2000\\\"}\",\"packageName\":\"com.ruoyi.app\",\"params\":{\"parentMenuId\":\"2000\"},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"动物状态信息表\",\"tableId\":3,\"tableName\":\"app_anima', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-16 15:25:38', 13);
INSERT INTO `sys_oper_log` VALUES (203, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 15:55:14', 89);
INSERT INTO `sys_oper_log` VALUES (204, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":3,\"pid\":6,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 15:55:16', 36);
INSERT INTO `sys_oper_log` VALUES (205, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 15:55:17', 30);
INSERT INTO `sys_oper_log` VALUES (206, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":4,\"pid\":6,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 15:55:18', 28);
INSERT INTO `sys_oper_log` VALUES (207, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 15:55:50', 31);
INSERT INTO `sys_oper_log` VALUES (208, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":5,\"pid\":6,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 15:55:56', 25);
INSERT INTO `sys_oper_log` VALUES (209, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 15:55:57', 28);
INSERT INTO `sys_oper_log` VALUES (210, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":6,\"pid\":6,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 15:56:47', 21);
INSERT INTO `sys_oper_log` VALUES (211, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":7,\"pid\":5,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:30:37', 34);
INSERT INTO `sys_oper_log` VALUES (212, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"pid\":5,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:30:47', 27);
INSERT INTO `sys_oper_log` VALUES (213, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":8,\"pid\":5,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:30:49', 27);
INSERT INTO `sys_oper_log` VALUES (214, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":9,\"pid\":7,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:31:17', 29);
INSERT INTO `sys_oper_log` VALUES (215, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":10,\"pid\":8,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:34:05', 53);
INSERT INTO `sys_oper_log` VALUES (216, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"pid\":5,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:36:53', 42);
INSERT INTO `sys_oper_log` VALUES (217, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":11,\"pid\":5,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:36:53', 26);
INSERT INTO `sys_oper_log` VALUES (218, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"pid\":5,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:36:54', 31);
INSERT INTO `sys_oper_log` VALUES (219, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:37:45', 26);
INSERT INTO `sys_oper_log` VALUES (220, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":12,\"pid\":6,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:37:49', 30);
INSERT INTO `sys_oper_log` VALUES (221, '收藏', 1, 'com.ruoyi.app.controller.AppCollectionController.add()', 'POST', 1, 'chen', NULL, '/app/collection', '10.1.65.80', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:37:54', 39);
INSERT INTO `sys_oper_log` VALUES (222, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"pid\":7,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:37:58', 23);
INSERT INTO `sys_oper_log` VALUES (223, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"pid\":6,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:38:04', 23);
INSERT INTO `sys_oper_log` VALUES (224, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":13,\"pid\":6,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:38:04', 29);
INSERT INTO `sys_oper_log` VALUES (225, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '10.1.65.80', '内网IP', '{\"createDate\":\"2023-03-17\",\"id\":14,\"pid\":7,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:38:08', 29);
INSERT INTO `sys_oper_log` VALUES (226, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '10.1.65.80', '内网IP', '{\"id\":3,\"toUid\":115,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:45:59', 18);
INSERT INTO `sys_oper_log` VALUES (227, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '10.1.65.80', '内网IP', '{\"toUid\":115,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-17 16:46:09', 15);
INSERT INTO `sys_oper_log` VALUES (228, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '10.1.65.80', '内网IP', '{\"id\":4,\"toUid\":115,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-17 16:46:10', 16);
INSERT INTO `sys_oper_log` VALUES (229, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":15,\"pid\":6,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:04', 66);
INSERT INTO `sys_oper_log` VALUES (230, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"pid\":6,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:41:05', 33);
INSERT INTO `sys_oper_log` VALUES (231, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":16,\"pid\":6,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:06', 21);
INSERT INTO `sys_oper_log` VALUES (232, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"pid\":6,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:41:07', 31);
INSERT INTO `sys_oper_log` VALUES (233, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":17,\"pid\":6,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:14', 36);
INSERT INTO `sys_oper_log` VALUES (234, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"pid\":6,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:41:16', 34);
INSERT INTO `sys_oper_log` VALUES (235, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":18,\"pid\":5,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:21', 40);
INSERT INTO `sys_oper_log` VALUES (236, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":19,\"pid\":7,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:26', 36);
INSERT INTO `sys_oper_log` VALUES (237, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":20,\"pid\":10,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:29', 48);
INSERT INTO `sys_oper_log` VALUES (238, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"pid\":7,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:41:47', 39);
INSERT INTO `sys_oper_log` VALUES (239, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'admin', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"id\":5,\"toUid\":115,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:41:52', 27);
INSERT INTO `sys_oper_log` VALUES (240, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'admin', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"toUid\":115,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:42:06', 13);
INSERT INTO `sys_oper_log` VALUES (241, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'admin', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"id\":6,\"toUid\":115,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:42:07', 14);
INSERT INTO `sys_oper_log` VALUES (242, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'admin', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"toUid\":115,\"uid\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:42:26', 14);
INSERT INTO `sys_oper_log` VALUES (243, '收藏', 1, 'com.ruoyi.app.controller.AppCollectionController.add()', 'POST', 1, 'admin', NULL, '/app/collection', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":3,\"pid\":5,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:42:50', 42);
INSERT INTO `sys_oper_log` VALUES (244, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"pid\":7,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:57:41', 36);
INSERT INTO `sys_oper_log` VALUES (245, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"pid\":8,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 19:57:46', 33);
INSERT INTO `sys_oper_log` VALUES (246, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":21,\"pid\":5,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:58:11', 38);
INSERT INTO `sys_oper_log` VALUES (247, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'chen', NULL, '/app/like', '192.168.196.105', '内网IP', '{\"createDate\":\"2023-03-18\",\"id\":22,\"pid\":7,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 19:58:14', 31);
INSERT INTO `sys_oper_log` VALUES (248, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"id\":7,\"toUid\":100,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 20:01:34', 11);
INSERT INTO `sys_oper_log` VALUES (249, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"toUid\":100,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 20:01:40', 12);
INSERT INTO `sys_oper_log` VALUES (250, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"id\":8,\"toUid\":100,\"uid\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-18 20:01:41', 13);
INSERT INTO `sys_oper_log` VALUES (251, '关注', 1, 'com.ruoyi.app.controller.AppConcernController.add()', 'POST', 1, 'chen', NULL, '/app/concern', '192.168.196.105', '内网IP', '{\"toUid\":100,\"uid\":100}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-18 20:01:42', 12);
INSERT INTO `sys_oper_log` VALUES (252, '点赞', 1, 'com.ruoyi.app.controller.AppLikeController.add()', 'POST', 1, 'admin', NULL, '/app/like', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-03-19\",\"id\":23,\"pid\":7,\"uid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-19 10:38:53', 35);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-02-28 15:41:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-02-28 15:41:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-02-28 15:41:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (100, '普通用户', 'uuser', 0, '1', 1, 1, '0', '0', 'admin', '2023-02-28 15:58:32', 'admin', '2023-03-16 09:09:09', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2061);
INSERT INTO `sys_role_menu` VALUES (100, 2062);
INSERT INTO `sys_role_menu` VALUES (100, 2063);
INSERT INTO `sys_role_menu` VALUES (100, 2064);
INSERT INTO `sys_role_menu` VALUES (100, 2065);
INSERT INTO `sys_role_menu` VALUES (100, 2067);
INSERT INTO `sys_role_menu` VALUES (100, 2068);
INSERT INTO `sys_role_menu` VALUES (100, 2073);
INSERT INTO `sys_role_menu` VALUES (100, 2074);
INSERT INTO `sys_role_menu` VALUES (100, 2075);
INSERT INTO `sys_role_menu` VALUES (100, 2076);
INSERT INTO `sys_role_menu` VALUES (100, 2077);
INSERT INTO `sys_role_menu` VALUES (100, 2079);
INSERT INTO `sys_role_menu` VALUES (100, 2080);
INSERT INTO `sys_role_menu` VALUES (100, 2081);
INSERT INTO `sys_role_menu` VALUES (100, 2085);
INSERT INTO `sys_role_menu` VALUES (100, 2086);
INSERT INTO `sys_role_menu` VALUES (100, 2087);
INSERT INTO `sys_role_menu` VALUES (100, 2088);
INSERT INTO `sys_role_menu` VALUES (100, 2089);
INSERT INTO `sys_role_menu` VALUES (100, 2091);
INSERT INTO `sys_role_menu` VALUES (100, 2092);
INSERT INTO `sys_role_menu` VALUES (100, 2097);
INSERT INTO `sys_role_menu` VALUES (100, 2098);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 110, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/upload/avatar.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-19 10:38:49', 'admin', '2023-02-28 15:41:58', '', '2023-03-19 10:38:48', '管理员');
INSERT INTO `sys_user` VALUES (100, 111, 'chen', 'chen', '00', '', '', '0', '/profile/upload/avatar.png', '$2a$10$vetw9Hf5..UWSlrwa6Q2F.AkaaKn0h7Uc/ludJ/W4l5.PR7rTVOXC', '0', '0', '192.168.196.105', '2023-03-18 19:57:34', 'admin', '2023-02-28 15:59:41', '', '2023-03-18 19:57:33', '普通用户');
INSERT INTO `sys_user` VALUES (115, 111, '17554222337', '用户48HgMChzwv', '00', '', '17554222337', '0', '/profile/upload/avatar.png', '$2a$10$Y8a5/Dmct0uv9PPRmM1J1Og.e.iUw6XLX47crKg5y45XOYP6PJRIu', '0', '0', '127.0.0.1', '2023-03-14 19:13:40', '', '2023-03-02 15:08:48', '', '2023-03-14 19:13:39', 'code');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (115, 100);

-- ----------------------------
-- Table structure for user_code
-- ----------------------------
DROP TABLE IF EXISTS `user_code`;
CREATE TABLE `user_code`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_code
-- ----------------------------

-- ----------------------------
-- Table structure for user_data
-- ----------------------------
DROP TABLE IF EXISTS `user_data`;
CREATE TABLE `user_data`  (
  `uid` bigint(20) NOT NULL COMMENT 'user_id',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `year` int(2) NULL DEFAULT NULL COMMENT '年龄',
  `to_uid` int(11) NULL DEFAULT NULL COMMENT '属于某用户',
  `s1` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展1',
  `s2` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展2'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户数据扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_data
-- ----------------------------

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES (1, '基地管理');
INSERT INTO `user_type` VALUES (2, '动物医院');
INSERT INTO `user_type` VALUES (3, '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
