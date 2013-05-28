SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
CREATE DATABASE IF NOT EXISTS `avsys` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `avsys`;
DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '活动类型的名称，例如：喜欢、看过、想看等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '演员信息表主键',
  `agency_id` int(11) DEFAULT NULL COMMENT '经纪公司ID',
  `cn_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '中文名字',
  `jp_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '日文名字',
  `en_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '英文名字',
  `nation` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `weight` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '体重',
  `introduce` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '演员信息简介',
  `birth_place` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '出生地',
  `cup` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'cup!',
  `BWH` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'BWH！！',
  `height` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `wiki` text COLLATE utf8_bin,
  `total_mark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评分',
  `mark_time` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `actor_activity`;
CREATE TABLE IF NOT EXISTS `actor_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) NOT NULL COMMENT '演员ID',
  `action` int(11) NOT NULL COMMENT '活动动作，如：出演，下马，出道，隐退',
  `content` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '活动描述',
  `target_id` bigint(20) DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `agency`;
CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `official_site` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `introduce` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `wiki` text COLLATE utf8_bin,
  `mark_time` int(11) DEFAULT NULL,
  `total_mark` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `agency_activity`;
CREATE TABLE IF NOT EXISTS `agency_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `action` int(11) NOT NULL COMMENT '如：发行，收编，',
  `target_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '如：影片、演员',
  `target_id` int(11) DEFAULT NULL COMMENT '影片ID、演员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `attachment`;
CREATE TABLE IF NOT EXISTS `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `category_relations`;
CREATE TABLE IF NOT EXISTS `category_relations` (
  `category_id` int(11) NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `group_user_relations`;
CREATE TABLE IF NOT EXISTS `group_user_relations` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `join_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_bin NOT NULL,
  `wiki` text COLLATE utf8_bin NOT NULL COMMENT '各种介绍。',
  `mark_time` int(11) DEFAULT NULL,
  `total_mark` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `movie_actor_relations`;
CREATE TABLE IF NOT EXISTS `movie_actor_relations` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `parameter`;
CREATE TABLE IF NOT EXISTS `parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `tag_relations`;
CREATE TABLE IF NOT EXISTS `tag_relations` (
  `tag_id` bigint(20) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `movie_id` bigint(20) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `role` tinyint(4) NOT NULL,
  `nickname` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE IF NOT EXISTS `user_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` tinyint(4) NOT NULL COMMENT '动态类型：喜欢，收藏，评论，想看，看过',
  `target_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '活动对象的类型，如：电影、演员、制作公司',
  `target_id` int(11) DEFAULT NULL COMMENT '活动对象的ID',
  `user_id` int(11) NOT NULL,
  `comment` varchar(280) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
