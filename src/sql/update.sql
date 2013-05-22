-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- ����: localhost
-- ��������: 2013 �� 05 �� 22 �� 09:18
-- �������汾: 5.5.27
-- PHP �汾: 5.3.9-ZS5.6.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- ���ݿ�: `avsys`
--

-- --------------------------------------------------------

--
-- ��Ľṹ `actor`
--
USE `avsys`;
DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ա��Ϣ������',
  `agency_id` int(11) DEFAULT NULL COMMENT '���͹�˾ID',
  `cn_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '��������',
  `jp_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '��������',
  `en_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Ӣ������',
  `nation` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `age` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `introduce` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ա��Ϣ���',
  `birth_place` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '������',
  `cup` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'cup!',
  `BWH` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'BWH����',
  `height` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `wiki` text COLLATE utf8_bin,
  `mark_time` int(13) NOT NULL DEFAULT '0',
  `total_mark` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��Ľṹ `agency`
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
-- ��Ľṹ `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime NOT NULL,
  `follow_comment_id` int(11) DEFAULT NULL COMMENT '������ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- ��Ľṹ `groups`
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
-- ��Ľṹ `tags`
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
-- ��Ľṹ `types`
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
-- ��Ľṹ `users`
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
-- ��Ľṹ `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_bin NOT NULL,
  `magnet_link` text COLLATE utf8_bin COMMENT '������������',
  `bit_torrent` text COLLATE utf8_bin NOT NULL COMMENT 'BT������������',
  `thunder_link` text COLLATE utf8_bin,
  `ed2k_link` text COLLATE utf8_bin,
  `wiki` text COLLATE utf8_bin NOT NULL COMMENT '���ֽ��ܡ�',
  `mark_time` int(11) NOT NULL DEFAULT '0',
  `total_mark` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- ��Ľṹ `video_actor`
--

DROP TABLE IF EXISTS `video_actor`;
CREATE TABLE IF NOT EXISTS `video_actor` (
  `video_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
