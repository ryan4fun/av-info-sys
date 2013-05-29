-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 05 月 22 日 09:18
-- 服务器版本: 5.5.27
-- PHP 版本: 5.3.9-ZS5.6.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- 数据库: `avsys`
--

-- --------------------------------------------------------

--
-- 表的结构 `actor`
--
USE `avsys`;
DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '演员信息表主键',
  `agency_id` int(11) DEFAULT NULL COMMENT '经纪公司ID',
  `cn_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '中文名字',
  `jp_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '日文名字',
  `en_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '英文名字',
  `nation` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '国籍',
  `age` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '年龄',
  `introduce` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '演员信息简介',
  `birth_place` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '出生地',
  `cup` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'cup!',
  `BWH` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'BWH！！',
  `height` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `wiki` text COLLATE utf8_bin,
  `mark_time` int(13) NOT NULL DEFAULT '0',
  `total_mark` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `agency`
--

DROP TABLE IF EXISTS `agency`;
CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `official_site` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `introduce` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `wiki` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime NOT NULL,
  `follow_comment_id` int(11) DEFAULT NULL COMMENT '跟帖的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `create_data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `is_loggin` tinyint(4) NOT NULL,
  `nickname` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_bin NOT NULL,
  `magnet_link` text COLLATE utf8_bin COMMENT '磁力下载链接',
  `bit_torrent` text COLLATE utf8_bin NOT NULL COMMENT 'BT种子下载链接',
  `thunder_link` text COLLATE utf8_bin,
  `ed2k_link` text COLLATE utf8_bin,
  `wiki` text COLLATE utf8_bin NOT NULL COMMENT '各种介绍。',
  `mark_time` int(11) NOT NULL DEFAULT '0',
  `total_mark` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `video_actor`
--

DROP TABLE IF EXISTS `video_actor`;
CREATE TABLE IF NOT EXISTS `video_actor` (
  `video_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
