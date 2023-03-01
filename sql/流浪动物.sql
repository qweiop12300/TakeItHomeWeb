ALTER TABLE `app_animal_state` DROP FOREIGN KEY `foreign_key_animal_id`;
ALTER TABLE `app_animal_state` DROP FOREIGN KEY `foreign_key_animal_state_data_id`;
ALTER TABLE `app_comments` DROP FOREIGN KEY `fk_post_id`;

DROP TABLE IF EXISTS `app_animal`;
DROP TABLE IF EXISTS `app_animal_state`;
DROP TABLE IF EXISTS `app_animal_state_data`;
DROP TABLE IF EXISTS `app_collection`;
DROP TABLE IF EXISTS `app_comments`;
DROP TABLE IF EXISTS `app_comments_like`;
DROP TABLE IF EXISTS `app_concern`;
DROP TABLE IF EXISTS `app_donation`;
DROP TABLE IF EXISTS `app_like`;
DROP TABLE IF EXISTS `app_message`;
DROP TABLE IF EXISTS `app_message_type`;
DROP TABLE IF EXISTS `app_post`;
DROP TABLE IF EXISTS `app_post_type`;
DROP TABLE IF EXISTS `app_topic`;
DROP TABLE IF EXISTS `user_data`;
DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `app_animal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动物id',
  `name` varchar(255) NOT NULL COMMENT '动物名字',
  `sex` bit(1) NOT NULL DEFAULT 0 COMMENT '动物性别',
  `icon` varchar(255) NULL COMMENT '动物头像',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `year` tinyint(2) NULL COMMENT '动物年龄',
  `s1` tinytext NULL COMMENT '扩展1',
  `s2` tinytext NULL COMMENT '扩展2',
  PRIMARY KEY (`id`)
) COMMENT = '动物信息表';

CREATE TABLE `app_animal_state`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `aid` bigint(20) NOT NULL COMMENT '动物id',
  `sid` int(2) NOT NULL DEFAULT 0 COMMENT '动物状态',
  `uid` bigint(20) NULL COMMENT '动物领养人id',
  `bid` bigint(20) NULL COMMENT '救助基地id',
  `hid` bigint(20) NULL COMMENT '动物医院id',
  `s1` varchar(255) NULL COMMENT '扩展1',
  PRIMARY KEY (`id`)
) COMMENT = '动物状态关联表';

CREATE TABLE `app_animal_state_data`  (
  `id` int NOT NULL COMMENT '状态id',
  `title` varchar(255) NULL COMMENT '动物状态标题',
  `s1` varchar(255) NULL COMMENT '扩展1',
  PRIMARY KEY (`id`)
) COMMENT = '动物状态信息表';

CREATE TABLE `app_collection`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `pid` bigint(20) NOT NULL COMMENT '帖子id',
  `create_date` datetime NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) COMMENT = '收藏表';

CREATE TABLE `app_comments`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `to_id` bigint(20) NULL COMMENT '被评论id',
  `pid` bigint(20) NULL COMMENT '被评论帖子id',
  `content` tinytext NULL COMMENT '内容',
  `image` tinytext NULL COMMENT '图片',
  `uid` bigint(20) NULL COMMENT '用户id',
  `aid` bigint(20) NULL COMMENT '动物id',
  `like_number` int NULL COMMENT '点赞数量',
  `create_date` datetime NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) COMMENT = '评论表';

CREATE TABLE `app_comments_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` bigint(20) NULL COMMENT '评论id',
  `uid` bigint(20) NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) COMMENT = '评论点赞表';

CREATE TABLE `app_concern`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) NULL COMMENT '用户id',
  `to_uid` bigint(20) NULL COMMENT '被关注用户id',
  `to_aid` bigint(20) NULL COMMENT '被关注动物id',
  `to_tid` int NULL COMMENT '被关注的话题',
  `create_date` datetime NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) COMMENT = '关注表';

CREATE TABLE `app_donation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '捐赠id',
  `uid` bigint(20) NULL COMMENT '用户id',
  `to_uid` bigint(20) NULL COMMENT '被捐赠用户id',
  `amount` float NULL COMMENT '金额',
  `create_date` datetime NULL COMMENT '捐赠时间',
  `title` varchar(255) NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) COMMENT = '捐赠表';

CREATE TABLE `app_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `pid` bigint(20) NOT NULL COMMENT '动态id',
  `create_date` datetime NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) COMMENT = '点赞表';

CREATE TABLE `app_message`  (
  `id` bigint(20) NOT NULL COMMENT '消息id',
  `uid` bigint(20) NULL COMMENT '用户id',
  `to_uid` bigint(20) NULL COMMENT '收消息用户id',
  `content` tinytext NULL COMMENT '内容',
  `pid` bigint(20) NULL COMMENT '帖子id',
  `type_id` int NULL COMMENT '类型id',
  `create_date` datetime NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) COMMENT = '消息表';

CREATE TABLE `app_message_type`  (
  `id` int NOT NULL COMMENT 'id',
  `name` varchar(255) NULL COMMENT '名字',
  PRIMARY KEY (`id`)
) COMMENT = '信息类型表';

CREATE TABLE `app_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 动态id',
  `title` varchar(255) NULL COMMENT '动态标题',
  `content` tinytext NULL COMMENT '动态内容',
  `image` tinytext NULL COMMENT '动态图片',
  `video` tinytext NULL COMMENT '动态视频',
  `create_date` datetime NULL COMMENT '创建时间',
  `update_date` datetime NULL COMMENT '更新时间',
  `uid` bigint NULL COMMENT '用户id',
  `tid` int NULL COMMENT '话题id',
  `aid` bigint(20) NULL COMMENT '动物id',
  `location` tinytext NULL COMMENT '具体位置',
  `city` varchar(255) NULL COMMENT '城市',
  `urgent` int(1) NULL COMMENT '紧急程度',
  `type_id` int NULL COMMENT '动态类型',
  `like_number` int NULL DEFAULT 0 COMMENT '点赞数量',
  `collection_number` int NULL DEFAULT 0 COMMENT '收藏数量',
  `comments_number` int NULL DEFAULT 0 COMMENT '评论数量',
  `url` tinytext NULL COMMENT '链接',
  `s1` tinytext NULL COMMENT '扩展1',
  PRIMARY KEY (`id`)
) COMMENT = '动态表';

CREATE TABLE `app_post_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '动态类型id',
  `name` varchar(255) NULL COMMENT '动态类型名字',
  PRIMARY KEY (`id`)
) COMMENT = '动态类型表';

CREATE TABLE `app_topic`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `title` varchar(255) NULL COMMENT '话题名字',
  PRIMARY KEY (`id`)
) COMMENT = '话题表';

CREATE TABLE `user_data`  (
  `uid` bigint(20) NOT NULL COMMENT 'user_id',
  `desc` varchar(255) NULL COMMENT '描述',
  `year` int(2) NULL COMMENT '年龄',
  `to_uid` int NULL COMMENT '属于某用户',
  `s1` tinytext NULL COMMENT '扩展1',
  `s2` tinytext NULL COMMENT '扩展2'
) COMMENT = '用户数据扩展表';

CREATE TABLE `user_type`  (
  `id` int NOT NULL COMMENT 'id',
  `title` varchar(255) NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) COMMENT = '用户类型表';

ALTER TABLE `app_animal_state` ADD CONSTRAINT `foreign_key_animal_id` FOREIGN KEY (`aid`) REFERENCES `app_animal` (`id`) ON DELETE CASCADE;
ALTER TABLE `app_animal_state` ADD CONSTRAINT `foreign_key_animal_state_data_id` FOREIGN KEY (`sid`) REFERENCES `app_animal_state_data` (`id`) ON DELETE CASCADE;
ALTER TABLE `app_comments` ADD CONSTRAINT `fk_post_id` FOREIGN KEY (`pid`) REFERENCES `app_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

