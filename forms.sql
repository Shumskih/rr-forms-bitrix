-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.7.24 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица forms_bitrix.b_admin_notify
CREATE TABLE IF NOT EXISTS `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_admin_notify: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify`;
/*!40000 ALTER TABLE `b_admin_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_admin_notify_lang
CREATE TABLE IF NOT EXISTS `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_admin_notify_lang: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify_lang`;
/*!40000 ALTER TABLE `b_admin_notify_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_agent
CREATE TABLE IF NOT EXISTS `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_agent: ~29 rows (приблизительно)
DELETE FROM `b_agent`;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`) VALUES
	(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2020-01-20 01:23:50', '2020-01-20 01:24:50', NULL, 60, 'N', NULL, 'N'),
	(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2020-01-20 01:02:57', '2020-01-20 02:02:57', NULL, 3600, 'N', NULL, 'N'),
	(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2020-01-19 12:57:11', '2020-01-20 12:57:11', NULL, 86400, 'N', NULL, 'N'),
	(13, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(14, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(15, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(16, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2020-01-19 23:57:43', '2020-01-20 01:57:43', NULL, 7200, 'N', NULL, 'N'),
	(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2020-01-20 01:02:57', '2020-01-20 02:02:57', NULL, 3600, 'N', NULL, 'N'),
	(18, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2020-01-20 00:00:00', '2020-01-21 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
	(19, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(20, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(21, 'rest', 100, '\\Bitrix\\Rest\\StatTable::cleanUpAgent();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(22, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(23, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(24, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2020-01-20 01:02:57', '2020-01-20 01:32:57', NULL, 1800, 'N', NULL, 'N'),
	(25, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2020-01-20 01:02:57', '2020-01-20 02:02:57', NULL, 3600, 'N', NULL, 'N'),
	(26, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2020-01-20 01:02:57', '2020-01-20 02:02:57', NULL, 3600, 'N', NULL, 'N'),
	(27, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2020-01-19 12:57:12', '2020-01-20 12:57:12', NULL, 86400, 'N', NULL, 'N'),
	(28, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2020-01-20 01:02:57', '2020-01-20 02:02:57', NULL, 3600, 'N', NULL, 'N'),
	(29, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', '2020-01-19 12:58:22', '2020-01-20 03:00:00', NULL, 86400, 'Y', NULL, 'N');
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_app_password
CREATE TABLE IF NOT EXISTS `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_app_password: ~0 rows (приблизительно)
DELETE FROM `b_app_password`;
/*!40000 ALTER TABLE `b_app_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_app_password` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_b24connector_buttons
CREATE TABLE IF NOT EXISTS `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_b24connector_buttons: ~0 rows (приблизительно)
DELETE FROM `b_b24connector_buttons`;
/*!40000 ALTER TABLE `b_b24connector_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_buttons` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_bitrixcloud_option
CREATE TABLE IF NOT EXISTS `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_bitrixcloud_option: ~3 rows (приблизительно)
DELETE FROM `b_bitrixcloud_option`;
/*!40000 ALTER TABLE `b_bitrixcloud_option` DISABLE KEYS */;
INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
	(1, 'backup_quota', 0, '0', '0'),
	(2, 'backup_total_size', 0, '0', '0'),
	(3, 'backup_last_backup_time', 0, '0', '1579003230'),
	(4, 'monitoring_expire_time', 0, '0', '1579082107');
/*!40000 ALTER TABLE `b_bitrixcloud_option` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog
CREATE TABLE IF NOT EXISTS `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog: ~0 rows (приблизительно)
DELETE FROM `b_blog`;
/*!40000 ALTER TABLE `b_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_category
CREATE TABLE IF NOT EXISTS `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_category`;
/*!40000 ALTER TABLE `b_blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_category` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_comment
CREATE TABLE IF NOT EXISTS `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_blog_comment`;
/*!40000 ALTER TABLE `b_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_group
CREATE TABLE IF NOT EXISTS `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_group`;
/*!40000 ALTER TABLE `b_blog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_image
CREATE TABLE IF NOT EXISTS `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_image: ~0 rows (приблизительно)
DELETE FROM `b_blog_image`;
/*!40000 ALTER TABLE `b_blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_image` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_post
CREATE TABLE IF NOT EXISTS `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_blog_post`;
/*!40000 ALTER TABLE `b_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_post_category
CREATE TABLE IF NOT EXISTS `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_post_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_category`;
/*!40000 ALTER TABLE `b_blog_post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_category` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_post_param
CREATE TABLE IF NOT EXISTS `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_post_param: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_param`;
/*!40000 ALTER TABLE `b_blog_post_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_param` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_site_path
CREATE TABLE IF NOT EXISTS `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_site_path: ~0 rows (приблизительно)
DELETE FROM `b_blog_site_path`;
/*!40000 ALTER TABLE `b_blog_site_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_site_path` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_socnet
CREATE TABLE IF NOT EXISTS `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_socnet: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet`;
/*!40000 ALTER TABLE `b_blog_socnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_socnet_rights
CREATE TABLE IF NOT EXISTS `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`),
  KEY `IX_BLOG_SR_2` (`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_socnet_rights: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet_rights`;
/*!40000 ALTER TABLE `b_blog_socnet_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet_rights` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_trackback
CREATE TABLE IF NOT EXISTS `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_trackback: ~0 rows (приблизительно)
DELETE FROM `b_blog_trackback`;
/*!40000 ALTER TABLE `b_blog_trackback` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_trackback` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_user
CREATE TABLE IF NOT EXISTS `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_user: ~0 rows (приблизительно)
DELETE FROM `b_blog_user`;
/*!40000 ALTER TABLE `b_blog_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_user2blog
CREATE TABLE IF NOT EXISTS `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_user2blog: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2blog`;
/*!40000 ALTER TABLE `b_blog_user2blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2blog` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_user2user_group
CREATE TABLE IF NOT EXISTS `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_user2user_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2user_group`;
/*!40000 ALTER TABLE `b_blog_user2user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2user_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_user_group
CREATE TABLE IF NOT EXISTS `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_user_group: ~2 rows (приблизительно)
DELETE FROM `b_blog_user_group`;
/*!40000 ALTER TABLE `b_blog_user_group` DISABLE KEYS */;
INSERT INTO `b_blog_user_group` (`ID`, `BLOG_ID`, `NAME`) VALUES
	(1, NULL, 'all'),
	(2, NULL, 'registered');
/*!40000 ALTER TABLE `b_blog_user_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_blog_user_group_perms
CREATE TABLE IF NOT EXISTS `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_blog_user_group_perms: ~0 rows (приблизительно)
DELETE FROM `b_blog_user_group_perms`;
/*!40000 ALTER TABLE `b_blog_user_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user_group_perms` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_cache_tag
CREATE TABLE IF NOT EXISTS `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_cache_tag: ~7 rows (приблизительно)
DELETE FROM `b_cache_tag`;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
INSERT INTO `b_cache_tag` (`SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
	(NULL, NULL, '0:1579427907', '**'),
	('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_1'),
	('s1', '/e25', '/s1/bitrix/news.detail/e25', 'iblock_id_1'),
	('s1', '/9de', '/s1/bitrix/form.result.new', 'forms'),
	('s1', '/9de', '/s1/bitrix/form.result.new', 'form_1'),
	('s1', '/9de', '/s1/bitrix/form.result.new', 'form_'),
	('s1', '/9de', '/s1/bitrix/form.result.new', 'form_2'),
	('s1', '/9de', '/s1/bitrix/form.result.new', 'form_3');
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_captcha
CREATE TABLE IF NOT EXISTS `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_captcha: ~66 rows (приблизительно)
DELETE FROM `b_captcha`;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
INSERT INTO `b_captcha` (`ID`, `CODE`, `IP`, `DATE_CREATE`) VALUES
	('0027070a79c85756bc6013f558c82e16', 'TJYEY', '127.0.0.1', '2020-01-20 00:46:44'),
	('007aa7c192010444a09b8c4764abb307', 'E9QXT', '127.0.0.1', '2020-01-20 01:04:37'),
	('008c6e1c0f56fc2e202e13e239f1168e', '2TMRL', '127.0.0.1', '2020-01-20 01:05:08'),
	('00b5b8b98f531cffb3c06219b459cf87', 'KTHJN', '127.0.0.1', '2020-01-20 00:55:30'),
	('00e819ae2ce04fb2504937ceda79c5be', 'B3B34', '127.0.0.1', '2020-01-20 00:06:35'),
	('0121e658985992d8840e99ba1ca9f85c', 'T4BXT', '127.0.0.1', '2020-01-20 00:54:41'),
	('013b50cb4078494146626095000b1802', '4Q8A9', '127.0.0.1', '2020-01-20 01:21:55'),
	('0142298320545357d066834230c5dfec', '5477L', '127.0.0.1', '2020-01-20 00:06:18'),
	('0144e7903b8d08e57a78b38b74d4557e', 'N389X', '127.0.0.1', '2020-01-20 00:03:56'),
	('01cc4a65a3fdd18185e73fe4d383b183', 'F2P2C', '127.0.0.1', '2020-01-20 01:10:34'),
	('01eade23a64db2db254702d027523f3b', 'H4MAP', '127.0.0.1', '2020-01-20 01:21:10'),
	('0249d983f1745238d4220056ddf4dff2', 'QX8RB', '127.0.0.1', '2020-01-20 00:07:08'),
	('025a2553fb29c55a5b6371edd648a99e', 'QWWJM', '127.0.0.1', '2020-01-20 01:11:36'),
	('025f719829e5d20906d5e633535f1b10', 'BWLGE', '127.0.0.1', '2020-01-20 01:07:12'),
	('032eefc69a5e8926a26ef765c7f67bc7', 'GGZYF', '127.0.0.1', '2020-01-20 00:32:09'),
	('03d04a6be334eda2f0da7bea8b6638e9', '9SDRH', '127.0.0.1', '2020-01-20 01:19:57'),
	('041e15e254875f0eeebc8372afae51a1', 'XYZCQ', '127.0.0.1', '2020-01-20 01:23:11'),
	('043c7cda66d5776e22d3dac1589feb76', '8SLPB', '127.0.0.1', '2020-01-20 01:15:10'),
	('04c0af80e6b1fc57c629efea633a4b71', 'PLGTF', '127.0.0.1', '2020-01-20 00:05:31'),
	('055f50a4e76a53d892f309134bfc974a', 'N4EGJ', '127.0.0.1', '2020-01-20 00:48:49'),
	('0583b7f02328cf9fa3d0673637769c28', 'JJ49S', '127.0.0.1', '2020-01-20 01:03:57'),
	('068d41434061bd0a9f7d926ef2d718ff', 'KPW68', '127.0.0.1', '2020-01-20 00:52:51'),
	('06a9a439b14dc6b1300915a0bd780917', 'T9S9D', '127.0.0.1', '2020-01-20 00:26:58'),
	('06cdc0ba891738e5770e94fc36e09032', 'AX7RG', '127.0.0.1', '2020-01-20 00:16:04'),
	('06f0ad7ecad53e84958bb1158cfcefee', 'TJ3Q7', '127.0.0.1', '2020-01-20 01:13:36'),
	('06f82abd2f7b1cf274cbdc784fa498d5', 'CGFDH', '127.0.0.1', '2020-01-20 00:29:56'),
	('06fa5e1fedccdfdc1f9cd58e3dda4123', 'MR3H9', '127.0.0.1', '2020-01-20 01:17:39'),
	('072f9977e580c8ee891ba1461cb67d34', '2YLTT', '127.0.0.1', '2020-01-20 00:47:24'),
	('0752eb65cf98d674e19050bdf3789ce9', 'P2Q38', '127.0.0.1', '2020-01-20 01:02:57'),
	('075ef5283245f1365602ebf303e856a1', 'RFH55', '127.0.0.1', '2020-01-20 01:12:06'),
	('0763bd4fab8c2fcbecca882bb1124553', 'STBMT', '127.0.0.1', '2020-01-20 01:23:06'),
	('0772315307b248818399543599024533', 'YYC64', '127.0.0.1', '2020-01-20 00:20:43'),
	('07805f22bd2c6e1441c5d7d32b88092f', 'CJYDG', '127.0.0.1', '2020-01-20 00:55:55'),
	('07976c5792c0904b7573dbce22574ca4', 'BLMAS', '127.0.0.1', '2020-01-20 00:14:52'),
	('079942d0ecf7794f477f91ac7b1a92df', 'CWW9D', '127.0.0.1', '2020-01-20 00:14:28'),
	('07ace29a04ff300893969bd9e1314ba7', 'AK6D3', '127.0.0.1', '2020-01-20 00:32:15'),
	('08e35c5bb0d64898a9fb6dbd1c6ae102', 'HQ6XY', '127.0.0.1', '2020-01-20 01:14:59'),
	('0919cc74382e697271e69d62c4e64252', 'RCYJ5', '127.0.0.1', '2020-01-20 00:45:22'),
	('097a90cb15b25904965eeaafba17f946', 'D288R', '127.0.0.1', '2020-01-20 01:10:24'),
	('0980163b9c3aa8367bbc65219ca7e64f', 'FFLRF', '127.0.0.1', '2020-01-20 00:30:31'),
	('09d143ef5c112ee0b43ca955256a88c7', 'FDP87', '127.0.0.1', '2020-01-20 00:21:05'),
	('09fc89f9b933a94324d3ddc32d20700b', '98QKP', '127.0.0.1', '2020-01-20 00:19:44'),
	('0a926b743ecb5cbaec8d6f200215f147', 'TSKGK', '127.0.0.1', '2020-01-20 00:24:07'),
	('0aa46ab44053ef73d22a7b54c3007bfb', 'HTF2E', '127.0.0.1', '2020-01-20 00:28:29'),
	('0aa7625b96f00a06a81af00c1e7c3f37', 'DGR8B', '127.0.0.1', '2020-01-20 00:25:29'),
	('0ac523328aa026181b249688519bacf2', 'KWL4M', '127.0.0.1', '2020-01-20 00:08:16'),
	('0adb4a45fabbe21b7b0c61818f4f71ad', 'YNEFK', '127.0.0.1', '2020-01-20 00:13:52'),
	('0b3ea22050da1060c3060450de2abbb7', '8F6ZN', '127.0.0.1', '2020-01-20 00:31:38'),
	('0b6f893c7f0ada261f4d64ee4548e4a9', '6A7Z2', '127.0.0.1', '2020-01-20 01:07:49'),
	('0b829627f8e5a49ff50de8c589f24e3f', 'JCRBK', '127.0.0.1', '2020-01-20 00:46:09'),
	('0bf9bfa3eee7132b9710f91a5792a237', 'PG3GY', '127.0.0.1', '2020-01-20 01:23:50'),
	('0c58ccf34f0ddea4f835d7a78645a4ff', 'B9ZYZ', '127.0.0.1', '2020-01-20 01:03:30'),
	('0c6a017d16b5e32e004c0e5e600b0870', 'TZ6GT', '127.0.0.1', '2020-01-20 01:17:06'),
	('0d298f7ef2a900a17364ecb61f76dbea', '7K9TL', '127.0.0.1', '2020-01-20 00:51:38'),
	('0d62289207d50bacb5a07585d6ae0070', 'FMX8N', '127.0.0.1', '2020-01-20 00:18:24'),
	('0d722efdcea3b529b3e3127eb040238d', 'GGEXB', '127.0.0.1', '2020-01-20 00:32:34'),
	('0de30612b70bbdd29eb561e1c1b6d839', 'C2QCJ', '127.0.0.1', '2020-01-20 00:52:12'),
	('0df38797697f83421837a2273bf2aa6b', 'SJ3K5', '127.0.0.1', '2020-01-20 01:15:30'),
	('0ed45d0e14a55d0bfe3d77693ddf6f53', 'DGGEM', '127.0.0.1', '2020-01-20 00:15:48'),
	('0edd38c4a516d6cb019ccd0f67435324', 'C7ZNF', '127.0.0.1', '2020-01-20 00:26:02'),
	('0f720e2a88378940b7e2e373719e7ca1', '8RM33', '127.0.0.1', '2020-01-20 01:12:31'),
	('0f91281c087a5e216d427848d8c0ee83', 'CTJ6Q', '127.0.0.1', '2020-01-20 00:12:36'),
	('0f9ebfd5d8063a5bedc9e24a99b6ec5c', 'AFR2J', '127.0.0.1', '2020-01-20 00:28:35'),
	('0fad75be12683ca0ff886fed61abf585', 'YNS8W', '127.0.0.1', '2020-01-20 00:49:37'),
	('0fb32abfe5a7b08e692476cb3d52afbc', 'YY6YC', '127.0.0.1', '2020-01-20 00:05:52'),
	('0fd79fcb2d4f650faa9f783c02dda726', 'E42HE', '127.0.0.1', '2020-01-20 00:20:02');
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_checklist
CREATE TABLE IF NOT EXISTS `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_checklist: ~0 rows (приблизительно)
DELETE FROM `b_checklist`;
/*!40000 ALTER TABLE `b_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_checklist` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_clouds_copy_queue
CREATE TABLE IF NOT EXISTS `b_clouds_copy_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `OP` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int(11) NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int(11) NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL DEFAULT '-1',
  `FILE_POS` int(11) NOT NULL DEFAULT '0',
  `FAIL_COUNTER` int(11) NOT NULL DEFAULT '0',
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_clouds_copy_queue: ~0 rows (приблизительно)
DELETE FROM `b_clouds_copy_queue`;
/*!40000 ALTER TABLE `b_clouds_copy_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_copy_queue` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_clouds_delete_queue
CREATE TABLE IF NOT EXISTS `b_clouds_delete_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_clouds_delete_queue: ~0 rows (приблизительно)
DELETE FROM `b_clouds_delete_queue`;
/*!40000 ALTER TABLE `b_clouds_delete_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_delete_queue` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_clouds_file_bucket
CREATE TABLE IF NOT EXISTS `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` double DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int(11) DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_clouds_file_bucket: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_bucket`;
/*!40000 ALTER TABLE `b_clouds_file_bucket` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_bucket` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_clouds_file_resize
CREATE TABLE IF NOT EXISTS `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_clouds_file_resize: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_resize`;
/*!40000 ALTER TABLE `b_clouds_file_resize` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_resize` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_clouds_file_save
CREATE TABLE IF NOT EXISTS `b_clouds_file_save` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_clouds_file_save: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_save`;
/*!40000 ALTER TABLE `b_clouds_file_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_save` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_clouds_file_upload
CREATE TABLE IF NOT EXISTS `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_clouds_file_upload: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_upload`;
/*!40000 ALTER TABLE `b_clouds_file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_upload` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_component_params
CREATE TABLE IF NOT EXISTS `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_component_params: ~2 rows (приблизительно)
DELETE FROM `b_component_params`;
/*!40000 ALTER TABLE `b_component_params` DISABLE KEYS */;
INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
	(2, 's1', 'bitrix:news', 'complex_news', '/index.php', 'Y', '/articles/', 101, 2240, 'a:67:{s:17:"ADD_ELEMENT_CHAIN";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:9:"AJAX_MODE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:13:"BROWSER_TITLE";s:1:"-";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:10:"CACHE_TIME";s:8:"36000000";s:10:"CACHE_TYPE";s:1:"A";s:11:"CHECK_DATES";s:1:"Y";s:25:"DETAIL_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:27:"DETAIL_DISPLAY_BOTTOM_PAGER";s:1:"Y";s:24:"DETAIL_DISPLAY_TOP_PAGER";s:1:"N";s:17:"DETAIL_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:21:"DETAIL_PAGER_SHOW_ALL";s:1:"Y";s:21:"DETAIL_PAGER_TEMPLATE";s:0:"";s:18:"DETAIL_PAGER_TITLE";s:16:"Страница";s:20:"DETAIL_PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:24:"DETAIL_SET_CANONICAL_URL";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:9:"IBLOCK_ID";s:1:"1";s:11:"IBLOCK_TYPE";s:8:"articles";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:23:"LIST_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:15:"LIST_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:18:"LIST_PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"MESSAGE_404";s:0:"";s:16:"META_DESCRIPTION";s:1:"-";s:13:"META_KEYWORDS";s:1:"-";s:10:"NEWS_COUNT";s:2:"20";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:14:"PAGER_TEMPLATE";s:8:".default";s:11:"PAGER_TITLE";s:14:"Новости";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:10:"SEF_FOLDER";s:10:"/articles/";s:8:"SEF_MODE";s:1:"Y";s:17:"SEF_URL_TEMPLATES";a:3:{s:6:"detail";s:15:"#ELEMENT_CODE#/";s:4:"news";s:0:"";s:7:"section";s:0:"";}s:17:"SET_LAST_MODIFIED";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:8:"SHOW_404";s:1:"N";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER1";s:4:"DESC";s:11:"SORT_ORDER2";s:3:"ASC";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:14:"USE_CATEGORIES";s:1:"N";s:10:"USE_FILTER";s:1:"N";s:15:"USE_PERMISSIONS";s:1:"N";s:10:"USE_RATING";s:1:"N";s:10:"USE_REVIEW";s:1:"N";s:7:"USE_RSS";s:1:"N";s:10:"USE_SEARCH";s:1:"N";s:9:"USE_SHARE";s:1:"N";}'),
	(11, 's1', 'bitrix:form', 'contact_us_form', '/contact-us.php', 'N', NULL, 102, 1090, 'a:28:{s:9:"AJAX_MODE";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:10:"CACHE_TIME";s:4:"3600";s:10:"CACHE_TYPE";s:1:"A";s:15:"CHAIN_ITEM_LINK";s:0:"";s:15:"CHAIN_ITEM_TEXT";s:0:"";s:15:"EDIT_ADDITIONAL";s:1:"N";s:11:"EDIT_STATUS";s:1:"Y";s:22:"IGNORE_CUSTOM_TEMPLATE";s:1:"N";s:15:"NOT_SHOW_FILTER";a:2:{i:0;s:0:"";i:1;s:0:"";}s:14:"NOT_SHOW_TABLE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:9:"RESULT_ID";s:23:"={$_REQUEST[RESULT_ID]}";s:8:"SEF_MODE";s:1:"N";s:15:"SHOW_ADDITIONAL";s:1:"N";s:17:"SHOW_ANSWER_VALUE";s:1:"N";s:14:"SHOW_EDIT_PAGE";s:1:"N";s:14:"SHOW_LIST_PAGE";s:1:"N";s:11:"SHOW_STATUS";s:1:"Y";s:14:"SHOW_VIEW_PAGE";s:1:"Y";s:10:"START_PAGE";s:3:"new";s:11:"SUCCESS_URL";s:11:"success.php";s:19:"USE_EXTENDED_ERRORS";s:1:"N";s:11:"WEB_FORM_ID";s:1:"3";s:18:"COMPONENT_TEMPLATE";s:15:"contact_us_form";s:16:"VARIABLE_ALIASES";a:1:{s:6:"action";s:6:"action";}}');
/*!40000 ALTER TABLE `b_component_params` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_composite_log
CREATE TABLE IF NOT EXISTS `b_composite_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(18) NOT NULL DEFAULT '0',
  `PAGE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_composite_log: ~0 rows (приблизительно)
DELETE FROM `b_composite_log`;
/*!40000 ALTER TABLE `b_composite_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_log` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_composite_page
CREATE TABLE IF NOT EXISTS `b_composite_page` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `REWRITES` int(18) NOT NULL DEFAULT '0',
  `SIZE` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_composite_page: ~0 rows (приблизительно)
DELETE FROM `b_composite_page`;
/*!40000 ALTER TABLE `b_composite_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_page` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_consent_agreement
CREATE TABLE IF NOT EXISTS `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_consent_agreement: ~0 rows (приблизительно)
DELETE FROM `b_consent_agreement`;
/*!40000 ALTER TABLE `b_consent_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_agreement` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_consent_field
CREATE TABLE IF NOT EXISTS `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_consent_field: ~0 rows (приблизительно)
DELETE FROM `b_consent_field`;
/*!40000 ALTER TABLE `b_consent_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_field` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_consent_user_consent
CREATE TABLE IF NOT EXISTS `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_consent_user_consent: ~0 rows (приблизительно)
DELETE FROM `b_consent_user_consent`;
/*!40000 ALTER TABLE `b_consent_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_counter_data
CREATE TABLE IF NOT EXISTS `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_counter_data: ~0 rows (приблизительно)
DELETE FROM `b_counter_data`;
/*!40000 ALTER TABLE `b_counter_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_counter_data` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_culture
CREATE TABLE IF NOT EXISTS `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_culture: ~2 rows (приблизительно)
DELETE FROM `b_culture`;
/*!40000 ALTER TABLE `b_culture` DISABLE KEYS */;
INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
	(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
	(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);
/*!40000 ALTER TABLE `b_culture` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event
CREATE TABLE IF NOT EXISTS `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event: ~8 rows (приблизительно)
DELETE FROM `b_event`;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
INSERT INTO `b_event` (`ID`, `EVENT_NAME`, `MESSAGE_ID`, `LID`, `C_FIELDS`, `DATE_INSERT`, `DATE_EXEC`, `SUCCESS_EXEC`, `DUPLICATE`, `LANGUAGE_ID`) VALUES
	(1, 'FORM_FILLING_SIMPLE_FORM_1', 30, 's1', 'a:18:{s:10:"RS_FORM_ID";s:1:"1";s:12:"RS_FORM_NAME";s:19:"Напиши нам";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_1";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_1";s:12:"RS_RESULT_ID";s:1:"1";s:14:"RS_DATE_CREATE";s:19:"16.01.2020 13:35:12";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_898";s:18:"Александр";s:23:"SIMPLE_QUESTION_898_RAW";s:18:"Александр";s:19:"SIMPLE_QUESTION_336";s:17:"music.dll@mail.ru";s:23:"SIMPLE_QUESTION_336_RAW";s:17:"music.dll@mail.ru";s:19:"SIMPLE_QUESTION_727";s:62:"dkfjsk gdfgh dlfgkhj dlfkgj ldfkjg ldkfjg ldkfjg dkfjg ldfgf g";s:23:"SIMPLE_QUESTION_727_RAW";s:62:"dkfjsk gdfgh dlfgkhj dlfkgj ldfkjg ldkfjg ldkfjg dkfjg ldfgf g";}', '2020-01-16 13:35:12', '2020-01-16 13:35:12', 'Y', 'Y', 'ru'),
	(2, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:18:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"2";s:14:"RS_DATE_CREATE";s:19:"19.01.2020 13:45:15";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:18:"Александр";s:23:"SIMPLE_QUESTION_523_RAW";s:18:"Александр";s:19:"SIMPLE_QUESTION_926";s:17:"music.dll@mail.ru";s:23:"SIMPLE_QUESTION_926_RAW";s:17:"music.dll@mail.ru";s:19:"SIMPLE_QUESTION_341";s:20:"dewsgfdfgf gdf gdf g";s:23:"SIMPLE_QUESTION_341_RAW";s:20:"dewsgfdfgf gdf gdf g";}', '2020-01-19 13:45:15', '2020-01-19 13:45:16', 'Y', 'Y', 'ru'),
	(3, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:18:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"3";s:14:"RS_DATE_CREATE";s:19:"19.01.2020 13:46:44";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:8:"nmghjghj";s:23:"SIMPLE_QUESTION_523_RAW";s:8:"nmghjghj";s:19:"SIMPLE_QUESTION_926";s:9:"ghj ghj g";s:23:"SIMPLE_QUESTION_926_RAW";s:9:"ghj ghj g";s:19:"SIMPLE_QUESTION_341";s:17:"gh jgh jgjkhjkhjk";s:23:"SIMPLE_QUESTION_341_RAW";s:17:"gh jgh jgjkhjkhjk";}', '2020-01-19 13:46:44', '2020-01-19 13:46:44', 'Y', 'Y', 'ru'),
	(4, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:18:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"4";s:14:"RS_DATE_CREATE";s:19:"20.01.2020 00:28:07";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:13:"dfjghfdjhgdfg";s:23:"SIMPLE_QUESTION_523_RAW";s:13:"dfjghfdjhgdfg";s:19:"SIMPLE_QUESTION_926";s:15:"fdspgodfjgjdfgd";s:23:"SIMPLE_QUESTION_926_RAW";s:15:"fdspgodfjgjdfgd";s:19:"SIMPLE_QUESTION_341";s:38:"dfgfdg fdo gdfhgjhdfgjh dfghj; dfg dfg";s:23:"SIMPLE_QUESTION_341_RAW";s:38:"dfgfdg fdo gdfhgjhdfgjh dfghj; dfg dfg";}', '2020-01-20 00:28:07', '2020-01-20 00:28:08', 'Y', 'Y', 'ru'),
	(5, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:20:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"5";s:14:"RS_DATE_CREATE";s:19:"20.01.2020 01:11:25";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:13:"fdrgdfgkdfj g";s:23:"SIMPLE_QUESTION_523_RAW";s:13:"fdrgdfgkdfj g";s:19:"SIMPLE_QUESTION_926";s:20:"sftogdjf gdfjg dfkg`";s:23:"SIMPLE_QUESTION_926_RAW";s:20:"sftogdjf gdfjg dfkg`";s:19:"SIMPLE_QUESTION_341";s:22:"fdgkjdf gdkfj gdgj dfg";s:23:"SIMPLE_QUESTION_341_RAW";s:22:"fdgkjdf gdkfj gdgj dfg";s:19:"SIMPLE_QUESTION_544";s:86:"Соглашаюсь на обработку персональных данных [8]";s:23:"SIMPLE_QUESTION_544_RAW";s:82:"Соглашаюсь на обработку персональных данных";}', '2020-01-20 01:11:25', '2020-01-20 01:11:25', 'Y', 'Y', 'ru'),
	(6, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:20:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"6";s:14:"RS_DATE_CREATE";s:19:"20.01.2020 01:12:26";s:10:"RS_USER_ID";s:35:"не зарегистрирован";s:13:"RS_USER_EMAIL";s:0:"";s:12:"RS_USER_NAME";s:0:"";s:12:"RS_USER_AUTH";s:0:"";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:16:"fgdm fgd g dg fd";s:23:"SIMPLE_QUESTION_523_RAW";s:16:"fgdm fgd g dg fd";s:19:"SIMPLE_QUESTION_926";s:10:"dfg dfg df";s:23:"SIMPLE_QUESTION_926_RAW";s:10:"dfg dfg df";s:19:"SIMPLE_QUESTION_341";s:18:"g dfg dfgh dhdfhdf";s:23:"SIMPLE_QUESTION_341_RAW";s:18:"g dfg dfgh dhdfhdf";s:19:"SIMPLE_QUESTION_544";s:86:"Соглашаюсь на обработку персональных данных [8]";s:23:"SIMPLE_QUESTION_544_RAW";s:82:"Соглашаюсь на обработку персональных данных";}', '2020-01-20 01:12:26', '2020-01-20 01:12:26', 'Y', 'Y', 'ru'),
	(7, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:20:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"7";s:14:"RS_DATE_CREATE";s:19:"20.01.2020 01:20:52";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:9:"vbncbnvbn";s:23:"SIMPLE_QUESTION_523_RAW";s:9:"vbncbnvbn";s:19:"SIMPLE_QUESTION_926";s:24:"vcbnvbcnvbn@hfjfgjhgj.ru";s:23:"SIMPLE_QUESTION_926_RAW";s:24:"vcbnvbcnvbn@hfjfgjhgj.ru";s:19:"SIMPLE_QUESTION_341";s:20:"vbcnv bn vbn vbncvbn";s:23:"SIMPLE_QUESTION_341_RAW";s:20:"vbcnv bn vbn vbncvbn";s:19:"SIMPLE_QUESTION_544";s:86:"Соглашаюсь на обработку персональных данных [8]";s:23:"SIMPLE_QUESTION_544_RAW";s:82:"Соглашаюсь на обработку персональных данных";}', '2020-01-20 01:20:52', '2020-01-20 01:20:53', 'Y', 'Y', 'ru'),
	(8, 'FORM_FILLING_SIMPLE_FORM_3', 32, 's1', 'a:20:{s:10:"RS_FORM_ID";s:1:"3";s:12:"RS_FORM_NAME";s:10:"Contact us";s:15:"RS_FORM_VARNAME";s:13:"SIMPLE_FORM_3";s:11:"RS_FORM_SID";s:13:"SIMPLE_FORM_3";s:12:"RS_RESULT_ID";s:1:"8";s:14:"RS_DATE_CREATE";s:19:"20.01.2020 01:23:00";s:10:"RS_USER_ID";s:1:"1";s:13:"RS_USER_EMAIL";s:17:"music.dll@mail.ru";s:12:"RS_USER_NAME";s:1:" ";s:12:"RS_USER_AUTH";s:1:" ";s:16:"RS_STAT_GUEST_ID";s:1:"0";s:18:"RS_STAT_SESSION_ID";s:1:"0";s:19:"SIMPLE_QUESTION_523";s:6:"jkljkl";s:23:"SIMPLE_QUESTION_523_RAW";s:6:"jkljkl";s:19:"SIMPLE_QUESTION_926";s:23:"tgfdgfdg@sdkfjgdskgj.ru";s:23:"SIMPLE_QUESTION_926_RAW";s:23:"tgfdgfdg@sdkfjgdskgj.ru";s:19:"SIMPLE_QUESTION_341";s:18:"gfhj gjh ghj hgjhg";s:23:"SIMPLE_QUESTION_341_RAW";s:18:"gfhj gjh ghj hgjhg";s:19:"SIMPLE_QUESTION_544";s:86:"Соглашаюсь на обработку персональных данных [8]";s:23:"SIMPLE_QUESTION_544_RAW";s:82:"Соглашаюсь на обработку персональных данных";}', '2020-01-20 01:23:00', '2020-01-20 01:23:00', 'Y', 'Y', 'ru');
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event_attachment
CREATE TABLE IF NOT EXISTS `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_attachment`;
/*!40000 ALTER TABLE `b_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_attachment` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event_log
CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event_log: ~13 rows (приблизительно)
DELETE FROM `b_event_log`;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
	(1, '2020-01-15 10:07:27', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/?finish', 's1', NULL, NULL, ''),
	(2, '2020-01-15 14:26:55', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
	(3, '2020-01-15 14:28:53', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:9:"index.php";}'),
	(4, '2020-01-16 10:46:00', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
	(5, '2020-01-16 13:25:33', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=blog_rr&path=%2F&back_url=%2F&siteTemplateId=blog_rr', NULL, 1, NULL, 'a:1:{s:4:"path";s:14:"contact-us.php";}'),
	(6, '2020-01-16 13:25:33', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=blog_rr&path=%2F&back_url=%2F&siteTemplateId=blog_rr', NULL, 1, NULL, 'a:2:{s:4:"path";b:0;s:9:"menu_name";N;}'),
	(7, '2020-01-16 13:26:33', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:14:"contact-us.php";}'),
	(8, '2020-01-16 13:46:40', 'UNKNOWN', 'MENU_EDIT', 'fileman', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/fileman_menu_edit.php?', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";b:0;}'),
	(9, '2020-01-17 11:47:42', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
	(10, '2020-01-19 12:57:11', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/contact-us.php?clear_cache=Y', 's1', NULL, NULL, ''),
	(11, '2020-01-19 13:12:50', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:14:"contact-us.php";}'),
	(12, '2020-01-19 13:13:40', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=blog_rr&path=%2F&back_url=%2Fcontact-us.php%3Fbitrix_include_areas%3DY%26clear_cache%3DY&siteTemplateId=blog_rr', NULL, 1, NULL, 'a:1:{s:4:"path";s:11:"success.php";}'),
	(13, '2020-01-19 13:13:49', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:11:"success.php";}'),
	(14, '2020-01-19 13:17:53', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:"path";s:14:"contact-us.php";}');
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event_message
CREATE TABLE IF NOT EXISTS `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event_message: ~30 rows (приблизительно)
DELETE FROM `b_event_message`;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
	(1, '2020-01-14 14:52:55', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams["SERVER_NAME"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams["USER_ID"];?>\n\n\nИмя: <?=$arParams["NAME"];?>\n\nФамилия: <?=$arParams["LAST_NAME"];?>\n\nE-Mail: <?=$arParams["EMAIL"];?>\n\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(2, '2020-01-14 14:52:55', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(3, '2020-01-14 14:52:55', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(4, '2020-01-14 14:52:55', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(5, '2020-01-14 14:52:55', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams["SERVER_NAME"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>&confirm_code=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(6, '2020-01-14 14:52:55', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["ID"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(7, '2020-01-14 14:52:55', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nE-mail автора: <?=$arParams["AUTHOR_EMAIL"];?>\n\n\nТекст сообщения:\n<?=$arParams["TEXT"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(8, '2020-01-14 14:52:55', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
	(9, '2020-01-14 14:54:06', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге "#BLOG_NAME#"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге "<?=$arParams["BLOG_NAME"];?>"\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, '2020-01-14 14:54:06', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, '2020-01-14 14:54:06', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, '2020-01-14 14:54:06', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, '2020-01-14 14:54:06', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, '2020-01-14 14:54:06', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог "#BLOG_NAME#" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог "#BLOG_NAME#" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВаш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен в друзья к <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, '2020-01-14 14:54:06', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, '2020-01-14 14:54:06', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, '2020-01-14 14:54:06', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог "#BLOG_NAME#" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог "#BLOG_NAME#" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВ ваш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен друг <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, '2020-01-14 14:54:06', 'BLOG_SONET_NEW_POST', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(19, '2020-01-14 14:54:06', 'BLOG_SONET_NEW_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', 'Re: #POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{#COMMENT_ID#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","EMAIL_TO" => "{#EMAIL_TO#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{$arParams[\'COMMENT_ID\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(20, '2020-01-14 14:54:06', 'BLOG_SONET_POST_SHARE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(21, '2020-01-14 14:54:06', 'BLOG_POST_BROADCAST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, '2020-01-14 14:54:40', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, '2020-01-14 14:54:40', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?> <?=$arParams["FROM_EMAIL"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '2020-01-14 14:54:40', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСсылка на сообщение: <?=$arParams["MESSAGE_LINK"];?>Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, '2020-01-14 14:54:40', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, '2020-01-14 14:54:40', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams["MESSAGE_TEXT"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams["FORUM_NAME"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nНаписать новое сообщение: <?=$arParams["FORUM_EMAIL"];?>\n\n\nАвтор сообщения: <?=$arParams["AUTHOR"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams["SITE_NAME"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, '2020-01-14 14:56:35', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams["SERVER_NAME"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, '2020-01-14 14:56:48', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams["SERVER_NAME"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams["EMAIL"];?>\n\nДата добавления/редактирования .... <?=$arParams["DATE_SUBSCR"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nОтписаться:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, '2020-01-14 14:57:12', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе "#VOTE_TITLE#":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams["USER_NAME"];?> принял участие в опросе "<?=$arParams["VOTE_TITLE"];?>":\n<?=$arParams["VOTE_STATISTIC"];?>\n\n\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["URL"];?>\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, '2020-01-19 13:38:34', 'FORM_FILLING_SIMPLE_FORM_3', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SERVER_NAME#: заполнена web-форма [#RS_FORM_ID#] #RS_FORM_NAME#', '#SERVER_NAME#\n\nЗаполнена web-форма: [#RS_FORM_ID#] #RS_FORM_NAME#\n-------------------------------------------------------\n\nДата - #RS_DATE_CREATE#\nРезультат - #RS_RESULT_ID#\nПользователь - [#RS_USER_ID#] #RS_USER_NAME# #RS_USER_AUTH#\nПосетитель - #RS_STAT_GUEST_ID#\nСессия - #RS_STAT_SESSION_ID#\n\n\n\nДля просмотра воспользуйтесь ссылкой:\nhttp://#SERVER_NAME#/bitrix/admin/form_result_view.php?lang=ru&WEB_FORM_ID=#RS_FORM_ID#&RESULT_ID=#RS_RESULT_ID#\n\n-------------------------------------------------------\nПисьмо сгенерировано автоматически.\n						', '<?=$arParams["SERVER_NAME"];?>\n\n\nЗаполнена web-форма: [<?=$arParams["RS_FORM_ID"];?>] <?=$arParams["RS_FORM_NAME"];?>\n\n-------------------------------------------------------\n\nДата - <?=$arParams["RS_DATE_CREATE"];?>\n\nРезультат - <?=$arParams["RS_RESULT_ID"];?>\n\nПользователь - [<?=$arParams["RS_USER_ID"];?>] <?=$arParams["RS_USER_NAME"];?> <?=$arParams["RS_USER_AUTH"];?>\n\nПосетитель - <?=$arParams["RS_STAT_GUEST_ID"];?>\n\nСессия - <?=$arParams["RS_STAT_SESSION_ID"];?>\n\n\n\n\nДля просмотра воспользуйтесь ссылкой:\nhttp://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/form_result_view.php?lang=ru&WEB_FORM_ID=<?=$arParams["RS_FORM_ID"];?>&RESULT_ID=<?=$arParams["RS_RESULT_ID"];?>\n\n\n-------------------------------------------------------\nПисьмо сгенерировано автоматически.\n						', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event_message_attachment
CREATE TABLE IF NOT EXISTS `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event_message_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_message_attachment`;
/*!40000 ALTER TABLE `b_event_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_message_attachment` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event_message_site
CREATE TABLE IF NOT EXISTS `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event_message_site: ~26 rows (приблизительно)
DELETE FROM `b_event_message_site`;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1'),
	(4, 's1'),
	(5, 's1'),
	(6, 's1'),
	(7, 's1'),
	(8, 's1'),
	(9, 's1'),
	(10, 's1'),
	(11, 's1'),
	(12, 's1'),
	(13, 's1'),
	(14, 's1'),
	(15, 's1'),
	(16, 's1'),
	(17, 's1'),
	(18, 's1'),
	(19, 's1'),
	(20, 's1'),
	(21, 's1'),
	(22, 's1'),
	(23, 's1'),
	(24, 's1'),
	(25, 's1'),
	(26, 's1'),
	(27, 's1'),
	(28, 's1'),
	(29, 's1'),
	(32, 's1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_event_type
CREATE TABLE IF NOT EXISTS `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_event_type: ~64 rows (приблизительно)
DELETE FROM `b_event_type`;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
	(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
	(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
	(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
	(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
	(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
	(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
	(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
	(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
	(9, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
	(10, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
	(11, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
	(12, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
	(13, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
	(14, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
	(15, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
	(16, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
	(17, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
	(18, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
	(19, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
	(20, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
	(21, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(22, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(23, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(24, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(25, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(26, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(27, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(28, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(29, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(30, 'ru', 'BLOG_SONET_NEW_POST', 'Добавлено новое сообщение', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(31, 'ru', 'BLOG_SONET_NEW_COMMENT', 'Добавлен новый комментарий', '#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(32, 'ru', 'BLOG_SONET_POST_SHARE', 'Добавлен новый получатель сообщения', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(33, 'ru', 'BLOG_POST_BROADCAST', 'Добавлено новое сообщение', '\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(34, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(35, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(36, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(37, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(38, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(39, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(40, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(41, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(42, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(43, 'en', 'BLOG_SONET_NEW_POST', 'New post added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(44, 'en', 'BLOG_SONET_NEW_COMMENT', 'Comment added', '#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(45, 'en', 'BLOG_SONET_POST_SHARE', 'New recipient added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(46, 'en', 'BLOG_POST_BROADCAST', 'New post added', '\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient', 100, 'email'),
	(47, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
	(48, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 100, 'email'),
	(49, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 100, 'email'),
	(50, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
	(51, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
	(52, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 100, 'email'),
	(53, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 100, 'email'),
	(54, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
	(55, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100, 'email'),
	(56, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100, 'email'),
	(57, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100, 'email'),
	(58, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100, 'email'),
	(59, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 100, 'email'),
	(60, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 100, 'email'),
	(61, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 100, 'email'),
	(62, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 100, 'email'),
	(199, 'ru', 'FORM_FILLING_SIMPLE_FORM_3', 'Заполнена web-форма "SIMPLE_FORM_3"', '#RS_FORM_ID# - ID формы\n#RS_FORM_NAME# - Имя формы\n#RS_FORM_SID# - SID формы\n#RS_RESULT_ID# - ID результата\n#RS_DATE_CREATE# - Дата заполнения формы\n#RS_USER_ID# - ID пользователя\n#RS_USER_EMAIL# - EMail пользователя\n#RS_USER_NAME# - Фамилия, имя пользователя\n#RS_USER_AUTH# - Пользователь был авторизован?\n#RS_STAT_GUEST_ID# - ID посетителя\n#RS_STAT_SESSION_ID# - ID сессии\n#SIMPLE_QUESTION_523# - Name\n#SIMPLE_QUESTION_523_RAW# - Name (оригинальное значение)\n#SIMPLE_QUESTION_926# - Email\n#SIMPLE_QUESTION_926_RAW# - Email (оригинальное значение)\n#SIMPLE_QUESTION_341# - Message\n#SIMPLE_QUESTION_341_RAW# - Message (оригинальное значение)\n#SIMPLE_QUESTION_544# - Согласие на обработку персональных данных\n#SIMPLE_QUESTION_544_RAW# - Согласие на обработку персональных данных (оригинальное значение)\n', 100, 'email'),
	(200, 'en', 'FORM_FILLING_SIMPLE_FORM_3', 'Web form filled "SIMPLE_FORM_3"', '#RS_FORM_ID# - Form ID\n#RS_FORM_NAME# - Form name\n#RS_FORM_SID# - Form SID\n#RS_RESULT_ID# - Result ID\n#RS_DATE_CREATE# - Form filling date\n#RS_USER_ID# - User ID\n#RS_USER_EMAIL# - User e-mail\n#RS_USER_NAME# - First and last user names\n#RS_USER_AUTH# - User authorized?\n#RS_STAT_GUEST_ID# - Visitor ID\n#RS_STAT_SESSION_ID# - Session ID\n#SIMPLE_QUESTION_523# - Name\n#SIMPLE_QUESTION_523_RAW# - Name (original value)\n#SIMPLE_QUESTION_926# - Email\n#SIMPLE_QUESTION_926_RAW# - Email (original value)\n#SIMPLE_QUESTION_341# - Message\n#SIMPLE_QUESTION_341_RAW# - Message (original value)\n#SIMPLE_QUESTION_544# - Согласие на обработку персональных данных\n#SIMPLE_QUESTION_544_RAW# - Согласие на обработку персональных данных (original value)\n', 100, 'email');
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_favorite
CREATE TABLE IF NOT EXISTS `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_favorite: ~0 rows (приблизительно)
DELETE FROM `b_favorite`;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_file
CREATE TABLE IF NOT EXISTS `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_file: ~8 rows (приблизительно)
DELETE FROM `b_file`;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
	(1, '2020-01-15 14:11:15', 'iblock', 192, 288, 11734, 'image/jpeg', 'iblock/72e', '72e14c7ffcac250cfde7c35e73b492f5.jpg', '1-300x200-blur_2-grayscale.jpg', '', NULL, '6ba0d61f31cca3d4d39a2d66d51e08ed'),
	(2, '2020-01-15 14:11:15', 'iblock', 200, 300, 5382, 'image/jpeg', 'iblock/9e7', '9e7a8f4974b7350bfeed59bb6b290a08.jpg', '1-300x200-blur_2-grayscale.jpg', '', NULL, 'bfafc8e3c7b693a3da5c6c9eb116b0ca'),
	(3, '2020-01-15 14:11:30', 'iblock', 192, 288, 12598, 'image/jpeg', 'iblock/17d', '17d041d58bf9f7c4c1ea178f5c9b597a.jpg', '2-300x200-blur_2-grayscale.jpg', '', NULL, '48f6710b6e233d1ba9456836d5d167af'),
	(4, '2020-01-15 14:11:30', 'iblock', 200, 300, 5818, 'image/jpeg', 'iblock/329', '329b3632b55f8243df5a351c25baba08.jpg', '2-300x200-blur_2-grayscale.jpg', '', NULL, 'e6913cc5d0b2de0a500482991c2d9ae5'),
	(5, '2020-01-15 14:12:03', 'iblock', 192, 288, 11679, 'image/jpeg', 'iblock/d0e', 'd0e3112b954346ebc0cd2ff653996da6.jpg', '3-300x200-blur_2-grayscale.jpg', '', NULL, '201b2465f085902800873bff0551d439'),
	(6, '2020-01-15 14:12:03', 'iblock', 200, 300, 5345, 'image/jpeg', 'iblock/d35', 'd3521c86f95b817c9682ce22c9a8579f.jpg', '3-300x200-blur_2-grayscale.jpg', '', NULL, '5c20dec9937b9b413cabd937ecbcf9b1'),
	(7, '2020-01-15 14:11:44', 'iblock', 192, 288, 11245, 'image/jpeg', 'iblock/550', '5505b5c85d78816ebb9b4643e6861d9f.jpg', '4-300x200-blur_2-grayscale.jpg', '', NULL, '511d8c010f07d0a9d81bad173cbc9b7a'),
	(8, '2020-01-15 14:11:44', 'iblock', 200, 300, 5061, 'image/jpeg', 'iblock/0eb', '0eba8a110bf65350119d4341965b6ea8.jpg', '4-300x200-blur_2-grayscale.jpg', '', NULL, 'a14d34b58c9a6602cddbca84ae644dd5'),
	(9, '2020-01-15 14:12:45', 'iblock', 192, 288, 11698, 'image/jpeg', 'iblock/526', '526ea7f3811e671a094cf744f575aeac.jpg', '6-300x200-blur_2-grayscale.jpg', '', NULL, '33eb5555d801f60d9ad9b8be6493ac9e'),
	(10, '2020-01-15 14:12:45', 'iblock', 200, 300, 5257, 'image/jpeg', 'iblock/b28', 'b2869cbb8a4947bdfcec62260c899523.jpg', '6-300x200-blur_2-grayscale.jpg', '', NULL, '794ed1909cabe50840795f0641f4ae97'),
	(11, '2020-01-15 14:13:28', 'iblock', 192, 288, 13449, 'image/jpeg', 'iblock/d4e', 'd4ec37fa5d3fc1019996cf3709770052.jpg', '7-300x200-blur_2-grayscale.jpg', '', NULL, 'bdb4d5bab0722a39c3f312df95466352'),
	(12, '2020-01-15 14:13:28', 'iblock', 200, 300, 6220, 'image/jpeg', 'iblock/ce7', 'ce7f1d7d3d098f4f81603d2395548bee.jpg', '7-300x200-blur_2-grayscale.jpg', '', NULL, '861f69f814770bdbb19e1e6fdd4570b0'),
	(13, '2020-01-15 14:14:04', 'iblock', 192, 288, 11924, 'image/jpeg', 'iblock/8db', '8db894cf268969177b43ce8e02eb72c6.jpg', '8-300x200-blur_2-grayscale.jpg', '', NULL, '801c74ef196398c7ebfd85ff06820ae4'),
	(14, '2020-01-15 14:14:04', 'iblock', 200, 300, 5536, 'image/jpeg', 'iblock/a1d', 'a1d4df9173a425c96a09505da2564b71.jpg', '8-300x200-blur_2-grayscale.jpg', '', NULL, '32da69eca589a72759cbd26fe12964aa'),
	(15, '2020-01-15 14:14:38', 'iblock', 192, 288, 11145, 'image/jpeg', 'iblock/75f', '75f616355f9c5eec0ab485fd8001fbbb.jpg', '9-300x200-blur_2-grayscale.jpg', '', NULL, '2027ec7b3b0eefacb84dc66422aa1b14'),
	(16, '2020-01-15 14:14:38', 'iblock', 200, 300, 5350, 'image/jpeg', 'iblock/04d', '04d29f32bc4d6c352fe91aa4a9011fed.jpg', '9-300x200-blur_2-grayscale.jpg', '', NULL, '7555a3243504f930c84fff1777964184'),
	(17, '2020-01-15 14:15:14', 'iblock', 192, 288, 9216, 'image/jpeg', 'iblock/b3b', 'b3b5dbe63187f2fb0129f4faafd396f9.jpg', '10-300x200-blur_2-grayscale.jpg', '', NULL, 'bc98351a588ac178de2b71a01921d548'),
	(18, '2020-01-15 14:15:14', 'iblock', 200, 300, 3807, 'image/jpeg', 'iblock/c4e', 'c4effd840434e4cd72cc216eeb17f2c7.jpg', '10-300x200-blur_2-grayscale.jpg', '', NULL, '40d6619df17851fed1dcbf84dcb58ac0'),
	(19, '2020-01-15 14:15:54', 'iblock', 192, 288, 11734, 'image/jpeg', 'iblock/114', '114dd7a09bd5f93434ebdf259c49c4d4.jpg', '1-300x200-blur_2-grayscale.jpg', '', NULL, '57a52ac9f82fb9d028cd50e1073e2984'),
	(20, '2020-01-15 14:15:54', 'iblock', 200, 300, 5382, 'image/jpeg', 'iblock/942', '942f73b6215094004c565d8979a23e95.jpg', '1-300x200-blur_2-grayscale.jpg', '', NULL, '6cdb09c8d53a59452fcf5ff62c238c3e');
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_file_preview
CREATE TABLE IF NOT EXISTS `b_file_preview` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PREVIEW_ID` int(18) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(18) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_file_preview: ~0 rows (приблизительно)
DELETE FROM `b_file_preview`;
/*!40000 ALTER TABLE `b_file_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_preview` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_file_search
CREATE TABLE IF NOT EXISTS `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_file_search: ~0 rows (приблизительно)
DELETE FROM `b_file_search`;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_filters
CREATE TABLE IF NOT EXISTS `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_filters: ~0 rows (приблизительно)
DELETE FROM `b_filters`;
/*!40000 ALTER TABLE `b_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_filters` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_finder_dest
CREATE TABLE IF NOT EXISTS `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_finder_dest: ~0 rows (приблизительно)
DELETE FROM `b_finder_dest`;
/*!40000 ALTER TABLE `b_finder_dest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_finder_dest` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form
CREATE TABLE IF NOT EXISTS `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form: ~1 rows (приблизительно)
DELETE FROM `b_form`;
/*!40000 ALTER TABLE `b_form` DISABLE KEYS */;
INSERT INTO `b_form` (`ID`, `TIMESTAMP_X`, `NAME`, `SID`, `BUTTON`, `C_SORT`, `FIRST_SITE_ID`, `IMAGE_ID`, `USE_CAPTCHA`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `FORM_TEMPLATE`, `USE_DEFAULT_TEMPLATE`, `SHOW_TEMPLATE`, `MAIL_EVENT_TYPE`, `SHOW_RESULT_TEMPLATE`, `PRINT_RESULT_TEMPLATE`, `EDIT_RESULT_TEMPLATE`, `FILTER_RESULT_TEMPLATE`, `TABLE_RESULT_TEMPLATE`, `USE_RESTRICTIONS`, `RESTRICT_USER`, `RESTRICT_TIME`, `RESTRICT_STATUS`, `STAT_EVENT1`, `STAT_EVENT2`, `STAT_EVENT3`) VALUES
	(3, '2020-01-19 13:38:34', 'Contact us', 'SIMPLE_FORM_3', 'Отправить', 100, NULL, NULL, 'Y', '', 'text', '', 'Y', NULL, 'FORM_FILLING_SIMPLE_FORM_3', NULL, NULL, NULL, NULL, NULL, 'N', 0, 0, '', 'form', '', '');
/*!40000 ALTER TABLE `b_form` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_2_group
CREATE TABLE IF NOT EXISTS `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_2_group`;
/*!40000 ALTER TABLE `b_form_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_2_mail_template
CREATE TABLE IF NOT EXISTS `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_2_mail_template`;
/*!40000 ALTER TABLE `b_form_2_mail_template` DISABLE KEYS */;
INSERT INTO `b_form_2_mail_template` (`FORM_ID`, `MAIL_TEMPLATE_ID`) VALUES
	(3, 32);
/*!40000 ALTER TABLE `b_form_2_mail_template` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_2_site
CREATE TABLE IF NOT EXISTS `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_2_site: ~1 rows (приблизительно)
DELETE FROM `b_form_2_site`;
/*!40000 ALTER TABLE `b_form_2_site` DISABLE KEYS */;
INSERT INTO `b_form_2_site` (`FORM_ID`, `SITE_ID`) VALUES
	(3, 's1');
/*!40000 ALTER TABLE `b_form_2_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_answer
CREATE TABLE IF NOT EXISTS `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_answer: ~3 rows (приблизительно)
DELETE FROM `b_form_answer`;
/*!40000 ALTER TABLE `b_form_answer` DISABLE KEYS */;
INSERT INTO `b_form_answer` (`ID`, `FIELD_ID`, `TIMESTAMP_X`, `MESSAGE`, `C_SORT`, `ACTIVE`, `VALUE`, `FIELD_TYPE`, `FIELD_WIDTH`, `FIELD_HEIGHT`, `FIELD_PARAM`) VALUES
	(5, 8, '2020-01-19 13:40:33', ' ', 0, 'Y', '', 'text', 0, 0, ''),
	(6, 9, '2020-01-20 01:15:26', ' ', 0, 'Y', '', 'email', 0, 0, ''),
	(7, 10, '2020-01-19 13:41:37', ' ', 0, 'Y', '', 'textarea', 0, 0, ''),
	(8, 11, '2020-01-20 01:07:46', 'Соглашаюсь на обработку персональных данных', 0, 'Y', '', 'checkbox', 0, 0, '');
/*!40000 ALTER TABLE `b_form_answer` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_crm
CREATE TABLE IF NOT EXISTS `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_crm: ~0 rows (приблизительно)
DELETE FROM `b_form_crm`;
/*!40000 ALTER TABLE `b_form_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_crm_field
CREATE TABLE IF NOT EXISTS `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_crm_field: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_field`;
/*!40000 ALTER TABLE `b_form_crm_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_field` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_crm_link
CREATE TABLE IF NOT EXISTS `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_crm_link: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_link`;
/*!40000 ALTER TABLE `b_form_crm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_link` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_field
CREATE TABLE IF NOT EXISTS `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_field: ~3 rows (приблизительно)
DELETE FROM `b_form_field`;
/*!40000 ALTER TABLE `b_form_field` DISABLE KEYS */;
INSERT INTO `b_form_field` (`ID`, `FORM_ID`, `TIMESTAMP_X`, `ACTIVE`, `TITLE`, `TITLE_TYPE`, `SID`, `C_SORT`, `ADDITIONAL`, `REQUIRED`, `IN_FILTER`, `IN_RESULTS_TABLE`, `IN_EXCEL_TABLE`, `FIELD_TYPE`, `IMAGE_ID`, `COMMENTS`, `FILTER_TITLE`, `RESULTS_TABLE_TITLE`) VALUES
	(8, 3, '2020-01-19 13:40:33', 'Y', 'Name', 'text', 'SIMPLE_QUESTION_523', 100, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', 'Name', 'Name'),
	(9, 3, '2020-01-20 01:15:26', 'Y', 'Email', 'text', 'SIMPLE_QUESTION_926', 200, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', 'Email', 'Email'),
	(10, 3, '2020-01-19 13:41:37', 'Y', 'Message', 'text', 'SIMPLE_QUESTION_341', 300, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', 'Message', 'Message'),
	(11, 3, '2020-01-20 01:07:46', 'Y', 'Согласие на обработку персональных данных', 'text', 'SIMPLE_QUESTION_544', 400, 'N', 'Y', 'Y', 'Y', 'Y', 'text', NULL, '', 'Согласие на обработку персональных данных', 'Согласие на обработку персональных данных');
/*!40000 ALTER TABLE `b_form_field` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_field_filter
CREATE TABLE IF NOT EXISTS `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_field_filter: ~7 rows (приблизительно)
DELETE FROM `b_form_field_filter`;
/*!40000 ALTER TABLE `b_form_field_filter` DISABLE KEYS */;
INSERT INTO `b_form_field_filter` (`ID`, `FIELD_ID`, `PARAMETER_NAME`, `FILTER_TYPE`) VALUES
	(45, 8, 'USER', 'text'),
	(46, 8, 'USER', 'exist'),
	(49, 10, 'USER', 'text'),
	(50, 10, 'USER', 'exist'),
	(55, 11, 'ANSWER_TEXT', 'dropdown'),
	(58, 9, 'USER', 'text'),
	(59, 9, 'USER', 'exist');
/*!40000 ALTER TABLE `b_form_field_filter` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_field_validator
CREATE TABLE IF NOT EXISTS `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_field_validator: ~2 rows (приблизительно)
DELETE FROM `b_form_field_validator`;
/*!40000 ALTER TABLE `b_form_field_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_validator` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_menu
CREATE TABLE IF NOT EXISTS `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_menu: ~2 rows (приблизительно)
DELETE FROM `b_form_menu`;
/*!40000 ALTER TABLE `b_form_menu` DISABLE KEYS */;
INSERT INTO `b_form_menu` (`ID`, `FORM_ID`, `LID`, `MENU`) VALUES
	(39, 3, 'ru', ''),
	(40, 3, 'en', '');
/*!40000 ALTER TABLE `b_form_menu` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_result
CREATE TABLE IF NOT EXISTS `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_result: ~2 rows (приблизительно)
DELETE FROM `b_form_result`;
/*!40000 ALTER TABLE `b_form_result` DISABLE KEYS */;
INSERT INTO `b_form_result` (`ID`, `TIMESTAMP_X`, `DATE_CREATE`, `STATUS_ID`, `FORM_ID`, `USER_ID`, `USER_AUTH`, `STAT_GUEST_ID`, `STAT_SESSION_ID`, `SENT_TO_CRM`) VALUES
	(7, '2020-01-20 01:20:52', '2020-01-20 01:20:52', 2, 3, 1, 'Y', 0, 0, 'N'),
	(8, '2020-01-20 01:23:00', '2020-01-20 01:23:00', 2, 3, 1, 'Y', 0, 0, 'N');
/*!40000 ALTER TABLE `b_form_result` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_result_answer
CREATE TABLE IF NOT EXISTS `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_result_answer: ~8 rows (приблизительно)
DELETE FROM `b_form_result_answer`;
/*!40000 ALTER TABLE `b_form_result_answer` DISABLE KEYS */;
INSERT INTO `b_form_result_answer` (`ID`, `RESULT_ID`, `FORM_ID`, `FIELD_ID`, `ANSWER_ID`, `ANSWER_TEXT`, `ANSWER_TEXT_SEARCH`, `ANSWER_VALUE`, `ANSWER_VALUE_SEARCH`, `USER_TEXT`, `USER_TEXT_SEARCH`, `USER_DATE`, `USER_FILE_ID`, `USER_FILE_NAME`, `USER_FILE_IS_IMAGE`, `USER_FILE_HASH`, `USER_FILE_SUFFIX`, `USER_FILE_SIZE`) VALUES
	(21, 7, 3, 8, 5, '', NULL, '', NULL, 'vbncbnvbn', 'VBNCBNVBN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 7, 3, 9, 6, '', NULL, '', NULL, 'vcbnvbcnvbn@hfjfgjhgj.ru', 'VCBNVBCNVBN@HFJFGJHGJ.RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 7, 3, 10, 7, '', NULL, '', NULL, 'vbcnv bn vbn vbncvbn', 'VBCNV BN VBN VBNCVBN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 7, 3, 11, 8, 'Соглашаюсь на обработку персональных данных', 'СОГЛАШАЮСЬ НА ОБРАБОТКУ ПЕРСОНАЛЬНЫХ ДАННЫХ', '', NULL, NULL, 'VBCNV BN VBN VBNCVBN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 8, 3, 8, 5, '', NULL, '', NULL, 'jkljkl', 'JKLJKL', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 8, 3, 9, 6, '', NULL, '', NULL, 'tgfdgfdg@sdkfjgdskgj.ru', 'TGFDGFDG@SDKFJGDSKGJ.RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 8, 3, 10, 7, '', NULL, '', NULL, 'gfhj gjh ghj hgjhg', 'GFHJ GJH GHJ HGJHG', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 8, 3, 11, 8, 'Соглашаюсь на обработку персональных данных', 'СОГЛАШАЮСЬ НА ОБРАБОТКУ ПЕРСОНАЛЬНЫХ ДАННЫХ', '', NULL, NULL, 'GFHJ GJH GHJ HGJHG', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_form_result_answer` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_status
CREATE TABLE IF NOT EXISTS `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_status: ~1 rows (приблизительно)
DELETE FROM `b_form_status`;
/*!40000 ALTER TABLE `b_form_status` DISABLE KEYS */;
INSERT INTO `b_form_status` (`ID`, `FORM_ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `TITLE`, `DESCRIPTION`, `DEFAULT_VALUE`, `CSS`, `HANDLER_OUT`, `HANDLER_IN`, `MAIL_EVENT_TYPE`) VALUES
	(2, 3, '2020-01-19 13:38:34', 'Y', 100, 'DEFAULT', 'DEFAULT', 'Y', 'statusgreen', NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_form_status` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_status_2_group
CREATE TABLE IF NOT EXISTS `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_status_2_group: ~4 rows (приблизительно)
DELETE FROM `b_form_status_2_group`;
/*!40000 ALTER TABLE `b_form_status_2_group` DISABLE KEYS */;
INSERT INTO `b_form_status_2_group` (`ID`, `STATUS_ID`, `GROUP_ID`, `PERMISSION`) VALUES
	(5, 2, 0, 'VIEW'),
	(6, 2, 0, 'MOVE'),
	(7, 2, 0, 'EDIT'),
	(8, 2, 0, 'DELETE');
/*!40000 ALTER TABLE `b_form_status_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_form_status_2_mail_template
CREATE TABLE IF NOT EXISTS `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_form_status_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_mail_template`;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum
CREATE TABLE IF NOT EXISTS `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum`;
/*!40000 ALTER TABLE `b_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum2site
CREATE TABLE IF NOT EXISTS `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum2site: ~0 rows (приблизительно)
DELETE FROM `b_forum2site`;
/*!40000 ALTER TABLE `b_forum2site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum2site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_dictionary
CREATE TABLE IF NOT EXISTS `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_dictionary: ~4 rows (приблизительно)
DELETE FROM `b_forum_dictionary`;
/*!40000 ALTER TABLE `b_forum_dictionary` DISABLE KEYS */;
INSERT INTO `b_forum_dictionary` (`ID`, `TITLE`, `TYPE`) VALUES
	(1, '[ru] Словарь слов', 'W'),
	(2, '[ru] Словарь транслита', 'T'),
	(3, '[en] Bad words', 'W'),
	(4, '[en] Transliteration', 'T');
/*!40000 ALTER TABLE `b_forum_dictionary` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_email
CREATE TABLE IF NOT EXISTS `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_email: ~0 rows (приблизительно)
DELETE FROM `b_forum_email`;
/*!40000 ALTER TABLE `b_forum_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_email` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_file
CREATE TABLE IF NOT EXISTS `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_file: ~0 rows (приблизительно)
DELETE FROM `b_forum_file`;
/*!40000 ALTER TABLE `b_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_file` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_filter
CREATE TABLE IF NOT EXISTS `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_filter: ~151 rows (приблизительно)
DELETE FROM `b_forum_filter`;
/*!40000 ALTER TABLE `b_forum_filter` DISABLE KEYS */;
INSERT INTO `b_forum_filter` (`ID`, `DICTIONARY_ID`, `WORDS`, `PATTERN`, `REPLACEMENT`, `DESCRIPTION`, `USE_IT`, `PATTERN_CREATE`) VALUES
	(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
	(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');
/*!40000 ALTER TABLE `b_forum_filter` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_group
CREATE TABLE IF NOT EXISTS `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_group: ~0 rows (приблизительно)
DELETE FROM `b_forum_group`;
/*!40000 ALTER TABLE `b_forum_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_group_lang
CREATE TABLE IF NOT EXISTS `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_group_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_group_lang`;
/*!40000 ALTER TABLE `b_forum_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_letter
CREATE TABLE IF NOT EXISTS `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_letter: ~37 rows (приблизительно)
DELETE FROM `b_forum_letter`;
/*!40000 ALTER TABLE `b_forum_letter` DISABLE KEYS */;
INSERT INTO `b_forum_letter` (`ID`, `DICTIONARY_ID`, `LETTER`, `REPLACEMENT`) VALUES
	(1, 2, 'а', 'АаAa'),
	(2, 2, 'б', 'БбBb'),
	(3, 2, 'в', 'ВвVv'),
	(4, 2, 'г', 'Гг'),
	(5, 2, 'д', 'ДдDd'),
	(6, 2, 'е', 'ЁёЕеEe'),
	(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
	(8, 2, 'ж', 'ЖжGg'),
	(9, 2, 'з', 'ЗзZz3'),
	(10, 2, 'и', 'ИиIi'),
	(11, 2, 'й', 'ЙйИиYy'),
	(12, 2, 'к', 'КкKk'),
	(13, 2, 'л', 'ЛлLl'),
	(14, 2, 'м', 'МмMm'),
	(15, 2, 'н', 'НнNn'),
	(16, 2, 'о', 'ОоOo'),
	(17, 2, 'п', 'ПпPp'),
	(18, 2, 'р', 'РрPpRr'),
	(19, 2, 'с', 'СсCc'),
	(20, 2, 'т', 'ТтTt'),
	(21, 2, 'у', 'УуUu'),
	(22, 2, 'ф', 'ФфFf'),
	(23, 2, 'х', 'ХхXx'),
	(24, 2, 'ц', 'ЦцCc'),
	(25, 2, 'ч', 'Чч'),
	(26, 2, 'ш', 'Шш'),
	(27, 2, 'щ', 'Щщ'),
	(28, 2, 'ь', 'ЪъЬь"\','),
	(29, 2, 'ы', 'Ыы'),
	(30, 2, 'ъ', 'ЪъЬь"\','),
	(31, 2, 'э', 'Ээ'),
	(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
	(33, 2, 'я', 'Яя'),
	(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
	(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
	(36, 2, 'тся', '%'),
	(37, 2, 'ться', '%');
/*!40000 ALTER TABLE `b_forum_letter` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_message
CREATE TABLE IF NOT EXISTS `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_message`;
/*!40000 ALTER TABLE `b_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_perms
CREATE TABLE IF NOT EXISTS `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_perms: ~0 rows (приблизительно)
DELETE FROM `b_forum_perms`;
/*!40000 ALTER TABLE `b_forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_perms` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_pm_folder
CREATE TABLE IF NOT EXISTS `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_pm_folder: ~4 rows (приблизительно)
DELETE FROM `b_forum_pm_folder`;
/*!40000 ALTER TABLE `b_forum_pm_folder` DISABLE KEYS */;
INSERT INTO `b_forum_pm_folder` (`ID`, `TITLE`, `USER_ID`, `SORT`) VALUES
	(1, 'SYSTEM_FOLDER_1', 0, 0),
	(2, 'SYSTEM_FOLDER_2', 0, 0),
	(3, 'SYSTEM_FOLDER_3', 0, 0),
	(4, 'SYSTEM_FOLDER_4', 0, 0);
/*!40000 ALTER TABLE `b_forum_pm_folder` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_points
CREATE TABLE IF NOT EXISTS `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_points`;
/*!40000 ALTER TABLE `b_forum_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_points2post
CREATE TABLE IF NOT EXISTS `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_points2post: ~0 rows (приблизительно)
DELETE FROM `b_forum_points2post`;
/*!40000 ALTER TABLE `b_forum_points2post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points2post` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_points_lang
CREATE TABLE IF NOT EXISTS `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_points_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_points_lang`;
/*!40000 ALTER TABLE `b_forum_points_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_private_message
CREATE TABLE IF NOT EXISTS `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_private_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_private_message`;
/*!40000 ALTER TABLE `b_forum_private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_private_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_rank
CREATE TABLE IF NOT EXISTS `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_rank: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank`;
/*!40000 ALTER TABLE `b_forum_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_rank_lang
CREATE TABLE IF NOT EXISTS `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_rank_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank_lang`;
/*!40000 ALTER TABLE `b_forum_rank_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_stat
CREATE TABLE IF NOT EXISTS `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_stat: ~0 rows (приблизительно)
DELETE FROM `b_forum_stat`;
/*!40000 ALTER TABLE `b_forum_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_stat` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_subscribe
CREATE TABLE IF NOT EXISTS `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_subscribe: ~0 rows (приблизительно)
DELETE FROM `b_forum_subscribe`;
/*!40000 ALTER TABLE `b_forum_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_subscribe` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_topic
CREATE TABLE IF NOT EXISTS `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_topic`;
/*!40000 ALTER TABLE `b_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_topic` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_user
CREATE TABLE IF NOT EXISTS `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text COLLATE utf8_unicode_ci,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_user: ~0 rows (приблизительно)
DELETE FROM `b_forum_user`;
/*!40000 ALTER TABLE `b_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_user_forum
CREATE TABLE IF NOT EXISTS `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_user_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_forum`;
/*!40000 ALTER TABLE `b_forum_user_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_forum` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_user_points
CREATE TABLE IF NOT EXISTS `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_user_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_points`;
/*!40000 ALTER TABLE `b_forum_user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_points` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_forum_user_topic
CREATE TABLE IF NOT EXISTS `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_forum_user_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_topic`;
/*!40000 ALTER TABLE `b_forum_user_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_topic` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_geoip_handlers
CREATE TABLE IF NOT EXISTS `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_geoip_handlers: ~2 rows (приблизительно)
DELETE FROM `b_geoip_handlers`;
/*!40000 ALTER TABLE `b_geoip_handlers` DISABLE KEYS */;
INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
	(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
	(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);
/*!40000 ALTER TABLE `b_geoip_handlers` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_group
CREATE TABLE IF NOT EXISTS `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_group: ~4 rows (приблизительно)
DELETE FROM `b_group`;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
	(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
	(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
	(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
	(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_group_collection_task
CREATE TABLE IF NOT EXISTS `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_group_collection_task: ~0 rows (приблизительно)
DELETE FROM `b_group_collection_task`;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_group_subordinate
CREATE TABLE IF NOT EXISTS `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_group_subordinate: ~0 rows (приблизительно)
DELETE FROM `b_group_subordinate`;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_group_task
CREATE TABLE IF NOT EXISTS `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_group_task: ~0 rows (приблизительно)
DELETE FROM `b_group_task`;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_hlblock_entity
CREATE TABLE IF NOT EXISTS `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_hlblock_entity: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity`;
/*!40000 ALTER TABLE `b_hlblock_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_hlblock_entity_lang
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_hlblock_entity_lang: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_lang`;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_hlblock_entity_rights
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_hlblock_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_rights`;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_hot_keys
CREATE TABLE IF NOT EXISTS `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_hot_keys: ~24 rows (приблизительно)
DELETE FROM `b_hot_keys`;
/*!40000 ALTER TABLE `b_hot_keys` DISABLE KEYS */;
INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
	(1, 'Ctrl+Alt+85', 139, 0),
	(2, 'Ctrl+Alt+80', 17, 0),
	(3, 'Ctrl+Alt+70', 120, 0),
	(4, 'Ctrl+Alt+68', 117, 0),
	(5, 'Ctrl+Alt+81', 3, 0),
	(6, 'Ctrl+Alt+75', 106, 0),
	(7, 'Ctrl+Alt+79', 133, 0),
	(8, 'Ctrl+Alt+70', 121, 0),
	(9, 'Ctrl+Alt+69', 118, 0),
	(10, 'Ctrl+Shift+83', 87, 0),
	(11, 'Ctrl+Shift+88', 88, 0),
	(12, 'Ctrl+Shift+76', 89, 0),
	(13, 'Ctrl+Alt+85', 139, 1),
	(14, 'Ctrl+Alt+80', 17, 1),
	(15, 'Ctrl+Alt+70', 120, 1),
	(16, 'Ctrl+Alt+68', 117, 1),
	(17, 'Ctrl+Alt+81', 3, 1),
	(18, 'Ctrl+Alt+75', 106, 1),
	(19, 'Ctrl+Alt+79', 133, 1),
	(20, 'Ctrl+Alt+70', 121, 1),
	(21, 'Ctrl+Alt+69', 118, 1),
	(22, 'Ctrl+Shift+83', 87, 1),
	(23, 'Ctrl+Shift+88', 88, 1),
	(24, 'Ctrl+Shift+76', 89, 1);
/*!40000 ALTER TABLE `b_hot_keys` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_hot_keys_code
CREATE TABLE IF NOT EXISTS `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_hot_keys_code: ~79 rows (приблизительно)
DELETE FROM `b_hot_keys_code`;
/*!40000 ALTER TABLE `b_hot_keys_code` DISABLE KEYS */;
INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
	(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
	(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
	(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
	(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
	(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
	(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
	(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
	(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
	(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
	(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
	(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
	(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
	(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
	(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
	(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
	(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
	(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
	(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
	(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
	(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
	(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
	(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
	(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
	(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
	(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
	(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
	(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
	(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
	(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
	(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
	(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
	(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
	(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
	(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
	(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
	(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
	(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
	(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
	(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
	(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
	(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
	(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
	(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
	(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
	(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
	(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
	(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
	(91, 'top_panel_menu', 'var d=BX("bx-panel-menu"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
	(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
	(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
	(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
	(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
	(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
	(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
	(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
	(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
	(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
	(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
	(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
	(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
	(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
	(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
	(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
	(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
	(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
	(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
	(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
	(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
	(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
	(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
	(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
	(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
	(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
	(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
	(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
	(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
	(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
/*!40000 ALTER TABLE `b_hot_keys_code` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock
CREATE TABLE IF NOT EXISTS `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock: ~0 rows (приблизительно)
DELETE FROM `b_iblock`;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
	(1, '2020-01-15 14:28:19', 'articles', 's1', 'articles', 'Статьи', 'Y', 500, '#SITE_DIR#/articles/index.php?ID=#IBLOCK_ID#', '#ELEMENT_CODE#/', '#SITE_DIR#/articles/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_cache
CREATE TABLE IF NOT EXISTS `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_cache: ~0 rows (приблизительно)
DELETE FROM `b_iblock_cache`;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_element
CREATE TABLE IF NOT EXISTS `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_element: ~9 rows (приблизительно)
DELETE FROM `b_iblock_element`;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
	(1, '2020-01-15 14:11:15', 1, '2020-01-15 14:08:53', 1, 1, NULL, 'Y', '2020-01-15 14:07:47', '2020-02-15 14:07:00', 500, 'Article title 1', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit..', 'text', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget. Aliquet nec ullamcorper sit amet risus. Dignissim enim sit amet venenatis urna cursus eget. Turpis egestas pretium aenean pharetra magna ac placerat. Sed tempus urna et pharetra pharetra massa massa ultricies. Risus nullam eget felis eget nunc lobortis. Vel eros donec ac odio tempor orci dapibus ultrices in. Quisque id diam vel quam. Faucibus et molestie ac feugiat sed lectus vestibulum mattis. Suspendisse faucibus interdum posuere lorem ipsum dolor. Non odio euismod lacinia at quis risus. Purus viverra accumsan in nisl nisi. Dolor sit amet consectetur adipiscing elit. Semper auctor neque vitae tempus quam pellentesque nec nam aliquam. Pharetra vel turpis nunc eget lorem dolor sed viverra. Elit ut aliquam purus sit amet luctus venenatis lectus magna. Pretium viverra suspendisse potenti nullam ac tortor vitae.</p>\r\n                        <p>Quisque egestas diam in arcu cursus. Blandit libero volutpat sed cras ornare arcu dui. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Praesent semper feugiat nibh sed pulvinar. Posuere ac ut consequat semper. Semper risus in hendrerit gravida rutrum quisque. Lacus viverra vitae congue eu consequat ac. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sapien nec sagittis aliquam malesuada. Ultricies leo integer malesuada nunc vel. Mattis ullamcorper velit sed ullamcorper morbi. Nec ullamcorper sit amet risus nullam eget felis. Amet consectetur adipiscing elit duis tristique sollicitudin. Etiam sit amet nisl purus in. Dignissim sodales ut eu sem integer.</p>\r\n                        <p>Viverra mauris in aliquam sem fringilla ut. Quis varius quam quisque id diam vel quam. Molestie ac feugiat sed lectus. Metus vulputate eu scelerisque felis imperdiet proin. Vitae auctor eu augue ut lectus arcu bibendum at varius. Vestibulum lorem sed risus ultricies. Egestas erat imperdiet sed euismod nisi porta lorem mollis aliquam. Leo urna molestie at elementum. Ac felis donec et odio. Tristique nulla aliquet enim tortor at auctor urna nunc. Velit ut tortor pretium viverra suspendisse. Tempor nec feugiat nisl pretium fusce. Aliquet nibh praesent tristique magna sit. Nibh nisl condimentum id venenatis. Augue neque gravida in fermentum et sollicitudin ac. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Et odio pellentesque diam volutpat commodo sed egestas. Scelerisque viverra mauris in aliquam.</p>\r\n                        <p>Turpis massa sed elementum tempus egestas sed sed. Fusce id velit ut tortor pretium viverra suspendisse potenti nullam. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Odio morbi quis commodo odio aenean sed adipiscing. Vulputate enim nulla aliquet porttitor. Sed augue lacus viverra vitae. Cum sociis natoque penatibus et magnis dis parturient. Ac turpis egestas sed tempus urna et pharetra. Blandit massa enim nec dui nunc mattis enim. Cras sed felis eget velit aliquet sagittis id consectetur purus. Bibendum at varius vel pharetra. Porta lorem mollis aliquam ut porttitor leo a. Eu turpis egestas pretium aenean pharetra magna. Praesent elementum facilisis leo vel fringilla est ullamcorper. Quisque non tellus orci ac auctor. Scelerisque eu ultrices vitae auctor eu augue. Malesuada fames ac turpis egestas integer eget aliquet nibh praesent.</p>\r\n                        <p>Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia. Aliquet eget sit amet tellus cras adipiscing. Dui accumsan sit amet nulla facilisi. Ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet. Aliquet nibh praesent tristique magna. At urna condimentum mattis pellentesque id. Et netus et malesuada fames ac turpis. Sit amet nulla facilisi morbi tempus iaculis urna id volutpat. Magna fringilla urna porttitor rhoncus. Sem viverra aliquet eget sit amet tellus cras adipiscing enim. At augue eget arcu dictum. Malesuada bibendum arcu vitae elementum curabitur vitae.</p>', 'html', 'ARTICLE TITLE 1\r\nLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT..\r\nLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD \r\nTEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. LOBORTIS FEUGIAT VIVAMUS AT AUGUE EGET. ALIQUET NEC ULLAMCORPER SIT AMET RISUS. DIGNISSIM ENIM SIT AMET VENENATIS URNA CURSUS EGET. TURPIS EGESTAS PRETIUM AENEAN PHARETRA MAGNA AC PLACERAT. SED TEMPUS URNA ET PHARETRA PHARETRA MASSA MASSA ULTRICIES. RISUS NULLAM EGET FELIS EGET NUNC LOBORTIS. VEL EROS DONEC AC ODIO TEMPOR ORCI DAPIBUS ULTRICES IN. QUISQUE ID DIAM VEL QUAM. FAUCIBUS ET MOLESTIE AC FEUGIAT SED LECTUS VESTIBULUM MATTIS. SUSPENDISSE FAUCIBUS INTERDUM POSUERE LOREM IPSUM DOLOR. NON ODIO EUISMOD LACINIA AT QUIS RISUS. PURUS VIVERRA ACCUMSAN IN NISL NISI. DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT. SEMPER AUCTOR NEQUE VITAE TEMPUS QUAM PELLENTESQUE NEC NAM ALIQUAM. PHARETRA VEL TURPIS NUNC EGET LOREM DOLOR SED VIVERRA. ELIT UT ALIQUAM PURUS SIT AMET LUCTUS VENENATIS LECTUS MAGNA. PRETIUM VIVERRA SUSPENDISSE POTENTI NULLAM AC TORTOR VITAE. \r\n\r\nQUISQUE EGESTAS DIAM IN ARCU CURSUS. BLANDIT LIBERO VOLUTPAT SED CRAS ORNARE \r\nARCU DUI. SCELERISQUE MAURIS PELLENTESQUE PULVINAR PELLENTESQUE HABITANT MORBI. PRAESENT SEMPER FEUGIAT NIBH SED PULVINAR. POSUERE AC UT CONSEQUAT SEMPER. SEMPER RISUS IN HENDRERIT GRAVIDA RUTRUM QUISQUE. LACUS VIVERRA VITAE CONGUE EU CONSEQUAT AC. NULLA MALESUADA PELLENTESQUE ELIT EGET GRAVIDA CUM SOCIIS NATOQUE PENATIBUS. SAPIEN NEC SAGITTIS ALIQUAM MALESUADA. ULTRICIES LEO INTEGER MALESUADA NUNC VEL. MATTIS ULLAMCORPER VELIT SED ULLAMCORPER MORBI. NEC ULLAMCORPER SIT AMET RISUS NULLAM EGET FELIS. AMET CONSECTETUR ADIPISCING ELIT DUIS TRISTIQUE SOLLICITUDIN. ETIAM SIT AMET NISL PURUS IN. DIGNISSIM SODALES UT EU SEM INTEGER. \r\n\r\nVIVERRA MAURIS IN ALIQUAM SEM FRINGILLA UT. QUIS VARIUS QUAM QUISQUE ID \r\nDIAM VEL QUAM. MOLESTIE AC FEUGIAT SED LECTUS. METUS VULPUTATE EU SCELERISQUE FELIS IMPERDIET PROIN. VITAE AUCTOR EU AUGUE UT LECTUS ARCU BIBENDUM AT VARIUS. VESTIBULUM LOREM SED RISUS ULTRICIES. EGESTAS ERAT IMPERDIET SED EUISMOD NISI PORTA LOREM MOLLIS ALIQUAM. LEO URNA MOLESTIE AT ELEMENTUM. AC FELIS DONEC ET ODIO. TRISTIQUE NULLA ALIQUET ENIM TORTOR AT AUCTOR URNA NUNC. VELIT UT TORTOR PRETIUM VIVERRA SUSPENDISSE. TEMPOR NEC FEUGIAT NISL PRETIUM FUSCE. ALIQUET NIBH PRAESENT TRISTIQUE MAGNA SIT. NIBH NISL CONDIMENTUM ID VENENATIS. AUGUE NEQUE GRAVIDA IN FERMENTUM ET SOLLICITUDIN AC. TEMPUS IMPERDIET NULLA MALESUADA PELLENTESQUE ELIT EGET GRAVIDA. ET ODIO PELLENTESQUE DIAM VOLUTPAT COMMODO SED EGESTAS. SCELERISQUE VIVERRA MAURIS IN ALIQUAM. \r\n\r\nTURPIS MASSA SED ELEMENTUM TEMPUS EGESTAS SED SED. FUSCE ID VELIT UT TORTOR \r\nPRETIUM VIVERRA SUSPENDISSE POTENTI NULLAM. QUAM LACUS SUSPENDISSE FAUCIBUS INTERDUM POSUERE LOREM IPSUM. ODIO MORBI QUIS COMMODO ODIO AENEAN SED ADIPISCING. VULPUTATE ENIM NULLA ALIQUET PORTTITOR. SED AUGUE LACUS VIVERRA VITAE. CUM SOCIIS NATOQUE PENATIBUS ET MAGNIS DIS PARTURIENT. AC TURPIS EGESTAS SED TEMPUS URNA ET PHARETRA. BLANDIT MASSA ENIM NEC DUI NUNC MATTIS ENIM. CRAS SED FELIS EGET VELIT ALIQUET SAGITTIS ID CONSECTETUR PURUS. BIBENDUM AT VARIUS VEL PHARETRA. PORTA LOREM MOLLIS ALIQUAM UT PORTTITOR LEO A. EU TURPIS EGESTAS PRETIUM AENEAN PHARETRA MAGNA. PRAESENT ELEMENTUM FACILISIS LEO VEL FRINGILLA EST ULLAMCORPER. QUISQUE NON TELLUS ORCI AC AUCTOR. SCELERISQUE EU ULTRICES VITAE AUCTOR EU AUGUE. MALESUADA FAMES AC TURPIS EGESTAS INTEGER EGET ALIQUET NIBH PRAESENT. \r\n\r\nODIO FACILISIS MAURIS SIT AMET MASSA VITAE TORTOR CONDIMENTUM LACINIA. \r\nALIQUET EGET SIT AMET TELLUS CRAS ADIPISCING. DUI ACCUMSAN SIT AMET NULLA FACILISI. RIDICULUS MUS MAURIS VITAE ULTRICIES LEO INTEGER MALESUADA NUNC VEL. NISI SCELERISQUE EU ULTRICES VITAE AUCTOR EU AUGUE UT LECTUS. PELLENTESQUE ADIPISCING COMMODO ELIT AT IMPERDIET DUI ACCUMSAN SIT AMET. ALIQUET NIBH PRAESENT TRISTIQUE MAGNA. AT URNA CONDIMENTUM MATTIS PELLENTESQUE ID. ET NETUS ET MALESUADA FAMES AC TURPIS. SIT AMET NULLA FACILISI MORBI TEMPUS IACULIS URNA ID VOLUTPAT. MAGNA FRINGILLA URNA PORTTITOR RHONCUS. SEM VIVERRA ALIQUET EGET SIT AMET TELLUS CRAS ADIPISCING ENIM. AT AUGUE EGET ARCU DICTUM. MALESUADA BIBENDUM ARCU VITAE ELEMENTUM CURABITUR VITAE.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '1', 'article-title-1', '', '0', NULL, 1, '2020-01-15 14:37:05'),
	(2, '2020-01-15 14:11:30', 1, '2020-01-15 14:09:30', 1, 1, NULL, 'Y', '2020-01-15 14:08:53', '2020-02-15 14:09:00', 500, 'Article title 2', 3, 'Zombie ipsum reversus ab viral inferno...', 'text', 4, '<p>Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.</p>\r\n                        <p>Cum horribilem walking dead resurgere de crazed sepulcris creaturis, zombie sicut de grave feeding iride et serpens. Pestilentia, shaun ofthe dead scythe animated corpses ipsa screams. Pestilentia est plague haec decaying ambulabat mortuos. Sicut zeder apathetic malus voodoo. Aenean a dolor plan et terror soulless vulnerum contagium accedunt, mortui iam vivam unlife. Qui tardius moveri, brid eof reanimator sed in magna copia sint terribiles undeath legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi braindead odores kill and infect, aere implent left four dead.</p>\r\n                        <p>Lucio fulci tremor est dark vivos magna. Expansis creepy arm yof darkness ulnis witchcraft missing carnem armis Kirkman Moore and Adlard caeruleum in locis. Romero morbo Congress amarus in auras. Nihil horum sagittis tincidunt, zombie slack-jawed gelida survival portenta. The unleashed virus est, et iam zombie mortui ambulabunt super terram. Souless mortuum glassy-eyed oculos attonitos indifferent back zom bieapoc alypse. An hoc dead snow braaaiiiins sociopathic incipere Clairvius Narcisse, an ante? Is bello mundi z?</p>\r\n                        <p>In Craven omni memoria patriae zombieland clairvius narcisse religionis sunt diri undead historiarum. Golums, zombies unrelenting et Raimi fascinati beheading. Maleficia! Vel cemetery man a modern bursting eyeballs perhsaps morbi. A terrenti flesh contagium. Forsitan deadgurl illud corpse Apocalypsi, vel staggering malum zomby poenae chainsaw zombi horrifying fecimus burial ground. Indeflexus shotgun coup de poudre monstra per plateas currere. Fit de decay nostra carne undead. Poenitentiam violent zom biehig hway agite RE:dead pœnitentiam! Vivens mortua sunt apud nos night of the living dead.</p>\r\n                        <p>Whyt zomby Ut fames after death cerebro virus enim carnis grusome, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus flesh eating. Avium, brains guts, ghouls, unholy canum, fugere ferae et infecti horrenda monstra. Videmus twenty-eight deformis pale, horrenda daemonum. Panduntur brains portae rotting inferi. Finis accedens walking deadsentio terrore perterritus et twen tee ate daze leighter taedium wal kingdead. The horror, monstra epidemic significant finem. Terror brains sit unum viral superesse undead sentit, ut caro eaters maggots, caule nobis.</p>', 'html', 'ARTICLE TITLE 2\r\nZOMBIE IPSUM REVERSUS AB VIRAL INFERNO...\r\nZOMBIE IPSUM REVERSUS AB VIRAL INFERNO, NAM RICK GRIMES MALUM CEREBRO. \r\nDE CARNE LUMBERING ANIMATA CORPORA QUAERITIS. SUMMUS BRAINS SIT​​, MORBO VEL MALEFICIA? DE APOCALYPSI GORGER OMERO UNDEAD SURVIVOR DICTUM MAURIS. HI MINDLESS MORTUIS SOULLESS CREATURAS, IMO EVIL STALKING MONSTRA ADVENTUS RESI DENTEVIL VULTUS COMEDAT CEREBELLA VIVENTIUM. QUI ANIMATED CORPSE, CRICKET BAT MAX BRUCKS TERRIBILEM INCESSU ZOMBY. THE VOODOO SACERDOS FLESH EATER, SUSCITAT MORTUOS COMEDERE CARNEM VIRUS. ZONBI TATTERED FOR SOLUM OCULI EORUM DEFUNCTIS GO LUM CEREBRO. NESCIO BRAINS AN UNDEAD ZOMBIES. SICUT MALUS PUTRID VOODOO HORROR. NIGH TOFTH ELIV INGDEAD. \r\n\r\nCUM HORRIBILEM WALKING DEAD RESURGERE DE CRAZED SEPULCRIS CREATURIS, ZOMBIE \r\nSICUT DE GRAVE FEEDING IRIDE ET SERPENS. PESTILENTIA, SHAUN OFTHE DEAD SCYTHE ANIMATED CORPSES IPSA SCREAMS. PESTILENTIA EST PLAGUE HAEC DECAYING AMBULABAT MORTUOS. SICUT ZEDER APATHETIC MALUS VOODOO. AENEAN A DOLOR PLAN ET TERROR SOULLESS VULNERUM CONTAGIUM ACCEDUNT, MORTUI IAM VIVAM UNLIFE. QUI TARDIUS MOVERI, BRID EOF REANIMATOR SED IN MAGNA COPIA SINT TERRIBILES UNDEATH LEGIONIS. ALII MISSING OCULIS ALIORUM SICUT SERPERE CRABS NOSTRAM. PUTRIDI BRAINDEAD ODORES KILL AND INFECT, AERE IMPLENT LEFT FOUR DEAD. \r\n\r\nLUCIO FULCI TREMOR EST DARK VIVOS MAGNA. EXPANSIS CREEPY ARM YOF DARKNESS \r\nULNIS WITCHCRAFT MISSING CARNEM ARMIS KIRKMAN MOORE AND ADLARD CAERULEUM IN LOCIS. ROMERO MORBO CONGRESS AMARUS IN AURAS. NIHIL HORUM SAGITTIS TINCIDUNT, ZOMBIE SLACK-JAWED GELIDA SURVIVAL PORTENTA. THE UNLEASHED VIRUS EST, ET IAM ZOMBIE MORTUI AMBULABUNT SUPER TERRAM. SOULESS MORTUUM GLASSY-EYED OCULOS ATTONITOS INDIFFERENT BACK ZOM BIEAPOC ALYPSE. AN HOC DEAD SNOW BRAAAIIIINS SOCIOPATHIC INCIPERE CLAIRVIUS NARCISSE, AN ANTE? IS BELLO MUNDI Z? \r\n\r\nIN CRAVEN OMNI MEMORIA PATRIAE ZOMBIELAND CLAIRVIUS NARCISSE RELIGIONIS \r\nSUNT DIRI UNDEAD HISTORIARUM. GOLUMS, ZOMBIES UNRELENTING ET RAIMI FASCINATI BEHEADING. MALEFICIA! VEL CEMETERY MAN A MODERN BURSTING EYEBALLS PERHSAPS MORBI. A TERRENTI FLESH CONTAGIUM. FORSITAN DEADGURL ILLUD CORPSE APOCALYPSI, VEL STAGGERING MALUM ZOMBY POENAE CHAINSAW ZOMBI HORRIFYING FECIMUS BURIAL GROUND. INDEFLEXUS SHOTGUN COUP DE POUDRE MONSTRA PER PLATEAS CURRERE. FIT DE DECAY NOSTRA CARNE UNDEAD. POENITENTIAM VIOLENT ZOM BIEHIG HWAY AGITE RE:DEAD PŒNITENTIAM! VIVENS MORTUA SUNT APUD NOS NIGHT OF THE LIVING DEAD. \r\n\r\nWHYT ZOMBY UT FAMES AFTER DEATH CEREBRO VIRUS ENIM CARNIS GRUSOME, VISCERA \r\nET ORGANA VIVENTIUM. SICUT SPARGIT VIRUS AD IMPETUM, QUI SUPERSUMUS FLESH EATING. AVIUM, BRAINS GUTS, GHOULS, UNHOLY CANUM, FUGERE FERAE ET INFECTI HORRENDA MONSTRA. VIDEMUS TWENTY-EIGHT DEFORMIS PALE, HORRENDA DAEMONUM. PANDUNTUR BRAINS PORTAE ROTTING INFERI. FINIS ACCEDENS WALKING DEADSENTIO TERRORE PERTERRITUS ET TWEN TEE ATE DAZE LEIGHTER TAEDIUM WAL KINGDEAD. THE HORROR, MONSTRA EPIDEMIC SIGNIFICANT FINEM. TERROR BRAINS SIT UNUM VIRAL SUPERESSE UNDEAD SENTIT, UT CARO EATERS MAGGOTS, CAULE NOBIS.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '2', 'article-title-2', '', '0', NULL, 1, '2020-01-15 14:35:59'),
	(3, '2020-01-15 14:12:03', 1, '2020-01-15 14:10:06', 1, 1, NULL, 'Y', '2020-01-15 14:09:30', '2020-02-15 14:09:00', 500, 'Article title 3', 5, 'Zombies reversus ab inferno, nam malum cerebro...', 'text', 6, '<p>Zombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.</p>\r\n                        <p>Cum horribilem resurgere de sepulcris creaturis, sicut de iride et serpens. Pestilentia, ipsa screams. Pestilentia est haec ambulabat mortuos. Sicut malus voodoo. Aenean a dolor vulnerum aperire accedunt, mortui iam vivam. Qui tardius moveri, sed in magna copia sint terribiles legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi odores aere implent.</p>\r\n                        <p>Tremor est vivos magna. Expansis ulnis video missing carnem armis caeruleum in locis. A morbo amarus in auras. Nihil horum sagittis tincidunt, gelida portenta. The unleashed virus est, et iam mortui ambulabunt super terram. Souless mortuum oculos attonitos back zombies. An hoc incipere Clairvius Narcisse, an ante? Is bello mundi z?</p>\r\n                        <p>In omni memoria patriae religionis sunt diri undead historiarum. Golums, zombies et fascinati. Maleficia! Vel a modern perhsaps morbi. A terrenti contagium. Forsitan illud Apocalypsi, vel malum poenae horrifying fecimus. Indeflexus monstra per plateas currere. Fit de nostra carne undead. Poenitentiam agite pœnitentiam! Vivens mortua sunt apud nos.</p>\r\n                        <p>Ut fames cerebro enim carnis, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus. Avium, canum, fugere ferae et infecti horrenda monstra. Videmus deformis horrenda daemonum. Panduntur portae inferi. Finis accedens sentio terrore perterritus et taedium. The horror, monstra significant finem. Terror sit unum superesse sentit, ut caro eaters caule nobis.</p>', 'html', 'ARTICLE TITLE 3\r\nZOMBIES REVERSUS AB INFERNO, NAM MALUM CEREBRO...\r\nZOMBIES REVERSUS AB INFERNO, NAM MALUM CEREBRO. DE CARNE ANIMATA CORPORA \r\nQUAERITIS. SUMMUS SIT​​, MORBO VEL MALEFICIA? DE APOCALYPSI UNDEAD DICTUM MAURIS. HI MORTUIS SOULLESS CREATURAS, IMO MONSTRA ADVENTUS VULTUS COMEDAT CEREBELLA VIVENTIUM. QUI OFFENDERIT RAPTO, TERRIBILEM INCESSU. THE VOODOO SACERDOS SUSCITAT MORTUOS COMEDERE CARNEM. SEARCH FOR SOLUM OCULI EORUM DEFUNCTIS CEREBRO. NESCIO AN UNDEAD ZOMBIES. SICUT MALUS MOVIE HORROR. \r\n\r\nCUM HORRIBILEM RESURGERE DE SEPULCRIS CREATURIS, SICUT DE IRIDE ET SERPENS. \r\nPESTILENTIA, IPSA SCREAMS. PESTILENTIA EST HAEC AMBULABAT MORTUOS. SICUT MALUS VOODOO. AENEAN A DOLOR VULNERUM APERIRE ACCEDUNT, MORTUI IAM VIVAM. QUI TARDIUS MOVERI, SED IN MAGNA COPIA SINT TERRIBILES LEGIONIS. ALII MISSING OCULIS ALIORUM SICUT SERPERE CRABS NOSTRAM. PUTRIDI ODORES AERE IMPLENT. \r\n\r\nTREMOR EST VIVOS MAGNA. EXPANSIS ULNIS VIDEO MISSING CARNEM ARMIS CAERULEUM \r\nIN LOCIS. A MORBO AMARUS IN AURAS. NIHIL HORUM SAGITTIS TINCIDUNT, GELIDA PORTENTA. THE UNLEASHED VIRUS EST, ET IAM MORTUI AMBULABUNT SUPER TERRAM. SOULESS MORTUUM OCULOS ATTONITOS BACK ZOMBIES. AN HOC INCIPERE CLAIRVIUS NARCISSE, AN ANTE? IS BELLO MUNDI Z? \r\n\r\nIN OMNI MEMORIA PATRIAE RELIGIONIS SUNT DIRI UNDEAD HISTORIARUM. GOLUMS, \r\nZOMBIES ET FASCINATI. MALEFICIA! VEL A MODERN PERHSAPS MORBI. A TERRENTI CONTAGIUM. FORSITAN ILLUD APOCALYPSI, VEL MALUM POENAE HORRIFYING FECIMUS. INDEFLEXUS MONSTRA PER PLATEAS CURRERE. FIT DE NOSTRA CARNE UNDEAD. POENITENTIAM AGITE PŒNITENTIAM! VIVENS MORTUA SUNT APUD NOS. \r\n\r\nUT FAMES CEREBRO ENIM CARNIS, VISCERA ET ORGANA VIVENTIUM. SICUT SPARGIT \r\nVIRUS AD IMPETUM, QUI SUPERSUMUS. AVIUM, CANUM, FUGERE FERAE ET INFECTI HORRENDA MONSTRA. VIDEMUS DEFORMIS HORRENDA DAEMONUM. PANDUNTUR PORTAE INFERI. FINIS ACCEDENS SENTIO TERRORE PERTERRITUS ET TAEDIUM. THE HORROR, MONSTRA SIGNIFICANT FINEM. TERROR SIT UNUM SUPERESSE SENTIT, UT CARO EATERS CAULE NOBIS.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', 'article-title-3', '', '0', NULL, NULL, NULL),
	(4, '2020-01-15 14:11:44', 1, '2020-01-15 14:10:48', 1, 1, NULL, 'Y', '2020-01-15 14:10:07', '2020-02-15 14:10:00', 500, 'Article title 4', 7, 'Bacon ipsum dolor amet jerky drumstick burgdoggen...', 'text', 8, '<p>Zombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.</p>\r\n                        <p>Cum horribilem resurgere de sepulcris creaturis, sicut de iride et serpens. Pestilentia, ipsa screams. Pestilentia est haec ambulabat mortuos. Sicut malus voodoo. Aenean a dolor vulnerum aperire accedunt, mortui iam vivam. Qui tardius moveri, sed in magna copia sint terribiles legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi odores aere implent.</p>\r\n                        <p>Tremor est vivos magna. Expansis ulnis video missing carnem armis caeruleum in locis. A morbo amarus in auras. Nihil horum sagittis tincidunt, gelida portenta. The unleashed virus est, et iam mortui ambulabunt super terram. Souless mortuum oculos attonitos back zombies. An hoc incipere Clairvius Narcisse, an ante? Is bello mundi z?</p>\r\n                        <p>In omni memoria patriae religionis sunt diri undead historiarum. Golums, zombies et fascinati. Maleficia! Vel a modern perhsaps morbi. A terrenti contagium. Forsitan illud Apocalypsi, vel malum poenae horrifying fecimus. Indeflexus monstra per plateas currere. Fit de nostra carne undead. Poenitentiam agite pœnitentiam! Vivens mortua sunt apud nos.</p>\r\n                        <p>Ut fames cerebro enim carnis, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus. Avium, canum, fugere ferae et infecti horrenda monstra. Videmus deformis horrenda daemonum. Panduntur portae inferi. Finis accedens sentio terrore perterritus et taedium. The horror, monstra significant finem. Terror sit unum superesse sentit, ut caro eaters caule nobis.</p>', 'html', 'ARTICLE TITLE 4\r\nBACON IPSUM DOLOR AMET JERKY DRUMSTICK BURGDOGGEN...\r\nZOMBIES REVERSUS AB INFERNO, NAM MALUM CEREBRO. DE CARNE ANIMATA CORPORA \r\nQUAERITIS. SUMMUS SIT​​, MORBO VEL MALEFICIA? DE APOCALYPSI UNDEAD DICTUM MAURIS. HI MORTUIS SOULLESS CREATURAS, IMO MONSTRA ADVENTUS VULTUS COMEDAT CEREBELLA VIVENTIUM. QUI OFFENDERIT RAPTO, TERRIBILEM INCESSU. THE VOODOO SACERDOS SUSCITAT MORTUOS COMEDERE CARNEM. SEARCH FOR SOLUM OCULI EORUM DEFUNCTIS CEREBRO. NESCIO AN UNDEAD ZOMBIES. SICUT MALUS MOVIE HORROR. \r\n\r\nCUM HORRIBILEM RESURGERE DE SEPULCRIS CREATURIS, SICUT DE IRIDE ET SERPENS. \r\nPESTILENTIA, IPSA SCREAMS. PESTILENTIA EST HAEC AMBULABAT MORTUOS. SICUT MALUS VOODOO. AENEAN A DOLOR VULNERUM APERIRE ACCEDUNT, MORTUI IAM VIVAM. QUI TARDIUS MOVERI, SED IN MAGNA COPIA SINT TERRIBILES LEGIONIS. ALII MISSING OCULIS ALIORUM SICUT SERPERE CRABS NOSTRAM. PUTRIDI ODORES AERE IMPLENT. \r\n\r\nTREMOR EST VIVOS MAGNA. EXPANSIS ULNIS VIDEO MISSING CARNEM ARMIS CAERULEUM \r\nIN LOCIS. A MORBO AMARUS IN AURAS. NIHIL HORUM SAGITTIS TINCIDUNT, GELIDA PORTENTA. THE UNLEASHED VIRUS EST, ET IAM MORTUI AMBULABUNT SUPER TERRAM. SOULESS MORTUUM OCULOS ATTONITOS BACK ZOMBIES. AN HOC INCIPERE CLAIRVIUS NARCISSE, AN ANTE? IS BELLO MUNDI Z? \r\n\r\nIN OMNI MEMORIA PATRIAE RELIGIONIS SUNT DIRI UNDEAD HISTORIARUM. GOLUMS, \r\nZOMBIES ET FASCINATI. MALEFICIA! VEL A MODERN PERHSAPS MORBI. A TERRENTI CONTAGIUM. FORSITAN ILLUD APOCALYPSI, VEL MALUM POENAE HORRIFYING FECIMUS. INDEFLEXUS MONSTRA PER PLATEAS CURRERE. FIT DE NOSTRA CARNE UNDEAD. POENITENTIAM AGITE PŒNITENTIAM! VIVENS MORTUA SUNT APUD NOS. \r\n\r\nUT FAMES CEREBRO ENIM CARNIS, VISCERA ET ORGANA VIVENTIUM. SICUT SPARGIT \r\nVIRUS AD IMPETUM, QUI SUPERSUMUS. AVIUM, CANUM, FUGERE FERAE ET INFECTI HORRENDA MONSTRA. VIDEMUS DEFORMIS HORRENDA DAEMONUM. PANDUNTUR PORTAE INFERI. FINIS ACCEDENS SENTIO TERRORE PERTERRITUS ET TAEDIUM. THE HORROR, MONSTRA SIGNIFICANT FINEM. TERROR SIT UNUM SUPERESSE SENTIT, UT CARO EATERS CAULE NOBIS.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', 'article-title-4', '', '0', NULL, NULL, NULL),
	(5, '2020-01-15 14:12:45', 1, '2020-01-15 14:12:45', 1, 1, NULL, 'Y', '2020-01-15 14:12:15', '2020-02-15 14:12:00', 500, 'Article title 5', 9, 'Apple pie dragée jelly muffin chocolate...', 'text', 10, '<p>Apple pie dragée jelly muffin chocolate. Cheesecake candy canes cheesecake lemon drops apple pie pastry soufflé. Lemon drops gingerbread fruitcake croissant soufflé cheesecake powder bonbon cookie. Danish donut tart liquorice. Tart halvah dessert tiramisu. Bonbon jelly beans lemon drops chupa chups pastry. Gummies candy cake. Marshmallow powder muffin cotton candy. Brownie cupcake carrot cake chocolate. Croissant chocolate cake jujubes danish muffin caramels fruitcake carrot cake cookie. Gingerbread chocolate cake donut bear claw jujubes biscuit. Jelly-o candy canes chocolate bar dessert jelly marzipan dragée. Pudding chocolate cake bonbon pudding dessert icing ice cream.</p>\r\n                        <p>Lollipop gingerbread gummi bears dragée tart toffee candy canes chocolate croissant. Gingerbread bonbon tiramisu jelly beans chocolate bar. Dragée topping muffin tiramisu sweet. Powder tart cake lollipop bear claw apple pie tart. Pie sweet roll candy danish danish pudding candy. Marshmallow sugar plum tart jelly beans bear claw cupcake chupa chups jelly dessert. Topping chupa chups chocolate cake liquorice. Jelly-o jujubes carrot cake cake donut lollipop candy canes bear claw. Cotton candy icing tootsie roll pastry. Sugar plum powder cookie candy jelly carrot cake cake pastry candy canes. Lemon drops pie chocolate cake candy canes chocolate cake. Gummi bears gummies wafer jelly-o carrot cake marzipan. Cake cheesecake candy canes gummi bears jelly.</p>\r\n                        <p>Topping tart gingerbread dessert. Chocolate cake dragée powder topping fruitcake. Liquorice apple pie wafer marshmallow biscuit donut halvah pudding cheesecake. Fruitcake jujubes tootsie roll bonbon. Liquorice muffin oat cake toffee chupa chups liquorice fruitcake. Macaroon soufflé jelly-o caramels donut cupcake pudding pie. Icing liquorice cheesecake sweet roll sweet roll dessert. Bonbon cheesecake candy cake. Topping soufflé chocolate carrot cake marshmallow macaroon tart croissant. Cheesecake cotton candy croissant caramels lollipop cake soufflé chocolate bar marzipan. Apple pie powder bear claw. Cupcake lollipop lemon drops pie wafer ice cream danish. Apple pie gingerbread jelly beans biscuit tart. Danish fruitcake fruitcake liquorice.</p>\r\n                        <p>Pudding dragée gingerbread chupa chups brownie fruitcake fruitcake cheesecake pudding. Chocolate bar danish sweet roll cake sugar plum sesame snaps toffee liquorice. Cotton candy jelly candy canes biscuit chocolate sweet. Muffin tart marshmallow liquorice dessert soufflé chocolate bar tart cupcake. Muffin cake marzipan jujubes pie gingerbread. Cookie cupcake pastry cheesecake cheesecake lemon drops gummies. Candy pudding gummi bears. Muffin sweet roll sweet danish wafer cotton candy. Wafer tart chocolate bar. Tart toffee jelly beans biscuit powder. Cotton candy lollipop sugar plum bonbon sweet gummi bears. Bear claw tootsie roll lemon drops cotton candy cheesecake. Bonbon topping danish sweet roll macaroon lollipop. Ice cream danish brownie lollipop donut lemon drops biscuit dragée.</p>\r\n                        <p>Tiramisu gummi bears pastry jelly. Sweet roll carrot cake liquorice bonbon chocolate tiramisu danish oat cake lemon drops. Chocolate cake wafer muffin chupa chups. Macaroon cupcake pastry brownie chocolate bar powder cheesecake marzipan. Pie chupa chups chocolate cake gummi bears fruitcake sesame snaps fruitcake biscuit cake. Pastry sugar plum muffin. Lollipop lemon drops bear claw topping lollipop cake. Marshmallow donut sugar plum lollipop marzipan. Bear claw candy canes cake gummi bears gummies jelly. Icing cake powder gummi bears cupcake. Carrot cake ice cream soufflé jelly beans. Sugar plum bear claw pie danish icing cupcake chocolate dessert tiramisu. Halvah sweet roll tiramisu sugar plum lollipop jujubes cupcake oat cake.</p>', 'html', 'ARTICLE TITLE 5\r\nAPPLE PIE DRAGÉE JELLY MUFFIN CHOCOLATE...\r\nAPPLE PIE DRAGÉE JELLY MUFFIN CHOCOLATE. CHEESECAKE CANDY CANES CHEESECAKE \r\nLEMON DROPS APPLE PIE PASTRY SOUFFLÉ. LEMON DROPS GINGERBREAD FRUITCAKE CROISSANT SOUFFLÉ CHEESECAKE POWDER BONBON COOKIE. DANISH DONUT TART LIQUORICE. TART HALVAH DESSERT TIRAMISU. BONBON JELLY BEANS LEMON DROPS CHUPA CHUPS PASTRY. GUMMIES CANDY CAKE. MARSHMALLOW POWDER MUFFIN COTTON CANDY. BROWNIE CUPCAKE CARROT CAKE CHOCOLATE. CROISSANT CHOCOLATE CAKE JUJUBES DANISH MUFFIN CARAMELS FRUITCAKE CARROT CAKE COOKIE. GINGERBREAD CHOCOLATE CAKE DONUT BEAR CLAW JUJUBES BISCUIT. JELLY-O CANDY CANES CHOCOLATE BAR DESSERT JELLY MARZIPAN DRAGÉE. PUDDING CHOCOLATE CAKE BONBON PUDDING DESSERT ICING ICE CREAM. \r\n\r\nLOLLIPOP GINGERBREAD GUMMI BEARS DRAGÉE TART TOFFEE CANDY CANES CHOCOLATE \r\nCROISSANT. GINGERBREAD BONBON TIRAMISU JELLY BEANS CHOCOLATE BAR. DRAGÉE TOPPING MUFFIN TIRAMISU SWEET. POWDER TART CAKE LOLLIPOP BEAR CLAW APPLE PIE TART. PIE SWEET ROLL CANDY DANISH DANISH PUDDING CANDY. MARSHMALLOW SUGAR PLUM TART JELLY BEANS BEAR CLAW CUPCAKE CHUPA CHUPS JELLY DESSERT. TOPPING CHUPA CHUPS CHOCOLATE CAKE LIQUORICE. JELLY-O JUJUBES CARROT CAKE CAKE DONUT LOLLIPOP CANDY CANES BEAR CLAW. COTTON CANDY ICING TOOTSIE ROLL PASTRY. SUGAR PLUM POWDER COOKIE CANDY JELLY CARROT CAKE CAKE PASTRY CANDY CANES. LEMON DROPS PIE CHOCOLATE CAKE CANDY CANES CHOCOLATE CAKE. GUMMI BEARS GUMMIES WAFER JELLY-O CARROT CAKE MARZIPAN. CAKE CHEESECAKE CANDY CANES GUMMI BEARS JELLY. \r\n\r\nTOPPING TART GINGERBREAD DESSERT. CHOCOLATE CAKE DRAGÉE POWDER TOPPING \r\nFRUITCAKE. LIQUORICE APPLE PIE WAFER MARSHMALLOW BISCUIT DONUT HALVAH PUDDING CHEESECAKE. FRUITCAKE JUJUBES TOOTSIE ROLL BONBON. LIQUORICE MUFFIN OAT CAKE TOFFEE CHUPA CHUPS LIQUORICE FRUITCAKE. MACAROON SOUFFLÉ JELLY-O CARAMELS DONUT CUPCAKE PUDDING PIE. ICING LIQUORICE CHEESECAKE SWEET ROLL SWEET ROLL DESSERT. BONBON CHEESECAKE CANDY CAKE. TOPPING SOUFFLÉ CHOCOLATE CARROT CAKE MARSHMALLOW MACAROON TART CROISSANT. CHEESECAKE COTTON CANDY CROISSANT CARAMELS LOLLIPOP CAKE SOUFFLÉ CHOCOLATE BAR MARZIPAN. APPLE PIE POWDER BEAR CLAW. CUPCAKE LOLLIPOP LEMON DROPS PIE WAFER ICE CREAM DANISH. APPLE PIE GINGERBREAD JELLY BEANS BISCUIT TART. DANISH FRUITCAKE FRUITCAKE LIQUORICE. \r\n\r\nPUDDING DRAGÉE GINGERBREAD CHUPA CHUPS BROWNIE FRUITCAKE FRUITCAKE CHEESECAKE \r\nPUDDING. CHOCOLATE BAR DANISH SWEET ROLL CAKE SUGAR PLUM SESAME SNAPS TOFFEE LIQUORICE. COTTON CANDY JELLY CANDY CANES BISCUIT CHOCOLATE SWEET. MUFFIN TART MARSHMALLOW LIQUORICE DESSERT SOUFFLÉ CHOCOLATE BAR TART CUPCAKE. MUFFIN CAKE MARZIPAN JUJUBES PIE GINGERBREAD. COOKIE CUPCAKE PASTRY CHEESECAKE CHEESECAKE LEMON DROPS GUMMIES. CANDY PUDDING GUMMI BEARS. MUFFIN SWEET ROLL SWEET DANISH WAFER COTTON CANDY. WAFER TART CHOCOLATE BAR. TART TOFFEE JELLY BEANS BISCUIT POWDER. COTTON CANDY LOLLIPOP SUGAR PLUM BONBON SWEET GUMMI BEARS. BEAR CLAW TOOTSIE ROLL LEMON DROPS COTTON CANDY CHEESECAKE. BONBON TOPPING DANISH SWEET ROLL MACAROON LOLLIPOP. ICE CREAM DANISH BROWNIE LOLLIPOP DONUT LEMON DROPS BISCUIT DRAGÉE. \r\n\r\nTIRAMISU GUMMI BEARS PASTRY JELLY. SWEET ROLL CARROT CAKE LIQUORICE BONBON \r\nCHOCOLATE TIRAMISU DANISH OAT CAKE LEMON DROPS. CHOCOLATE CAKE WAFER MUFFIN CHUPA CHUPS. MACAROON CUPCAKE PASTRY BROWNIE CHOCOLATE BAR POWDER CHEESECAKE MARZIPAN. PIE CHUPA CHUPS CHOCOLATE CAKE GUMMI BEARS FRUITCAKE SESAME SNAPS FRUITCAKE BISCUIT CAKE. PASTRY SUGAR PLUM MUFFIN. LOLLIPOP LEMON DROPS BEAR CLAW TOPPING LOLLIPOP CAKE. MARSHMALLOW DONUT SUGAR PLUM LOLLIPOP MARZIPAN. BEAR CLAW CANDY CANES CAKE GUMMI BEARS GUMMIES JELLY. ICING CAKE POWDER GUMMI BEARS CUPCAKE. CARROT CAKE ICE CREAM SOUFFLÉ JELLY BEANS. SUGAR PLUM BEAR CLAW PIE DANISH ICING CUPCAKE CHOCOLATE DESSERT TIRAMISU. HALVAH SWEET ROLL TIRAMISU SUGAR PLUM LOLLIPOP JUJUBES CUPCAKE OAT CAKE.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '5', 'article-title-5', '', '0', NULL, NULL, NULL),
	(6, '2020-01-15 14:13:28', 1, '2020-01-15 14:13:28', 1, 1, NULL, 'Y', '2020-01-15 14:12:46', '2020-02-15 14:12:00', 500, 'Article title 6', 11, 'Yeah well, you shouldn\'t drink...', 'text', 12, '<p>Yeah well, you shouldn\'t drink. Mayor Goldie Wilson, I like the sound of that. Oh hey, Biff, hey, guys, how are you doing? What do you mean you\'ve seen this, it\'s brand new. You\'re gonna be in the car with her.</p>\r\n                        <p>Shit. Hello, hello, anybody home? Think, McFly, think. I gotta have time to get them re-typed. Do you realize what would happen if I hand in my reports in your handwriting. I\'ll get fired. You wouldn\'t want that to happen would you? Would you? Doc, you gotta help- Oh, then I wanna give her a call, I don\'t want her to worry about you. I don\'t know, I can\'t keep up with all of your boyfriends.</p>\r\n                        <p>Excuse me. Whoa, they really cleaned this place up, looks brand new. But I can\'t go to the dance, I\'ll miss my favorite television program, Science Fiction Theater. Will you take care of that? Watch this. Not me, the car, the car. My calculations are correct, when this baby hits eighty-eight miles per hour, your gonna see some serious shit. Watch this, watch this. Ha, what did I tell you, eighty-eight miles per hour. The temporal displacement occurred at exactly 1:20 a.m. and zero seconds.</p>\r\n                        <p>Uh, well, actually, I figured since it wasn\'t due till Monday- I think it\'s terrible. Girls chasing boys. When I was your age I never chased a boy, or called a boy, or sat in a parked car with a boy. Look, I\'m just not ready to ask Lorraine out to the dance, and not you, nor anybody else on this planet is gonna make me change my mind. Wait a minute. Wait a minute, Doc. Are you telling me that it\'s 8:25? Good evening, I\'m Doctor Emmett Brown. I\'m standing on the parking lot of Twin Pines Mall. It\'s Saturday morning, October 26, 1985, 1:18 a.m. and this is temporal experiment number one. C\'mon, Einy, hey hey boy, get in there, that a boy, in you go, get down, that\'s it.</p>\r\n                        <p>That\'s a Florence Nightingale effect. It happens in hospitals when nurses fall in love with their patients. Go to it, kid. Whoa, they really cleaned this place up, looks brand new. No. Aw yeah, everything is great. Don\'t pay any attention to him, he\'s in one of his moods. Sam, quit fiddling with that thing, come in here to dinner. Now let\'s see, you already know Lorraine, this is Milton, this is Sally, that\'s Toby, and over there in the playpen is little baby Joey.</p>', 'html', 'ARTICLE TITLE 6\r\nYEAH WELL, YOU SHOULDN\'T DRINK...\r\nYEAH WELL, YOU SHOULDN\'T DRINK. MAYOR GOLDIE WILSON, I LIKE THE SOUND OF \r\nTHAT. OH HEY, BIFF, HEY, GUYS, HOW ARE YOU DOING? WHAT DO YOU MEAN YOU\'VE SEEN THIS, IT\'S BRAND NEW. YOU\'RE GONNA BE IN THE CAR WITH HER. \r\n\r\nSHIT. HELLO, HELLO, ANYBODY HOME? THINK, MCFLY, THINK. I GOTTA HAVE TIME \r\nTO GET THEM RE-TYPED. DO YOU REALIZE WHAT WOULD HAPPEN IF I HAND IN MY REPORTS IN YOUR HANDWRITING. I\'LL GET FIRED. YOU WOULDN\'T WANT THAT TO HAPPEN WOULD YOU? WOULD YOU? DOC, YOU GOTTA HELP- OH, THEN I WANNA GIVE HER A CALL, I DON\'T WANT HER TO WORRY ABOUT YOU. I DON\'T KNOW, I CAN\'T KEEP UP WITH ALL OF YOUR BOYFRIENDS. \r\n\r\nEXCUSE ME. WHOA, THEY REALLY CLEANED THIS PLACE UP, LOOKS BRAND NEW. BUT \r\nI CAN\'T GO TO THE DANCE, I\'LL MISS MY FAVORITE TELEVISION PROGRAM, SCIENCE FICTION THEATER. WILL YOU TAKE CARE OF THAT? WATCH THIS. NOT ME, THE CAR, THE CAR. MY CALCULATIONS ARE CORRECT, WHEN THIS BABY HITS EIGHTY-EIGHT MILES PER HOUR, YOUR GONNA SEE SOME SERIOUS SHIT. WATCH THIS, WATCH THIS. HA, WHAT DID I TELL YOU, EIGHTY-EIGHT MILES PER HOUR. THE TEMPORAL DISPLACEMENT OCCURRED AT EXACTLY 1:20 A.M. AND ZERO SECONDS. \r\n\r\nUH, WELL, ACTUALLY, I FIGURED SINCE IT WASN\'T DUE TILL MONDAY- I THINK \r\nIT\'S TERRIBLE. GIRLS CHASING BOYS. WHEN I WAS YOUR AGE I NEVER CHASED A BOY, OR CALLED A BOY, OR SAT IN A PARKED CAR WITH A BOY. LOOK, I\'M JUST NOT READY TO ASK LORRAINE OUT TO THE DANCE, AND NOT YOU, NOR ANYBODY ELSE ON THIS PLANET IS GONNA MAKE ME CHANGE MY MIND. WAIT A MINUTE. WAIT A MINUTE, DOC. ARE YOU TELLING ME THAT IT\'S 8:25? GOOD EVENING, I\'M DOCTOR EMMETT BROWN. I\'M STANDING ON THE PARKING LOT OF TWIN PINES MALL. IT\'S SATURDAY MORNING, OCTOBER 26, 1985, 1:18 A.M. AND THIS IS TEMPORAL EXPERIMENT NUMBER ONE. C\'MON, EINY, HEY HEY BOY, GET IN THERE, THAT A BOY, IN YOU GO, GET DOWN, THAT\'S IT. \r\n\r\nTHAT\'S A FLORENCE NIGHTINGALE EFFECT. IT HAPPENS IN HOSPITALS WHEN NURSES \r\nFALL IN LOVE WITH THEIR PATIENTS. GO TO IT, KID. WHOA, THEY REALLY CLEANED THIS PLACE UP, LOOKS BRAND NEW. NO. AW YEAH, EVERYTHING IS GREAT. DON\'T PAY ANY ATTENTION TO HIM, HE\'S IN ONE OF HIS MOODS. SAM, QUIT FIDDLING WITH THAT THING, COME IN HERE TO DINNER. NOW LET\'S SEE, YOU ALREADY KNOW LORRAINE, THIS IS MILTON, THIS IS SALLY, THAT\'S TOBY, AND OVER THERE IN THE PLAYPEN IS LITTLE BABY JOEY.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '6', 'article-title-6', '', '0', NULL, NULL, NULL),
	(7, '2020-01-15 14:14:04', 1, '2020-01-15 14:14:04', 1, 1, NULL, 'Y', '2020-01-15 14:13:28', '2020-02-15 14:13:00', 500, 'Article title 7', 13, 'Busey ipsum dolor sit amet...', 'text', 14, '<p>Busey ipsum dolor sit amet. Have you urinated? Have you drained your bladder? Are you free? Because if you haven\'t it will only come out later. I\'m giving you some information that your bodily fluids may penetrate your clothing fibre\'s without warning.You ever roasted doughnuts?</p>\r\n                        <p>You ever roasted doughnuts?The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.Sometimes horses cough and fart at the same time, so stay out of the range of its butt muscle because a horses butt muscle is thick.</p>\r\n                        <p>Go with the feeling of the nature. Take it easy. Know why you\'re here. And remember to balance your internal energy with the environment.The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.</p>\r\n                        <p>It\'s good to yell at people and tell people that you\'re from Tennesee, so that way you\'ll be safe.The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.</p>\r\n                        <p>Did you feel that? Look at me - I\'m not out of breath anymore!When you get lost in your imaginatory vagueness, your foresight will become a nimble vagrant.Go with the feeling of the nature. Take it easy. Know why you\'re here. And remember to balance your internal energy with the environment.</p>', 'html', 'ARTICLE TITLE 7\r\nBUSEY IPSUM DOLOR SIT AMET...\r\nBUSEY IPSUM DOLOR SIT AMET. HAVE YOU URINATED? HAVE YOU DRAINED YOUR BLADDER? \r\nARE YOU FREE? BECAUSE IF YOU HAVEN\'T IT WILL ONLY COME OUT LATER. I\'M GIVING YOU SOME INFORMATION THAT YOUR BODILY FLUIDS MAY PENETRATE YOUR CLOTHING FIBRE\'S WITHOUT WARNING.YOU EVER ROASTED DOUGHNUTS? \r\n\r\nYOU EVER ROASTED DOUGHNUTS?THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE \r\nCOMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING.SOMETIMES HORSES COUGH AND FART AT THE SAME TIME, SO STAY OUT OF THE RANGE OF ITS BUTT MUSCLE BECAUSE A HORSES BUTT MUSCLE IS THICK. \r\n\r\nGO WITH THE FEELING OF THE NATURE. TAKE IT EASY. KNOW WHY YOU\'RE HERE. \r\nAND REMEMBER TO BALANCE YOUR INTERNAL ENERGY WITH THE ENVIRONMENT.THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING. \r\n\r\nIT\'S GOOD TO YELL AT PEOPLE AND TELL PEOPLE THAT YOU\'RE FROM TENNESEE, \r\nSO THAT WAY YOU\'LL BE SAFE.THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING. \r\n\r\nDID YOU FEEL THAT? LOOK AT ME - I\'M NOT OUT OF BREATH ANYMORE!WHEN YOU \r\nGET LOST IN YOUR IMAGINATORY VAGUENESS, YOUR FORESIGHT WILL BECOME A NIMBLE VAGRANT.GO WITH THE FEELING OF THE NATURE. TAKE IT EASY. KNOW WHY YOU\'RE HERE. AND REMEMBER TO BALANCE YOUR INTERNAL ENERGY WITH THE ENVIRONMENT.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '7', 'article-title-7', '', '0', NULL, NULL, NULL),
	(8, '2020-01-15 14:14:38', 1, '2020-01-15 14:14:38', 1, 1, NULL, 'Y', '2020-01-15 14:14:04', '2020-02-15 14:14:00', 500, 'Article title 8', 15, 'Listen to the silence...', 'text', 16, '<p>Busey ipsum dolor sit amet. Listen to the silence. And when the silence is deafening, you\'re in the center of your own universe.I wrestled a bear once. A 750lbs black bear.The magic Indian is a mysterious spiritual force, and we\'re going to Cathedral Rock, and that\'s the vortex of the heart.</p>\r\n                        <p>Have you urinated? Have you drained your bladder? Are you free? Because if you haven\'t it will only come out later. I\'m giving you some information that your bodily fluids may penetrate your clothing fibre\'s without warning.It\'s OK to get Rib-grease on your face, because you\'re allowing people to see that you\'re proud of these ribs.</p>\r\n                        <p>I would like to give you a backstage pass to my imagination.Listen to the silence. And when the silence is deafening, you\'re in the center of your own universe.Have you urinated? Have you drained your bladder? Are you free? Because if you haven\'t it will only come out later. I\'m giving you some information that your bodily fluids may penetrate your clothing fibre\'s without warning.</p>\r\n                        <p>The magic Indian is a mysterious spiritual force, and we\'re going to Cathedral Rock, and that\'s the vortex of the heart.I wrestled a bear once. A 750lbs black bear.Listen to the silence. And when the silence is deafening, you\'re in the center of your own universe.</p>\r\n                        <p>You gotta go through it to see there ain\'t nothing to it.It\'s good to yell at people and tell people that you\'re from Tennesee, so that way you\'ll be safe.The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.</p>', 'html', 'ARTICLE TITLE 8\r\nLISTEN TO THE SILENCE...\r\nBUSEY IPSUM DOLOR SIT AMET. LISTEN TO THE SILENCE. AND WHEN THE SILENCE \r\nIS DEAFENING, YOU\'RE IN THE CENTER OF YOUR OWN UNIVERSE.I WRESTLED A BEAR ONCE. A 750LBS BLACK BEAR.THE MAGIC INDIAN IS A MYSTERIOUS SPIRITUAL FORCE, AND WE\'RE GOING TO CATHEDRAL ROCK, AND THAT\'S THE VORTEX OF THE HEART. \r\n\r\nHAVE YOU URINATED? HAVE YOU DRAINED YOUR BLADDER? ARE YOU FREE? BECAUSE \r\nIF YOU HAVEN\'T IT WILL ONLY COME OUT LATER. I\'M GIVING YOU SOME INFORMATION THAT YOUR BODILY FLUIDS MAY PENETRATE YOUR CLOTHING FIBRE\'S WITHOUT WARNING.IT\'S OK TO GET RIB-GREASE ON YOUR FACE, BECAUSE YOU\'RE ALLOWING PEOPLE TO SEE THAT YOU\'RE PROUD OF THESE RIBS. \r\n\r\nI WOULD LIKE TO GIVE YOU A BACKSTAGE PASS TO MY IMAGINATION.LISTEN TO THE \r\nSILENCE. AND WHEN THE SILENCE IS DEAFENING, YOU\'RE IN THE CENTER OF YOUR OWN UNIVERSE.HAVE YOU URINATED? HAVE YOU DRAINED YOUR BLADDER? ARE YOU FREE? BECAUSE IF YOU HAVEN\'T IT WILL ONLY COME OUT LATER. I\'M GIVING YOU SOME INFORMATION THAT YOUR BODILY FLUIDS MAY PENETRATE YOUR CLOTHING FIBRE\'S WITHOUT WARNING. \r\n\r\nTHE MAGIC INDIAN IS A MYSTERIOUS SPIRITUAL FORCE, AND WE\'RE GOING TO CATHEDRAL \r\nROCK, AND THAT\'S THE VORTEX OF THE HEART.I WRESTLED A BEAR ONCE. A 750LBS BLACK BEAR.LISTEN TO THE SILENCE. AND WHEN THE SILENCE IS DEAFENING, YOU\'RE IN THE CENTER OF YOUR OWN UNIVERSE. \r\n\r\nYOU GOTTA GO THROUGH IT TO SEE THERE AIN\'T NOTHING TO IT.IT\'S GOOD TO YELL \r\nAT PEOPLE AND TELL PEOPLE THAT YOU\'RE FROM TENNESEE, SO THAT WAY YOU\'LL BE SAFE.THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', 'article-title-8', '', '0', NULL, 3, '2020-01-15 14:36:12'),
	(9, '2020-01-15 14:15:14', 1, '2020-01-15 14:15:14', 1, 1, NULL, 'Y', '2020-01-15 14:14:38', '2020-02-15 14:14:00', 500, 'Article title 9', 17, 'Veggies es bonus vobis, proinde vos postulo...', 'text', 18, '<p>Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.</p>\r\n                        <p>Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.</p>\r\n                        <p>Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. Celery potato scallion desert raisin horseradish spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea. Brussels sprout coriander water chestnut gourd swiss chard wakame kohlrabi beetroot carrot watercress. Corn amaranth salsify bunya nuts nori azuki bean chickweed potato bell pepper artichoke.</p>\r\n                        <p>Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley jícama salsify.</p>\r\n                        <p>Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard.</p>\r\n                        <p>Pea horseradish azuki bean lettuce avocado asparagus okra. Kohlrabi radish okra azuki bean corn fava bean mustard tigernut jícama green bean celtuce collard greens avocado quandong fennel gumbo black-eyed pea. Grape silver beet watercress potato tigernut corn groundnut. Chickweed okra pea winter purslane coriander yarrow sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut pea tomato spring onion azuki bean gourd. Gumbo kakadu plum komatsuna black-eyed pea green bean zucchini gourd winter purslane silver beet rock melon radish asparagus spinach.</p>\r\n                        <p>Beetroot water spinach okra water chestnut ricebean pea catsear courgette summer purslane. Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. Dandelion zucchini burdock yarrow chickpea dandelion sorrel courgette turnip greens tigernut soybean radish artichoke wattle seed endive groundnut broccoli arugula.</p>\r\n                        <p>Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut. Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra sea lettuce broccoli celery lotus root carrot winter purslane turnip greens garlic. Jícama garlic courgette coriander radicchio plantain scallion cauliflower fava bean desert raisin spring onion chicory bunya nuts. Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.</p>', 'html', 'ARTICLE TITLE 9\r\nVEGGIES ES BONUS VOBIS, PROINDE VOS POSTULO...\r\nVEGGIES ES BONUS VOBIS, PROINDE VOS POSTULO ESSUM MAGIS KOHLRABI WELSH \r\nONION DAIKON AMARANTH TATSOI TOMATILLO MELON AZUKI BEAN GARLIC. \r\n\r\nGUMBO BEET GREENS CORN SOKO ENDIVE GUMBO GOURD. PARSLEY SHALLOT COURGETTE \r\nTATSOI PEA SPROUTS FAVA BEAN COLLARD GREENS DANDELION OKRA WAKAME TOMATO. DANDELION CUCUMBER EARTHNUT PEA PEANUT SOKO ZUCCHINI. \r\n\r\nTURNIP GREENS YARROW RICEBEAN RUTABAGA ENDIVE CAULIFLOWER SEA LETTUCE KOHLRABI \r\nAMARANTH WATER SPINACH AVOCADO DAIKON NAPA CABBAGE ASPARAGUS WINTER PURSLANE KALE. CELERY POTATO SCALLION DESERT RAISIN HORSERADISH SPINACH CARROT SOKO. LOTUS ROOT WATER SPINACH FENNEL KOMBU MAIZE BAMBOO SHOOT GREEN BEAN SWISS CHARD SEAKALE PUMPKIN ONION CHICKPEA GRAM CORN PEA. BRUSSELS SPROUT CORIANDER WATER CHESTNUT GOURD SWISS CHARD WAKAME KOHLRABI BEETROOT CARROT WATERCRESS. CORN AMARANTH SALSIFY BUNYA NUTS NORI AZUKI BEAN CHICKWEED POTATO BELL PEPPER ARTICHOKE. \r\n\r\nNORI GRAPE SILVER BEET BROCCOLI KOMBU BEET GREENS FAVA BEAN POTATO QUANDONG \r\nCELERY. BUNYA NUTS BLACK-EYED PEA PRAIRIE TURNIP LEEK LENTIL TURNIP GREENS PARSNIP. SEA LETTUCE LETTUCE WATER CHESTNUT EGGPLANT WINTER PURSLANE FENNEL AZUKI BEAN EARTHNUT PEA SIERRA LEONE BOLOGI LEEK SOKO CHICORY CELTUCE PARSLEY JÍCAMA SALSIFY. \r\n\r\nCELERY QUANDONG SWISS CHARD CHICORY EARTHNUT PEA POTATO. SALSIFY TARO CATSEAR \r\nGARLIC GRAM CELERY BITTERLEAF WATTLE SEED COLLARD GREENS NORI. GRAPE WATTLE SEED KOMBU BEETROOT HORSERADISH CARROT SQUASH BRUSSELS SPROUT CHARD. \r\n\r\nPEA HORSERADISH AZUKI BEAN LETTUCE AVOCADO ASPARAGUS OKRA. KOHLRABI RADISH \r\nOKRA AZUKI BEAN CORN FAVA BEAN MUSTARD TIGERNUT JÍCAMA GREEN BEAN CELTUCE COLLARD GREENS AVOCADO QUANDONG FENNEL GUMBO BLACK-EYED PEA. GRAPE SILVER BEET WATERCRESS POTATO TIGERNUT CORN GROUNDNUT. CHICKWEED OKRA PEA WINTER PURSLANE CORIANDER YARROW SWEET PEPPER RADISH GARLIC BRUSSELS SPROUT GROUNDNUT SUMMER PURSLANE EARTHNUT PEA TOMATO SPRING ONION AZUKI BEAN GOURD. GUMBO KAKADU PLUM KOMATSUNA BLACK-EYED PEA GREEN BEAN ZUCCHINI GOURD WINTER PURSLANE SILVER BEET ROCK MELON RADISH ASPARAGUS SPINACH. \r\n\r\nBEETROOT WATER SPINACH OKRA WATER CHESTNUT RICEBEAN PEA CATSEAR COURGETTE \r\nSUMMER PURSLANE. WATER SPINACH ARUGULA PEA TATSOI AUBERGINE SPRING ONION BUSH TOMATO KALE RADICCHIO TURNIP CHICORY SALSIFY PEA SPROUTS FAVA BEAN. DANDELION ZUCCHINI BURDOCK YARROW CHICKPEA DANDELION SORREL COURGETTE TURNIP GREENS TIGERNUT SOYBEAN RADISH ARTICHOKE WATTLE SEED ENDIVE GROUNDNUT BROCCOLI ARUGULA. \r\n\r\nSOKO RADICCHIO BUNYA NUTS GRAM DULSE SILVER BEET PARSNIP NAPA CABBAGE LOTUS \r\nROOT SEA LETTUCE BRUSSELS SPROUT CABBAGE. CATSEAR CAULIFLOWER GARBANZO YARROW SALSIFY CHICORY GARLIC BELL PEPPER NAPA CABBAGE LETTUCE TOMATO KALE ARUGULA MELON SIERRA LEONE BOLOGI RUTABAGA TIGERNUT. SEA LETTUCE GUMBO GRAPE KALE KOMBU CAULIFLOWER SALSIFY KOHLRABI OKRA SEA LETTUCE BROCCOLI CELERY LOTUS ROOT CARROT WINTER PURSLANE TURNIP GREENS GARLIC. JÍCAMA GARLIC COURGETTE CORIANDER RADICCHIO PLANTAIN SCALLION CAULIFLOWER FAVA BEAN DESERT RAISIN SPRING ONION CHICORY BUNYA NUTS. SEA LETTUCE WATER SPINACH GRAM FAVA BEAN LEEK DANDELION SILVER BEET EGGPLANT BUSH TOMATO.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', 'article-title-9', '', '0', NULL, 3, '2020-01-15 14:26:59'),
	(10, '2020-01-15 14:15:54', 1, '2020-01-15 14:15:54', 1, 1, NULL, 'Y', '2020-01-15 14:15:15', '2020-02-15 14:15:00', 500, 'Article title 10', 19, 'Pommy ipsum Elementary my dear Watson...', 'text', 20, '<p>Pommy ipsum Elementary my dear Watson ask your mother if down the village green a total jessie it\'s me peepers, smeg 10 pence mix naff off shepherd\'s pie. Got his end away throw a paddy conked him one on the nose a reet bobbydazzler, 10 pence mix half-inch it Union Jack, wind up challenge you to a duel. Middle class cobbles working class corgi ey up chuck on his tod, pants doing my head in upper class on the pull sling one\'s hook, terribly scones barmy nose rag. Half-inch it pennyboy Bad Wolf in the jacksy flabbergasted golly gosh bloke I could reet fancy a, pork dripping hedgehog because there was nothing on the gogglebox tally-ho the black death alright duck, corgi down the local football whizz mush a bottle of plonk.</p>\r\n                        <p>Fancied a flutter apple and pears conkers rather scatterbrained challenge you to a duel it\'s nicked football ridiculous, fried toast scatterbrained Doctor Who bossy britches pants ey up duck. Have a gander rivetting stuff it\'s the bees knees utter shambles Amelia Pond flog a dead horse porky-pies spiffing chav, gutted willy that\'s ace morris dancers scally meat and two veg. Sling one\'s hook damn have a butcher\'s at this bent as a nine bob note big light Kate and Will superb, give you a bell you \'avin a laugh fish and chips sod\'s law the fuzz god save the queen darling, pulled a right corker doing my head in at the boozer is she \'avin a laugh absolute twoddle.</p>\r\n                        <p>Down the village green Moriarty jolly bowler hat bargain Betty, Essex girls scrote beefeater. Darling terribly lug hole sweet fanny adams and thus Kate and Will, daft cow sorted it cup of tea it\'s nicked. Victoria sponge cake 221B Baker Street bag egg\'s old boy had a barney with the inlaws picalilly a bottle of plonk cotton on, narky ey up chuck rambunctious bobby gravy cheese and chips down the local, Victoria sponge cake cockney ridicule I\'m off to Bedfordshire bovver boots. Essex girls the lakes brilliant bog roll football scones biscuits, wibbly-wobbly timey-wimey stuff round our gaff the chippy pillock scones a right toff fish and chips, skive real ale doofer off with her head scones.</p>\r\n                        <p>Old girl a reet bobbydazzler collywobbles scones loo one feels that, pot noodle up North knackered apple and pears. Superb nonsense driving a mini lost her marbles numpty ee bah gum baffled have a kip, throw a spanner in the works could murder a pint doolally bossy britches chav indeed. Chuffed cor blimey\' clock round the earhole black pudding gobsmacked it\'s cracking flags sling one\'s hook, a right royal knees up chaps Weeping Angels twiglets Amelia Pond guinness, ever so lovely bottled it devonshire cream tea blummin\' Essex girls. Completely crackers quid wellies a week on Sunday gosh golly well fit, what a doddle jolly good pie-eyed copper accordingly easy peasy, Prince Charles absolute on his tod off with her head cornish pasty.</p>\r\n                        <p>The Hounds of Baskerville nosh taking the mick off t\'shop see a man about a dog, brown sauce argy-bargy clock round the earhole Southeners pulled a right corker, what a mug off with her head conkers. Dr. Watson pie-eyed flabbergasted what a load of cobblers have a gander guinness oopsy-daisies, bovver boots off the hook a right corker it\'s me peepers. A week on Sunday chap absolute nose rag flog, narky alright geezer.</p>', 'html', 'ARTICLE TITLE 10\r\nPOMMY IPSUM ELEMENTARY MY DEAR WATSON...\r\nPOMMY IPSUM ELEMENTARY MY DEAR WATSON ASK YOUR MOTHER IF DOWN THE VILLAGE \r\nGREEN A TOTAL JESSIE IT\'S ME PEEPERS, SMEG 10 PENCE MIX NAFF OFF SHEPHERD\'S PIE. GOT HIS END AWAY THROW A PADDY CONKED HIM ONE ON THE NOSE A REET BOBBYDAZZLER, 10 PENCE MIX HALF-INCH IT UNION JACK, WIND UP CHALLENGE YOU TO A DUEL. MIDDLE CLASS COBBLES WORKING CLASS CORGI EY UP CHUCK ON HIS TOD, PANTS DOING MY HEAD IN UPPER CLASS ON THE PULL SLING ONE\'S HOOK, TERRIBLY SCONES BARMY NOSE RAG. HALF-INCH IT PENNYBOY BAD WOLF IN THE JACKSY FLABBERGASTED GOLLY GOSH BLOKE I COULD REET FANCY A, PORK DRIPPING HEDGEHOG BECAUSE THERE WAS NOTHING ON THE GOGGLEBOX TALLY-HO THE BLACK DEATH ALRIGHT DUCK, CORGI DOWN THE LOCAL FOOTBALL WHIZZ MUSH A BOTTLE OF PLONK. \r\n\r\nFANCIED A FLUTTER APPLE AND PEARS CONKERS RATHER SCATTERBRAINED CHALLENGE \r\nYOU TO A DUEL IT\'S NICKED FOOTBALL RIDICULOUS, FRIED TOAST SCATTERBRAINED DOCTOR WHO BOSSY BRITCHES PANTS EY UP DUCK. HAVE A GANDER RIVETTING STUFF IT\'S THE BEES KNEES UTTER SHAMBLES AMELIA POND FLOG A DEAD HORSE PORKY-PIES SPIFFING CHAV, GUTTED WILLY THAT\'S ACE MORRIS DANCERS SCALLY MEAT AND TWO VEG. SLING ONE\'S HOOK DAMN HAVE A BUTCHER\'S AT THIS BENT AS A NINE BOB NOTE BIG LIGHT KATE AND WILL SUPERB, GIVE YOU A BELL YOU \'AVIN A LAUGH FISH AND CHIPS SOD\'S LAW THE FUZZ GOD SAVE THE QUEEN DARLING, PULLED A RIGHT CORKER DOING MY HEAD IN AT THE BOOZER IS SHE \'AVIN A LAUGH ABSOLUTE TWODDLE. \r\n\r\nDOWN THE VILLAGE GREEN MORIARTY JOLLY BOWLER HAT BARGAIN BETTY, ESSEX GIRLS \r\nSCROTE BEEFEATER. DARLING TERRIBLY LUG HOLE SWEET FANNY ADAMS AND THUS KATE AND WILL, DAFT COW SORTED IT CUP OF TEA IT\'S NICKED. VICTORIA SPONGE CAKE 221B BAKER STREET BAG EGG\'S OLD BOY HAD A BARNEY WITH THE INLAWS PICALILLY A BOTTLE OF PLONK COTTON ON, NARKY EY UP CHUCK RAMBUNCTIOUS BOBBY GRAVY CHEESE AND CHIPS DOWN THE LOCAL, VICTORIA SPONGE CAKE COCKNEY RIDICULE I\'M OFF TO BEDFORDSHIRE BOVVER BOOTS. ESSEX GIRLS THE LAKES BRILLIANT BOG ROLL FOOTBALL SCONES BISCUITS, WIBBLY-WOBBLY TIMEY-WIMEY STUFF ROUND OUR GAFF THE CHIPPY PILLOCK SCONES A RIGHT TOFF FISH AND CHIPS, SKIVE REAL ALE DOOFER OFF WITH HER HEAD SCONES. \r\n\r\nOLD GIRL A REET BOBBYDAZZLER COLLYWOBBLES SCONES LOO ONE FEELS THAT, POT \r\nNOODLE UP NORTH KNACKERED APPLE AND PEARS. SUPERB NONSENSE DRIVING A MINI LOST HER MARBLES NUMPTY EE BAH GUM BAFFLED HAVE A KIP, THROW A SPANNER IN THE WORKS COULD MURDER A PINT DOOLALLY BOSSY BRITCHES CHAV INDEED. CHUFFED COR BLIMEY\' CLOCK ROUND THE EARHOLE BLACK PUDDING GOBSMACKED IT\'S CRACKING FLAGS SLING ONE\'S HOOK, A RIGHT ROYAL KNEES UP CHAPS WEEPING ANGELS TWIGLETS AMELIA POND GUINNESS, EVER SO LOVELY BOTTLED IT DEVONSHIRE CREAM TEA BLUMMIN\' ESSEX GIRLS. COMPLETELY CRACKERS QUID WELLIES A WEEK ON SUNDAY GOSH GOLLY WELL FIT, WHAT A DODDLE JOLLY GOOD PIE-EYED COPPER ACCORDINGLY EASY PEASY, PRINCE CHARLES ABSOLUTE ON HIS TOD OFF WITH HER HEAD CORNISH PASTY. \r\n\r\nTHE HOUNDS OF BASKERVILLE NOSH TAKING THE MICK OFF T\'SHOP SEE A MAN ABOUT \r\nA DOG, BROWN SAUCE ARGY-BARGY CLOCK ROUND THE EARHOLE SOUTHENERS PULLED A RIGHT CORKER, WHAT A MUG OFF WITH HER HEAD CONKERS. DR. WATSON PIE-EYED FLABBERGASTED WHAT A LOAD OF COBBLERS HAVE A GANDER GUINNESS OOPSY-DAISIES, BOVVER BOOTS OFF THE HOOK A RIGHT CORKER IT\'S ME PEEPERS. A WEEK ON SUNDAY CHAP ABSOLUTE NOSE RAG FLOG, NARKY ALRIGHT GEEZER.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '10', 'article-title-10', '', '0', NULL, 2, '2020-01-15 14:28:31');
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_element_iprop
CREATE TABLE IF NOT EXISTS `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_element_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_iprop`;
/*!40000 ALTER TABLE `b_iblock_element_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_element_lock
CREATE TABLE IF NOT EXISTS `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_element_lock: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_lock`;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_element_property
CREATE TABLE IF NOT EXISTS `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_element_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_property`;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_element_right
CREATE TABLE IF NOT EXISTS `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_element_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_right`;
/*!40000 ALTER TABLE `b_iblock_element_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_right` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_fields
CREATE TABLE IF NOT EXISTS `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_fields: ~32 rows (приблизительно)
DELETE FROM `b_iblock_fields`;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
	(1, 'ACTIVE', 'Y', 'Y'),
	(1, 'ACTIVE_FROM', 'N', '=now'),
	(1, 'ACTIVE_TO', 'N', ''),
	(1, 'CODE', 'Y', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(1, 'DETAIL_PICTURE', 'Y', 'a:17:{s:5:"SCALE";s:1:"Y";s:5:"WIDTH";i:300;s:6:"HEIGHT";i:200;s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'DETAIL_TEXT', 'Y', ''),
	(1, 'DETAIL_TEXT_TYPE', 'Y', 'html'),
	(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(1, 'LOG_ELEMENT_ADD', 'N', NULL),
	(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(1, 'LOG_SECTION_ADD', 'N', NULL),
	(1, 'LOG_SECTION_DELETE', 'N', NULL),
	(1, 'LOG_SECTION_EDIT', 'N', NULL),
	(1, 'NAME', 'Y', ''),
	(1, 'PREVIEW_PICTURE', 'Y', 'a:20:{s:11:"FROM_DETAIL";s:1:"Y";s:5:"SCALE";s:1:"Y";s:5:"WIDTH";i:288;s:6:"HEIGHT";i:192;s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"Y";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'PREVIEW_TEXT', 'Y', ''),
	(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(1, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(1, 'SECTION_DESCRIPTION', 'N', ''),
	(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'SECTION_NAME', 'Y', ''),
	(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'SECTION_XML_ID', 'N', ''),
	(1, 'SORT', 'N', '0'),
	(1, 'TAGS', 'N', ''),
	(1, 'XML_ID', 'Y', ''),
	(1, 'XML_IMPORT_START_TIME', 'N', NULL);
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_group
CREATE TABLE IF NOT EXISTS `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_group: ~2 rows (приблизительно)
DELETE FROM `b_iblock_group`;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
	(1, 1, 'X'),
	(1, 2, 'R');
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_iblock_iprop
CREATE TABLE IF NOT EXISTS `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_iblock_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iblock_iprop`;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_iproperty
CREATE TABLE IF NOT EXISTS `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_iproperty: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iproperty`;
/*!40000 ALTER TABLE `b_iblock_iproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iproperty` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_messages
CREATE TABLE IF NOT EXISTS `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_messages: ~10 rows (приблизительно)
DELETE FROM `b_iblock_messages`;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
	(1, 'ELEMENT_ADD', 'Добавить элемент'),
	(1, 'ELEMENT_DELETE', 'Удалить элемент'),
	(1, 'ELEMENT_EDIT', 'Изменить элемент'),
	(1, 'ELEMENT_NAME', 'Элемент'),
	(1, 'ELEMENTS_NAME', 'Элементы'),
	(1, 'SECTION_ADD', 'Добавить раздел'),
	(1, 'SECTION_DELETE', 'Удалить раздел'),
	(1, 'SECTION_EDIT', 'Изменить раздел'),
	(1, 'SECTION_NAME', 'Раздел'),
	(1, 'SECTIONS_NAME', 'Разделы');
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_offers_tmp
CREATE TABLE IF NOT EXISTS `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_offers_tmp: ~0 rows (приблизительно)
DELETE FROM `b_iblock_offers_tmp`;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_property
CREATE TABLE IF NOT EXISTS `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property`;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_property_enum
CREATE TABLE IF NOT EXISTS `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_property_enum: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_enum`;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_property_feature
CREATE TABLE IF NOT EXISTS `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_property_feature: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_feature`;
/*!40000 ALTER TABLE `b_iblock_property_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property_feature` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_right
CREATE TABLE IF NOT EXISTS `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_right`;
/*!40000 ALTER TABLE `b_iblock_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_right` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_rss
CREATE TABLE IF NOT EXISTS `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_rss: ~0 rows (приблизительно)
DELETE FROM `b_iblock_rss`;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_section
CREATE TABLE IF NOT EXISTS `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_section: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section`;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_section_element
CREATE TABLE IF NOT EXISTS `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_section_element: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_element`;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_section_iprop
CREATE TABLE IF NOT EXISTS `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_section_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_iprop`;
/*!40000 ALTER TABLE `b_iblock_section_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_section_property
CREATE TABLE IF NOT EXISTS `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_section_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_property`;
/*!40000 ALTER TABLE `b_iblock_section_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_property` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_section_right
CREATE TABLE IF NOT EXISTS `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_section_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_right`;
/*!40000 ALTER TABLE `b_iblock_section_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_right` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_sequence
CREATE TABLE IF NOT EXISTS `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_sequence: ~0 rows (приблизительно)
DELETE FROM `b_iblock_sequence`;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_site
CREATE TABLE IF NOT EXISTS `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_site: ~1 rows (приблизительно)
DELETE FROM `b_iblock_site`;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
	(1, 's1');
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_type
CREATE TABLE IF NOT EXISTS `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_type: ~0 rows (приблизительно)
DELETE FROM `b_iblock_type`;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
	('articles', 'Y', '', '', 'N', 500),
	('rest_entity', 'Y', NULL, NULL, 'N', 1000);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_iblock_type_lang
CREATE TABLE IF NOT EXISTS `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_iblock_type_lang: ~3 rows (приблизительно)
DELETE FROM `b_iblock_type_lang`;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
	('rest_entity', 'ru', 'Хранилище данных для приложений Маркетплейс24', 'Разделы', 'Элементы'),
	('articles', 'ru', 'Статьи', '', ''),
	('articles', 'en', 'Articles', '', '');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing
CREATE TABLE IF NOT EXISTS `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing: ~0 rows (приблизительно)
DELETE FROM `b_landing`;
/*!40000 ALTER TABLE `b_landing` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_block
CREATE TABLE IF NOT EXISTS `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT '500',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_block`;
/*!40000 ALTER TABLE `b_landing_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_block` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_demo
CREATE TABLE IF NOT EXISTS `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci,
  `LANG` text COLLATE utf8_unicode_ci,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_demo: ~0 rows (приблизительно)
DELETE FROM `b_landing_demo`;
/*!40000 ALTER TABLE `b_landing_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_demo` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_domain
CREATE TABLE IF NOT EXISTS `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_domain: ~0 rows (приблизительно)
DELETE FROM `b_landing_domain`;
/*!40000 ALTER TABLE `b_landing_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_domain` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_entity_rights
CREATE TABLE IF NOT EXISTS `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_landing_entity_rights`;
/*!40000 ALTER TABLE `b_landing_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_entity_rights` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_file
CREATE TABLE IF NOT EXISTS `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_file: ~0 rows (приблизительно)
DELETE FROM `b_landing_file`;
/*!40000 ALTER TABLE `b_landing_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_file` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_filter_block
CREATE TABLE IF NOT EXISTS `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`),
  KEY `IX_B_FILTER_ID` (`FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_filter_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_filter_block`;
/*!40000 ALTER TABLE `b_landing_filter_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_filter_block` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_filter_entity
CREATE TABLE IF NOT EXISTS `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_filter_entity: ~0 rows (приблизительно)
DELETE FROM `b_landing_filter_entity`;
/*!40000 ALTER TABLE `b_landing_filter_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_filter_entity` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_hook_data
CREATE TABLE IF NOT EXISTS `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_hook_data: ~0 rows (приблизительно)
DELETE FROM `b_landing_hook_data`;
/*!40000 ALTER TABLE `b_landing_hook_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_hook_data` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_manifest
CREATE TABLE IF NOT EXISTS `b_landing_manifest` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_MANIFEST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_manifest: ~0 rows (приблизительно)
DELETE FROM `b_landing_manifest`;
/*!40000 ALTER TABLE `b_landing_manifest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_manifest` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_placement
CREATE TABLE IF NOT EXISTS `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_placement: ~0 rows (приблизительно)
DELETE FROM `b_landing_placement`;
/*!40000 ALTER TABLE `b_landing_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_placement` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_repo
CREATE TABLE IF NOT EXISTS `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_repo: ~0 rows (приблизительно)
DELETE FROM `b_landing_repo`;
/*!40000 ALTER TABLE `b_landing_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_repo` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_role
CREATE TABLE IF NOT EXISTS `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_role: ~0 rows (приблизительно)
DELETE FROM `b_landing_role`;
/*!40000 ALTER TABLE `b_landing_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_role` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_site
CREATE TABLE IF NOT EXISTS `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_site: ~0 rows (приблизительно)
DELETE FROM `b_landing_site`;
/*!40000 ALTER TABLE `b_landing_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_syspage
CREATE TABLE IF NOT EXISTS `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_syspage: ~0 rows (приблизительно)
DELETE FROM `b_landing_syspage`;
/*!40000 ALTER TABLE `b_landing_syspage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_syspage` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_template
CREATE TABLE IF NOT EXISTS `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT '100',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_template: ~6 rows (приблизительно)
DELETE FROM `b_landing_template`;
/*!40000 ALTER TABLE `b_landing_template` DISABLE KEYS */;
INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
	(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2020-01-14 14:55:19', '2020-01-14 14:55:19'),
	(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class="landing-layout-flex">\n								<div class="g-width-25x--lg g-max-width-100x g-overflow-hidden landing-sidebar">#AREA_1#</div> \n								<div class="g-width-75x--lg g-max-width-100x landing-main">#CONTENT#</div> \n							</div>', 1, 1, 1, '2020-01-14 14:55:19', '2020-01-14 14:55:19'),
	(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class="landing-layout-flex sidebar-right">\n								<div class="g-width-25x--lg g-max-width-100x landing-sidebar">#AREA_1#</div> \n								<div class="g-width-75x--lg  g-max-width-100x landing-main">#CONTENT#</div> \n							</div>', 1, 1, 1, '2020-01-14 14:55:19', '2020-01-14 14:55:19'),
	(4, 'Y', '#HEADER_FOOTER#', 400, 'header_footer', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-main">#CONTENT#</div> \n							<div class="landing-footer">#AREA_2#</div>', 2, 1, 1, '2020-01-14 14:55:19', '2020-01-14 14:55:19'),
	(5, 'Y', '#WITHOUT_LEFT#', 500, 'without_left', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-layout-flex without-left">\n									<div class="g-width-25x--lg g-max-width-100x landing-sidebar">#AREA_2#</div>\n									<div class="g-width-75x--lg g-max-width-100x landing-main">#CONTENT#</div> \n								</div> \n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2020-01-14 14:55:19', '2020-01-14 14:55:19'),
	(6, 'Y', '#WITHOUT_RIGHT#', 600, 'without_right', '<div class="landing-header">#AREA_1#</div>\n								<div class="landing-layout-flex">\n									<div class="g-width-25x--lg g-max-width-100x landing-sidebar">#AREA_2#</div>\n									<div class="g-width-75x--lg g-max-width-100x landing-main">#CONTENT#</div>\n								</div>\n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2020-01-14 14:55:19', '2020-01-14 14:55:19');
/*!40000 ALTER TABLE `b_landing_template` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_template_ref
CREATE TABLE IF NOT EXISTS `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_template_ref: ~0 rows (приблизительно)
DELETE FROM `b_landing_template_ref`;
/*!40000 ALTER TABLE `b_landing_template_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_template_ref` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_update_block
CREATE TABLE IF NOT EXISTS `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT '0',
  `PARAMS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_update_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_update_block`;
/*!40000 ALTER TABLE `b_landing_update_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_update_block` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_landing_urlrewrite
CREATE TABLE IF NOT EXISTS `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_landing_urlrewrite: ~0 rows (приблизительно)
DELETE FROM `b_landing_urlrewrite`;
/*!40000 ALTER TABLE `b_landing_urlrewrite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_urlrewrite` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_lang
CREATE TABLE IF NOT EXISTS `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_lang: ~0 rows (приблизительно)
DELETE FROM `b_lang`;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
	('s1', 1, 'Y', 'Y', 'Сайт по умолчанию', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', '', '', 1);
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_language
CREATE TABLE IF NOT EXISTS `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_language: ~2 rows (приблизительно)
DELETE FROM `b_language`;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
	('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
	('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_lang_domain
CREATE TABLE IF NOT EXISTS `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_lang_domain: ~0 rows (приблизительно)
DELETE FROM `b_lang_domain`;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_list_rubric
CREATE TABLE IF NOT EXISTS `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_list_rubric: ~0 rows (приблизительно)
DELETE FROM `b_list_rubric`;
/*!40000 ALTER TABLE `b_list_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_list_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_log_notification
CREATE TABLE IF NOT EXISTS `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_log_notification: ~0 rows (приблизительно)
DELETE FROM `b_log_notification`;
/*!40000 ALTER TABLE `b_log_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_log_notification` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_log_notification_action
CREATE TABLE IF NOT EXISTS `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_log_notification_action: ~0 rows (приблизительно)
DELETE FROM `b_log_notification_action`;
/*!40000 ALTER TABLE `b_log_notification_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_log_notification_action` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_main_mail_blacklist
CREATE TABLE IF NOT EXISTS `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_main_mail_blacklist: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_blacklist`;
/*!40000 ALTER TABLE `b_main_mail_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_blacklist` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_main_mail_sender
CREATE TABLE IF NOT EXISTS `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT '0',
  `OPTIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_main_mail_sender: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_sender`;
/*!40000 ALTER TABLE `b_main_mail_sender` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_sender` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_medialib_collection
CREATE TABLE IF NOT EXISTS `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_medialib_collection: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection`;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_medialib_collection_item
CREATE TABLE IF NOT EXISTS `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_medialib_collection_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection_item`;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_medialib_item
CREATE TABLE IF NOT EXISTS `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_medialib_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_item`;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_medialib_type
CREATE TABLE IF NOT EXISTS `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_medialib_type: ~3 rows (приблизительно)
DELETE FROM `b_medialib_type`;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
	(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
	(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
	(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_messageservice_message
CREATE TABLE IF NOT EXISTS `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_messageservice_message: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_message`;
/*!40000 ALTER TABLE `b_messageservice_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_messageservice_rest_app
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_messageservice_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app`;
/*!40000 ALTER TABLE `b_messageservice_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_messageservice_rest_app_lang
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_messageservice_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app_lang`;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_mobileapp_app
CREATE TABLE IF NOT EXISTS `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_mobileapp_app: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_app`;
/*!40000 ALTER TABLE `b_mobileapp_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_app` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_mobileapp_config
CREATE TABLE IF NOT EXISTS `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_mobileapp_config: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_config`;
/*!40000 ALTER TABLE `b_mobileapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_config` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_module
CREATE TABLE IF NOT EXISTS `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_module: ~29 rows (приблизительно)
DELETE FROM `b_module`;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
	('b24connector', NULL),
	('bitrix.sitecorporate', NULL),
	('bitrix.siteinfoportal', NULL),
	('bitrix.sitepersonal', NULL),
	('bitrixcloud', NULL),
	('blog', NULL),
	('clouds', NULL),
	('compression', NULL),
	('fileman', NULL),
	('form', NULL),
	('forum', NULL),
	('highloadblock', NULL),
	('iblock', NULL),
	('landing', NULL),
	('main', NULL),
	('messageservice', NULL),
	('mobileapp', NULL),
	('perfmon', NULL),
	('photogallery', NULL),
	('rest', NULL),
	('scale', NULL),
	('search', NULL),
	('security', NULL),
	('seo', NULL),
	('socialservices', NULL),
	('subscribe', NULL),
	('translate', NULL),
	('ui', NULL),
	('vote', NULL);
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_module_group
CREATE TABLE IF NOT EXISTS `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_module_group: ~0 rows (приблизительно)
DELETE FROM `b_module_group`;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_module_to_module
CREATE TABLE IF NOT EXISTS `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_module_to_module: ~280 rows (приблизительно)
DELETE FROM `b_module_to_module`;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
	(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
	(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
	(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
	(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
	(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
	(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
	(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
	(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
	(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
	(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
	(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
	(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
	(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
	(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
	(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
	(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
	(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
	(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
	(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
	(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
	(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
	(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
	(23, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1, '71909f221d70fa277429e80412f97f41'),
	(24, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
	(25, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
	(26, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
	(27, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
	(28, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1, '954e2c4ca8624f90f1aee6f40183d5fc'),
	(29, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
	(30, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
	(31, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
	(32, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
	(33, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
	(34, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
	(35, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
	(36, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
	(37, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
	(38, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
	(39, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
	(40, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
	(41, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
	(42, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
	(43, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
	(44, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
	(45, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
	(46, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
	(47, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
	(48, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
	(49, NULL, 100, 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1, 'bfd508b9d33aff2527add538ca8ce0da'),
	(50, NULL, 100, 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1, 'a98030c3e6d284d10916eadb1153cb68'),
	(51, NULL, 100, 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1, '6787372096415bcfe93bd50d8b24f608'),
	(52, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
	(53, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
	(54, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
	(55, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
	(56, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
	(57, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
	(58, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
	(59, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
	(60, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
	(61, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
	(62, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
	(63, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
	(64, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
	(65, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1, '7ffb3da30f1bec7fe0c7456a8ec3b8d7'),
	(66, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1, '5a8bf3ea4b17f8d011b8f398c05ac89b'),
	(67, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
	(68, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
	(69, NULL, 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1, '6c23ebfcdfc99d14541ad083b0ee7430'),
	(70, NULL, 100, 'main', 'OnUserDelete', 'blog', '', 'CBlogUser', 'Delete', '', 1, '9e7cb3d757ecbfea5e1a218afcf30589'),
	(71, NULL, 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1, '33b1b3449b56990b745b251f3976521d'),
	(72, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1, '4fa06723b7108652d8f6846f17c4bfda'),
	(73, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '5e642b195637a47eda278a2f769d72ae'),
	(74, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '94116bd773c35830e32cabd264e1deac'),
	(75, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsAdd', '', 1, 'ef99702762ccf8958b3bd05a0bc2bd21'),
	(76, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '7e78a43487928787ac0665eb1eade0d5'),
	(77, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsUpdate', '', 1, '13116dc44040b680c93a2b7f60ff2845'),
	(78, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '06ae1cde11216c73393f8720c0f31ea9'),
	(79, NULL, 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1, '6dd70a97fa5c2f15e619721007813bd0'),
	(80, NULL, 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1, 'a2f4b906bc5e1e984c28ef37728d7007'),
	(81, NULL, 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1, '4461c77de3ca9dec12cd66c9554555a0'),
	(82, NULL, 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1, '6708964800c60ed28bb3ac095494d0f8'),
	(83, NULL, 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1, '29df09132203259924e883921fed0971'),
	(84, NULL, 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1, 'a47b921e59710bdca16e2284d11e8aa0'),
	(85, NULL, 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1, 'cd6910b2ee2dd66f257a68a6406b9f79'),
	(86, NULL, 100, 'im', 'OnAnswerNotify', 'blog', '', 'CBlogNotifySchema', 'CBlogEventsIMCallback', '', 1, '890d3be770eab6025cc54e120d3b51f5'),
	(87, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1, 'bfd07861166a9d51c1d21d18b291a1dc'),
	(88, NULL, 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'e5df84e19828b3b95901e7b2a5d55cb1'),
	(89, NULL, 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '75028a7a2551f7c677c09c367ed1a54c'),
	(90, NULL, 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1, 'a3b637f0c0945089c95d5c08e1166938'),
	(91, NULL, 100, 'mail', 'onReplyReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleReplyReceivedBlogPost', '', 2, '5e3d8ad3f14c5b994981074e43a02cd7'),
	(92, NULL, 100, 'mail', 'onForwardReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleForwardReceivedBlogPost', '', 2, '6002badd4ffa13790a43d45c5c29fca3'),
	(93, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '3fba13b74a731f896448388c082c24a4'),
	(94, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, '57ce8e76c004b1447554d8ec64c48783'),
	(95, NULL, 100, 'socialnetwork', 'onContentViewed', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, 'd33a4b2ae579a2c9b5ddcea17bc62806'),
	(96, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
	(97, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
	(98, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
	(99, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
	(100, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
	(101, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
	(102, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
	(103, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
	(104, NULL, 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, 'fefe695dc9f0e579e949c2dfcbe90d9d'),
	(105, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
	(106, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
	(107, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
	(108, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
	(109, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
	(110, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
	(111, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
	(112, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
	(113, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
	(114, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
	(115, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
	(116, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
	(117, NULL, 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1, 'b5b3b05c97cb867ae7494ab99fa9a119'),
	(118, NULL, 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1, '397a459912acd1c78fc9129065807860'),
	(119, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
	(120, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
	(121, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
	(122, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
	(123, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
	(124, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
	(125, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
	(126, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
	(127, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
	(128, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
	(129, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
	(130, NULL, 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1, '182217f1803d20e2899086e379ada21c'),
	(131, NULL, 100, 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', 1, '18ca0a9757a229b6290603235dfff0d1'),
	(132, NULL, 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1, '63f10ce39f269a9f1add6a0600aa05b9'),
	(133, NULL, 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1, '201c2a343960654a90382521e253328f'),
	(134, NULL, 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1, 'a00aa95408b2665018cb63e21cef4684'),
	(135, NULL, 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1, '3fe2c3077963069fee2360611d840816'),
	(136, NULL, 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1, 'eb0cb7958d708be629eba740bcabd8c4'),
	(137, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1, 'd5b04b52654500981293dbcf10ca1ef9'),
	(138, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1, '929cf569dd703b922e4a96a0a023f120'),
	(139, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1, '30a759001702af8052ea65e700c519c7'),
	(140, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1, '78ecc0524ac5d4fb0545c8a3fa28b3bd'),
	(141, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1, '94cfb4cf5460746b7b31a5b93a3805f6'),
	(142, NULL, 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1, '28c7a91a467c1190a064f597487abd5c'),
	(143, NULL, 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1, 'e42fc61795fed0c5f397259bb6f1f6b9'),
	(144, NULL, 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1, 'db966e6ee1f8b98f83e57411f4757858'),
	(145, NULL, 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1, 'f5f6a93c1fe6d7dc61fbb5bf25f9965f'),
	(146, NULL, 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1, '84556c2f1f7f23189f90603f45ad3942'),
	(147, NULL, 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1, '7ead6be47d7bb2e297a2af57f85dc7ee'),
	(148, NULL, 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1, '99f4b68c8e6c1598377e0016b31234bb'),
	(149, NULL, 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1, '5ef51ecf36931b3a32f4fea00dc49c8c'),
	(150, NULL, 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1, 'ad425ff862192078c050ea34d60f8d63'),
	(151, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1, '205fd3e33648d7e1ed6f4b7f0298f603'),
	(152, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'forum', '', 'CForumRestService', 'OnRestServiceBuildDescription', '', 1, '506b2a93cea64d73c9e7c187fdde2840'),
	(153, NULL, 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'fa69bf6ff10a0fb9b2e91098f0c0bab3'),
	(154, NULL, 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '9eb2b6d8edde63385655c1001d9e0c31'),
	(155, NULL, 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1, 'ea61a319e93c2c3a9bfc9a63840b2155'),
	(156, NULL, 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1, '3cc5f27501dad77acdecb1c8a4e978de'),
	(157, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '909a8b84bf80774a6a89bfbbd2258ce8'),
	(158, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, 'e6aaa86c7daeae2bc002e513f06ccffa'),
	(159, NULL, 100, 'socialnetwork', 'onContentViewed', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, '5db6b373f6612f36c2ff6783dd4d6154'),
	(160, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
	(161, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
	(162, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
	(163, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
	(164, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
	(165, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
	(166, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
	(167, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
	(168, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
	(169, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
	(170, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
	(171, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
	(172, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
	(173, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
	(174, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
	(175, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
	(176, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
	(177, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
	(178, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
	(179, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
	(180, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
	(181, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
	(182, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
	(183, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
	(184, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
	(185, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
	(186, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
	(187, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
	(188, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
	(189, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
	(190, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
	(191, NULL, 100, 'rest', 'OnRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
	(192, NULL, 100, 'main', 'OnBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
	(193, NULL, 100, 'main', 'OnSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
	(194, NULL, 100, 'bitrix24', 'OnDomainChange', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\NodeAttributes', 'updateFormDomain', '', 2, 'a5f1ac2c31163115813298acc7bbffcf'),
	(195, NULL, 100, 'socialservices', '\\Bitrix\\Socialservices\\ApTable::OnAfterAdd', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\NodeAttributes', 'updateFormDomainByConnector', '', 2, '0152997776462d358b5364b794cd205e'),
	(196, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
	(197, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
	(198, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
	(199, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
	(200, NULL, 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1, '4833278dbe60d476fbccbaa54545cffa'),
	(201, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
	(202, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1, 'dc9ea0b8411dfa54929a022d44bc5b1a'),
	(203, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1, '7fc7f3cc71ad3188022388365d446ed2'),
	(204, NULL, 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1, '06e2330d56c3b972e67707d665383704'),
	(205, NULL, 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1, '7ca75249042a033e858d90dc2473adac'),
	(206, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'photogallery', '', '\\Bitrix\\Photogallery\\Integration\\Socialnetwork\\Group', 'onSocNetGroupDelete', '', 1, 'bded61c39d768685fa7dd112c63c702b'),
	(207, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
	(208, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
	(209, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
	(210, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
	(211, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
	(212, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
	(213, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
	(214, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
	(215, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
	(216, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
	(217, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
	(218, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
	(219, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
	(220, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
	(221, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1, 'd8192b7113f1652bdf8a37bcd4e38dea'),
	(222, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
	(223, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
	(224, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
	(225, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
	(226, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
	(227, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
	(228, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
	(229, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
	(230, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
	(231, NULL, 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1, '450a1c7509f5363a9bf7d1472f22f9cf'),
	(232, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1, '893bc94df887141b4f3579561ea37454'),
	(233, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1, '9ba919b0537aa25fe47e438c2428b4d9'),
	(234, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1, 'c751923f396ccc4e102ed17e97cb8afb'),
	(235, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1, '0c7cea553d58a72f7c5521d282898bc7'),
	(236, NULL, 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1, 'bb70fedd18267b1c5290068ae80dbc4d'),
	(237, NULL, 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1, 'd1886589ecd51b020420e6c1415edeaf'),
	(238, NULL, 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1, '2dbeb7fa7a8bec4d90e8940616976b3d'),
	(239, NULL, 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1, '099871646b4df8c1263e26f9bd91f3bd'),
	(240, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
	(241, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
	(242, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
	(243, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
	(244, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
	(245, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2, '148ce014df9dd9f99f17ebfc5d766e8a'),
	(246, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2, '4b1e9896d9f0aa37a7039a321f25f9a5'),
	(247, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2, 'b699c1c0d6665f9cffe7ff76ab108a24'),
	(248, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2, 'ff3a36654015c53890f4cf2204b030c4'),
	(249, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2, 'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
	(250, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2, 'a1022e0619263c0e91139fb3f9837085'),
	(251, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2, '27930cffcd40b84666d0a22e1a953c41'),
	(252, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2, 'f0151e07363564774d45acba4100aebe'),
	(253, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2, 'd4d54756116942c9ee0bda9b31e9d0e7'),
	(254, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2, '3e0a8569016a4c941f3eb4aa9fca6e8b'),
	(255, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2, '7f4379c818231561b41589d3de41e36b'),
	(256, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
	(257, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
	(258, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
	(259, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
	(260, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
	(261, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
	(262, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
	(263, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
	(264, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
	(265, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
	(266, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
	(267, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
	(268, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
	(269, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
	(270, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
	(271, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
	(272, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
	(273, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
	(274, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6'),
	(275, NULL, 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1, 'ee539731a3e52fe65cb52596ce0856d2'),
	(276, NULL, 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1, '88c6e57a6f0f18341332db1879c0005b'),
	(277, NULL, 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1, 'f4fa3b156b00fb4415c8612f8439f278'),
	(278, NULL, 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1, '990d63845f75e93e670ed85f1aa15152'),
	(279, NULL, 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1, '8a1cffe1bd46a72108e48656a1bae99b'),
	(280, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', 1, '38070e5e7a0aa6ff4876ffc7f3feb94b'),
	(281, NULL, 10, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1, '251d4d100c1545ca5847d8d6d626dea9'),
	(282, NULL, 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'Bitrix\\Vote\\Uf\\VoteUserType', 'getUserTypeDescription', '', 1, 'e30dd2d26df22ce2dcffef84256cf160'),
	(283, NULL, 200, 'main', 'OnUserLogin', 'vote', '', 'Bitrix\\Vote\\User', 'onUserLogin', '', 1, '5047b245af7aede3f2474b40dfbc65be'),
	(284, NULL, 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1, '97ffe9642e64dc7d68f9ec9bc789be47'),
	(285, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_numerator
CREATE TABLE IF NOT EXISTS `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_numerator: ~0 rows (приблизительно)
DELETE FROM `b_numerator`;
/*!40000 ALTER TABLE `b_numerator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_numerator_sequence
CREATE TABLE IF NOT EXISTS `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT '0',
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_numerator_sequence: ~0 rows (приблизительно)
DELETE FROM `b_numerator_sequence`;
/*!40000 ALTER TABLE `b_numerator_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator_sequence` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_operation
CREATE TABLE IF NOT EXISTS `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_operation: ~120 rows (приблизительно)
DELETE FROM `b_operation`;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'edit_php', 'main', NULL, 'module'),
	(2, 'view_own_profile', 'main', NULL, 'module'),
	(3, 'edit_own_profile', 'main', NULL, 'module'),
	(4, 'view_all_users', 'main', NULL, 'module'),
	(5, 'view_groups', 'main', NULL, 'module'),
	(6, 'view_tasks', 'main', NULL, 'module'),
	(7, 'view_other_settings', 'main', NULL, 'module'),
	(8, 'view_subordinate_users', 'main', NULL, 'module'),
	(9, 'edit_subordinate_users', 'main', NULL, 'module'),
	(10, 'edit_all_users', 'main', NULL, 'module'),
	(11, 'edit_groups', 'main', NULL, 'module'),
	(12, 'edit_tasks', 'main', NULL, 'module'),
	(13, 'edit_other_settings', 'main', NULL, 'module'),
	(14, 'cache_control', 'main', NULL, 'module'),
	(15, 'lpa_template_edit', 'main', NULL, 'module'),
	(16, 'view_event_log', 'main', NULL, 'module'),
	(17, 'edit_ratings', 'main', NULL, 'module'),
	(18, 'manage_short_uri', 'main', NULL, 'module'),
	(19, 'fm_view_permission', 'main', NULL, 'file'),
	(20, 'fm_view_file', 'main', NULL, 'file'),
	(21, 'fm_view_listing', 'main', NULL, 'file'),
	(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
	(23, 'fm_create_new_file', 'main', NULL, 'file'),
	(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
	(25, 'fm_create_new_folder', 'main', NULL, 'file'),
	(26, 'fm_delete_file', 'main', NULL, 'file'),
	(27, 'fm_delete_folder', 'main', NULL, 'file'),
	(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
	(29, 'fm_rename_file', 'main', NULL, 'file'),
	(30, 'fm_rename_folder', 'main', NULL, 'file'),
	(31, 'fm_upload_file', 'main', NULL, 'file'),
	(32, 'fm_add_to_menu', 'main', NULL, 'file'),
	(33, 'fm_download_file', 'main', NULL, 'file'),
	(34, 'fm_lpa', 'main', NULL, 'file'),
	(35, 'fm_edit_permission', 'main', NULL, 'file'),
	(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
	(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
	(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
	(39, 'clouds_browse', 'clouds', NULL, 'module'),
	(40, 'clouds_upload', 'clouds', NULL, 'module'),
	(41, 'clouds_config', 'clouds', NULL, 'module'),
	(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
	(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
	(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
	(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
	(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
	(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
	(48, 'fileman_admin_files', 'fileman', '', 'module'),
	(49, 'fileman_admin_folders', 'fileman', '', 'module'),
	(50, 'fileman_view_permissions', 'fileman', '', 'module'),
	(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
	(52, 'fileman_upload_files', 'fileman', '', 'module'),
	(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
	(54, 'fileman_install_control', 'fileman', '', 'module'),
	(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
	(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
	(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
	(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
	(59, 'medialib_access', 'fileman', '', 'medialib'),
	(60, 'medialib_new_item', 'fileman', '', 'medialib'),
	(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
	(62, 'medialib_del_item', 'fileman', '', 'medialib'),
	(63, 'sticker_view', 'fileman', '', 'stickers'),
	(64, 'sticker_edit', 'fileman', '', 'stickers'),
	(65, 'sticker_new', 'fileman', '', 'stickers'),
	(66, 'sticker_del', 'fileman', '', 'stickers'),
	(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
	(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
	(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
	(70, 'section_read', 'iblock', NULL, 'iblock'),
	(71, 'element_read', 'iblock', NULL, 'iblock'),
	(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
	(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
	(74, 'element_edit', 'iblock', NULL, 'iblock'),
	(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
	(76, 'element_delete', 'iblock', NULL, 'iblock'),
	(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
	(78, 'section_edit', 'iblock', NULL, 'iblock'),
	(79, 'section_delete', 'iblock', NULL, 'iblock'),
	(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
	(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
	(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
	(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
	(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
	(85, 'iblock_export', 'iblock', NULL, 'iblock'),
	(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
	(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
	(88, 'landing_read', 'landing', NULL, 'module'),
	(89, 'landing_edit', 'landing', NULL, 'module'),
	(90, 'landing_sett', 'landing', NULL, 'module'),
	(91, 'landing_public', 'landing', NULL, 'module'),
	(92, 'landing_delete', 'landing', NULL, 'module'),
	(93, 'security_filter_bypass', 'security', NULL, 'module'),
	(94, 'security_edit_user_otp', 'security', NULL, 'module'),
	(95, 'security_module_settings_read', 'security', NULL, 'module'),
	(96, 'security_panel_view', 'security', NULL, 'module'),
	(97, 'security_filter_settings_read', 'security', NULL, 'module'),
	(98, 'security_otp_settings_read', 'security', NULL, 'module'),
	(99, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
	(100, 'security_session_settings_read', 'security', NULL, 'module'),
	(101, 'security_redirect_settings_read', 'security', NULL, 'module'),
	(102, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
	(103, 'security_iprule_settings_read', 'security', NULL, 'module'),
	(104, 'security_antivirus_settings_read', 'security', NULL, 'module'),
	(105, 'security_frame_settings_read', 'security', NULL, 'module'),
	(106, 'security_module_settings_write', 'security', NULL, 'module'),
	(107, 'security_filter_settings_write', 'security', NULL, 'module'),
	(108, 'security_otp_settings_write', 'security', NULL, 'module'),
	(109, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
	(110, 'security_session_settings_write', 'security', NULL, 'module'),
	(111, 'security_redirect_settings_write', 'security', NULL, 'module'),
	(112, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
	(113, 'security_iprule_settings_write', 'security', NULL, 'module'),
	(114, 'security_file_verifier_sign', 'security', NULL, 'module'),
	(115, 'security_file_verifier_collect', 'security', NULL, 'module'),
	(116, 'security_file_verifier_verify', 'security', NULL, 'module'),
	(117, 'security_antivirus_settings_write', 'security', NULL, 'module'),
	(118, 'security_frame_settings_write', 'security', NULL, 'module'),
	(119, 'seo_settings', 'seo', '', 'module'),
	(120, 'seo_tools', 'seo', '', 'module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_option
CREATE TABLE IF NOT EXISTS `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_option: ~54 rows (приблизительно)
DELETE FROM `b_option`;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
	('blog', 'socNetNewPerms', 'Y', NULL, NULL),
	('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
	('fileman', 'use_editor_3', 'Y', NULL, NULL),
	('form', 'FORM_DEFAULT_PERMISSION', '10', NULL, NULL),
	('form', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
	('form', 'RECORDS_LIMIT', '5000', NULL, NULL),
	('form', 'RESULTS_PAGEN', '10', NULL, NULL),
	('form', 'SIMPLE', 'Y', NULL, NULL),
	('form', 'USE_HTML_EDIT', 'Y', NULL, NULL),
	('forum', 'FILTER', 'N', NULL, NULL),
	('landing', 'block_vendor_bitrix', 'https://repo.bitrix24.site/rest/1/w1uqy3swvyp50bso/', NULL, NULL),
	('landing', 'disabled_namespaces', 'bitrix', NULL, NULL),
	('landing', 'pub_path_s1', '/lp/', NULL, NULL),
	('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:"OTP_SECRET";b:1;}', NULL, NULL),
	('main', '~ft_b_user_index', 'a:3:{s:19:"SEARCH_USER_CONTENT";b:1;s:25:"SEARCH_DEPARTMENT_CONTENT";b:1;s:20:"SEARCH_ADMIN_CONTENT";b:1;}', NULL, NULL),
	('main', '~ft_b_user_index_selector', 'a:1:{s:23:"SEARCH_SELECTOR_CONTENT";b:1;}', NULL, NULL),
	('main', '~new_license11_sign', 'Y', NULL, NULL),
	('main', '~new_license18_0_sign', 'Y', NULL, NULL),
	('main', '~update_autocheck_result', 'a:3:{s:10:"check_date";i:0;s:6:"result";b:0;s:5:"error";s:56:"[LICENSE_NOT_FOUND] Лицензия не найдена";}', NULL, NULL),
	('main', 'admin_lid', 'ru', NULL, NULL),
	('main', 'admin_passwordh', 'FVkQemYUBgUtCUVcBxcECgsTAQ==', NULL, NULL),
	('main', 'distributive6', 'Y', NULL, NULL),
	('main', 'email_from', 'music.dll@mail.ru', NULL, NULL),
	('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
	('main', 'optimize_css_files', 'Y', NULL, NULL),
	('main', 'optimize_js_files', 'Y', NULL, NULL),
	('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
	('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
	('main', 'rating_assign_authority_group', '4', NULL, NULL),
	('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
	('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
	('main', 'rating_assign_rating_group', '3', NULL, NULL),
	('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
	('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
	('main', 'rating_assign_type', 'auto', NULL, NULL),
	('main', 'rating_authority_rating', '2', NULL, NULL),
	('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
	('main', 'rating_community_authority', '30', NULL, NULL),
	('main', 'rating_community_last_visit', '90', NULL, NULL),
	('main', 'rating_community_size', '1', NULL, NULL),
	('main', 'rating_count_vote', '10', NULL, NULL),
	('main', 'rating_normalization', '10', NULL, NULL),
	('main', 'rating_normalization_type', 'auto', NULL, NULL),
	('main', 'rating_self_vote', 'Y', NULL, NULL),
	('main', 'rating_start_authority', '3', NULL, NULL),
	('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
	('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
	('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
	('main', 'rating_vote_show', 'Y', NULL, NULL),
	('main', 'rating_vote_template', 'like', NULL, NULL),
	('main', 'rating_vote_type', 'like', NULL, NULL),
	('main', 'rating_vote_weight', '10', NULL, NULL),
	('main', 'server_uniq_id', '3f83d11e83c8178197e17c0d4671583d', NULL, NULL),
	('main', 'signer_default_key', 'cee7c4299af54498ca04878a83c65cb9e799454e10007aba92df6d5f098fd8aa1b15bddea5538e8a6ba594887826fc866b7bc4eff23da18eff3b252bbd829e86', NULL, NULL),
	('main', 'site_checker_success', NULL, NULL, NULL),
	('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
	('main', 'update_site_ns', 'Y', NULL, NULL),
	('main', 'update_system_check', '15.01.2020 14:25:12', NULL, NULL),
	('main', 'vendor', '1c_bitrix', NULL, NULL),
	('messageservice', 'clean_up_period', '14', NULL, NULL),
	('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
	('rest', 'server_path', '/rest', NULL, NULL),
	('search', 'dbnode_id', 'N', NULL, NULL),
	('search', 'dbnode_status', 'ok', NULL, NULL),
	('search', 'version', 'v2.0', NULL, NULL),
	('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_4101ca33f4db513bfa419d4ed109b0fb', NULL, NULL),
	('security', 'redirect_sid', 'dhxctfu1250jbqluarwysdtudazz5f62', NULL, NULL),
	('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
	('vote', 'VOTE_DIR', '', NULL, NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_option_site
CREATE TABLE IF NOT EXISTS `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_option_site: ~4 rows (приблизительно)
DELETE FROM `b_option_site`;
/*!40000 ALTER TABLE `b_option_site` DISABLE KEYS */;
INSERT INTO `b_option_site` (`MODULE_ID`, `NAME`, `SITE_ID`, `VALUE`) VALUES
	('forum', 'FILTER_DICT_T', 'en', '4'),
	('forum', 'FILTER_DICT_T', 'ru', '2'),
	('forum', 'FILTER_DICT_W', 'en', '3'),
	('forum', 'FILTER_DICT_W', 'ru', '1');
/*!40000 ALTER TABLE `b_option_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_cache
CREATE TABLE IF NOT EXISTS `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_cache: ~0 rows (приблизительно)
DELETE FROM `b_perf_cache`;
/*!40000 ALTER TABLE `b_perf_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cache` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_cluster
CREATE TABLE IF NOT EXISTS `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_cluster: ~0 rows (приблизительно)
DELETE FROM `b_perf_cluster`;
/*!40000 ALTER TABLE `b_perf_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cluster` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_component
CREATE TABLE IF NOT EXISTS `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_component: ~0 rows (приблизительно)
DELETE FROM `b_perf_component`;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_error
CREATE TABLE IF NOT EXISTS `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_error: ~0 rows (приблизительно)
DELETE FROM `b_perf_error`;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_history
CREATE TABLE IF NOT EXISTS `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_history: ~0 rows (приблизительно)
DELETE FROM `b_perf_history`;
/*!40000 ALTER TABLE `b_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_history` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_hit
CREATE TABLE IF NOT EXISTS `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_hit: ~0 rows (приблизительно)
DELETE FROM `b_perf_hit`;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_index_ban
CREATE TABLE IF NOT EXISTS `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_index_ban: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_ban`;
/*!40000 ALTER TABLE `b_perf_index_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_ban` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_index_complete
CREATE TABLE IF NOT EXISTS `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_index_complete: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_complete`;
/*!40000 ALTER TABLE `b_perf_index_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_complete` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_index_suggest
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_index_suggest: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest`;
/*!40000 ALTER TABLE `b_perf_index_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_index_suggest_sql
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_index_suggest_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest_sql`;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_sql
CREATE TABLE IF NOT EXISTS `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql`;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_sql_backtrace
CREATE TABLE IF NOT EXISTS `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_sql_backtrace: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql_backtrace`;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_tab_column_stat
CREATE TABLE IF NOT EXISTS `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_tab_column_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_column_stat`;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_tab_stat
CREATE TABLE IF NOT EXISTS `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_tab_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_stat`;
/*!40000 ALTER TABLE `b_perf_tab_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_stat` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_perf_test
CREATE TABLE IF NOT EXISTS `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_perf_test: ~0 rows (приблизительно)
DELETE FROM `b_perf_test`;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_posting
CREATE TABLE IF NOT EXISTS `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_posting: ~0 rows (приблизительно)
DELETE FROM `b_posting`;
/*!40000 ALTER TABLE `b_posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_posting_email
CREATE TABLE IF NOT EXISTS `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_posting_email: ~0 rows (приблизительно)
DELETE FROM `b_posting_email`;
/*!40000 ALTER TABLE `b_posting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_email` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_posting_file
CREATE TABLE IF NOT EXISTS `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_posting_file: ~0 rows (приблизительно)
DELETE FROM `b_posting_file`;
/*!40000 ALTER TABLE `b_posting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_file` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_posting_group
CREATE TABLE IF NOT EXISTS `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_posting_group: ~0 rows (приблизительно)
DELETE FROM `b_posting_group`;
/*!40000 ALTER TABLE `b_posting_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_posting_rubric
CREATE TABLE IF NOT EXISTS `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_posting_rubric: ~0 rows (приблизительно)
DELETE FROM `b_posting_rubric`;
/*!40000 ALTER TABLE `b_posting_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating
CREATE TABLE IF NOT EXISTS `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating: ~2 rows (приблизительно)
DELETE FROM `b_rating`;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
	(1, 'N', 'Рейтинг', 'USER', 'SUM', '2020-01-14 14:52:54', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:16:"TODAY_TOPIC_COEF";s:3:"0.4";s:15:"WEEK_TOPIC_COEF";s:3:"0.2";s:16:"MONTH_TOPIC_COEF";s:3:"0.1";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.2";s:14:"WEEK_POST_COEF";s:3:"0.1";s:15:"MONTH_POST_COEF";s:4:"0.05";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}'),
	(2, 'N', 'Авторитет', 'USER', 'SUM', '2020-01-14 14:52:54', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:1:"0";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:16:"TODAY_TOPIC_COEF";s:2:"20";s:15:"WEEK_TOPIC_COEF";s:2:"10";s:16:"MONTH_TOPIC_COEF";s:1:"5";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}');
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_component
CREATE TABLE IF NOT EXISTS `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_component: ~0 rows (приблизительно)
DELETE FROM `b_rating_component`;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_component_results
CREATE TABLE IF NOT EXISTS `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_component_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_component_results`;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_prepare
CREATE TABLE IF NOT EXISTS `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_prepare`;
/*!40000 ALTER TABLE `b_rating_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_prepare` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_results
CREATE TABLE IF NOT EXISTS `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_results`;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_rule
CREATE TABLE IF NOT EXISTS `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_rule: ~5 rows (приблизительно)
DELETE FROM `b_rating_rule`;
/*!40000 ALTER TABLE `b_rating_rule` DISABLE KEYS */;
INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
	(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2020-01-14 14:52:54', '2020-01-14 14:52:54', NULL),
	(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2020-01-14 14:52:54', '2020-01-14 14:52:54', NULL),
	(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2020-01-14 14:52:54', '2020-01-14 14:52:54', NULL),
	(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2020-01-14 14:52:54', '2020-01-14 14:52:54', NULL),
	(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:"VOTE";a:6:{s:10:"VOTE_LIMIT";i:90;s:11:"VOTE_RESULT";i:10;s:16:"VOTE_FORUM_TOPIC";d:0.5;s:15:"VOTE_FORUM_POST";d:0.1;s:14:"VOTE_BLOG_POST";d:0.5;s:17:"VOTE_BLOG_COMMENT";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2020-01-14 14:52:54', '2020-01-14 14:52:54', NULL);
/*!40000 ALTER TABLE `b_rating_rule` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_rule_vetting
CREATE TABLE IF NOT EXISTS `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_rule_vetting: ~0 rows (приблизительно)
DELETE FROM `b_rating_rule_vetting`;
/*!40000 ALTER TABLE `b_rating_rule_vetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_rule_vetting` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_user
CREATE TABLE IF NOT EXISTS `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_user: ~0 rows (приблизительно)
DELETE FROM `b_rating_user`;
/*!40000 ALTER TABLE `b_rating_user` DISABLE KEYS */;
INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
	(1, 2, 1, 3.0000, 30.0000, 13);
/*!40000 ALTER TABLE `b_rating_user` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_vote
CREATE TABLE IF NOT EXISTS `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_vote: ~0 rows (приблизительно)
DELETE FROM `b_rating_vote`;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_vote_group
CREATE TABLE IF NOT EXISTS `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_vote_group: ~6 rows (приблизительно)
DELETE FROM `b_rating_vote_group`;
/*!40000 ALTER TABLE `b_rating_vote_group` DISABLE KEYS */;
INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
	(5, 1, 'A'),
	(1, 1, 'R'),
	(3, 1, 'R'),
	(2, 3, 'R'),
	(4, 3, 'R'),
	(6, 4, 'A');
/*!40000 ALTER TABLE `b_rating_vote_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_voting
CREATE TABLE IF NOT EXISTS `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_voting: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting`;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_voting_prepare
CREATE TABLE IF NOT EXISTS `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_voting_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_prepare`;
/*!40000 ALTER TABLE `b_rating_voting_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_prepare` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_voting_reaction
CREATE TABLE IF NOT EXISTS `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_voting_reaction: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_reaction`;
/*!40000 ALTER TABLE `b_rating_voting_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_reaction` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rating_weight
CREATE TABLE IF NOT EXISTS `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rating_weight: ~0 rows (приблизительно)
DELETE FROM `b_rating_weight`;
/*!40000 ALTER TABLE `b_rating_weight` DISABLE KEYS */;
INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
	(1, -1000000.0000, 1000000.0000, 1.0000, 10);
/*!40000 ALTER TABLE `b_rating_weight` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_ap
CREATE TABLE IF NOT EXISTS `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_ap: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap`;
/*!40000 ALTER TABLE `b_rest_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_app
CREATE TABLE IF NOT EXISTS `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_rest_app`;
/*!40000 ALTER TABLE `b_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_app_lang
CREATE TABLE IF NOT EXISTS `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_lang`;
/*!40000 ALTER TABLE `b_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_app_log
CREATE TABLE IF NOT EXISTS `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_app_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_log`;
/*!40000 ALTER TABLE `b_rest_app_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_log` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_ap_permission
CREATE TABLE IF NOT EXISTS `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_ap_permission: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap_permission`;
/*!40000 ALTER TABLE `b_rest_ap_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap_permission` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_event
CREATE TABLE IF NOT EXISTS `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_app_id` (`APP_ID`),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_event: ~0 rows (приблизительно)
DELETE FROM `b_rest_event`;
/*!40000 ALTER TABLE `b_rest_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_event_offline
CREATE TABLE IF NOT EXISTS `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_event_offline: ~0 rows (приблизительно)
DELETE FROM `b_rest_event_offline`;
/*!40000 ALTER TABLE `b_rest_event_offline` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event_offline` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_log
CREATE TABLE IF NOT EXISTS `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_log`;
/*!40000 ALTER TABLE `b_rest_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_log` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_placement
CREATE TABLE IF NOT EXISTS `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_placement: ~0 rows (приблизительно)
DELETE FROM `b_rest_placement`;
/*!40000 ALTER TABLE `b_rest_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_placement` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_stat
CREATE TABLE IF NOT EXISTS `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_stat: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat`;
/*!40000 ALTER TABLE `b_rest_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_rest_stat_method
CREATE TABLE IF NOT EXISTS `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_rest_stat_method: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat_method`;
/*!40000 ALTER TABLE `b_rest_stat_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat_method` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content
CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_content: ~8 rows (приблизительно)
DELETE FROM `b_search_content`;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
	(1, '2020-01-15 14:07:47', 'iblock', '1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-1', 'Article title 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit..\r\n\rLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget. Aliquet nec ullamcorper sit amet risus. Dignissim enim sit amet venenatis urna cursus eget. Turpis egestas pretium aenean pharetra magna ac placerat. Sed tempus urna et pharetra pharetra massa massa ultricies. Risus nullam eget felis eget nunc lobortis. Vel eros donec ac odio tempor orci dapibus ultrices in. Quisque id diam vel quam. Faucibus et molestie ac feugiat sed lectus vestibulum mattis. Suspendisse faucibus interdum posuere lorem ipsum dolor. Non odio euismod lacinia at quis risus. Purus viverra accumsan in nisl nisi. Dolor sit amet consectetur adipiscing elit. Semper auctor neque vitae tempus quam pellentesque nec nam aliquam. Pharetra vel turpis nunc eget lorem dolor sed viverra. Elit ut aliquam purus sit amet luctus venenatis lectus magna. Pretium viverra suspendisse potenti nullam ac tortor vitae.\rQuisque egestas diam in arcu cursus. Blandit libero volutpat sed cras ornare arcu dui. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Praesent semper feugiat nibh sed pulvinar. Posuere ac ut consequat semper. Semper risus in hendrerit gravida rutrum quisque. Lacus viverra vitae congue eu consequat ac. Nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus. Sapien nec sagittis aliquam malesuada. Ultricies leo integer malesuada nunc vel. Mattis ullamcorper velit sed ullamcorper morbi. Nec ullamcorper sit amet risus nullam eget felis. Amet consectetur adipiscing elit duis tristique sollicitudin. Etiam sit amet nisl purus in. Dignissim sodales ut eu sem integer.\rViverra mauris in aliquam sem fringilla ut. Quis varius quam quisque id diam vel quam. Molestie ac feugiat sed lectus. Metus vulputate eu scelerisque felis imperdiet proin. Vitae auctor eu augue ut lectus arcu bibendum at varius. Vestibulum lorem sed risus ultricies. Egestas erat imperdiet sed euismod nisi porta lorem mollis aliquam. Leo urna molestie at elementum. Ac felis donec et odio. Tristique nulla aliquet enim tortor at auctor urna nunc. Velit ut tortor pretium viverra suspendisse. Tempor nec feugiat nisl pretium fusce. Aliquet nibh praesent tristique magna sit. Nibh nisl condimentum id venenatis. Augue neque gravida in fermentum et sollicitudin ac. Tempus imperdiet nulla malesuada pellentesque elit eget gravida. Et odio pellentesque diam volutpat commodo sed egestas. Scelerisque viverra mauris in aliquam.\rTurpis massa sed elementum tempus egestas sed sed. Fusce id velit ut tortor pretium viverra suspendisse potenti nullam. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Odio morbi quis commodo odio aenean sed adipiscing. Vulputate enim nulla aliquet porttitor. Sed augue lacus viverra vitae. Cum sociis natoque penatibus et magnis dis parturient. Ac turpis egestas sed tempus urna et pharetra. Blandit massa enim nec dui nunc mattis enim. Cras sed felis eget velit aliquet sagittis id consectetur purus. Bibendum at varius vel pharetra. Porta lorem mollis aliquam ut porttitor leo a. Eu turpis egestas pretium aenean pharetra magna. Praesent elementum facilisis leo vel fringilla est ullamcorper. Quisque non tellus orci ac auctor. Scelerisque eu ultrices vitae auctor eu augue. Malesuada fames ac turpis egestas integer eget aliquet nibh praesent.\rOdio facilisis mauris sit amet massa vitae tortor condimentum lacinia. Aliquet eget sit amet tellus cras adipiscing. Dui accumsan sit amet nulla facilisi. Ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet. Aliquet nibh praesent tristique magna. At urna condimentum mattis pellentesque id. Et netus et malesuada fames ac turpis. Sit amet nulla facilisi morbi tempus iaculis urna id volutpat. Magna fringilla urna porttitor rhoncus. Sem viverra aliquet eget sit amet tellus cras adipiscing enim. At augue eget arcu dictum. Malesuada bibendum arcu vitae elementum curabitur vitae.', '', 'articles', '1', NULL, '2020-01-15 14:07:47', '2020-02-15 14:07:00'),
	(2, '2020-01-15 14:08:53', 'iblock', '2', 0, NULL, NULL, NULL, '=ID=2&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-2', 'Article title 2', 'Zombie ipsum reversus ab viral inferno...\r\n\rZombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium. Qui animated corpse, cricket bat max brucks terribilem incessu zomby. The voodoo sacerdos flesh eater, suscitat mortuos comedere carnem virus. Zonbi tattered for solum oculi eorum defunctis go lum cerebro. Nescio brains an Undead zombies. Sicut malus putrid voodoo horror. Nigh tofth eliv ingdead.\rCum horribilem walking dead resurgere de crazed sepulcris creaturis, zombie sicut de grave feeding iride et serpens. Pestilentia, shaun ofthe dead scythe animated corpses ipsa screams. Pestilentia est plague haec decaying ambulabat mortuos. Sicut zeder apathetic malus voodoo. Aenean a dolor plan et terror soulless vulnerum contagium accedunt, mortui iam vivam unlife. Qui tardius moveri, brid eof reanimator sed in magna copia sint terribiles undeath legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi braindead odores kill and infect, aere implent left four dead.\rLucio fulci tremor est dark vivos magna. Expansis creepy arm yof darkness ulnis witchcraft missing carnem armis Kirkman Moore and Adlard caeruleum in locis. Romero morbo Congress amarus in auras. Nihil horum sagittis tincidunt, zombie slack-jawed gelida survival portenta. The unleashed virus est, et iam zombie mortui ambulabunt super terram. Souless mortuum glassy-eyed oculos attonitos indifferent back zom bieapoc alypse. An hoc dead snow braaaiiiins sociopathic incipere Clairvius Narcisse, an ante? Is bello mundi z?\rIn Craven omni memoria patriae zombieland clairvius narcisse religionis sunt diri undead historiarum. Golums, zombies unrelenting et Raimi fascinati beheading. Maleficia! Vel cemetery man a modern bursting eyeballs perhsaps morbi. A terrenti flesh contagium. Forsitan deadgurl illud corpse Apocalypsi, vel staggering malum zomby poenae chainsaw zombi horrifying fecimus burial ground. Indeflexus shotgun coup de poudre monstra per plateas currere. Fit de decay nostra carne undead. Poenitentiam violent zom biehig hway agite RE:dead pœnitentiam! Vivens mortua sunt apud nos night of the living dead.\rWhyt zomby Ut fames after death cerebro virus enim carnis grusome, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus flesh eating. Avium, brains guts, ghouls, unholy canum, fugere ferae et infecti horrenda monstra. Videmus twenty-eight deformis pale, horrenda daemonum. Panduntur brains portae rotting inferi. Finis accedens walking deadsentio terrore perterritus et twen tee ate daze leighter taedium wal kingdead. The horror, monstra epidemic significant finem. Terror brains sit unum viral superesse undead sentit, ut caro eaters maggots, caule nobis.', '', 'articles', '1', NULL, '2020-01-15 14:08:53', '2020-02-15 14:09:00'),
	(3, '2020-01-15 14:09:30', 'iblock', '3', 0, NULL, NULL, NULL, '=ID=3&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-3', 'Article title 3', 'Zombies reversus ab inferno, nam malum cerebro...\r\n\rZombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.\rCum horribilem resurgere de sepulcris creaturis, sicut de iride et serpens. Pestilentia, ipsa screams. Pestilentia est haec ambulabat mortuos. Sicut malus voodoo. Aenean a dolor vulnerum aperire accedunt, mortui iam vivam. Qui tardius moveri, sed in magna copia sint terribiles legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi odores aere implent.\rTremor est vivos magna. Expansis ulnis video missing carnem armis caeruleum in locis. A morbo amarus in auras. Nihil horum sagittis tincidunt, gelida portenta. The unleashed virus est, et iam mortui ambulabunt super terram. Souless mortuum oculos attonitos back zombies. An hoc incipere Clairvius Narcisse, an ante? Is bello mundi z?\rIn omni memoria patriae religionis sunt diri undead historiarum. Golums, zombies et fascinati. Maleficia! Vel a modern perhsaps morbi. A terrenti contagium. Forsitan illud Apocalypsi, vel malum poenae horrifying fecimus. Indeflexus monstra per plateas currere. Fit de nostra carne undead. Poenitentiam agite pœnitentiam! Vivens mortua sunt apud nos.\rUt fames cerebro enim carnis, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus. Avium, canum, fugere ferae et infecti horrenda monstra. Videmus deformis horrenda daemonum. Panduntur portae inferi. Finis accedens sentio terrore perterritus et taedium. The horror, monstra significant finem. Terror sit unum superesse sentit, ut caro eaters caule nobis.', '', 'articles', '1', NULL, '2020-01-15 14:09:30', '2020-02-15 14:09:00'),
	(4, '2020-01-15 14:10:07', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-4', 'Article title 4', 'Bacon ipsum dolor amet jerky drumstick burgdoggen...\r\n\rZombies reversus ab inferno, nam malum cerebro. De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia? De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo monstra adventus vultus comedat cerebella viventium. Qui offenderit rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem. Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies. Sicut malus movie horror.\rCum horribilem resurgere de sepulcris creaturis, sicut de iride et serpens. Pestilentia, ipsa screams. Pestilentia est haec ambulabat mortuos. Sicut malus voodoo. Aenean a dolor vulnerum aperire accedunt, mortui iam vivam. Qui tardius moveri, sed in magna copia sint terribiles legionis. Alii missing oculis aliorum sicut serpere crabs nostram. Putridi odores aere implent.\rTremor est vivos magna. Expansis ulnis video missing carnem armis caeruleum in locis. A morbo amarus in auras. Nihil horum sagittis tincidunt, gelida portenta. The unleashed virus est, et iam mortui ambulabunt super terram. Souless mortuum oculos attonitos back zombies. An hoc incipere Clairvius Narcisse, an ante? Is bello mundi z?\rIn omni memoria patriae religionis sunt diri undead historiarum. Golums, zombies et fascinati. Maleficia! Vel a modern perhsaps morbi. A terrenti contagium. Forsitan illud Apocalypsi, vel malum poenae horrifying fecimus. Indeflexus monstra per plateas currere. Fit de nostra carne undead. Poenitentiam agite pœnitentiam! Vivens mortua sunt apud nos.\rUt fames cerebro enim carnis, viscera et organa viventium. Sicut spargit virus ad impetum, qui supersumus. Avium, canum, fugere ferae et infecti horrenda monstra. Videmus deformis horrenda daemonum. Panduntur portae inferi. Finis accedens sentio terrore perterritus et taedium. The horror, monstra significant finem. Terror sit unum superesse sentit, ut caro eaters caule nobis.', '', 'articles', '1', NULL, '2020-01-15 14:10:07', '2020-02-15 14:10:00'),
	(5, '2020-01-15 14:12:15', 'iblock', '5', 0, NULL, NULL, NULL, '=ID=5&EXTERNAL_ID=5&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-5', 'Article title 5', 'Apple pie dragée jelly muffin chocolate...\r\n\rApple pie dragée jelly muffin chocolate. Cheesecake candy canes cheesecake lemon drops apple pie pastry soufflé. Lemon drops gingerbread fruitcake croissant soufflé cheesecake powder bonbon cookie. Danish donut tart liquorice. Tart halvah dessert tiramisu. Bonbon jelly beans lemon drops chupa chups pastry. Gummies candy cake. Marshmallow powder muffin cotton candy. Brownie cupcake carrot cake chocolate. Croissant chocolate cake jujubes danish muffin caramels fruitcake carrot cake cookie. Gingerbread chocolate cake donut bear claw jujubes biscuit. Jelly-o candy canes chocolate bar dessert jelly marzipan dragée. Pudding chocolate cake bonbon pudding dessert icing ice cream.\rLollipop gingerbread gummi bears dragée tart toffee candy canes chocolate croissant. Gingerbread bonbon tiramisu jelly beans chocolate bar. Dragée topping muffin tiramisu sweet. Powder tart cake lollipop bear claw apple pie tart. Pie sweet roll candy danish danish pudding candy. Marshmallow sugar plum tart jelly beans bear claw cupcake chupa chups jelly dessert. Topping chupa chups chocolate cake liquorice. Jelly-o jujubes carrot cake cake donut lollipop candy canes bear claw. Cotton candy icing tootsie roll pastry. Sugar plum powder cookie candy jelly carrot cake cake pastry candy canes. Lemon drops pie chocolate cake candy canes chocolate cake. Gummi bears gummies wafer jelly-o carrot cake marzipan. Cake cheesecake candy canes gummi bears jelly.\rTopping tart gingerbread dessert. Chocolate cake dragée powder topping fruitcake. Liquorice apple pie wafer marshmallow biscuit donut halvah pudding cheesecake. Fruitcake jujubes tootsie roll bonbon. Liquorice muffin oat cake toffee chupa chups liquorice fruitcake. Macaroon soufflé jelly-o caramels donut cupcake pudding pie. Icing liquorice cheesecake sweet roll sweet roll dessert. Bonbon cheesecake candy cake. Topping soufflé chocolate carrot cake marshmallow macaroon tart croissant. Cheesecake cotton candy croissant caramels lollipop cake soufflé chocolate bar marzipan. Apple pie powder bear claw. Cupcake lollipop lemon drops pie wafer ice cream danish. Apple pie gingerbread jelly beans biscuit tart. Danish fruitcake fruitcake liquorice.\rPudding dragée gingerbread chupa chups brownie fruitcake fruitcake cheesecake pudding. Chocolate bar danish sweet roll cake sugar plum sesame snaps toffee liquorice. Cotton candy jelly candy canes biscuit chocolate sweet. Muffin tart marshmallow liquorice dessert soufflé chocolate bar tart cupcake. Muffin cake marzipan jujubes pie gingerbread. Cookie cupcake pastry cheesecake cheesecake lemon drops gummies. Candy pudding gummi bears. Muffin sweet roll sweet danish wafer cotton candy. Wafer tart chocolate bar. Tart toffee jelly beans biscuit powder. Cotton candy lollipop sugar plum bonbon sweet gummi bears. Bear claw tootsie roll lemon drops cotton candy cheesecake. Bonbon topping danish sweet roll macaroon lollipop. Ice cream danish brownie lollipop donut lemon drops biscuit dragée.\rTiramisu gummi bears pastry jelly. Sweet roll carrot cake liquorice bonbon chocolate tiramisu danish oat cake lemon drops. Chocolate cake wafer muffin chupa chups. Macaroon cupcake pastry brownie chocolate bar powder cheesecake marzipan. Pie chupa chups chocolate cake gummi bears fruitcake sesame snaps fruitcake biscuit cake. Pastry sugar plum muffin. Lollipop lemon drops bear claw topping lollipop cake. Marshmallow donut sugar plum lollipop marzipan. Bear claw candy canes cake gummi bears gummies jelly. Icing cake powder gummi bears cupcake. Carrot cake ice cream soufflé jelly beans. Sugar plum bear claw pie danish icing cupcake chocolate dessert tiramisu. Halvah sweet roll tiramisu sugar plum lollipop jujubes cupcake oat cake.', '', 'articles', '1', NULL, '2020-01-15 14:12:15', '2020-02-15 14:12:00'),
	(6, '2020-01-15 14:12:46', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-6', 'Article title 6', 'Yeah well, you shouldn\'t drink...\r\n\rYeah well, you shouldn\'t drink. Mayor Goldie Wilson, I like the sound of that. Oh hey, Biff, hey, guys, how are you doing? What do you mean you\'ve seen this, it\'s brand new. You\'re gonna be in the car with her.\rShit. Hello, hello, anybody home? Think, McFly, think. I gotta have time to get them re-typed. Do you realize what would happen if I hand in my reports in your handwriting. I\'ll get fired. You wouldn\'t want that to happen would you? Would you? Doc, you gotta help- Oh, then I wanna give her a call, I don\'t want her to worry about you. I don\'t know, I can\'t keep up with all of your boyfriends.\rExcuse me. Whoa, they really cleaned this place up, looks brand new. But I can\'t go to the dance, I\'ll miss my favorite television program, Science Fiction Theater. Will you take care of that? Watch this. Not me, the car, the car. My calculations are correct, when this baby hits eighty-eight miles per hour, your gonna see some serious shit. Watch this, watch this. Ha, what did I tell you, eighty-eight miles per hour. The temporal displacement occurred at exactly 1:20 a.m. and zero seconds.\rUh, well, actually, I figured since it wasn\'t due till Monday- I think it\'s terrible. Girls chasing boys. When I was your age I never chased a boy, or called a boy, or sat in a parked car with a boy. Look, I\'m just not ready to ask Lorraine out to the dance, and not you, nor anybody else on this planet is gonna make me change my mind. Wait a minute. Wait a minute, Doc. Are you telling me that it\'s 8:25? Good evening, I\'m Doctor Emmett Brown. I\'m standing on the parking lot of Twin Pines Mall. It\'s Saturday morning, October 26, 1985, 1:18 a.m. and this is temporal experiment number one. C\'mon, Einy, hey hey boy, get in there, that a boy, in you go, get down, that\'s it.\rThat\'s a Florence Nightingale effect. It happens in hospitals when nurses fall in love with their patients. Go to it, kid. Whoa, they really cleaned this place up, looks brand new. No. Aw yeah, everything is great. Don\'t pay any attention to him, he\'s in one of his moods. Sam, quit fiddling with that thing, come in here to dinner. Now let\'s see, you already know Lorraine, this is Milton, this is Sally, that\'s Toby, and over there in the playpen is little baby Joey.', '', 'articles', '1', NULL, '2020-01-15 14:12:46', '2020-02-15 14:12:00'),
	(7, '2020-01-15 14:13:28', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-7', 'Article title 7', 'Busey ipsum dolor sit amet...\r\n\rBusey ipsum dolor sit amet. Have you urinated? Have you drained your bladder? Are you free? Because if you haven\'t it will only come out later. I\'m giving you some information that your bodily fluids may penetrate your clothing fibre\'s without warning.You ever roasted doughnuts?\rYou ever roasted doughnuts?The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.Sometimes horses cough and fart at the same time, so stay out of the range of its butt muscle because a horses butt muscle is thick.\rGo with the feeling of the nature. Take it easy. Know why you\'re here. And remember to balance your internal energy with the environment.The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.\rIt\'s good to yell at people and tell people that you\'re from Tennesee, so that way you\'ll be safe.The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.\rDid you feel that? Look at me - I\'m not out of breath anymore!When you get lost in your imaginatory vagueness, your foresight will become a nimble vagrant.Go with the feeling of the nature. Take it easy. Know why you\'re here. And remember to balance your internal energy with the environment.', '', 'articles', '1', NULL, '2020-01-15 14:13:28', '2020-02-15 14:13:00'),
	(8, '2020-01-15 14:14:04', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-8', 'Article title 8', 'Listen to the silence...\r\n\rBusey ipsum dolor sit amet. Listen to the silence. And when the silence is deafening, you\'re in the center of your own universe.I wrestled a bear once. A 750lbs black bear.The magic Indian is a mysterious spiritual force, and we\'re going to Cathedral Rock, and that\'s the vortex of the heart.\rHave you urinated? Have you drained your bladder? Are you free? Because if you haven\'t it will only come out later. I\'m giving you some information that your bodily fluids may penetrate your clothing fibre\'s without warning.It\'s OK to get Rib-grease on your face, because you\'re allowing people to see that you\'re proud of these ribs.\rI would like to give you a backstage pass to my imagination.Listen to the silence. And when the silence is deafening, you\'re in the center of your own universe.Have you urinated? Have you drained your bladder? Are you free? Because if you haven\'t it will only come out later. I\'m giving you some information that your bodily fluids may penetrate your clothing fibre\'s without warning.\rThe magic Indian is a mysterious spiritual force, and we\'re going to Cathedral Rock, and that\'s the vortex of the heart.I wrestled a bear once. A 750lbs black bear.Listen to the silence. And when the silence is deafening, you\'re in the center of your own universe.\rYou gotta go through it to see there ain\'t nothing to it.It\'s good to yell at people and tell people that you\'re from Tennesee, so that way you\'ll be safe.The best way to communicate is compatible. Compatible communication is listening with open ears and an open mind, and not being fearful or judgemental about what you\'re hearing.', '', 'articles', '1', NULL, '2020-01-15 14:14:04', '2020-02-15 14:14:00'),
	(9, '2020-01-15 14:14:38', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-9', 'Article title 9', 'Veggies es bonus vobis, proinde vos postulo...\r\n\rVeggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.\rGumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.\rTurnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. Celery potato scallion desert raisin horseradish spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea. Brussels sprout coriander water chestnut gourd swiss chard wakame kohlrabi beetroot carrot watercress. Corn amaranth salsify bunya nuts nori azuki bean chickweed potato bell pepper artichoke.\rNori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley jícama salsify.\rCelery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard.\rPea horseradish azuki bean lettuce avocado asparagus okra. Kohlrabi radish okra azuki bean corn fava bean mustard tigernut jícama green bean celtuce collard greens avocado quandong fennel gumbo black-eyed pea. Grape silver beet watercress potato tigernut corn groundnut. Chickweed okra pea winter purslane coriander yarrow sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut pea tomato spring onion azuki bean gourd. Gumbo kakadu plum komatsuna black-eyed pea green bean zucchini gourd winter purslane silver beet rock melon radish asparagus spinach.\rBeetroot water spinach okra water chestnut ricebean pea catsear courgette summer purslane. Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. Dandelion zucchini burdock yarrow chickpea dandelion sorrel courgette turnip greens tigernut soybean radish artichoke wattle seed endive groundnut broccoli arugula.\rSoko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut. Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra sea lettuce broccoli celery lotus root carrot winter purslane turnip greens garlic. Jícama garlic courgette coriander radicchio plantain scallion cauliflower fava bean desert raisin spring onion chicory bunya nuts. Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.', '', 'articles', '1', NULL, '2020-01-15 14:14:38', '2020-02-15 14:14:00'),
	(10, '2020-01-15 14:15:15', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=articles&IBLOCK_ID=1&IBLOCK_CODE=articles&IBLOCK_EXTERNAL_ID=&CODE=article-title-10', 'Article title 10', 'Pommy ipsum Elementary my dear Watson...\r\n\rPommy ipsum Elementary my dear Watson ask your mother if down the village green a total jessie it\'s me peepers, smeg 10 pence mix naff off shepherd\'s pie. Got his end away throw a paddy conked him one on the nose a reet bobbydazzler, 10 pence mix half-inch it Union Jack, wind up challenge you to a duel. Middle class cobbles working class corgi ey up chuck on his tod, pants doing my head in upper class on the pull sling one\'s hook, terribly scones barmy nose rag. Half-inch it pennyboy Bad Wolf in the jacksy flabbergasted golly gosh bloke I could reet fancy a, pork dripping hedgehog because there was nothing on the gogglebox tally-ho the black death alright duck, corgi down the local football whizz mush a bottle of plonk.\rFancied a flutter apple and pears conkers rather scatterbrained challenge you to a duel it\'s nicked football ridiculous, fried toast scatterbrained Doctor Who bossy britches pants ey up duck. Have a gander rivetting stuff it\'s the bees knees utter shambles Amelia Pond flog a dead horse porky-pies spiffing chav, gutted willy that\'s ace morris dancers scally meat and two veg. Sling one\'s hook damn have a butcher\'s at this bent as a nine bob note big light Kate and Will superb, give you a bell you \'avin a laugh fish and chips sod\'s law the fuzz god save the queen darling, pulled a right corker doing my head in at the boozer is she \'avin a laugh absolute twoddle.\rDown the village green Moriarty jolly bowler hat bargain Betty, Essex girls scrote beefeater. Darling terribly lug hole sweet fanny adams and thus Kate and Will, daft cow sorted it cup of tea it\'s nicked. Victoria sponge cake 221B Baker Street bag egg\'s old boy had a barney with the inlaws picalilly a bottle of plonk cotton on, narky ey up chuck rambunctious bobby gravy cheese and chips down the local, Victoria sponge cake cockney ridicule I\'m off to Bedfordshire bovver boots. Essex girls the lakes brilliant bog roll football scones biscuits, wibbly-wobbly timey-wimey stuff round our gaff the chippy pillock scones a right toff fish and chips, skive real ale doofer off with her head scones.\rOld girl a reet bobbydazzler collywobbles scones loo one feels that, pot noodle up North knackered apple and pears. Superb nonsense driving a mini lost her marbles numpty ee bah gum baffled have a kip, throw a spanner in the works could murder a pint doolally bossy britches chav indeed. Chuffed cor blimey\' clock round the earhole black pudding gobsmacked it\'s cracking flags sling one\'s hook, a right royal knees up chaps Weeping Angels twiglets Amelia Pond guinness, ever so lovely bottled it devonshire cream tea blummin\' Essex girls. Completely crackers quid wellies a week on Sunday gosh golly well fit, what a doddle jolly good pie-eyed copper accordingly easy peasy, Prince Charles absolute on his tod off with her head cornish pasty.\rThe Hounds of Baskerville nosh taking the mick off t\'shop see a man about a dog, brown sauce argy-bargy clock round the earhole Southeners pulled a right corker, what a mug off with her head conkers. Dr. Watson pie-eyed flabbergasted what a load of cobblers have a gander guinness oopsy-daisies, bovver boots off the hook a right corker it\'s me peepers. A week on Sunday chap absolute nose rag flog, narky alright geezer.', '', 'articles', '1', NULL, '2020-01-15 14:15:15', '2020-02-15 14:15:00'),
	(11, '2020-01-15 14:28:54', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', 'RR Blog', '', '', '', '', NULL, NULL, NULL),
	(12, '2020-01-19 13:46:16', 'main', 's1|/contact-us.php', 0, NULL, NULL, NULL, '/contact-us.php', 'Contact us', '', '', '', '', NULL, NULL, NULL),
	(13, '2020-01-19 13:13:50', 'main', 's1|/success.php', 0, NULL, NULL, NULL, '/success.php', 'Сообщение отправлено', '', '', '', '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_freq
CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_content_freq: ~0 rows (приблизительно)
DELETE FROM `b_search_content_freq`;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_param
CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_content_param: ~0 rows (приблизительно)
DELETE FROM `b_search_content_param`;
/*!40000 ALTER TABLE `b_search_content_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_param` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_right
CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_content_right: ~18 rows (приблизительно)
DELETE FROM `b_search_content_right`;
/*!40000 ALTER TABLE `b_search_content_right` DISABLE KEYS */;
INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
	(1, 'G1'),
	(1, 'G2'),
	(2, 'G1'),
	(2, 'G2'),
	(3, 'G1'),
	(3, 'G2'),
	(4, 'G1'),
	(4, 'G2'),
	(5, 'G1'),
	(5, 'G2'),
	(6, 'G1'),
	(6, 'G2'),
	(7, 'G1'),
	(7, 'G2'),
	(8, 'G1'),
	(8, 'G2'),
	(9, 'G1'),
	(9, 'G2'),
	(10, 'G1'),
	(10, 'G2'),
	(11, 'G2'),
	(12, 'G2'),
	(13, 'G2');
/*!40000 ALTER TABLE `b_search_content_right` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_site
CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_content_site: ~8 rows (приблизительно)
DELETE FROM `b_search_content_site`;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
	(1, 's1', ''),
	(2, 's1', ''),
	(3, 's1', ''),
	(4, 's1', ''),
	(5, 's1', ''),
	(6, 's1', ''),
	(7, 's1', ''),
	(8, 's1', ''),
	(9, 's1', ''),
	(10, 's1', ''),
	(11, 's1', ''),
	(12, 's1', ''),
	(13, 's1', '');
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_stem
CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы forms_bitrix.b_search_content_stem: ~1 736 rows (приблизительно)
DELETE FROM `b_search_content_stem`;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
	(1, 'ru', 1, 0.1078, 1),
	(1, 'ru', 2, 0.1078, 2),
	(1, 'ru', 3, 0.3418, 362.875),
	(1, 'ru', 4, 0.2504, 219.25),
	(1, 'ru', 5, 0.2787, 123),
	(1, 'ru', 6, 0.4313, 503.867),
	(1, 'ru', 7, 0.4313, 492.667),
	(1, 'ru', 8, 0.2787, 281.6),
	(1, 'ru', 9, 0.3418, 521.25),
	(1, 'ru', 10, 0.3418, 347.375),
	(1, 'ru', 11, 0.4581, 469.556),
	(1, 'ru', 12, 0.1078, 31),
	(1, 'ru', 13, 0.1078, 32),
	(1, 'ru', 14, 0.2157, 242.333),
	(1, 'ru', 15, 0.1078, 34),
	(1, 'ru', 16, 0.373, 488.2),
	(1, 'ru', 17, 0.1078, 36),
	(1, 'ru', 18, 0.373, 545.9),
	(1, 'ru', 19, 0.1078, 38),
	(1, 'ru', 20, 0.3235, 529.286),
	(1, 'ru', 21, 0.1078, 40),
	(1, 'ru', 22, 0.1709, 80),
	(1, 'ru', 23, 0.2787, 306.2),
	(1, 'ru', 24, 0.1078, 48),
	(1, 'ru', 25, 0.3582, 609.333),
	(1, 'ru', 26, 0.3235, 663),
	(1, 'ru', 27, 0.4105, 497.385),
	(1, 'ru', 28, 0.3582, 705.222),
	(1, 'ru', 29, 0.3027, 390.333),
	(1, 'ru', 30, 0.2787, 406.6),
	(1, 'ru', 31, 0.3027, 260.5),
	(1, 'ru', 32, 0.1709, 247),
	(1, 'ru', 33, 0.3027, 640.667),
	(1, 'ru', 34, 0.2157, 302.667),
	(1, 'ru', 35, 0.3418, 616.125),
	(1, 'ru', 36, 0.1709, 170.5),
	(1, 'ru', 37, 0.3235, 617),
	(1, 'ru', 38, 0.3418, 567.25),
	(1, 'ru', 39, 0.3027, 489.667),
	(1, 'ru', 40, 0.2157, 528.333),
	(1, 'ru', 41, 0.3235, 404.857),
	(1, 'ru', 42, 0.4105, 481.154),
	(1, 'ru', 43, 0.1078, 88),
	(1, 'ru', 44, 0.3027, 549.667),
	(1, 'ru', 45, 0.2787, 494.4),
	(1, 'ru', 46, 0.2504, 469.75),
	(1, 'ru', 47, 0.2504, 357.25),
	(1, 'ru', 48, 0.2787, 456.8),
	(1, 'ru', 49, 0.3027, 487.5),
	(1, 'ru', 50, 0.3418, 477),
	(1, 'ru', 51, 0.1078, 121),
	(1, 'ru', 52, 0.1709, 329),
	(1, 'ru', 53, 0.3235, 530.286),
	(1, 'ru', 54, 0.1709, 477.5),
	(1, 'ru', 55, 0.1078, 127),
	(1, 'ru', 56, 0.2157, 629),
	(1, 'ru', 57, 0.3418, 375.875),
	(1, 'ru', 58, 0.2787, 400),
	(1, 'ru', 59, 0.3235, 652.429),
	(1, 'ru', 60, 0.2504, 371.25),
	(1, 'ru', 61, 0.2787, 386.8),
	(1, 'ru', 62, 0.2157, 328.667),
	(1, 'ru', 63, 0.2157, 378.333),
	(1, 'ru', 64, 0.2787, 454.8),
	(1, 'ru', 65, 0.1709, 325.5),
	(1, 'ru', 66, 0.2504, 562),
	(1, 'ru', 67, 0.2787, 464.6),
	(1, 'ru', 68, 0.1709, 421.5),
	(1, 'ru', 69, 0.2157, 384.667),
	(1, 'ru', 70, 0.1709, 499),
	(1, 'ru', 71, 0.1709, 343),
	(1, 'ru', 72, 0.1709, 523.5),
	(1, 'ru', 73, 0.2157, 439.333),
	(1, 'ru', 74, 0.2504, 402.75),
	(1, 'ru', 75, 0.373, 502.6),
	(1, 'ru', 76, 0.2157, 672),
	(1, 'ru', 77, 0.2504, 442.25),
	(1, 'ru', 78, 0.2157, 539.667),
	(1, 'ru', 79, 0.2504, 284),
	(1, 'ru', 80, 0.3027, 639.167),
	(1, 'ru', 81, 0.1709, 404.5),
	(1, 'ru', 82, 0.3866, 691.273),
	(1, 'ru', 83, 0.3418, 534.25),
	(1, 'ru', 84, 0.1078, 213),
	(1, 'ru', 85, 0.3235, 457.714),
	(1, 'ru', 86, 0.1078, 240),
	(1, 'ru', 87, 0.1709, 461.5),
	(1, 'ru', 88, 0.2787, 580.2),
	(1, 'ru', 113, 0.1078, 1024),
	(1, 'ru', 114, 0.2787, 627.4),
	(1, 'ru', 244, 0.2787, 618),
	(1, 'ru', 245, 0.1709, 511.5),
	(1, 'ru', 246, 0.1078, 274),
	(1, 'ru', 247, 0.2157, 631.667),
	(1, 'ru', 248, 0.2504, 734),
	(1, 'ru', 249, 0.1078, 278),
	(1, 'ru', 250, 0.2504, 715.75),
	(1, 'ru', 251, 0.2787, 631.2),
	(1, 'ru', 252, 0.1709, 296),
	(1, 'ru', 253, 0.1078, 291),
	(1, 'ru', 254, 0.2504, 588),
	(1, 'ru', 255, 0.2787, 700),
	(1, 'ru', 256, 0.2787, 655.6),
	(1, 'ru', 257, 0.1709, 324),
	(1, 'ru', 258, 0.1078, 322),
	(1, 'ru', 259, 0.2504, 473.75),
	(1, 'ru', 260, 0.1078, 324),
	(1, 'ru', 261, 0.2157, 575.333),
	(1, 'ru', 262, 0.1078, 334),
	(1, 'ru', 263, 0.3582, 671.889),
	(1, 'ru', 264, 0.3027, 681.167),
	(1, 'ru', 265, 0.3418, 681.625),
	(1, 'ru', 266, 0.1709, 536.5),
	(1, 'ru', 267, 0.1709, 537.5),
	(1, 'ru', 268, 0.1709, 538.5),
	(1, 'ru', 269, 0.1709, 539.5),
	(1, 'ru', 270, 0.1078, 358),
	(1, 'ru', 271, 0.1709, 564.5),
	(1, 'ru', 272, 0.2787, 682),
	(1, 'ru', 273, 0.2504, 640.75),
	(1, 'ru', 274, 0.2504, 592.75),
	(1, 'ru', 275, 0.1078, 407),
	(1, 'ru', 276, 0.2504, 621.25),
	(1, 'ru', 277, 0.1709, 508),
	(1, 'ru', 278, 0.1078, 415),
	(1, 'ru', 279, 0.1078, 427),
	(1, 'ru', 280, 0.2157, 625.333),
	(1, 'ru', 281, 0.2157, 752),
	(1, 'ru', 282, 0.2157, 574.333),
	(1, 'ru', 283, 0.1078, 472),
	(1, 'ru', 284, 0.1709, 588.5),
	(1, 'ru', 285, 0.2504, 635),
	(1, 'ru', 286, 0.1078, 478),
	(1, 'ru', 287, 0.2157, 766.667),
	(1, 'ru', 288, 0.1078, 510),
	(1, 'ru', 289, 0.1709, 651.5),
	(1, 'ru', 290, 0.1709, 653.5),
	(1, 'ru', 291, 0.2504, 757.25),
	(1, 'ru', 292, 0.1709, 618.5),
	(1, 'ru', 293, 0.2157, 808),
	(1, 'ru', 294, 0.1078, 605),
	(1, 'ru', 295, 0.2157, 753.333),
	(1, 'ru', 296, 0.2157, 833),
	(1, 'ru', 297, 0.1078, 729),
	(1, 'ru', 298, 0.1078, 730),
	(1, 'ru', 299, 0.1078, 731),
	(1, 'ru', 300, 0.1709, 840),
	(1, 'ru', 301, 0.1078, 819),
	(1, 'ru', 302, 0.2157, 907.333),
	(1, 'ru', 303, 0.1709, 911),
	(1, 'ru', 304, 0.1709, 939.5),
	(1, 'ru', 305, 0.1078, 902),
	(1, 'ru', 306, 0.1078, 903),
	(1, 'ru', 307, 0.1078, 969),
	(1, 'ru', 308, 0.1078, 986),
	(1, 'ru', 309, 0.1078, 999),
	(1, 'ru', 310, 0.1078, 1035),
	(2, 'ru', 1, 0.1147, 1),
	(2, 'ru', 2, 0.1147, 2),
	(2, 'ru', 4, 0.1818, 15.5),
	(2, 'ru', 5, 0.1147, 231),
	(2, 'ru', 6, 0.1818, 352),
	(2, 'ru', 11, 0.1147, 254),
	(2, 'ru', 16, 0.1818, 601.5),
	(2, 'ru', 18, 0.3441, 425.286),
	(2, 'ru', 20, 0.1818, 279),
	(2, 'ru', 33, 0.1147, 553),
	(2, 'ru', 40, 0.1147, 229),
	(2, 'ru', 50, 0.2294, 326),
	(2, 'ru', 57, 0.2663, 330.75),
	(2, 'ru', 84, 0.1147, 31),
	(2, 'ru', 89, 0.2965, 183),
	(2, 'ru', 90, 0.1818, 16.5),
	(2, 'ru', 91, 0.1818, 17.5),
	(2, 'ru', 92, 0.2294, 229.667),
	(2, 'ru', 93, 0.1818, 19.5),
	(2, 'ru', 94, 0.1147, 32),
	(2, 'ru', 95, 0.1147, 33),
	(2, 'ru', 96, 0.1818, 255.5),
	(2, 'ru', 97, 0.2294, 240.667),
	(2, 'ru', 98, 0.322, 243.667),
	(2, 'ru', 99, 0.1818, 275.5),
	(2, 'ru', 100, 0.1147, 43),
	(2, 'ru', 101, 0.1147, 44),
	(2, 'ru', 102, 0.1147, 45),
	(2, 'ru', 103, 0.1147, 46),
	(2, 'ru', 104, 0.1147, 52),
	(2, 'ru', 105, 0.2965, 406.6),
	(2, 'ru', 106, 0.1818, 193),
	(2, 'ru', 107, 0.1818, 249),
	(2, 'ru', 108, 0.1818, 269),
	(2, 'ru', 109, 0.1147, 65),
	(2, 'ru', 110, 0.1147, 66),
	(2, 'ru', 111, 0.2965, 359.6),
	(2, 'ru', 112, 0.1147, 68),
	(2, 'ru', 113, 0.1147, 69),
	(2, 'ru', 114, 0.1147, 70),
	(2, 'ru', 115, 0.1147, 76),
	(2, 'ru', 116, 0.1147, 77),
	(2, 'ru', 117, 0.1147, 78),
	(2, 'ru', 118, 0.1818, 157),
	(2, 'ru', 119, 0.1147, 80),
	(2, 'ru', 120, 0.1147, 81),
	(2, 'ru', 121, 0.1147, 82),
	(2, 'ru', 122, 0.1147, 83),
	(2, 'ru', 123, 0.2663, 452.25),
	(2, 'ru', 124, 0.1147, 85),
	(2, 'ru', 125, 0.1147, 86),
	(2, 'ru', 126, 0.1147, 87),
	(2, 'ru', 127, 0.1147, 88),
	(2, 'ru', 128, 0.1147, 89),
	(2, 'ru', 129, 0.1147, 90),
	(2, 'ru', 130, 0.1818, 325),
	(2, 'ru', 131, 0.2294, 305),
	(2, 'ru', 132, 0.1818, 148),
	(2, 'ru', 133, 0.1818, 286),
	(2, 'ru', 134, 0.1147, 100),
	(2, 'ru', 135, 0.1147, 101),
	(2, 'ru', 136, 0.1147, 102),
	(2, 'ru', 137, 0.1147, 103),
	(2, 'ru', 138, 0.1147, 104),
	(2, 'ru', 139, 0.1147, 105),
	(2, 'ru', 140, 0.2294, 376.667),
	(2, 'ru', 141, 0.2663, 410.25),
	(2, 'ru', 142, 0.2294, 163.667),
	(2, 'ru', 143, 0.1147, 114),
	(2, 'ru', 144, 0.2294, 383.333),
	(2, 'ru', 145, 0.1147, 116),
	(2, 'ru', 146, 0.1147, 117),
	(2, 'ru', 147, 0.1818, 165.5),
	(2, 'ru', 148, 0.1147, 119),
	(2, 'ru', 149, 0.1818, 218),
	(2, 'ru', 150, 0.2663, 399.25),
	(2, 'ru', 151, 0.1147, 127),
	(2, 'ru', 152, 0.1147, 128),
	(2, 'ru', 153, 0.1147, 129),
	(2, 'ru', 154, 0.1147, 130),
	(2, 'ru', 155, 0.1147, 131),
	(2, 'ru', 156, 0.1147, 132),
	(2, 'ru', 157, 0.1147, 133),
	(2, 'ru', 158, 0.1147, 134),
	(2, 'ru', 159, 0.1147, 135),
	(2, 'ru', 160, 0.1147, 142),
	(2, 'ru', 161, 0.2294, 308.333),
	(2, 'ru', 162, 0.1818, 288),
	(2, 'ru', 163, 0.2965, 277.6),
	(2, 'ru', 164, 0.1818, 187.5),
	(2, 'ru', 165, 0.1147, 154),
	(2, 'ru', 166, 0.1818, 397),
	(2, 'ru', 167, 0.1147, 162),
	(2, 'ru', 168, 0.1147, 163),
	(2, 'ru', 169, 0.1147, 164),
	(2, 'ru', 170, 0.1147, 165),
	(2, 'ru', 238, 0.1147, 485),
	(2, 'ru', 254, 0.1147, 455),
	(2, 'ru', 266, 0.1147, 171),
	(2, 'ru', 271, 0.1147, 343),
	(2, 'ru', 301, 0.2294, 288.333),
	(2, 'ru', 303, 0.1147, 548),
	(2, 'ru', 311, 0.1147, 172),
	(2, 'ru', 312, 0.1818, 396),
	(2, 'ru', 313, 0.322, 351.667),
	(2, 'ru', 314, 0.1147, 175),
	(2, 'ru', 315, 0.1147, 177),
	(2, 'ru', 316, 0.1147, 178),
	(2, 'ru', 317, 0.1147, 179),
	(2, 'ru', 318, 0.1147, 183),
	(2, 'ru', 319, 0.1147, 184),
	(2, 'ru', 320, 0.1147, 185),
	(2, 'ru', 321, 0.1147, 187),
	(2, 'ru', 322, 0.1818, 200),
	(2, 'ru', 323, 0.1147, 194),
	(2, 'ru', 324, 0.1147, 195),
	(2, 'ru', 325, 0.1147, 197),
	(2, 'ru', 326, 0.1147, 199),
	(2, 'ru', 327, 0.1147, 200),
	(2, 'ru', 328, 0.1147, 201),
	(2, 'ru', 329, 0.1147, 209),
	(2, 'ru', 330, 0.1147, 210),
	(2, 'ru', 331, 0.1147, 211),
	(2, 'ru', 332, 0.1147, 212),
	(2, 'ru', 333, 0.1147, 220),
	(2, 'ru', 334, 0.1147, 221),
	(2, 'ru', 335, 0.1147, 232),
	(2, 'ru', 336, 0.1818, 441),
	(2, 'ru', 337, 0.1147, 236),
	(2, 'ru', 338, 0.1818, 350.5),
	(2, 'ru', 339, 0.1147, 238),
	(2, 'ru', 340, 0.1818, 300.5),
	(2, 'ru', 341, 0.1818, 300),
	(2, 'ru', 342, 0.1147, 241),
	(2, 'ru', 343, 0.1147, 242),
	(2, 'ru', 344, 0.1147, 249),
	(2, 'ru', 345, 0.1147, 250),
	(2, 'ru', 346, 0.1147, 251),
	(2, 'ru', 347, 0.1147, 252),
	(2, 'ru', 348, 0.1147, 253),
	(2, 'ru', 349, 0.1147, 257),
	(2, 'ru', 350, 0.1147, 258),
	(2, 'ru', 351, 0.1147, 259),
	(2, 'ru', 352, 0.1147, 260),
	(2, 'ru', 353, 0.1147, 261),
	(2, 'ru', 354, 0.1147, 267),
	(2, 'ru', 355, 0.1818, 291.5),
	(2, 'ru', 356, 0.1147, 269),
	(2, 'ru', 357, 0.1147, 270),
	(2, 'ru', 358, 0.1147, 272),
	(2, 'ru', 359, 0.1147, 273),
	(2, 'ru', 360, 0.1147, 274),
	(2, 'ru', 361, 0.1147, 280),
	(2, 'ru', 362, 0.1147, 281),
	(2, 'ru', 363, 0.1147, 282),
	(2, 'ru', 364, 0.1147, 283),
	(2, 'ru', 365, 0.1818, 302),
	(2, 'ru', 366, 0.1147, 285),
	(2, 'ru', 367, 0.1147, 286),
	(2, 'ru', 368, 0.1147, 287),
	(2, 'ru', 369, 0.1147, 288),
	(2, 'ru', 370, 0.1147, 289),
	(2, 'ru', 371, 0.1147, 296),
	(2, 'ru', 372, 0.1147, 297),
	(2, 'ru', 373, 0.1147, 298),
	(2, 'ru', 374, 0.1147, 300),
	(2, 'ru', 375, 0.1147, 301),
	(2, 'ru', 376, 0.1147, 308),
	(2, 'ru', 377, 0.1147, 309),
	(2, 'ru', 378, 0.1147, 310),
	(2, 'ru', 379, 0.1147, 311),
	(2, 'ru', 380, 0.1147, 312),
	(2, 'ru', 381, 0.1147, 313),
	(2, 'ru', 382, 0.1147, 314),
	(2, 'ru', 383, 0.1147, 317),
	(2, 'ru', 384, 0.1147, 318),
	(2, 'ru', 385, 0.1147, 319),
	(2, 'ru', 386, 0.1147, 321),
	(2, 'ru', 387, 0.1147, 322),
	(2, 'ru', 388, 0.1147, 324),
	(2, 'ru', 389, 0.1147, 330),
	(2, 'ru', 390, 0.1147, 332),
	(2, 'ru', 391, 0.1147, 333),
	(2, 'ru', 392, 0.1147, 335),
	(2, 'ru', 393, 0.1147, 341),
	(2, 'ru', 394, 0.1147, 342),
	(2, 'ru', 395, 0.1147, 344),
	(2, 'ru', 396, 0.1147, 346),
	(2, 'ru', 397, 0.1147, 347),
	(2, 'ru', 398, 0.1147, 348),
	(2, 'ru', 399, 0.1147, 349),
	(2, 'ru', 400, 0.1147, 356),
	(2, 'ru', 401, 0.1147, 363),
	(2, 'ru', 402, 0.1147, 364),
	(2, 'ru', 403, 0.1147, 365),
	(2, 'ru', 404, 0.1147, 371),
	(2, 'ru', 405, 0.1147, 372),
	(2, 'ru', 406, 0.1147, 373),
	(2, 'ru', 407, 0.1147, 374),
	(2, 'ru', 408, 0.1147, 375),
	(2, 'ru', 409, 0.1147, 376),
	(2, 'ru', 410, 0.1147, 377),
	(2, 'ru', 411, 0.1818, 448),
	(2, 'ru', 412, 0.1147, 379),
	(2, 'ru', 413, 0.1147, 380),
	(2, 'ru', 414, 0.1147, 387),
	(2, 'ru', 415, 0.1147, 389),
	(2, 'ru', 416, 0.1147, 390),
	(2, 'ru', 417, 0.1147, 391),
	(2, 'ru', 418, 0.1147, 392),
	(2, 'ru', 419, 0.1818, 405),
	(2, 'ru', 420, 0.1818, 406),
	(2, 'ru', 421, 0.1147, 396),
	(2, 'ru', 422, 0.1147, 402),
	(2, 'ru', 423, 0.1147, 403),
	(2, 'ru', 424, 0.1147, 404),
	(2, 'ru', 425, 0.1147, 412),
	(2, 'ru', 426, 0.1147, 413),
	(2, 'ru', 427, 0.1147, 414),
	(2, 'ru', 428, 0.1147, 415),
	(2, 'ru', 429, 0.1147, 416),
	(2, 'ru', 430, 0.1147, 419),
	(2, 'ru', 431, 0.1818, 476),
	(2, 'ru', 432, 0.1147, 421),
	(2, 'ru', 433, 0.1147, 423),
	(2, 'ru', 434, 0.1147, 429),
	(2, 'ru', 435, 0.1147, 431),
	(2, 'ru', 436, 0.1147, 433),
	(2, 'ru', 437, 0.1147, 434),
	(2, 'ru', 438, 0.1147, 435),
	(2, 'ru', 439, 0.1147, 448),
	(2, 'ru', 440, 0.1147, 449),
	(2, 'ru', 441, 0.1147, 451),
	(2, 'ru', 442, 0.1147, 452),
	(2, 'ru', 443, 0.1147, 453),
	(2, 'ru', 444, 0.1147, 454),
	(2, 'ru', 445, 0.1147, 462),
	(2, 'ru', 446, 0.1147, 470),
	(2, 'ru', 447, 0.1147, 471),
	(2, 'ru', 448, 0.1147, 472),
	(2, 'ru', 449, 0.1147, 476),
	(2, 'ru', 450, 0.1147, 479),
	(2, 'ru', 451, 0.1147, 480),
	(2, 'ru', 452, 0.1147, 481),
	(2, 'ru', 453, 0.1147, 482),
	(2, 'ru', 454, 0.1147, 483),
	(2, 'ru', 455, 0.1147, 484),
	(2, 'ru', 456, 0.1147, 491),
	(2, 'ru', 457, 0.1147, 492),
	(2, 'ru', 458, 0.1147, 493),
	(2, 'ru', 459, 0.1147, 495),
	(2, 'ru', 460, 0.1147, 497),
	(2, 'ru', 461, 0.1147, 498),
	(2, 'ru', 462, 0.1147, 499),
	(2, 'ru', 463, 0.1147, 505),
	(2, 'ru', 464, 0.1147, 507),
	(2, 'ru', 465, 0.1147, 508),
	(2, 'ru', 466, 0.1147, 516),
	(2, 'ru', 467, 0.1147, 517),
	(2, 'ru', 468, 0.1147, 519),
	(2, 'ru', 469, 0.1147, 520),
	(2, 'ru', 470, 0.1147, 521),
	(2, 'ru', 471, 0.1147, 522),
	(2, 'ru', 472, 0.1147, 524),
	(2, 'ru', 473, 0.1147, 530),
	(2, 'ru', 474, 0.1147, 531),
	(2, 'ru', 475, 0.1147, 533),
	(2, 'ru', 476, 0.1147, 534),
	(2, 'ru', 477, 0.1147, 535),
	(2, 'ru', 478, 0.1147, 536),
	(2, 'ru', 479, 0.1147, 538),
	(2, 'ru', 480, 0.1147, 545),
	(2, 'ru', 481, 0.1147, 549),
	(2, 'ru', 482, 0.1147, 550),
	(2, 'ru', 483, 0.1147, 554),
	(2, 'ru', 484, 0.1147, 555),
	(2, 'ru', 485, 0.1147, 556),
	(2, 'ru', 486, 0.1147, 558),
	(2, 'ru', 487, 0.1147, 566),
	(2, 'ru', 488, 0.1147, 568),
	(2, 'ru', 489, 0.1147, 569),
	(2, 'ru', 490, 0.1147, 571),
	(2, 'ru', 491, 0.1147, 573),
	(2, 'ru', 492, 0.1147, 579),
	(2, 'ru', 493, 0.1147, 581),
	(2, 'ru', 494, 0.1147, 582),
	(2, 'ru', 495, 0.1147, 583),
	(2, 'ru', 496, 0.1147, 584),
	(2, 'ru', 497, 0.1147, 585),
	(2, 'ru', 498, 0.1147, 586),
	(2, 'ru', 499, 0.1147, 588),
	(2, 'ru', 500, 0.1818, 594.5),
	(2, 'ru', 501, 0.1147, 596),
	(2, 'ru', 502, 0.1147, 597),
	(2, 'ru', 503, 0.1147, 598),
	(2, 'ru', 504, 0.1147, 599),
	(2, 'ru', 505, 0.1147, 601),
	(2, 'ru', 506, 0.1147, 607),
	(2, 'ru', 507, 0.1147, 609),
	(2, 'ru', 508, 0.1147, 610),
	(2, 'ru', 509, 0.1147, 611),
	(2, 'ru', 510, 0.1147, 617),
	(2, 'ru', 511, 0.1147, 618),
	(2, 'ru', 512, 0.1147, 620),
	(2, 'ru', 513, 0.1147, 621),
	(2, 'ru', 514, 0.1147, 622),
	(2, 'ru', 515, 0.1147, 624),
	(2, 'ru', 516, 0.1147, 625),
	(2, 'ru', 517, 0.1147, 626),
	(2, 'ru', 518, 0.1147, 627),
	(2, 'ru', 519, 0.1147, 628),
	(2, 'ru', 520, 0.1147, 629),
	(2, 'ru', 521, 0.1147, 630),
	(2, 'ru', 522, 0.1147, 631),
	(2, 'ru', 523, 0.1147, 640),
	(2, 'ru', 524, 0.1147, 641),
	(2, 'ru', 525, 0.1147, 642),
	(2, 'ru', 526, 0.1147, 651),
	(2, 'ru', 527, 0.1147, 653),
	(2, 'ru', 528, 0.1147, 655),
	(2, 'ru', 529, 0.1147, 657),
	(2, 'ru', 530, 0.1147, 658),
	(2, 'ru', 531, 0.1147, 659),
	(2, 'ru', 532, 0.1147, 660),
	(2, 'ru', 533, 0.1147, 661),
	(3, 'ru', 1, 0.1239, 1),
	(3, 'ru', 2, 0.1239, 2),
	(3, 'ru', 5, 0.1239, 180),
	(3, 'ru', 6, 0.1964, 273),
	(3, 'ru', 11, 0.1239, 195),
	(3, 'ru', 16, 0.1964, 459.5),
	(3, 'ru', 18, 0.3478, 351.5),
	(3, 'ru', 20, 0.1964, 214.5),
	(3, 'ru', 33, 0.1239, 421),
	(3, 'ru', 40, 0.1239, 178),
	(3, 'ru', 50, 0.2478, 256.667),
	(3, 'ru', 57, 0.2877, 254),
	(3, 'ru', 84, 0.1964, 19),
	(3, 'ru', 90, 0.1964, 16),
	(3, 'ru', 91, 0.1964, 17),
	(3, 'ru', 93, 0.1964, 18),
	(3, 'ru', 96, 0.2478, 137),
	(3, 'ru', 97, 0.2877, 143.5),
	(3, 'ru', 98, 0.3203, 153.8),
	(3, 'ru', 99, 0.1964, 216),
	(3, 'ru', 101, 0.1239, 40),
	(3, 'ru', 102, 0.1239, 41),
	(3, 'ru', 103, 0.1239, 42),
	(3, 'ru', 104, 0.1239, 48),
	(3, 'ru', 106, 0.1964, 151.5),
	(3, 'ru', 107, 0.1964, 197.5),
	(3, 'ru', 108, 0.1964, 214),
	(3, 'ru', 111, 0.2877, 225.25),
	(3, 'ru', 113, 0.1239, 61),
	(3, 'ru', 114, 0.1239, 62),
	(3, 'ru', 115, 0.1239, 68),
	(3, 'ru', 117, 0.1239, 69),
	(3, 'ru', 118, 0.1239, 70),
	(3, 'ru', 119, 0.1239, 71),
	(3, 'ru', 120, 0.1239, 72),
	(3, 'ru', 123, 0.2877, 348.25),
	(3, 'ru', 124, 0.1239, 74),
	(3, 'ru', 127, 0.1239, 75),
	(3, 'ru', 128, 0.1239, 76),
	(3, 'ru', 129, 0.1239, 77),
	(3, 'ru', 130, 0.1964, 252),
	(3, 'ru', 131, 0.2478, 237.667),
	(3, 'ru', 138, 0.1239, 87),
	(3, 'ru', 139, 0.1239, 88),
	(3, 'ru', 141, 0.2478, 284.333),
	(3, 'ru', 142, 0.1964, 133.5),
	(3, 'ru', 143, 0.1239, 96),
	(3, 'ru', 146, 0.1239, 97),
	(3, 'ru', 147, 0.1964, 131),
	(3, 'ru', 148, 0.1239, 99),
	(3, 'ru', 149, 0.1964, 171),
	(3, 'ru', 150, 0.1964, 354.5),
	(3, 'ru', 153, 0.1239, 107),
	(3, 'ru', 154, 0.1239, 108),
	(3, 'ru', 155, 0.1239, 109),
	(3, 'ru', 156, 0.1239, 110),
	(3, 'ru', 157, 0.1239, 111),
	(3, 'ru', 160, 0.1239, 118),
	(3, 'ru', 161, 0.2478, 240.667),
	(3, 'ru', 162, 0.3203, 155.8),
	(3, 'ru', 163, 0.3203, 216.4),
	(3, 'ru', 164, 0.1964, 149.5),
	(3, 'ru', 166, 0.1964, 308.5),
	(3, 'ru', 171, 0.1239, 85),
	(3, 'ru', 172, 0.1239, 86),
	(3, 'ru', 173, 0.1239, 106),
	(3, 'ru', 174, 0.1239, 129),
	(3, 'ru', 254, 0.1239, 353),
	(3, 'ru', 266, 0.1239, 136),
	(3, 'ru', 271, 0.1239, 264),
	(3, 'ru', 301, 0.2478, 222.333),
	(3, 'ru', 303, 0.1239, 419),
	(3, 'ru', 311, 0.1239, 137),
	(3, 'ru', 314, 0.1239, 138),
	(3, 'ru', 316, 0.1239, 140),
	(3, 'ru', 317, 0.1239, 141),
	(3, 'ru', 320, 0.1239, 144),
	(3, 'ru', 321, 0.1239, 146),
	(3, 'ru', 322, 0.1964, 156),
	(3, 'ru', 327, 0.1239, 153),
	(3, 'ru', 328, 0.1239, 154),
	(3, 'ru', 330, 0.1239, 162),
	(3, 'ru', 332, 0.1239, 163),
	(3, 'ru', 336, 0.1239, 496),
	(3, 'ru', 337, 0.1239, 181),
	(3, 'ru', 338, 0.1239, 361),
	(3, 'ru', 339, 0.1239, 183),
	(3, 'ru', 340, 0.1964, 231.5),
	(3, 'ru', 341, 0.1964, 231.5),
	(3, 'ru', 342, 0.1239, 186),
	(3, 'ru', 344, 0.1239, 193),
	(3, 'ru', 345, 0.1239, 194),
	(3, 'ru', 349, 0.1239, 198),
	(3, 'ru', 350, 0.1239, 199),
	(3, 'ru', 351, 0.1239, 200),
	(3, 'ru', 353, 0.1239, 201),
	(3, 'ru', 354, 0.1239, 207),
	(3, 'ru', 355, 0.1964, 224.5),
	(3, 'ru', 356, 0.1239, 209),
	(3, 'ru', 357, 0.1239, 210),
	(3, 'ru', 358, 0.1239, 212),
	(3, 'ru', 359, 0.1239, 213),
	(3, 'ru', 360, 0.1239, 214),
	(3, 'ru', 361, 0.1239, 220),
	(3, 'ru', 363, 0.1239, 221),
	(3, 'ru', 367, 0.1239, 222),
	(3, 'ru', 368, 0.1239, 223),
	(3, 'ru', 373, 0.1239, 229),
	(3, 'ru', 375, 0.1239, 231),
	(3, 'ru', 376, 0.1239, 238),
	(3, 'ru', 381, 0.1239, 239),
	(3, 'ru', 383, 0.1239, 243),
	(3, 'ru', 387, 0.1239, 244),
	(3, 'ru', 388, 0.1239, 246),
	(3, 'ru', 391, 0.1239, 254),
	(3, 'ru', 392, 0.1239, 256),
	(3, 'ru', 393, 0.1239, 262),
	(3, 'ru', 394, 0.1239, 263),
	(3, 'ru', 395, 0.1239, 265),
	(3, 'ru', 397, 0.1239, 266),
	(3, 'ru', 399, 0.1239, 267),
	(3, 'ru', 400, 0.1239, 274),
	(3, 'ru', 401, 0.1239, 280),
	(3, 'ru', 402, 0.1239, 281),
	(3, 'ru', 403, 0.1239, 282),
	(3, 'ru', 404, 0.1239, 288),
	(3, 'ru', 405, 0.1239, 289),
	(3, 'ru', 407, 0.1239, 290),
	(3, 'ru', 408, 0.1239, 291),
	(3, 'ru', 410, 0.1239, 292),
	(3, 'ru', 414, 0.1239, 300),
	(3, 'ru', 418, 0.1239, 301),
	(3, 'ru', 419, 0.1239, 302),
	(3, 'ru', 420, 0.1239, 303),
	(3, 'ru', 421, 0.1239, 305),
	(3, 'ru', 422, 0.1239, 311),
	(3, 'ru', 423, 0.1239, 312),
	(3, 'ru', 424, 0.1239, 313),
	(3, 'ru', 426, 0.1239, 321),
	(3, 'ru', 427, 0.1239, 322),
	(3, 'ru', 428, 0.1239, 323),
	(3, 'ru', 430, 0.1239, 324),
	(3, 'ru', 431, 0.1964, 367.5),
	(3, 'ru', 432, 0.1239, 326),
	(3, 'ru', 433, 0.1239, 328),
	(3, 'ru', 434, 0.1239, 334),
	(3, 'ru', 437, 0.1239, 337),
	(3, 'ru', 441, 0.1239, 351),
	(3, 'ru', 444, 0.1239, 352),
	(3, 'ru', 445, 0.1239, 360),
	(3, 'ru', 446, 0.1239, 367),
	(3, 'ru', 448, 0.1239, 368),
	(3, 'ru', 450, 0.1239, 372),
	(3, 'ru', 453, 0.1239, 373),
	(3, 'ru', 454, 0.1239, 374),
	(3, 'ru', 456, 0.1239, 380),
	(3, 'ru', 460, 0.1239, 382),
	(3, 'ru', 461, 0.1239, 383),
	(3, 'ru', 462, 0.1239, 384),
	(3, 'ru', 463, 0.1239, 390),
	(3, 'ru', 465, 0.1239, 392),
	(3, 'ru', 466, 0.1239, 400),
	(3, 'ru', 470, 0.1239, 401),
	(3, 'ru', 472, 0.1239, 402),
	(3, 'ru', 473, 0.1239, 408),
	(3, 'ru', 474, 0.1239, 409),
	(3, 'ru', 475, 0.1239, 411),
	(3, 'ru', 476, 0.1239, 412),
	(3, 'ru', 483, 0.1239, 422),
	(3, 'ru', 485, 0.1239, 423),
	(3, 'ru', 486, 0.1239, 425),
	(3, 'ru', 487, 0.1239, 433),
	(3, 'ru', 488, 0.1239, 435),
	(3, 'ru', 489, 0.1239, 436),
	(3, 'ru', 490, 0.1239, 438),
	(3, 'ru', 492, 0.1239, 444),
	(3, 'ru', 496, 0.1239, 445),
	(3, 'ru', 497, 0.1239, 446),
	(3, 'ru', 498, 0.1239, 447),
	(3, 'ru', 499, 0.1239, 449),
	(3, 'ru', 500, 0.1964, 454.5),
	(3, 'ru', 501, 0.1239, 457),
	(3, 'ru', 503, 0.1239, 458),
	(3, 'ru', 505, 0.1239, 460),
	(3, 'ru', 506, 0.1239, 466),
	(3, 'ru', 507, 0.1239, 467),
	(3, 'ru', 509, 0.1239, 468),
	(3, 'ru', 510, 0.1239, 474),
	(3, 'ru', 511, 0.1239, 475),
	(3, 'ru', 513, 0.1239, 477),
	(3, 'ru', 514, 0.1239, 478),
	(3, 'ru', 520, 0.1239, 480),
	(3, 'ru', 524, 0.1239, 489),
	(3, 'ru', 525, 0.1239, 490),
	(3, 'ru', 526, 0.1239, 498),
	(3, 'ru', 527, 0.1239, 499),
	(3, 'ru', 528, 0.1239, 500),
	(3, 'ru', 529, 0.1239, 502),
	(3, 'ru', 530, 0.1239, 503),
	(3, 'ru', 532, 0.1239, 504),
	(3, 'ru', 533, 0.1239, 505),
	(3, 'ru', 534, 0.1239, 182),
	(3, 'ru', 535, 0.1239, 240),
	(3, 'ru', 536, 0.1239, 476),
	(4, 'ru', 1, 0.1239, 1),
	(4, 'ru', 2, 0.1239, 2),
	(4, 'ru', 4, 0.1239, 5),
	(4, 'ru', 5, 0.1964, 93),
	(4, 'ru', 6, 0.1964, 273),
	(4, 'ru', 7, 0.1239, 7),
	(4, 'ru', 11, 0.1239, 195),
	(4, 'ru', 16, 0.1964, 459.5),
	(4, 'ru', 18, 0.3478, 351.5),
	(4, 'ru', 20, 0.1964, 214.5),
	(4, 'ru', 33, 0.1239, 421),
	(4, 'ru', 40, 0.1239, 178),
	(4, 'ru', 50, 0.2478, 256.667),
	(4, 'ru', 57, 0.2877, 254),
	(4, 'ru', 84, 0.1239, 30),
	(4, 'ru', 90, 0.1239, 27),
	(4, 'ru', 91, 0.1239, 28),
	(4, 'ru', 93, 0.1239, 29),
	(4, 'ru', 96, 0.1964, 201),
	(4, 'ru', 97, 0.2478, 188),
	(4, 'ru', 98, 0.3203, 153.8),
	(4, 'ru', 99, 0.1964, 216),
	(4, 'ru', 101, 0.1239, 40),
	(4, 'ru', 102, 0.1239, 41),
	(4, 'ru', 103, 0.1239, 42),
	(4, 'ru', 104, 0.1239, 48),
	(4, 'ru', 106, 0.1964, 151.5),
	(4, 'ru', 107, 0.1964, 197.5),
	(4, 'ru', 108, 0.1964, 214),
	(4, 'ru', 111, 0.2877, 225.25),
	(4, 'ru', 113, 0.1239, 61),
	(4, 'ru', 114, 0.1239, 62),
	(4, 'ru', 115, 0.1239, 68),
	(4, 'ru', 117, 0.1239, 69),
	(4, 'ru', 118, 0.1239, 70),
	(4, 'ru', 119, 0.1239, 71),
	(4, 'ru', 120, 0.1239, 72),
	(4, 'ru', 123, 0.2877, 348.25),
	(4, 'ru', 124, 0.1239, 74),
	(4, 'ru', 127, 0.1239, 75),
	(4, 'ru', 128, 0.1239, 76),
	(4, 'ru', 129, 0.1239, 77),
	(4, 'ru', 130, 0.1964, 252),
	(4, 'ru', 131, 0.2478, 237.667),
	(4, 'ru', 138, 0.1239, 87),
	(4, 'ru', 139, 0.1239, 88),
	(4, 'ru', 141, 0.2478, 284.333),
	(4, 'ru', 142, 0.1964, 133.5),
	(4, 'ru', 143, 0.1239, 96),
	(4, 'ru', 146, 0.1239, 97),
	(4, 'ru', 147, 0.1964, 131),
	(4, 'ru', 148, 0.1239, 99),
	(4, 'ru', 149, 0.1964, 171),
	(4, 'ru', 150, 0.1964, 354.5),
	(4, 'ru', 153, 0.1239, 107),
	(4, 'ru', 154, 0.1239, 108),
	(4, 'ru', 155, 0.1239, 109),
	(4, 'ru', 156, 0.1239, 110),
	(4, 'ru', 157, 0.1239, 111),
	(4, 'ru', 160, 0.1239, 118),
	(4, 'ru', 161, 0.2478, 240.667),
	(4, 'ru', 162, 0.2877, 193.75),
	(4, 'ru', 163, 0.3203, 216.4),
	(4, 'ru', 164, 0.1964, 149.5),
	(4, 'ru', 166, 0.1964, 308.5),
	(4, 'ru', 171, 0.1239, 85),
	(4, 'ru', 172, 0.1239, 86),
	(4, 'ru', 173, 0.1239, 106),
	(4, 'ru', 174, 0.1239, 129),
	(4, 'ru', 175, 0.1239, 4),
	(4, 'ru', 176, 0.1239, 8),
	(4, 'ru', 177, 0.1239, 9),
	(4, 'ru', 178, 0.1239, 10),
	(4, 'ru', 254, 0.1239, 353),
	(4, 'ru', 266, 0.1239, 136),
	(4, 'ru', 271, 0.1239, 264),
	(4, 'ru', 301, 0.2478, 222.333),
	(4, 'ru', 303, 0.1239, 419),
	(4, 'ru', 311, 0.1239, 137),
	(4, 'ru', 314, 0.1239, 138),
	(4, 'ru', 316, 0.1239, 140),
	(4, 'ru', 317, 0.1239, 141),
	(4, 'ru', 320, 0.1239, 144),
	(4, 'ru', 321, 0.1239, 146),
	(4, 'ru', 322, 0.1964, 156),
	(4, 'ru', 327, 0.1239, 153),
	(4, 'ru', 328, 0.1239, 154),
	(4, 'ru', 330, 0.1239, 162),
	(4, 'ru', 332, 0.1239, 163),
	(4, 'ru', 336, 0.1239, 496),
	(4, 'ru', 337, 0.1239, 181),
	(4, 'ru', 338, 0.1239, 361),
	(4, 'ru', 339, 0.1239, 183),
	(4, 'ru', 340, 0.1964, 231.5),
	(4, 'ru', 341, 0.1964, 231.5),
	(4, 'ru', 342, 0.1239, 186),
	(4, 'ru', 344, 0.1239, 193),
	(4, 'ru', 345, 0.1239, 194),
	(4, 'ru', 349, 0.1239, 198),
	(4, 'ru', 350, 0.1239, 199),
	(4, 'ru', 351, 0.1239, 200),
	(4, 'ru', 353, 0.1239, 201),
	(4, 'ru', 354, 0.1239, 207),
	(4, 'ru', 355, 0.1964, 224.5),
	(4, 'ru', 356, 0.1239, 209),
	(4, 'ru', 357, 0.1239, 210),
	(4, 'ru', 358, 0.1239, 212),
	(4, 'ru', 359, 0.1239, 213),
	(4, 'ru', 360, 0.1239, 214),
	(4, 'ru', 361, 0.1239, 220),
	(4, 'ru', 363, 0.1239, 221),
	(4, 'ru', 367, 0.1239, 222),
	(4, 'ru', 368, 0.1239, 223),
	(4, 'ru', 373, 0.1239, 229),
	(4, 'ru', 375, 0.1239, 231),
	(4, 'ru', 376, 0.1239, 238),
	(4, 'ru', 381, 0.1239, 239),
	(4, 'ru', 383, 0.1239, 243),
	(4, 'ru', 387, 0.1239, 244),
	(4, 'ru', 388, 0.1239, 246),
	(4, 'ru', 391, 0.1239, 254),
	(4, 'ru', 392, 0.1239, 256),
	(4, 'ru', 393, 0.1239, 262),
	(4, 'ru', 394, 0.1239, 263),
	(4, 'ru', 395, 0.1239, 265),
	(4, 'ru', 397, 0.1239, 266),
	(4, 'ru', 399, 0.1239, 267),
	(4, 'ru', 400, 0.1239, 274),
	(4, 'ru', 401, 0.1239, 280),
	(4, 'ru', 402, 0.1239, 281),
	(4, 'ru', 403, 0.1239, 282),
	(4, 'ru', 404, 0.1239, 288),
	(4, 'ru', 405, 0.1239, 289),
	(4, 'ru', 407, 0.1239, 290),
	(4, 'ru', 408, 0.1239, 291),
	(4, 'ru', 410, 0.1239, 292),
	(4, 'ru', 414, 0.1239, 300),
	(4, 'ru', 418, 0.1239, 301),
	(4, 'ru', 419, 0.1239, 302),
	(4, 'ru', 420, 0.1239, 303),
	(4, 'ru', 421, 0.1239, 305),
	(4, 'ru', 422, 0.1239, 311),
	(4, 'ru', 423, 0.1239, 312),
	(4, 'ru', 424, 0.1239, 313),
	(4, 'ru', 426, 0.1239, 321),
	(4, 'ru', 427, 0.1239, 322),
	(4, 'ru', 428, 0.1239, 323),
	(4, 'ru', 430, 0.1239, 324),
	(4, 'ru', 431, 0.1964, 367.5),
	(4, 'ru', 432, 0.1239, 326),
	(4, 'ru', 433, 0.1239, 328),
	(4, 'ru', 434, 0.1239, 334),
	(4, 'ru', 437, 0.1239, 337),
	(4, 'ru', 441, 0.1239, 351),
	(4, 'ru', 444, 0.1239, 352),
	(4, 'ru', 445, 0.1239, 360),
	(4, 'ru', 446, 0.1239, 367),
	(4, 'ru', 448, 0.1239, 368),
	(4, 'ru', 450, 0.1239, 372),
	(4, 'ru', 453, 0.1239, 373),
	(4, 'ru', 454, 0.1239, 374),
	(4, 'ru', 456, 0.1239, 380),
	(4, 'ru', 460, 0.1239, 382),
	(4, 'ru', 461, 0.1239, 383),
	(4, 'ru', 462, 0.1239, 384),
	(4, 'ru', 463, 0.1239, 390),
	(4, 'ru', 465, 0.1239, 392),
	(4, 'ru', 466, 0.1239, 400),
	(4, 'ru', 470, 0.1239, 401),
	(4, 'ru', 472, 0.1239, 402),
	(4, 'ru', 473, 0.1239, 408),
	(4, 'ru', 474, 0.1239, 409),
	(4, 'ru', 475, 0.1239, 411),
	(4, 'ru', 476, 0.1239, 412),
	(4, 'ru', 483, 0.1239, 422),
	(4, 'ru', 485, 0.1239, 423),
	(4, 'ru', 486, 0.1239, 425),
	(4, 'ru', 487, 0.1239, 433),
	(4, 'ru', 488, 0.1239, 435),
	(4, 'ru', 489, 0.1239, 436),
	(4, 'ru', 490, 0.1239, 438),
	(4, 'ru', 492, 0.1239, 444),
	(4, 'ru', 496, 0.1239, 445),
	(4, 'ru', 497, 0.1239, 446),
	(4, 'ru', 498, 0.1239, 447),
	(4, 'ru', 499, 0.1239, 449),
	(4, 'ru', 500, 0.1964, 454.5),
	(4, 'ru', 501, 0.1239, 457),
	(4, 'ru', 503, 0.1239, 458),
	(4, 'ru', 505, 0.1239, 460),
	(4, 'ru', 506, 0.1239, 466),
	(4, 'ru', 507, 0.1239, 467),
	(4, 'ru', 509, 0.1239, 468),
	(4, 'ru', 510, 0.1239, 474),
	(4, 'ru', 511, 0.1239, 475),
	(4, 'ru', 513, 0.1239, 477),
	(4, 'ru', 514, 0.1239, 478),
	(4, 'ru', 520, 0.1239, 480),
	(4, 'ru', 524, 0.1239, 489),
	(4, 'ru', 525, 0.1239, 490),
	(4, 'ru', 526, 0.1239, 498),
	(4, 'ru', 527, 0.1239, 499),
	(4, 'ru', 528, 0.1239, 500),
	(4, 'ru', 529, 0.1239, 502),
	(4, 'ru', 530, 0.1239, 503),
	(4, 'ru', 532, 0.1239, 504),
	(4, 'ru', 533, 0.1239, 505),
	(4, 'ru', 534, 0.1239, 182),
	(4, 'ru', 535, 0.1239, 240),
	(4, 'ru', 536, 0.1239, 476),
	(5, 'ru', 1, 0.1105, 1),
	(5, 'ru', 2, 0.1105, 2),
	(5, 'ru', 537, 0.3315, 238.143),
	(5, 'ru', 538, 0.4317, 382.857),
	(5, 'ru', 539, 0.3503, 274.125),
	(5, 'ru', 540, 0.442, 383),
	(5, 'ru', 541, 0.3961, 381.454),
	(5, 'ru', 542, 0.5131, 396.792),
	(5, 'ru', 543, 0.4207, 414.231),
	(5, 'ru', 544, 0.4998, 380),
	(5, 'ru', 545, 0.3671, 337.556),
	(5, 'ru', 546, 0.3823, 448.9),
	(5, 'ru', 547, 0.3823, 449.9),
	(5, 'ru', 548, 0.3503, 448.375),
	(5, 'ru', 549, 0.3315, 409.714),
	(5, 'ru', 550, 0.3503, 321),
	(5, 'ru', 551, 0.3961, 456),
	(5, 'ru', 552, 0.2856, 260.6),
	(5, 'ru', 553, 0.3671, 419.556),
	(5, 'ru', 554, 0.3671, 380),
	(5, 'ru', 555, 0.2566, 275),
	(5, 'ru', 556, 0.4089, 485.333),
	(5, 'ru', 557, 0.3315, 400.143),
	(5, 'ru', 558, 0.4207, 368.846),
	(5, 'ru', 559, 0.3823, 434),
	(5, 'ru', 560, 0.221, 442.667),
	(5, 'ru', 561, 0.3503, 363),
	(5, 'ru', 562, 0.3315, 522.143),
	(5, 'ru', 563, 0.3102, 423.5),
	(5, 'ru', 564, 0.3315, 436.429),
	(5, 'ru', 565, 0.3315, 437.429),
	(5, 'ru', 566, 0.2566, 464.75),
	(5, 'ru', 567, 0.5622, 453.818),
	(5, 'ru', 568, 0.3102, 428.333),
	(5, 'ru', 569, 0.3315, 483.286),
	(5, 'ru', 570, 0.2566, 524),
	(5, 'ru', 571, 0.3823, 578.1),
	(5, 'ru', 572, 0.3503, 398.875),
	(5, 'ru', 573, 0.3102, 401.833),
	(5, 'ru', 574, 0.221, 341),
	(5, 'ru', 575, 0.3671, 502),
	(5, 'ru', 576, 0.3671, 503),
	(5, 'ru', 577, 0.3315, 533),
	(5, 'ru', 578, 0.2566, 297),
	(5, 'ru', 579, 0.3315, 478.857),
	(5, 'ru', 580, 0.3102, 522),
	(5, 'ru', 581, 0.3503, 383.625),
	(5, 'ru', 582, 0.2856, 516.4),
	(5, 'ru', 583, 0.2566, 552),
	(5, 'ru', 584, 0.2566, 553),
	(5, 'ru', 585, 0.4089, 579.75),
	(5, 'ru', 586, 0.3671, 585.444),
	(5, 'ru', 587, 0.3671, 586.444),
	(5, 'ru', 588, 0.2566, 448.25),
	(5, 'ru', 589, 0.3315, 448.143),
	(5, 'ru', 590, 0.4089, 550.75),
	(5, 'ru', 591, 0.3961, 537.818),
	(5, 'ru', 592, 0.3503, 632.75),
	(5, 'ru', 593, 0.3503, 633.75),
	(5, 'ru', 594, 0.221, 453.667),
	(5, 'ru', 595, 0.3102, 536),
	(5, 'ru', 596, 0.221, 669.667),
	(5, 'ru', 597, 0.2566, 578),
	(5, 'ru', 598, 0.1751, 660.5),
	(5, 'ru', 599, 0.1751, 661.5),
	(6, 'ru', 1, 0.1156, 1),
	(6, 'ru', 2, 0.1156, 2),
	(6, 'ru', 12, 0.1833, 98),
	(6, 'ru', 25, 0.1156, 351),
	(6, 'ru', 57, 0.4146, 470.091),
	(6, 'ru', 141, 0.3842, 330.889),
	(6, 'ru', 158, 0.2313, 479),
	(6, 'ru', 365, 0.2685, 516),
	(6, 'ru', 422, 0.3246, 625.667),
	(6, 'ru', 460, 0.1833, 325),
	(6, 'ru', 471, 0.1156, 82),
	(6, 'ru', 478, 0.2989, 343.2),
	(6, 'ru', 600, 0.2313, 224),
	(6, 'ru', 601, 0.2313, 135.667),
	(6, 'ru', 602, 0.4912, 229.333),
	(6, 'ru', 603, 0.1833, 17.5),
	(6, 'ru', 604, 0.1833, 19.5),
	(6, 'ru', 605, 0.1156, 36),
	(6, 'ru', 606, 0.1156, 37),
	(6, 'ru', 607, 0.1156, 38),
	(6, 'ru', 608, 0.1156, 40),
	(6, 'ru', 609, 0.1156, 42),
	(6, 'ru', 610, 0.3842, 452.889),
	(6, 'ru', 611, 0.1833, 117.5),
	(6, 'ru', 612, 0.2685, 307.25),
	(6, 'ru', 613, 0.1156, 52),
	(6, 'ru', 614, 0.1156, 54),
	(6, 'ru', 615, 0.1156, 55),
	(6, 'ru', 616, 0.2313, 280.667),
	(6, 'ru', 617, 0.1156, 58),
	(6, 'ru', 618, 0.2313, 177),
	(6, 'ru', 619, 0.1156, 67),
	(6, 'ru', 620, 0.1156, 69),
	(6, 'ru', 621, 0.1156, 70),
	(6, 'ru', 622, 0.4146, 415),
	(6, 'ru', 623, 0.3666, 455.5),
	(6, 'ru', 624, 0.2313, 314.667),
	(6, 'ru', 625, 0.2313, 315.667),
	(6, 'ru', 626, 0.2313, 284),
	(6, 'ru', 627, 0.1156, 84),
	(6, 'ru', 628, 0.2685, 274.25),
	(6, 'ru', 629, 0.2989, 401.4),
	(6, 'ru', 630, 0.2313, 158.667),
	(6, 'ru', 631, 0.1833, 206),
	(6, 'ru', 632, 0.1833, 101.5),
	(6, 'ru', 633, 0.1833, 276.5),
	(6, 'ru', 634, 0.1156, 104),
	(6, 'ru', 635, 0.2313, 203.333),
	(6, 'ru', 636, 0.1156, 111),
	(6, 'ru', 637, 0.1833, 151),
	(6, 'ru', 638, 0.1156, 120),
	(6, 'ru', 639, 0.1156, 121),
	(6, 'ru', 640, 0.3842, 396.667),
	(6, 'ru', 641, 0.2685, 353.75),
	(6, 'ru', 642, 0.1156, 124),
	(6, 'ru', 643, 0.1156, 125),
	(6, 'ru', 644, 0.1156, 133),
	(6, 'ru', 645, 0.2313, 158.667),
	(6, 'ru', 646, 0.1833, 151),
	(6, 'ru', 647, 0.1156, 137),
	(6, 'ru', 648, 0.1156, 139),
	(6, 'ru', 649, 0.2685, 290),
	(6, 'ru', 650, 0.1156, 142),
	(6, 'ru', 651, 0.2685, 270.75),
	(6, 'ru', 652, 0.1156, 145),
	(6, 'ru', 653, 0.1833, 204.5),
	(6, 'ru', 654, 0.1156, 154),
	(6, 'ru', 655, 0.1156, 161),
	(6, 'ru', 656, 0.1833, 179.5),
	(6, 'ru', 657, 0.1833, 329.5),
	(6, 'ru', 658, 0.1156, 184),
	(6, 'ru', 659, 0.1156, 186),
	(6, 'ru', 660, 0.1156, 188),
	(6, 'ru', 661, 0.1156, 189),
	(6, 'ru', 662, 0.1156, 192),
	(6, 'ru', 663, 0.2313, 351.333),
	(6, 'ru', 664, 0.1156, 199),
	(6, 'ru', 665, 0.1156, 200),
	(6, 'ru', 666, 0.1833, 451.5),
	(6, 'ru', 667, 0.1833, 231),
	(6, 'ru', 668, 0.1156, 214),
	(6, 'ru', 669, 0.2313, 360.333),
	(6, 'ru', 670, 0.1156, 217),
	(6, 'ru', 671, 0.1156, 220),
	(6, 'ru', 672, 0.1156, 226),
	(6, 'ru', 673, 0.2685, 365.5),
	(6, 'ru', 674, 0.1833, 427),
	(6, 'ru', 675, 0.1833, 428),
	(6, 'ru', 676, 0.1833, 429),
	(6, 'ru', 677, 0.1833, 430),
	(6, 'ru', 678, 0.1833, 432),
	(6, 'ru', 679, 0.1833, 434),
	(6, 'ru', 680, 0.1156, 248),
	(6, 'ru', 681, 0.1833, 350),
	(6, 'ru', 682, 0.1156, 258),
	(6, 'ru', 683, 0.1156, 260),
	(6, 'ru', 684, 0.1156, 261),
	(6, 'ru', 685, 0.1156, 262),
	(6, 'ru', 686, 0.1156, 263),
	(6, 'ru', 687, 0.1156, 264),
	(6, 'ru', 688, 0.1156, 265),
	(6, 'ru', 689, 0.1156, 271),
	(6, 'ru', 690, 0.1156, 273),
	(6, 'ru', 691, 0.1156, 274),
	(6, 'ru', 692, 0.2313, 310),
	(6, 'ru', 693, 0.2313, 391),
	(6, 'ru', 694, 0.1156, 301),
	(6, 'ru', 695, 0.1156, 303),
	(6, 'ru', 696, 0.2313, 436),
	(6, 'ru', 697, 0.1833, 509),
	(6, 'ru', 698, 0.1156, 307),
	(6, 'ru', 699, 0.1833, 323),
	(6, 'ru', 700, 0.1833, 324),
	(6, 'ru', 701, 0.1833, 326),
	(6, 'ru', 702, 0.1833, 502),
	(6, 'ru', 703, 0.1156, 315),
	(6, 'ru', 704, 0.1156, 316),
	(6, 'ru', 705, 0.1156, 332),
	(6, 'ru', 706, 0.1156, 334),
	(6, 'ru', 707, 0.1156, 336),
	(6, 'ru', 708, 0.1833, 449),
	(6, 'ru', 709, 0.1156, 349),
	(6, 'ru', 710, 0.1156, 350),
	(6, 'ru', 711, 0.1156, 352),
	(6, 'ru', 712, 0.1156, 354),
	(6, 'ru', 713, 0.1156, 368),
	(6, 'ru', 714, 0.1156, 369),
	(6, 'ru', 715, 0.1156, 375),
	(6, 'ru', 716, 0.1156, 377),
	(6, 'ru', 717, 0.1156, 379),
	(6, 'ru', 718, 0.1156, 380),
	(6, 'ru', 719, 0.1156, 382),
	(6, 'ru', 720, 0.1156, 384),
	(6, 'ru', 721, 0.1156, 385),
	(6, 'ru', 722, 0.1156, 386),
	(6, 'ru', 723, 0.1156, 391),
	(6, 'ru', 724, 0.1156, 397),
	(6, 'ru', 725, 0.1156, 398),
	(6, 'ru', 726, 0.1156, 399),
	(6, 'ru', 727, 0.1156, 407),
	(6, 'ru', 728, 0.1156, 409),
	(6, 'ru', 729, 0.1156, 411),
	(6, 'ru', 730, 0.1156, 412),
	(6, 'ru', 731, 0.2989, 478.6),
	(6, 'ru', 732, 0.1833, 417),
	(6, 'ru', 733, 0.1156, 416),
	(6, 'ru', 734, 0.1156, 420),
	(6, 'ru', 735, 0.1156, 423),
	(6, 'ru', 736, 0.1156, 433),
	(6, 'ru', 737, 0.1156, 436),
	(6, 'ru', 738, 0.1156, 438),
	(6, 'ru', 739, 0.1156, 440),
	(6, 'ru', 740, 0.1833, 567.5),
	(6, 'ru', 741, 0.1156, 442),
	(6, 'ru', 742, 0.1156, 449),
	(6, 'ru', 743, 0.1156, 451),
	(6, 'ru', 744, 0.1833, 482.5),
	(6, 'ru', 745, 0.1156, 454),
	(6, 'ru', 746, 0.1156, 457),
	(6, 'ru', 747, 0.1156, 459),
	(6, 'ru', 748, 0.1156, 461),
	(6, 'ru', 749, 0.1833, 471),
	(6, 'ru', 750, 0.1833, 473),
	(6, 'ru', 751, 0.1156, 486),
	(6, 'ru', 752, 0.1156, 492),
	(6, 'ru', 753, 0.1156, 498),
	(6, 'ru', 754, 0.1156, 499),
	(6, 'ru', 755, 0.1156, 502),
	(6, 'ru', 756, 0.1156, 503),
	(6, 'ru', 757, 0.1156, 504),
	(6, 'ru', 758, 0.1156, 512),
	(6, 'ru', 759, 0.1156, 515),
	(6, 'ru', 760, 0.1156, 516),
	(6, 'ru', 761, 0.1156, 518),
	(6, 'ru', 762, 0.1156, 519),
	(6, 'ru', 763, 0.1156, 520),
	(6, 'ru', 764, 0.1156, 528),
	(6, 'ru', 765, 0.1156, 529),
	(6, 'ru', 766, 0.1156, 530),
	(6, 'ru', 767, 0.1156, 531),
	(6, 'ru', 768, 0.1156, 532),
	(6, 'ru', 769, 0.1156, 534),
	(6, 'ru', 770, 0.1156, 551),
	(6, 'ru', 771, 0.1156, 552),
	(6, 'ru', 772, 0.1833, 607.5),
	(6, 'ru', 773, 0.1156, 560),
	(6, 'ru', 774, 0.1156, 561),
	(6, 'ru', 775, 0.1833, 636.5),
	(6, 'ru', 776, 0.1156, 575),
	(6, 'ru', 777, 0.1156, 587),
	(6, 'ru', 778, 0.1156, 588),
	(6, 'ru', 779, 0.1156, 589),
	(6, 'ru', 780, 0.1156, 596),
	(6, 'ru', 781, 0.1156, 598),
	(6, 'ru', 782, 0.1156, 600),
	(6, 'ru', 783, 0.1156, 601),
	(6, 'ru', 784, 0.1156, 603),
	(6, 'ru', 785, 0.1156, 605),
	(6, 'ru', 786, 0.1156, 606),
	(6, 'ru', 787, 0.1156, 615),
	(6, 'ru', 788, 0.1156, 636),
	(6, 'ru', 789, 0.1156, 642),
	(6, 'ru', 790, 0.1156, 644),
	(6, 'ru', 791, 0.1156, 646),
	(6, 'ru', 792, 0.1156, 654),
	(6, 'ru', 793, 0.1156, 655),
	(6, 'ru', 794, 0.1156, 656),
	(6, 'ru', 795, 0.1156, 658),
	(6, 'ru', 796, 0.1156, 659),
	(6, 'ru', 797, 0.1156, 664),
	(6, 'ru', 798, 0.1156, 665),
	(6, 'ru', 799, 0.1156, 671),
	(6, 'ru', 800, 0.1156, 672),
	(6, 'ru', 801, 0.1156, 673),
	(6, 'ru', 802, 0.1156, 676),
	(6, 'ru', 803, 0.1156, 677),
	(6, 'ru', 804, 0.1156, 679),
	(6, 'ru', 805, 0.1156, 681),
	(6, 'ru', 806, 0.1156, 687),
	(6, 'ru', 807, 0.1156, 688),
	(6, 'ru', 808, 0.1156, 692),
	(6, 'ru', 809, 0.1156, 697),
	(6, 'ru', 810, 0.1156, 700),
	(6, 'ru', 811, 0.1156, 703),
	(6, 'ru', 812, 0.1156, 705),
	(6, 'ru', 813, 0.1156, 709),
	(6, 'ru', 814, 0.1156, 711),
	(6, 'ru', 815, 0.1156, 713),
	(7, 'ru', 1, 0.1242, 1),
	(7, 'ru', 2, 0.1242, 2),
	(7, 'ru', 4, 0.1969, 15),
	(7, 'ru', 5, 0.1969, 16),
	(7, 'ru', 6, 0.1969, 17),
	(7, 'ru', 7, 0.1969, 18),
	(7, 'ru', 25, 0.2485, 261.333),
	(7, 'ru', 57, 0.1242, 366),
	(7, 'ru', 141, 0.4453, 252.273),
	(7, 'ru', 158, 0.1969, 284.5),
	(7, 'ru', 161, 0.2485, 235.667),
	(7, 'ru', 365, 0.4298, 248.6),
	(7, 'ru', 422, 0.3727, 218.714),
	(7, 'ru', 471, 0.3487, 273.5),
	(7, 'ru', 478, 0.3211, 254),
	(7, 'ru', 602, 0.5078, 194),
	(7, 'ru', 610, 0.2884, 247.5),
	(7, 'ru', 616, 0.1242, 52),
	(7, 'ru', 618, 0.2485, 245.667),
	(7, 'ru', 623, 0.2884, 232.75),
	(7, 'ru', 627, 0.1242, 291),
	(7, 'ru', 629, 0.3727, 272.714),
	(7, 'ru', 638, 0.1969, 38),
	(7, 'ru', 639, 0.1242, 164),
	(7, 'ru', 640, 0.3487, 260.5),
	(7, 'ru', 641, 0.1242, 364),
	(7, 'ru', 647, 0.1242, 61),
	(7, 'ru', 651, 0.3727, 227.143),
	(7, 'ru', 653, 0.1242, 290),
	(7, 'ru', 665, 0.2485, 244.667),
	(7, 'ru', 666, 0.1969, 304.5),
	(7, 'ru', 673, 0.1242, 348),
	(7, 'ru', 689, 0.1969, 219),
	(7, 'ru', 690, 0.1969, 296.5),
	(7, 'ru', 693, 0.2884, 267.75),
	(7, 'ru', 696, 0.1242, 362),
	(7, 'ru', 703, 0.1242, 80),
	(7, 'ru', 706, 0.1242, 337),
	(7, 'ru', 707, 0.1242, 279),
	(7, 'ru', 732, 0.2485, 242.667),
	(7, 'ru', 736, 0.1242, 346),
	(7, 'ru', 741, 0.2485, 196.333),
	(7, 'ru', 748, 0.2485, 237.667),
	(7, 'ru', 753, 0.1242, 273),
	(7, 'ru', 803, 0.1242, 68),
	(7, 'ru', 804, 0.1969, 308.5),
	(7, 'ru', 816, 0.1969, 14),
	(7, 'ru', 817, 0.1242, 36),
	(7, 'ru', 818, 0.1242, 44),
	(7, 'ru', 819, 0.1242, 46),
	(7, 'ru', 820, 0.1242, 54),
	(7, 'ru', 821, 0.1969, 117.5),
	(7, 'ru', 822, 0.1242, 63),
	(7, 'ru', 823, 0.1242, 67),
	(7, 'ru', 824, 0.1242, 70),
	(7, 'ru', 825, 0.1242, 78),
	(7, 'ru', 826, 0.1242, 81),
	(7, 'ru', 827, 0.1242, 84),
	(7, 'ru', 828, 0.1242, 85),
	(7, 'ru', 829, 0.1242, 86),
	(7, 'ru', 830, 0.1242, 87),
	(7, 'ru', 831, 0.1242, 89),
	(7, 'ru', 832, 0.1242, 90),
	(7, 'ru', 833, 0.1242, 92),
	(7, 'ru', 834, 0.1242, 93),
	(7, 'ru', 835, 0.1969, 104.5),
	(7, 'ru', 836, 0.1969, 105.5),
	(7, 'ru', 837, 0.1969, 106.5),
	(7, 'ru', 838, 0.2485, 216.667),
	(7, 'ru', 839, 0.2884, 235.25),
	(7, 'ru', 840, 0.2485, 219.667),
	(7, 'ru', 841, 0.3487, 224.667),
	(7, 'ru', 842, 0.2485, 228.667),
	(7, 'ru', 843, 0.2485, 230.667),
	(7, 'ru', 844, 0.3487, 234.667),
	(7, 'ru', 845, 0.2485, 233.667),
	(7, 'ru', 846, 0.2485, 240.667),
	(7, 'ru', 847, 0.2485, 241.667),
	(7, 'ru', 848, 0.2485, 243.667),
	(7, 'ru', 849, 0.2485, 248.667),
	(7, 'ru', 850, 0.1242, 156),
	(7, 'ru', 851, 0.1969, 167),
	(7, 'ru', 852, 0.1242, 158),
	(7, 'ru', 853, 0.1242, 160),
	(7, 'ru', 854, 0.1242, 163),
	(7, 'ru', 855, 0.1969, 225.5),
	(7, 'ru', 856, 0.1242, 166),
	(7, 'ru', 857, 0.1242, 170),
	(7, 'ru', 858, 0.1242, 172),
	(7, 'ru', 859, 0.1969, 175.5),
	(7, 'ru', 860, 0.1969, 176.5),
	(7, 'ru', 861, 0.1242, 181),
	(7, 'ru', 862, 0.1969, 287.5),
	(7, 'ru', 863, 0.1969, 290.5),
	(7, 'ru', 864, 0.1969, 298.5),
	(7, 'ru', 865, 0.1969, 305.5),
	(7, 'ru', 866, 0.1969, 315.5),
	(7, 'ru', 867, 0.1969, 317.5),
	(7, 'ru', 868, 0.1969, 319.5),
	(7, 'ru', 869, 0.1969, 320.5),
	(7, 'ru', 870, 0.1969, 323.5),
	(7, 'ru', 871, 0.1242, 275),
	(7, 'ru', 872, 0.1969, 278.5),
	(7, 'ru', 873, 0.1242, 284),
	(7, 'ru', 874, 0.1242, 285),
	(7, 'ru', 875, 0.1242, 292),
	(7, 'ru', 876, 0.1242, 339),
	(7, 'ru', 877, 0.1242, 355),
	(7, 'ru', 878, 0.1242, 356),
	(7, 'ru', 879, 0.1242, 365),
	(7, 'ru', 880, 0.1242, 368),
	(7, 'ru', 881, 0.1242, 369),
	(7, 'ru', 882, 0.1242, 371),
	(7, 'ru', 883, 0.1242, 373),
	(7, 'ru', 884, 0.1242, 375),
	(7, 'ru', 885, 0.1242, 376),
	(8, 'ru', 1, 0.1224, 1),
	(8, 'ru', 2, 0.1224, 2),
	(8, 'ru', 4, 0.1224, 24),
	(8, 'ru', 5, 0.1224, 25),
	(8, 'ru', 6, 0.1224, 26),
	(8, 'ru', 7, 0.1224, 27),
	(8, 'ru', 25, 0.1224, 412),
	(8, 'ru', 57, 0.2448, 221),
	(8, 'ru', 141, 0.5104, 213.471),
	(8, 'ru', 158, 0.1224, 391),
	(8, 'ru', 161, 0.1224, 454),
	(8, 'ru', 205, 0.1224, 196),
	(8, 'ru', 365, 0.4234, 279.7),
	(8, 'ru', 422, 0.3672, 276.857),
	(8, 'ru', 471, 0.4066, 259.556),
	(8, 'ru', 478, 0.3436, 216.667),
	(8, 'ru', 575, 0.2842, 209.5),
	(8, 'ru', 602, 0.5376, 246.25),
	(8, 'ru', 608, 0.1224, 204),
	(8, 'ru', 610, 0.3672, 272.714),
	(8, 'ru', 616, 0.194, 196.5),
	(8, 'ru', 618, 0.1224, 464),
	(8, 'ru', 623, 0.3436, 299),
	(8, 'ru', 627, 0.1224, 427),
	(8, 'ru', 629, 0.1224, 450),
	(8, 'ru', 637, 0.1224, 390),
	(8, 'ru', 638, 0.2842, 182.5),
	(8, 'ru', 640, 0.4782, 247.143),
	(8, 'ru', 641, 0.1224, 178),
	(8, 'ru', 645, 0.1224, 203),
	(8, 'ru', 647, 0.194, 205.5),
	(8, 'ru', 649, 0.1224, 212),
	(8, 'ru', 651, 0.4234, 215.5),
	(8, 'ru', 653, 0.1224, 426),
	(8, 'ru', 661, 0.1224, 206),
	(8, 'ru', 665, 0.1224, 463),
	(8, 'ru', 689, 0.194, 210.5),
	(8, 'ru', 693, 0.1224, 458),
	(8, 'ru', 696, 0.2448, 214),
	(8, 'ru', 702, 0.194, 292),
	(8, 'ru', 703, 0.194, 224.5),
	(8, 'ru', 707, 0.1224, 415),
	(8, 'ru', 732, 0.1224, 461),
	(8, 'ru', 741, 0.194, 213.5),
	(8, 'ru', 744, 0.1224, 180),
	(8, 'ru', 748, 0.1224, 456),
	(8, 'ru', 753, 0.1224, 409),
	(8, 'ru', 775, 0.1224, 396),
	(8, 'ru', 803, 0.194, 212.5),
	(8, 'ru', 816, 0.1224, 23),
	(8, 'ru', 817, 0.194, 180.5),
	(8, 'ru', 818, 0.194, 188.5),
	(8, 'ru', 819, 0.194, 190.5),
	(8, 'ru', 820, 0.194, 198.5),
	(8, 'ru', 821, 0.2448, 197.333),
	(8, 'ru', 822, 0.194, 207.5),
	(8, 'ru', 823, 0.194, 211.5),
	(8, 'ru', 824, 0.194, 214.5),
	(8, 'ru', 825, 0.194, 222.5),
	(8, 'ru', 826, 0.194, 225.5),
	(8, 'ru', 827, 0.194, 228.5),
	(8, 'ru', 828, 0.194, 229.5),
	(8, 'ru', 829, 0.194, 230.5),
	(8, 'ru', 830, 0.194, 231.5),
	(8, 'ru', 831, 0.194, 233.5),
	(8, 'ru', 832, 0.194, 234.5),
	(8, 'ru', 833, 0.194, 236.5),
	(8, 'ru', 834, 0.194, 237.5),
	(8, 'ru', 838, 0.1224, 435),
	(8, 'ru', 839, 0.194, 430),
	(8, 'ru', 840, 0.1224, 438),
	(8, 'ru', 841, 0.194, 443),
	(8, 'ru', 842, 0.1224, 447),
	(8, 'ru', 843, 0.1224, 449),
	(8, 'ru', 844, 0.194, 453),
	(8, 'ru', 845, 0.1224, 452),
	(8, 'ru', 846, 0.1224, 459),
	(8, 'ru', 847, 0.1224, 460),
	(8, 'ru', 848, 0.1224, 462),
	(8, 'ru', 849, 0.1224, 467),
	(8, 'ru', 855, 0.1224, 422),
	(8, 'ru', 871, 0.1224, 411),
	(8, 'ru', 872, 0.2448, 338.667),
	(8, 'ru', 873, 0.1224, 420),
	(8, 'ru', 874, 0.1224, 421),
	(8, 'ru', 875, 0.1224, 428),
	(8, 'ru', 886, 0.2842, 154),
	(8, 'ru', 887, 0.3672, 182.286),
	(8, 'ru', 888, 0.2448, 218),
	(8, 'ru', 889, 0.2448, 223),
	(8, 'ru', 890, 0.2448, 226),
	(8, 'ru', 891, 0.2448, 227),
	(8, 'ru', 892, 0.194, 202.5),
	(8, 'ru', 893, 0.194, 205.5),
	(8, 'ru', 894, 0.194, 212.5),
	(8, 'ru', 895, 0.194, 213.5),
	(8, 'ru', 896, 0.194, 198),
	(8, 'ru', 897, 0.194, 199),
	(8, 'ru', 898, 0.194, 202),
	(8, 'ru', 899, 0.194, 203),
	(8, 'ru', 900, 0.194, 204),
	(8, 'ru', 901, 0.194, 206),
	(8, 'ru', 902, 0.194, 208),
	(8, 'ru', 903, 0.194, 210),
	(8, 'ru', 904, 0.194, 211),
	(8, 'ru', 905, 0.194, 216),
	(8, 'ru', 906, 0.194, 219),
	(8, 'ru', 907, 0.1224, 176),
	(8, 'ru', 908, 0.1224, 179),
	(8, 'ru', 909, 0.1224, 182),
	(8, 'ru', 910, 0.1224, 186),
	(8, 'ru', 911, 0.1224, 193),
	(8, 'ru', 912, 0.1224, 195),
	(8, 'ru', 913, 0.1224, 209),
	(8, 'ru', 914, 0.1224, 210),
	(8, 'ru', 915, 0.1224, 213),
	(8, 'ru', 916, 0.1224, 392),
	(8, 'ru', 917, 0.1224, 397),
	(8, 'ru', 918, 0.1224, 399),
	(9, 'ru', 1, 0.114, 1),
	(9, 'ru', 2, 0.114, 2),
	(9, 'ru', 572, 0.2648, 283.5),
	(9, 'ru', 590, 0.114, 364),
	(9, 'ru', 593, 0.114, 388),
	(9, 'ru', 904, 0.114, 400),
	(9, 'ru', 919, 0.1808, 15),
	(9, 'ru', 920, 0.1808, 16),
	(9, 'ru', 921, 0.1808, 17),
	(9, 'ru', 922, 0.1808, 18),
	(9, 'ru', 923, 0.1808, 19),
	(9, 'ru', 924, 0.1808, 20),
	(9, 'ru', 925, 0.1808, 21),
	(9, 'ru', 926, 0.114, 33),
	(9, 'ru', 927, 0.114, 34),
	(9, 'ru', 928, 0.2948, 231.6),
	(9, 'ru', 929, 0.114, 36),
	(9, 'ru', 930, 0.2948, 312.6),
	(9, 'ru', 931, 0.1808, 73.5),
	(9, 'ru', 932, 0.2281, 107.667),
	(9, 'ru', 933, 0.2281, 179.333),
	(9, 'ru', 934, 0.114, 41),
	(9, 'ru', 935, 0.2281, 319),
	(9, 'ru', 936, 0.3202, 245),
	(9, 'ru', 937, 0.4562, 301.933),
	(9, 'ru', 938, 0.3202, 381.667),
	(9, 'ru', 939, 0.2948, 271.4),
	(9, 'ru', 940, 0.3421, 323.571),
	(9, 'ru', 941, 0.3789, 251.778),
	(9, 'ru', 942, 0.2948, 211.4),
	(9, 'ru', 943, 0.2948, 199),
	(9, 'ru', 944, 0.2281, 207.667),
	(9, 'ru', 945, 0.2648, 249.5),
	(9, 'ru', 946, 0.1808, 157),
	(9, 'ru', 947, 0.114, 65),
	(9, 'ru', 948, 0.2648, 374.25),
	(9, 'ru', 949, 0.4456, 291.857),
	(9, 'ru', 950, 0.1808, 256),
	(9, 'ru', 951, 0.3202, 363.333),
	(9, 'ru', 952, 0.2281, 227.667),
	(9, 'ru', 953, 0.2948, 329.2),
	(9, 'ru', 954, 0.3202, 335),
	(9, 'ru', 955, 0.1808, 122),
	(9, 'ru', 956, 0.2948, 397.2),
	(9, 'ru', 957, 0.114, 84),
	(9, 'ru', 958, 0.2648, 240.5),
	(9, 'ru', 959, 0.114, 87),
	(9, 'ru', 960, 0.2281, 311.667),
	(9, 'ru', 961, 0.3202, 329.667),
	(9, 'ru', 962, 0.2648, 354),
	(9, 'ru', 963, 0.1808, 257),
	(9, 'ru', 964, 0.1808, 308.5),
	(9, 'ru', 965, 0.2648, 422.75),
	(9, 'ru', 966, 0.3202, 409.167),
	(9, 'ru', 967, 0.3789, 390.111),
	(9, 'ru', 968, 0.3615, 308.375),
	(9, 'ru', 969, 0.3421, 313.286),
	(9, 'ru', 970, 0.2281, 250),
	(9, 'ru', 971, 0.2281, 367.667),
	(9, 'ru', 972, 0.2648, 399.75),
	(9, 'ru', 973, 0.2281, 275),
	(9, 'ru', 974, 0.2948, 329.4),
	(9, 'ru', 975, 0.3421, 349.286),
	(9, 'ru', 976, 0.2648, 398.25),
	(9, 'ru', 977, 0.2948, 280.2),
	(9, 'ru', 978, 0.2948, 225.6),
	(9, 'ru', 979, 0.1808, 340.5),
	(9, 'ru', 980, 0.1808, 343),
	(9, 'ru', 981, 0.1808, 344),
	(9, 'ru', 982, 0.2281, 241.333),
	(9, 'ru', 983, 0.2281, 387),
	(9, 'ru', 984, 0.2281, 388),
	(9, 'ru', 985, 0.2281, 237.333),
	(9, 'ru', 986, 0.2648, 290.5),
	(9, 'ru', 987, 0.114, 141),
	(9, 'ru', 988, 0.114, 142),
	(9, 'ru', 989, 0.114, 143),
	(9, 'ru', 990, 0.2281, 288),
	(9, 'ru', 991, 0.2281, 190.667),
	(9, 'ru', 992, 0.2648, 218.25),
	(9, 'ru', 993, 0.114, 148),
	(9, 'ru', 994, 0.114, 149),
	(9, 'ru', 995, 0.1808, 303),
	(9, 'ru', 996, 0.2648, 371.25),
	(9, 'ru', 997, 0.2648, 328.75),
	(9, 'ru', 998, 0.2648, 329.75),
	(9, 'ru', 999, 0.2281, 359.667),
	(9, 'ru', 1000, 0.2281, 271),
	(9, 'ru', 1001, 0.2281, 290.667),
	(9, 'ru', 1002, 0.1808, 259.5),
	(9, 'ru', 1003, 0.3202, 363.167),
	(9, 'ru', 1004, 0.2648, 360),
	(9, 'ru', 1005, 0.2648, 361),
	(9, 'ru', 1006, 0.2281, 220.333),
	(9, 'ru', 1007, 0.1808, 271.5),
	(9, 'ru', 1008, 0.1808, 347),
	(9, 'ru', 1009, 0.2281, 353.667),
	(9, 'ru', 1010, 0.1808, 327),
	(9, 'ru', 1011, 0.2648, 339.25),
	(9, 'ru', 1012, 0.2948, 401.2),
	(9, 'ru', 1013, 0.2281, 402),
	(9, 'ru', 1014, 0.2281, 266.667),
	(9, 'ru', 1015, 0.2281, 314.333),
	(9, 'ru', 1016, 0.114, 218),
	(9, 'ru', 1017, 0.2281, 349),
	(9, 'ru', 1018, 0.114, 221),
	(9, 'ru', 1019, 0.1808, 354),
	(9, 'ru', 1020, 0.1808, 410),
	(9, 'ru', 1021, 0.1808, 379),
	(9, 'ru', 1022, 0.1808, 380),
	(9, 'ru', 1023, 0.1808, 381),
	(9, 'ru', 1024, 0.2948, 404),
	(9, 'ru', 1025, 0.1808, 289.5),
	(9, 'ru', 1026, 0.2281, 376.667),
	(9, 'ru', 1027, 0.114, 272),
	(9, 'ru', 1028, 0.2281, 396.667),
	(9, 'ru', 1029, 0.114, 277),
	(9, 'ru', 1030, 0.2281, 344),
	(9, 'ru', 1031, 0.2281, 345),
	(9, 'ru', 1032, 0.114, 295),
	(9, 'ru', 1033, 0.2648, 387.25),
	(9, 'ru', 1034, 0.114, 325),
	(9, 'ru', 1035, 0.2648, 413.75),
	(9, 'ru', 1036, 0.2281, 396.333),
	(9, 'ru', 1037, 0.1808, 395.5),
	(9, 'ru', 1038, 0.2281, 457.667),
	(9, 'ru', 1039, 0.114, 387),
	(9, 'ru', 1040, 0.114, 389),
	(9, 'ru', 1041, 0.2281, 470.667),
	(9, 'ru', 1042, 0.114, 432),
	(9, 'ru', 1043, 0.1808, 510.5),
	(9, 'ru', 1044, 0.2281, 490.333),
	(9, 'ru', 1045, 0.114, 453),
	(9, 'ru', 1046, 0.114, 457),
	(9, 'ru', 1047, 0.114, 462),
	(9, 'ru', 1048, 0.114, 481),
	(9, 'ru', 1049, 0.114, 501),
	(9, 'ru', 1050, 0.114, 557),
	(10, 'ru', 1, 0.1103, 1),
	(10, 'ru', 2, 0.1103, 2),
	(10, 'ru', 4, 0.1748, 15.5),
	(10, 'ru', 25, 0.1748, 283.5),
	(10, 'ru', 57, 0.2561, 263.5),
	(10, 'ru', 141, 0.499, 338.818),
	(10, 'ru', 185, 0.1103, 148),
	(10, 'ru', 209, 0.1103, 352),
	(10, 'ru', 219, 0.1748, 248),
	(10, 'ru', 239, 0.2206, 527.667),
	(10, 'ru', 313, 0.1103, 231),
	(10, 'ru', 365, 0.3664, 333.444),
	(10, 'ru', 422, 0.1103, 308),
	(10, 'ru', 440, 0.1103, 618),
	(10, 'ru', 463, 0.1103, 577),
	(10, 'ru', 478, 0.2851, 436.2),
	(10, 'ru', 482, 0.1103, 161),
	(10, 'ru', 537, 0.1748, 329.5),
	(10, 'ru', 538, 0.1103, 54),
	(10, 'ru', 567, 0.1748, 386.5),
	(10, 'ru', 569, 0.1103, 388),
	(10, 'ru', 581, 0.1103, 528),
	(10, 'ru', 584, 0.1103, 556),
	(10, 'ru', 590, 0.1103, 343),
	(10, 'ru', 591, 0.1103, 426),
	(10, 'ru', 601, 0.1103, 576),
	(10, 'ru', 602, 0.2561, 208.25),
	(10, 'ru', 610, 0.1748, 354),
	(10, 'ru', 617, 0.1748, 204.5),
	(10, 'ru', 618, 0.2206, 622.667),
	(10, 'ru', 622, 0.1103, 263),
	(10, 'ru', 623, 0.3816, 313.8),
	(10, 'ru', 629, 0.2561, 516),
	(10, 'ru', 630, 0.2561, 544.25),
	(10, 'ru', 638, 0.2561, 407.75),
	(10, 'ru', 640, 0.2206, 229.667),
	(10, 'ru', 647, 0.1103, 34),
	(10, 'ru', 649, 0.2561, 111.5),
	(10, 'ru', 651, 0.1103, 32),
	(10, 'ru', 661, 0.1103, 276),
	(10, 'ru', 665, 0.1103, 619),
	(10, 'ru', 669, 0.3097, 300.167),
	(10, 'ru', 673, 0.1748, 360),
	(10, 'ru', 689, 0.1748, 312),
	(10, 'ru', 702, 0.1103, 616),
	(10, 'ru', 724, 0.2206, 437.333),
	(10, 'ru', 727, 0.1103, 153),
	(10, 'ru', 731, 0.1103, 376),
	(10, 'ru', 739, 0.1103, 31),
	(10, 'ru', 744, 0.3496, 335),
	(10, 'ru', 753, 0.1103, 582),
	(10, 'ru', 755, 0.1103, 202),
	(10, 'ru', 757, 0.1103, 622),
	(10, 'ru', 772, 0.2851, 288.8),
	(10, 'ru', 775, 0.1103, 152),
	(10, 'ru', 776, 0.2561, 230),
	(10, 'ru', 795, 0.1103, 68),
	(10, 'ru', 797, 0.2206, 252.667),
	(10, 'ru', 821, 0.1103, 151),
	(10, 'ru', 835, 0.1103, 550),
	(10, 'ru', 855, 0.1103, 551),
	(10, 'ru', 864, 0.1103, 586),
	(10, 'ru', 879, 0.1103, 489),
	(10, 'ru', 895, 0.1748, 343.5),
	(10, 'ru', 918, 0.1103, 154),
	(10, 'ru', 990, 0.1748, 180.5),
	(10, 'ru', 1008, 0.1103, 279),
	(10, 'ru', 1051, 0.2206, 42),
	(10, 'ru', 1052, 0.1748, 14.5),
	(10, 'ru', 1053, 0.1748, 16.5),
	(10, 'ru', 1054, 0.1748, 18.5),
	(10, 'ru', 1055, 0.2206, 230.667),
	(10, 'ru', 1056, 0.1103, 33),
	(10, 'ru', 1057, 0.1748, 179.5),
	(10, 'ru', 1058, 0.1103, 40),
	(10, 'ru', 1059, 0.1103, 41),
	(10, 'ru', 1060, 0.1748, 361),
	(10, 'ru', 1061, 0.1103, 46),
	(10, 'ru', 1062, 0.1748, 62.5),
	(10, 'ru', 1063, 0.1748, 63.5),
	(10, 'ru', 1064, 0.1103, 50),
	(10, 'ru', 1065, 0.3309, 489),
	(10, 'ru', 1066, 0.1103, 52),
	(10, 'ru', 1067, 0.1103, 60),
	(10, 'ru', 1068, 0.1103, 62),
	(10, 'ru', 1069, 0.1103, 63),
	(10, 'ru', 1070, 0.1748, 282),
	(10, 'ru', 1071, 0.1103, 66),
	(10, 'ru', 1072, 0.1103, 67),
	(10, 'ru', 1073, 0.2206, 295),
	(10, 'ru', 1074, 0.2206, 227.333),
	(10, 'ru', 1075, 0.1748, 269.5),
	(10, 'ru', 1076, 0.1748, 105),
	(10, 'ru', 1077, 0.1103, 81),
	(10, 'ru', 1078, 0.1103, 82),
	(10, 'ru', 1079, 0.1103, 83),
	(10, 'ru', 1080, 0.1748, 137),
	(10, 'ru', 1081, 0.1748, 141),
	(10, 'ru', 1082, 0.1103, 95),
	(10, 'ru', 1083, 0.2206, 102.667),
	(10, 'ru', 1084, 0.1103, 97),
	(10, 'ru', 1085, 0.1103, 98),
	(10, 'ru', 1086, 0.1748, 132),
	(10, 'ru', 1087, 0.2206, 233),
	(10, 'ru', 1088, 0.1748, 349.5),
	(10, 'ru', 1089, 0.1748, 156.5),
	(10, 'ru', 1090, 0.2851, 420.6),
	(10, 'ru', 1091, 0.1103, 112),
	(10, 'ru', 1092, 0.1103, 116),
	(10, 'ru', 1093, 0.2206, 301.333),
	(10, 'ru', 1094, 0.2561, 395.75),
	(10, 'ru', 1095, 0.1748, 230.5),
	(10, 'ru', 1096, 0.2851, 381.8),
	(10, 'ru', 1097, 0.1103, 123),
	(10, 'ru', 1098, 0.1748, 407.5),
	(10, 'ru', 1099, 0.1103, 133),
	(10, 'ru', 1100, 0.1103, 134),
	(10, 'ru', 1101, 0.1103, 135),
	(10, 'ru', 1102, 0.1103, 138),
	(10, 'ru', 1103, 0.1748, 397),
	(10, 'ru', 1104, 0.1748, 357.5),
	(10, 'ru', 1105, 0.1748, 357.5),
	(10, 'ru', 1106, 0.1103, 142),
	(10, 'ru', 1107, 0.1748, 325),
	(10, 'ru', 1108, 0.1103, 146),
	(10, 'ru', 1109, 0.1103, 149),
	(10, 'ru', 1110, 0.1103, 150),
	(10, 'ru', 1111, 0.1103, 157),
	(10, 'ru', 1112, 0.1103, 158),
	(10, 'ru', 1113, 0.1748, 427.5),
	(10, 'ru', 1114, 0.1748, 186),
	(10, 'ru', 1115, 0.1748, 284.5),
	(10, 'ru', 1116, 0.2206, 264),
	(10, 'ru', 1117, 0.1103, 169),
	(10, 'ru', 1118, 0.1103, 170),
	(10, 'ru', 1119, 0.1748, 278.5),
	(10, 'ru', 1120, 0.1748, 280.5),
	(10, 'ru', 1121, 0.1103, 180),
	(10, 'ru', 1122, 0.1103, 182),
	(10, 'ru', 1123, 0.1748, 331.5),
	(10, 'ru', 1124, 0.1748, 413.5),
	(10, 'ru', 1125, 0.1103, 187),
	(10, 'ru', 1126, 0.1748, 194.5),
	(10, 'ru', 1127, 0.1748, 278),
	(10, 'ru', 1128, 0.1103, 198),
	(10, 'ru', 1129, 0.1103, 199),
	(10, 'ru', 1130, 0.1103, 200),
	(10, 'ru', 1131, 0.1103, 203),
	(10, 'ru', 1132, 0.1748, 357.5),
	(10, 'ru', 1133, 0.1748, 358.5),
	(10, 'ru', 1134, 0.1748, 440),
	(10, 'ru', 1135, 0.1103, 218),
	(10, 'ru', 1136, 0.1748, 325.5),
	(10, 'ru', 1137, 0.1103, 223),
	(10, 'ru', 1138, 0.1748, 382.5),
	(10, 'ru', 1139, 0.1103, 225),
	(10, 'ru', 1140, 0.1103, 226),
	(10, 'ru', 1141, 0.1748, 387),
	(10, 'ru', 1142, 0.1748, 388),
	(10, 'ru', 1143, 0.1748, 460),
	(10, 'ru', 1144, 0.1103, 232),
	(10, 'ru', 1145, 0.1103, 233),
	(10, 'ru', 1146, 0.1103, 234),
	(10, 'ru', 1147, 0.1748, 374),
	(10, 'ru', 1148, 0.1103, 236),
	(10, 'ru', 1149, 0.1103, 237),
	(10, 'ru', 1150, 0.1103, 240),
	(10, 'ru', 1151, 0.1103, 241),
	(10, 'ru', 1152, 0.1103, 242),
	(10, 'ru', 1153, 0.1103, 243),
	(10, 'ru', 1154, 0.1103, 244),
	(10, 'ru', 1155, 0.1103, 246),
	(10, 'ru', 1156, 0.1103, 247),
	(10, 'ru', 1157, 0.1103, 257),
	(10, 'ru', 1158, 0.1103, 260),
	(10, 'ru', 1159, 0.1103, 264),
	(10, 'ru', 1160, 0.1103, 265),
	(10, 'ru', 1161, 0.1103, 267),
	(10, 'ru', 1162, 0.1103, 268),
	(10, 'ru', 1163, 0.1103, 269),
	(10, 'ru', 1164, 0.1103, 270),
	(10, 'ru', 1165, 0.1103, 271),
	(10, 'ru', 1166, 0.1748, 310),
	(10, 'ru', 1167, 0.1748, 379.5),
	(10, 'ru', 1168, 0.1748, 295.5),
	(10, 'ru', 1169, 0.1748, 297.5),
	(10, 'ru', 1170, 0.1748, 363.5),
	(10, 'ru', 1171, 0.2206, 376.667),
	(10, 'ru', 1172, 0.1103, 287),
	(10, 'ru', 1173, 0.1103, 289),
	(10, 'ru', 1174, 0.1103, 291),
	(10, 'ru', 1175, 0.1103, 292),
	(10, 'ru', 1176, 0.1103, 293),
	(10, 'ru', 1177, 0.1103, 295),
	(10, 'ru', 1178, 0.1748, 317.5),
	(10, 'ru', 1179, 0.1748, 463.5),
	(10, 'ru', 1180, 0.2851, 516.6),
	(10, 'ru', 1181, 0.2206, 535.333),
	(10, 'ru', 1182, 0.1103, 307),
	(10, 'ru', 1183, 0.1103, 309),
	(10, 'ru', 1184, 0.2206, 530.333),
	(10, 'ru', 1185, 0.1103, 314),
	(10, 'ru', 1186, 0.1103, 324),
	(10, 'ru', 1187, 0.1748, 453),
	(10, 'ru', 1188, 0.1103, 326),
	(10, 'ru', 1189, 0.1103, 327),
	(10, 'ru', 1190, 0.1103, 328),
	(10, 'ru', 1191, 0.1103, 329),
	(10, 'ru', 1192, 0.2206, 436.333),
	(10, 'ru', 1193, 0.1103, 332),
	(10, 'ru', 1194, 0.1103, 333),
	(10, 'ru', 1195, 0.1103, 341),
	(10, 'ru', 1196, 0.1103, 342),
	(10, 'ru', 1197, 0.1103, 344),
	(10, 'ru', 1198, 0.1103, 345),
	(10, 'ru', 1199, 0.1103, 347),
	(10, 'ru', 1200, 0.1103, 351),
	(10, 'ru', 1201, 0.1103, 353),
	(10, 'ru', 1202, 0.1103, 355),
	(10, 'ru', 1203, 0.1748, 457),
	(10, 'ru', 1204, 0.1748, 384.5),
	(10, 'ru', 1205, 0.1748, 385.5),
	(10, 'ru', 1206, 0.1103, 369),
	(10, 'ru', 1207, 0.1103, 370),
	(10, 'ru', 1208, 0.1103, 371),
	(10, 'ru', 1209, 0.1103, 372),
	(10, 'ru', 1210, 0.1103, 373),
	(10, 'ru', 1211, 0.1748, 417.5),
	(10, 'ru', 1212, 0.1103, 377),
	(10, 'ru', 1213, 0.1103, 379),
	(10, 'ru', 1214, 0.1103, 382),
	(10, 'ru', 1215, 0.1103, 383),
	(10, 'ru', 1216, 0.1748, 541),
	(10, 'ru', 1217, 0.1103, 394),
	(10, 'ru', 1218, 0.1103, 395),
	(10, 'ru', 1219, 0.1103, 396),
	(10, 'ru', 1220, 0.1103, 397),
	(10, 'ru', 1221, 0.1103, 406),
	(10, 'ru', 1222, 0.1103, 407),
	(10, 'ru', 1223, 0.1103, 412),
	(10, 'ru', 1224, 0.1748, 539.5),
	(10, 'ru', 1225, 0.1748, 540.5),
	(10, 'ru', 1226, 0.1103, 423),
	(10, 'ru', 1227, 0.1103, 424),
	(10, 'ru', 1228, 0.1103, 425),
	(10, 'ru', 1229, 0.1103, 429),
	(10, 'ru', 1230, 0.1103, 430),
	(10, 'ru', 1231, 0.1103, 431),
	(10, 'ru', 1232, 0.1103, 434),
	(10, 'ru', 1233, 0.1103, 435),
	(10, 'ru', 1234, 0.1103, 437),
	(10, 'ru', 1235, 0.1103, 438),
	(10, 'ru', 1236, 0.1103, 442),
	(10, 'ru', 1237, 0.1103, 446),
	(10, 'ru', 1238, 0.1103, 447),
	(10, 'ru', 1239, 0.1103, 448),
	(10, 'ru', 1240, 0.1103, 449),
	(10, 'ru', 1241, 0.1103, 461),
	(10, 'ru', 1242, 0.1103, 465),
	(10, 'ru', 1243, 0.1103, 467),
	(10, 'ru', 1244, 0.1103, 469),
	(10, 'ru', 1245, 0.1103, 471),
	(10, 'ru', 1246, 0.1103, 472),
	(10, 'ru', 1247, 0.1103, 474),
	(10, 'ru', 1248, 0.1103, 475),
	(10, 'ru', 1249, 0.1103, 485),
	(10, 'ru', 1250, 0.1103, 486),
	(10, 'ru', 1251, 0.1103, 488),
	(10, 'ru', 1252, 0.1103, 491),
	(10, 'ru', 1253, 0.1103, 492),
	(10, 'ru', 1254, 0.1103, 493),
	(10, 'ru', 1255, 0.1103, 494),
	(10, 'ru', 1256, 0.1103, 495),
	(10, 'ru', 1257, 0.1103, 496),
	(10, 'ru', 1258, 0.1103, 499),
	(10, 'ru', 1259, 0.1103, 502),
	(10, 'ru', 1260, 0.1103, 505),
	(10, 'ru', 1261, 0.1103, 507),
	(10, 'ru', 1262, 0.1103, 509),
	(10, 'ru', 1263, 0.1103, 510),
	(10, 'ru', 1264, 0.1103, 514),
	(10, 'ru', 1265, 0.1103, 520),
	(10, 'ru', 1266, 0.1103, 521),
	(10, 'ru', 1267, 0.1103, 522),
	(10, 'ru', 1268, 0.1748, 574),
	(10, 'ru', 1269, 0.1748, 577),
	(10, 'ru', 1270, 0.1103, 529),
	(10, 'ru', 1271, 0.1103, 532),
	(10, 'ru', 1272, 0.1103, 533),
	(10, 'ru', 1273, 0.1103, 540),
	(10, 'ru', 1274, 0.1103, 543),
	(10, 'ru', 1275, 0.1103, 544),
	(10, 'ru', 1276, 0.1103, 545),
	(10, 'ru', 1277, 0.1103, 546),
	(10, 'ru', 1278, 0.1748, 606.5),
	(10, 'ru', 1279, 0.1103, 552),
	(10, 'ru', 1280, 0.1103, 553),
	(10, 'ru', 1281, 0.1103, 555),
	(10, 'ru', 1282, 0.1103, 558),
	(10, 'ru', 1283, 0.1103, 566),
	(10, 'ru', 1284, 0.1103, 567),
	(10, 'ru', 1285, 0.1103, 568),
	(10, 'ru', 1286, 0.1103, 569),
	(10, 'ru', 1287, 0.1748, 627.5),
	(10, 'ru', 1288, 0.1748, 629.5),
	(10, 'ru', 1289, 0.1103, 580),
	(10, 'ru', 1290, 0.1748, 618.5),
	(10, 'ru', 1291, 0.1103, 584),
	(10, 'ru', 1292, 0.1103, 585),
	(10, 'ru', 1293, 0.1103, 587),
	(10, 'ru', 1294, 0.1103, 588),
	(10, 'ru', 1295, 0.1103, 589),
	(10, 'ru', 1296, 0.1103, 598),
	(10, 'ru', 1297, 0.1103, 599),
	(10, 'ru', 1298, 0.1103, 606),
	(10, 'ru', 1299, 0.1103, 608),
	(10, 'ru', 1300, 0.1103, 609),
	(10, 'ru', 1301, 0.1103, 610),
	(10, 'ru', 1302, 0.1103, 612),
	(10, 'ru', 1303, 0.1103, 615),
	(10, 'ru', 1304, 0.1103, 621),
	(10, 'ru', 1305, 0.1103, 623),
	(10, 'ru', 1306, 0.1103, 624),
	(10, 'ru', 1307, 0.1103, 629),
	(10, 'ru', 1308, 0.1103, 636),
	(10, 'ru', 1309, 0.1103, 647),
	(10, 'ru', 1310, 0.1103, 658),
	(10, 'ru', 1311, 0.1103, 660),
	(10, 'ru', 1312, 0.1103, 665),
	(10, 'ru', 1313, 0.1103, 687),
	(10, 'ru', 1314, 0.1103, 694),
	(11, 'ru', 1315, 0.2314, 1),
	(11, 'ru', 1316, 0.2314, 2),
	(12, 'ru', 1317, 0.2314, 1),
	(12, 'ru', 1318, 0.2314, 2),
	(13, 'ru', 1320, 0.2314, 1),
	(13, 'ru', 1321, 0.2314, 2);
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_text
CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_content_text: ~13 rows (приблизительно)
DELETE FROM `b_search_content_text`;
/*!40000 ALTER TABLE `b_search_content_text` DISABLE KEYS */;
INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
	(1, 'd5049c1f1758bac2c46a5af5be20f39d', 'ARTICLE TITLE 1\r\nLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT..\r\n\rLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. LOBORTIS FEUGIAT VIVAMUS AT AUGUE EGET. ALIQUET NEC ULLAMCORPER SIT AMET RISUS. DIGNISSIM ENIM SIT AMET VENENATIS URNA CURSUS EGET. TURPIS EGESTAS PRETIUM AENEAN PHARETRA MAGNA AC PLACERAT. SED TEMPUS URNA ET PHARETRA PHARETRA MASSA MASSA ULTRICIES. RISUS NULLAM EGET FELIS EGET NUNC LOBORTIS. VEL EROS DONEC AC ODIO TEMPOR ORCI DAPIBUS ULTRICES IN. QUISQUE ID DIAM VEL QUAM. FAUCIBUS ET MOLESTIE AC FEUGIAT SED LECTUS VESTIBULUM MATTIS. SUSPENDISSE FAUCIBUS INTERDUM POSUERE LOREM IPSUM DOLOR. NON ODIO EUISMOD LACINIA AT QUIS RISUS. PURUS VIVERRA ACCUMSAN IN NISL NISI. DOLOR SIT AMET CONSECTETUR ADIPISCING ELIT. SEMPER AUCTOR NEQUE VITAE TEMPUS QUAM PELLENTESQUE NEC NAM ALIQUAM. PHARETRA VEL TURPIS NUNC EGET LOREM DOLOR SED VIVERRA. ELIT UT ALIQUAM PURUS SIT AMET LUCTUS VENENATIS LECTUS MAGNA. PRETIUM VIVERRA SUSPENDISSE POTENTI NULLAM AC TORTOR VITAE.\rQUISQUE EGESTAS DIAM IN ARCU CURSUS. BLANDIT LIBERO VOLUTPAT SED CRAS ORNARE ARCU DUI. SCELERISQUE MAURIS PELLENTESQUE PULVINAR PELLENTESQUE HABITANT MORBI. PRAESENT SEMPER FEUGIAT NIBH SED PULVINAR. POSUERE AC UT CONSEQUAT SEMPER. SEMPER RISUS IN HENDRERIT GRAVIDA RUTRUM QUISQUE. LACUS VIVERRA VITAE CONGUE EU CONSEQUAT AC. NULLA MALESUADA PELLENTESQUE ELIT EGET GRAVIDA CUM SOCIIS NATOQUE PENATIBUS. SAPIEN NEC SAGITTIS ALIQUAM MALESUADA. ULTRICIES LEO INTEGER MALESUADA NUNC VEL. MATTIS ULLAMCORPER VELIT SED ULLAMCORPER MORBI. NEC ULLAMCORPER SIT AMET RISUS NULLAM EGET FELIS. AMET CONSECTETUR ADIPISCING ELIT DUIS TRISTIQUE SOLLICITUDIN. ETIAM SIT AMET NISL PURUS IN. DIGNISSIM SODALES UT EU SEM INTEGER.\rVIVERRA MAURIS IN ALIQUAM SEM FRINGILLA UT. QUIS VARIUS QUAM QUISQUE ID DIAM VEL QUAM. MOLESTIE AC FEUGIAT SED LECTUS. METUS VULPUTATE EU SCELERISQUE FELIS IMPERDIET PROIN. VITAE AUCTOR EU AUGUE UT LECTUS ARCU BIBENDUM AT VARIUS. VESTIBULUM LOREM SED RISUS ULTRICIES. EGESTAS ERAT IMPERDIET SED EUISMOD NISI PORTA LOREM MOLLIS ALIQUAM. LEO URNA MOLESTIE AT ELEMENTUM. AC FELIS DONEC ET ODIO. TRISTIQUE NULLA ALIQUET ENIM TORTOR AT AUCTOR URNA NUNC. VELIT UT TORTOR PRETIUM VIVERRA SUSPENDISSE. TEMPOR NEC FEUGIAT NISL PRETIUM FUSCE. ALIQUET NIBH PRAESENT TRISTIQUE MAGNA SIT. NIBH NISL CONDIMENTUM ID VENENATIS. AUGUE NEQUE GRAVIDA IN FERMENTUM ET SOLLICITUDIN AC. TEMPUS IMPERDIET NULLA MALESUADA PELLENTESQUE ELIT EGET GRAVIDA. ET ODIO PELLENTESQUE DIAM VOLUTPAT COMMODO SED EGESTAS. SCELERISQUE VIVERRA MAURIS IN ALIQUAM.\rTURPIS MASSA SED ELEMENTUM TEMPUS EGESTAS SED SED. FUSCE ID VELIT UT TORTOR PRETIUM VIVERRA SUSPENDISSE POTENTI NULLAM. QUAM LACUS SUSPENDISSE FAUCIBUS INTERDUM POSUERE LOREM IPSUM. ODIO MORBI QUIS COMMODO ODIO AENEAN SED ADIPISCING. VULPUTATE ENIM NULLA ALIQUET PORTTITOR. SED AUGUE LACUS VIVERRA VITAE. CUM SOCIIS NATOQUE PENATIBUS ET MAGNIS DIS PARTURIENT. AC TURPIS EGESTAS SED TEMPUS URNA ET PHARETRA. BLANDIT MASSA ENIM NEC DUI NUNC MATTIS ENIM. CRAS SED FELIS EGET VELIT ALIQUET SAGITTIS ID CONSECTETUR PURUS. BIBENDUM AT VARIUS VEL PHARETRA. PORTA LOREM MOLLIS ALIQUAM UT PORTTITOR LEO A. EU TURPIS EGESTAS PRETIUM AENEAN PHARETRA MAGNA. PRAESENT ELEMENTUM FACILISIS LEO VEL FRINGILLA EST ULLAMCORPER. QUISQUE NON TELLUS ORCI AC AUCTOR. SCELERISQUE EU ULTRICES VITAE AUCTOR EU AUGUE. MALESUADA FAMES AC TURPIS EGESTAS INTEGER EGET ALIQUET NIBH PRAESENT.\rODIO FACILISIS MAURIS SIT AMET MASSA VITAE TORTOR CONDIMENTUM LACINIA. ALIQUET EGET SIT AMET TELLUS CRAS ADIPISCING. DUI ACCUMSAN SIT AMET NULLA FACILISI. RIDICULUS MUS MAURIS VITAE ULTRICIES LEO INTEGER MALESUADA NUNC VEL. NISI SCELERISQUE EU ULTRICES VITAE AUCTOR EU AUGUE UT LECTUS. PELLENTESQUE ADIPISCING COMMODO ELIT AT IMPERDIET DUI ACCUMSAN SIT AMET. ALIQUET NIBH PRAESENT TRISTIQUE MAGNA. AT URNA CONDIMENTUM MATTIS PELLENTESQUE ID. ET NETUS ET MALESUADA FAMES AC TURPIS. SIT AMET NULLA FACILISI MORBI TEMPUS IACULIS URNA ID VOLUTPAT. MAGNA FRINGILLA URNA PORTTITOR RHONCUS. SEM VIVERRA ALIQUET EGET SIT AMET TELLUS CRAS ADIPISCING ENIM. AT AUGUE EGET ARCU DICTUM. MALESUADA BIBENDUM ARCU VITAE ELEMENTUM CURABITUR VITAE.\r\n'),
	(2, '07a1d3dd9b47fa2531e30c8da84504b5', 'ARTICLE TITLE 2\r\nZOMBIE IPSUM REVERSUS AB VIRAL INFERNO...\r\n\rZOMBIE IPSUM REVERSUS AB VIRAL INFERNO, NAM RICK GRIMES MALUM CEREBRO. DE CARNE LUMBERING ANIMATA CORPORA QUAERITIS. SUMMUS BRAINS SIT​​, MORBO VEL MALEFICIA? DE APOCALYPSI GORGER OMERO UNDEAD SURVIVOR DICTUM MAURIS. HI MINDLESS MORTUIS SOULLESS CREATURAS, IMO EVIL STALKING MONSTRA ADVENTUS RESI DENTEVIL VULTUS COMEDAT CEREBELLA VIVENTIUM. QUI ANIMATED CORPSE, CRICKET BAT MAX BRUCKS TERRIBILEM INCESSU ZOMBY. THE VOODOO SACERDOS FLESH EATER, SUSCITAT MORTUOS COMEDERE CARNEM VIRUS. ZONBI TATTERED FOR SOLUM OCULI EORUM DEFUNCTIS GO LUM CEREBRO. NESCIO BRAINS AN UNDEAD ZOMBIES. SICUT MALUS PUTRID VOODOO HORROR. NIGH TOFTH ELIV INGDEAD.\rCUM HORRIBILEM WALKING DEAD RESURGERE DE CRAZED SEPULCRIS CREATURIS, ZOMBIE SICUT DE GRAVE FEEDING IRIDE ET SERPENS. PESTILENTIA, SHAUN OFTHE DEAD SCYTHE ANIMATED CORPSES IPSA SCREAMS. PESTILENTIA EST PLAGUE HAEC DECAYING AMBULABAT MORTUOS. SICUT ZEDER APATHETIC MALUS VOODOO. AENEAN A DOLOR PLAN ET TERROR SOULLESS VULNERUM CONTAGIUM ACCEDUNT, MORTUI IAM VIVAM UNLIFE. QUI TARDIUS MOVERI, BRID EOF REANIMATOR SED IN MAGNA COPIA SINT TERRIBILES UNDEATH LEGIONIS. ALII MISSING OCULIS ALIORUM SICUT SERPERE CRABS NOSTRAM. PUTRIDI BRAINDEAD ODORES KILL AND INFECT, AERE IMPLENT LEFT FOUR DEAD.\rLUCIO FULCI TREMOR EST DARK VIVOS MAGNA. EXPANSIS CREEPY ARM YOF DARKNESS ULNIS WITCHCRAFT MISSING CARNEM ARMIS KIRKMAN MOORE AND ADLARD CAERULEUM IN LOCIS. ROMERO MORBO CONGRESS AMARUS IN AURAS. NIHIL HORUM SAGITTIS TINCIDUNT, ZOMBIE SLACK-JAWED GELIDA SURVIVAL PORTENTA. THE UNLEASHED VIRUS EST, ET IAM ZOMBIE MORTUI AMBULABUNT SUPER TERRAM. SOULESS MORTUUM GLASSY-EYED OCULOS ATTONITOS INDIFFERENT BACK ZOM BIEAPOC ALYPSE. AN HOC DEAD SNOW BRAAAIIIINS SOCIOPATHIC INCIPERE CLAIRVIUS NARCISSE, AN ANTE? IS BELLO MUNDI Z?\rIN CRAVEN OMNI MEMORIA PATRIAE ZOMBIELAND CLAIRVIUS NARCISSE RELIGIONIS SUNT DIRI UNDEAD HISTORIARUM. GOLUMS, ZOMBIES UNRELENTING ET RAIMI FASCINATI BEHEADING. MALEFICIA! VEL CEMETERY MAN A MODERN BURSTING EYEBALLS PERHSAPS MORBI. A TERRENTI FLESH CONTAGIUM. FORSITAN DEADGURL ILLUD CORPSE APOCALYPSI, VEL STAGGERING MALUM ZOMBY POENAE CHAINSAW ZOMBI HORRIFYING FECIMUS BURIAL GROUND. INDEFLEXUS SHOTGUN COUP DE POUDRE MONSTRA PER PLATEAS CURRERE. FIT DE DECAY NOSTRA CARNE UNDEAD. POENITENTIAM VIOLENT ZOM BIEHIG HWAY AGITE RE:DEAD PŒNITENTIAM! VIVENS MORTUA SUNT APUD NOS NIGHT OF THE LIVING DEAD.\rWHYT ZOMBY UT FAMES AFTER DEATH CEREBRO VIRUS ENIM CARNIS GRUSOME, VISCERA ET ORGANA VIVENTIUM. SICUT SPARGIT VIRUS AD IMPETUM, QUI SUPERSUMUS FLESH EATING. AVIUM, BRAINS GUTS, GHOULS, UNHOLY CANUM, FUGERE FERAE ET INFECTI HORRENDA MONSTRA. VIDEMUS TWENTY-EIGHT DEFORMIS PALE, HORRENDA DAEMONUM. PANDUNTUR BRAINS PORTAE ROTTING INFERI. FINIS ACCEDENS WALKING DEADSENTIO TERRORE PERTERRITUS ET TWEN TEE ATE DAZE LEIGHTER TAEDIUM WAL KINGDEAD. THE HORROR, MONSTRA EPIDEMIC SIGNIFICANT FINEM. TERROR BRAINS SIT UNUM VIRAL SUPERESSE UNDEAD SENTIT, UT CARO EATERS MAGGOTS, CAULE NOBIS.\r\n'),
	(3, '2f146b96d7533bd09e6319ad174d122e', 'ARTICLE TITLE 3\r\nZOMBIES REVERSUS AB INFERNO, NAM MALUM CEREBRO...\r\n\rZOMBIES REVERSUS AB INFERNO, NAM MALUM CEREBRO. DE CARNE ANIMATA CORPORA QUAERITIS. SUMMUS SIT​​, MORBO VEL MALEFICIA? DE APOCALYPSI UNDEAD DICTUM MAURIS. HI MORTUIS SOULLESS CREATURAS, IMO MONSTRA ADVENTUS VULTUS COMEDAT CEREBELLA VIVENTIUM. QUI OFFENDERIT RAPTO, TERRIBILEM INCESSU. THE VOODOO SACERDOS SUSCITAT MORTUOS COMEDERE CARNEM. SEARCH FOR SOLUM OCULI EORUM DEFUNCTIS CEREBRO. NESCIO AN UNDEAD ZOMBIES. SICUT MALUS MOVIE HORROR.\rCUM HORRIBILEM RESURGERE DE SEPULCRIS CREATURIS, SICUT DE IRIDE ET SERPENS. PESTILENTIA, IPSA SCREAMS. PESTILENTIA EST HAEC AMBULABAT MORTUOS. SICUT MALUS VOODOO. AENEAN A DOLOR VULNERUM APERIRE ACCEDUNT, MORTUI IAM VIVAM. QUI TARDIUS MOVERI, SED IN MAGNA COPIA SINT TERRIBILES LEGIONIS. ALII MISSING OCULIS ALIORUM SICUT SERPERE CRABS NOSTRAM. PUTRIDI ODORES AERE IMPLENT.\rTREMOR EST VIVOS MAGNA. EXPANSIS ULNIS VIDEO MISSING CARNEM ARMIS CAERULEUM IN LOCIS. A MORBO AMARUS IN AURAS. NIHIL HORUM SAGITTIS TINCIDUNT, GELIDA PORTENTA. THE UNLEASHED VIRUS EST, ET IAM MORTUI AMBULABUNT SUPER TERRAM. SOULESS MORTUUM OCULOS ATTONITOS BACK ZOMBIES. AN HOC INCIPERE CLAIRVIUS NARCISSE, AN ANTE? IS BELLO MUNDI Z?\rIN OMNI MEMORIA PATRIAE RELIGIONIS SUNT DIRI UNDEAD HISTORIARUM. GOLUMS, ZOMBIES ET FASCINATI. MALEFICIA! VEL A MODERN PERHSAPS MORBI. A TERRENTI CONTAGIUM. FORSITAN ILLUD APOCALYPSI, VEL MALUM POENAE HORRIFYING FECIMUS. INDEFLEXUS MONSTRA PER PLATEAS CURRERE. FIT DE NOSTRA CARNE UNDEAD. POENITENTIAM AGITE PŒNITENTIAM! VIVENS MORTUA SUNT APUD NOS.\rUT FAMES CEREBRO ENIM CARNIS, VISCERA ET ORGANA VIVENTIUM. SICUT SPARGIT VIRUS AD IMPETUM, QUI SUPERSUMUS. AVIUM, CANUM, FUGERE FERAE ET INFECTI HORRENDA MONSTRA. VIDEMUS DEFORMIS HORRENDA DAEMONUM. PANDUNTUR PORTAE INFERI. FINIS ACCEDENS SENTIO TERRORE PERTERRITUS ET TAEDIUM. THE HORROR, MONSTRA SIGNIFICANT FINEM. TERROR SIT UNUM SUPERESSE SENTIT, UT CARO EATERS CAULE NOBIS.\r\n'),
	(4, '618cb356373f25e84e8fe9a9b7a0effb', 'ARTICLE TITLE 4\r\nBACON IPSUM DOLOR AMET JERKY DRUMSTICK BURGDOGGEN...\r\n\rZOMBIES REVERSUS AB INFERNO, NAM MALUM CEREBRO. DE CARNE ANIMATA CORPORA QUAERITIS. SUMMUS SIT​​, MORBO VEL MALEFICIA? DE APOCALYPSI UNDEAD DICTUM MAURIS. HI MORTUIS SOULLESS CREATURAS, IMO MONSTRA ADVENTUS VULTUS COMEDAT CEREBELLA VIVENTIUM. QUI OFFENDERIT RAPTO, TERRIBILEM INCESSU. THE VOODOO SACERDOS SUSCITAT MORTUOS COMEDERE CARNEM. SEARCH FOR SOLUM OCULI EORUM DEFUNCTIS CEREBRO. NESCIO AN UNDEAD ZOMBIES. SICUT MALUS MOVIE HORROR.\rCUM HORRIBILEM RESURGERE DE SEPULCRIS CREATURIS, SICUT DE IRIDE ET SERPENS. PESTILENTIA, IPSA SCREAMS. PESTILENTIA EST HAEC AMBULABAT MORTUOS. SICUT MALUS VOODOO. AENEAN A DOLOR VULNERUM APERIRE ACCEDUNT, MORTUI IAM VIVAM. QUI TARDIUS MOVERI, SED IN MAGNA COPIA SINT TERRIBILES LEGIONIS. ALII MISSING OCULIS ALIORUM SICUT SERPERE CRABS NOSTRAM. PUTRIDI ODORES AERE IMPLENT.\rTREMOR EST VIVOS MAGNA. EXPANSIS ULNIS VIDEO MISSING CARNEM ARMIS CAERULEUM IN LOCIS. A MORBO AMARUS IN AURAS. NIHIL HORUM SAGITTIS TINCIDUNT, GELIDA PORTENTA. THE UNLEASHED VIRUS EST, ET IAM MORTUI AMBULABUNT SUPER TERRAM. SOULESS MORTUUM OCULOS ATTONITOS BACK ZOMBIES. AN HOC INCIPERE CLAIRVIUS NARCISSE, AN ANTE? IS BELLO MUNDI Z?\rIN OMNI MEMORIA PATRIAE RELIGIONIS SUNT DIRI UNDEAD HISTORIARUM. GOLUMS, ZOMBIES ET FASCINATI. MALEFICIA! VEL A MODERN PERHSAPS MORBI. A TERRENTI CONTAGIUM. FORSITAN ILLUD APOCALYPSI, VEL MALUM POENAE HORRIFYING FECIMUS. INDEFLEXUS MONSTRA PER PLATEAS CURRERE. FIT DE NOSTRA CARNE UNDEAD. POENITENTIAM AGITE PŒNITENTIAM! VIVENS MORTUA SUNT APUD NOS.\rUT FAMES CEREBRO ENIM CARNIS, VISCERA ET ORGANA VIVENTIUM. SICUT SPARGIT VIRUS AD IMPETUM, QUI SUPERSUMUS. AVIUM, CANUM, FUGERE FERAE ET INFECTI HORRENDA MONSTRA. VIDEMUS DEFORMIS HORRENDA DAEMONUM. PANDUNTUR PORTAE INFERI. FINIS ACCEDENS SENTIO TERRORE PERTERRITUS ET TAEDIUM. THE HORROR, MONSTRA SIGNIFICANT FINEM. TERROR SIT UNUM SUPERESSE SENTIT, UT CARO EATERS CAULE NOBIS.\r\n'),
	(5, 'f244e1c4c51d9d31aff90ea65812b466', 'ARTICLE TITLE 5\r\nAPPLE PIE DRAGÉE JELLY MUFFIN CHOCOLATE...\r\n\rAPPLE PIE DRAGÉE JELLY MUFFIN CHOCOLATE. CHEESECAKE CANDY CANES CHEESECAKE LEMON DROPS APPLE PIE PASTRY SOUFFLÉ. LEMON DROPS GINGERBREAD FRUITCAKE CROISSANT SOUFFLÉ CHEESECAKE POWDER BONBON COOKIE. DANISH DONUT TART LIQUORICE. TART HALVAH DESSERT TIRAMISU. BONBON JELLY BEANS LEMON DROPS CHUPA CHUPS PASTRY. GUMMIES CANDY CAKE. MARSHMALLOW POWDER MUFFIN COTTON CANDY. BROWNIE CUPCAKE CARROT CAKE CHOCOLATE. CROISSANT CHOCOLATE CAKE JUJUBES DANISH MUFFIN CARAMELS FRUITCAKE CARROT CAKE COOKIE. GINGERBREAD CHOCOLATE CAKE DONUT BEAR CLAW JUJUBES BISCUIT. JELLY-O CANDY CANES CHOCOLATE BAR DESSERT JELLY MARZIPAN DRAGÉE. PUDDING CHOCOLATE CAKE BONBON PUDDING DESSERT ICING ICE CREAM.\rLOLLIPOP GINGERBREAD GUMMI BEARS DRAGÉE TART TOFFEE CANDY CANES CHOCOLATE CROISSANT. GINGERBREAD BONBON TIRAMISU JELLY BEANS CHOCOLATE BAR. DRAGÉE TOPPING MUFFIN TIRAMISU SWEET. POWDER TART CAKE LOLLIPOP BEAR CLAW APPLE PIE TART. PIE SWEET ROLL CANDY DANISH DANISH PUDDING CANDY. MARSHMALLOW SUGAR PLUM TART JELLY BEANS BEAR CLAW CUPCAKE CHUPA CHUPS JELLY DESSERT. TOPPING CHUPA CHUPS CHOCOLATE CAKE LIQUORICE. JELLY-O JUJUBES CARROT CAKE CAKE DONUT LOLLIPOP CANDY CANES BEAR CLAW. COTTON CANDY ICING TOOTSIE ROLL PASTRY. SUGAR PLUM POWDER COOKIE CANDY JELLY CARROT CAKE CAKE PASTRY CANDY CANES. LEMON DROPS PIE CHOCOLATE CAKE CANDY CANES CHOCOLATE CAKE. GUMMI BEARS GUMMIES WAFER JELLY-O CARROT CAKE MARZIPAN. CAKE CHEESECAKE CANDY CANES GUMMI BEARS JELLY.\rTOPPING TART GINGERBREAD DESSERT. CHOCOLATE CAKE DRAGÉE POWDER TOPPING FRUITCAKE. LIQUORICE APPLE PIE WAFER MARSHMALLOW BISCUIT DONUT HALVAH PUDDING CHEESECAKE. FRUITCAKE JUJUBES TOOTSIE ROLL BONBON. LIQUORICE MUFFIN OAT CAKE TOFFEE CHUPA CHUPS LIQUORICE FRUITCAKE. MACAROON SOUFFLÉ JELLY-O CARAMELS DONUT CUPCAKE PUDDING PIE. ICING LIQUORICE CHEESECAKE SWEET ROLL SWEET ROLL DESSERT. BONBON CHEESECAKE CANDY CAKE. TOPPING SOUFFLÉ CHOCOLATE CARROT CAKE MARSHMALLOW MACAROON TART CROISSANT. CHEESECAKE COTTON CANDY CROISSANT CARAMELS LOLLIPOP CAKE SOUFFLÉ CHOCOLATE BAR MARZIPAN. APPLE PIE POWDER BEAR CLAW. CUPCAKE LOLLIPOP LEMON DROPS PIE WAFER ICE CREAM DANISH. APPLE PIE GINGERBREAD JELLY BEANS BISCUIT TART. DANISH FRUITCAKE FRUITCAKE LIQUORICE.\rPUDDING DRAGÉE GINGERBREAD CHUPA CHUPS BROWNIE FRUITCAKE FRUITCAKE CHEESECAKE PUDDING. CHOCOLATE BAR DANISH SWEET ROLL CAKE SUGAR PLUM SESAME SNAPS TOFFEE LIQUORICE. COTTON CANDY JELLY CANDY CANES BISCUIT CHOCOLATE SWEET. MUFFIN TART MARSHMALLOW LIQUORICE DESSERT SOUFFLÉ CHOCOLATE BAR TART CUPCAKE. MUFFIN CAKE MARZIPAN JUJUBES PIE GINGERBREAD. COOKIE CUPCAKE PASTRY CHEESECAKE CHEESECAKE LEMON DROPS GUMMIES. CANDY PUDDING GUMMI BEARS. MUFFIN SWEET ROLL SWEET DANISH WAFER COTTON CANDY. WAFER TART CHOCOLATE BAR. TART TOFFEE JELLY BEANS BISCUIT POWDER. COTTON CANDY LOLLIPOP SUGAR PLUM BONBON SWEET GUMMI BEARS. BEAR CLAW TOOTSIE ROLL LEMON DROPS COTTON CANDY CHEESECAKE. BONBON TOPPING DANISH SWEET ROLL MACAROON LOLLIPOP. ICE CREAM DANISH BROWNIE LOLLIPOP DONUT LEMON DROPS BISCUIT DRAGÉE.\rTIRAMISU GUMMI BEARS PASTRY JELLY. SWEET ROLL CARROT CAKE LIQUORICE BONBON CHOCOLATE TIRAMISU DANISH OAT CAKE LEMON DROPS. CHOCOLATE CAKE WAFER MUFFIN CHUPA CHUPS. MACAROON CUPCAKE PASTRY BROWNIE CHOCOLATE BAR POWDER CHEESECAKE MARZIPAN. PIE CHUPA CHUPS CHOCOLATE CAKE GUMMI BEARS FRUITCAKE SESAME SNAPS FRUITCAKE BISCUIT CAKE. PASTRY SUGAR PLUM MUFFIN. LOLLIPOP LEMON DROPS BEAR CLAW TOPPING LOLLIPOP CAKE. MARSHMALLOW DONUT SUGAR PLUM LOLLIPOP MARZIPAN. BEAR CLAW CANDY CANES CAKE GUMMI BEARS GUMMIES JELLY. ICING CAKE POWDER GUMMI BEARS CUPCAKE. CARROT CAKE ICE CREAM SOUFFLÉ JELLY BEANS. SUGAR PLUM BEAR CLAW PIE DANISH ICING CUPCAKE CHOCOLATE DESSERT TIRAMISU. HALVAH SWEET ROLL TIRAMISU SUGAR PLUM LOLLIPOP JUJUBES CUPCAKE OAT CAKE.\r\n'),
	(6, '190899441255f9c5150e9128503a508e', 'ARTICLE TITLE 6\r\nYEAH WELL, YOU SHOULDN\'T DRINK...\r\n\rYEAH WELL, YOU SHOULDN\'T DRINK. MAYOR GOLDIE WILSON, I LIKE THE SOUND OF THAT. OH HEY, BIFF, HEY, GUYS, HOW ARE YOU DOING? WHAT DO YOU MEAN YOU\'VE SEEN THIS, IT\'S BRAND NEW. YOU\'RE GONNA BE IN THE CAR WITH HER.\rSHIT. HELLO, HELLO, ANYBODY HOME? THINK, MCFLY, THINK. I GOTTA HAVE TIME TO GET THEM RE-TYPED. DO YOU REALIZE WHAT WOULD HAPPEN IF I HAND IN MY REPORTS IN YOUR HANDWRITING. I\'LL GET FIRED. YOU WOULDN\'T WANT THAT TO HAPPEN WOULD YOU? WOULD YOU? DOC, YOU GOTTA HELP- OH, THEN I WANNA GIVE HER A CALL, I DON\'T WANT HER TO WORRY ABOUT YOU. I DON\'T KNOW, I CAN\'T KEEP UP WITH ALL OF YOUR BOYFRIENDS.\rEXCUSE ME. WHOA, THEY REALLY CLEANED THIS PLACE UP, LOOKS BRAND NEW. BUT I CAN\'T GO TO THE DANCE, I\'LL MISS MY FAVORITE TELEVISION PROGRAM, SCIENCE FICTION THEATER. WILL YOU TAKE CARE OF THAT? WATCH THIS. NOT ME, THE CAR, THE CAR. MY CALCULATIONS ARE CORRECT, WHEN THIS BABY HITS EIGHTY-EIGHT MILES PER HOUR, YOUR GONNA SEE SOME SERIOUS SHIT. WATCH THIS, WATCH THIS. HA, WHAT DID I TELL YOU, EIGHTY-EIGHT MILES PER HOUR. THE TEMPORAL DISPLACEMENT OCCURRED AT EXACTLY 1:20 A.M. AND ZERO SECONDS.\rUH, WELL, ACTUALLY, I FIGURED SINCE IT WASN\'T DUE TILL MONDAY- I THINK IT\'S TERRIBLE. GIRLS CHASING BOYS. WHEN I WAS YOUR AGE I NEVER CHASED A BOY, OR CALLED A BOY, OR SAT IN A PARKED CAR WITH A BOY. LOOK, I\'M JUST NOT READY TO ASK LORRAINE OUT TO THE DANCE, AND NOT YOU, NOR ANYBODY ELSE ON THIS PLANET IS GONNA MAKE ME CHANGE MY MIND. WAIT A MINUTE. WAIT A MINUTE, DOC. ARE YOU TELLING ME THAT IT\'S 8:25? GOOD EVENING, I\'M DOCTOR EMMETT BROWN. I\'M STANDING ON THE PARKING LOT OF TWIN PINES MALL. IT\'S SATURDAY MORNING, OCTOBER 26, 1985, 1:18 A.M. AND THIS IS TEMPORAL EXPERIMENT NUMBER ONE. C\'MON, EINY, HEY HEY BOY, GET IN THERE, THAT A BOY, IN YOU GO, GET DOWN, THAT\'S IT.\rTHAT\'S A FLORENCE NIGHTINGALE EFFECT. IT HAPPENS IN HOSPITALS WHEN NURSES FALL IN LOVE WITH THEIR PATIENTS. GO TO IT, KID. WHOA, THEY REALLY CLEANED THIS PLACE UP, LOOKS BRAND NEW. NO. AW YEAH, EVERYTHING IS GREAT. DON\'T PAY ANY ATTENTION TO HIM, HE\'S IN ONE OF HIS MOODS. SAM, QUIT FIDDLING WITH THAT THING, COME IN HERE TO DINNER. NOW LET\'S SEE, YOU ALREADY KNOW LORRAINE, THIS IS MILTON, THIS IS SALLY, THAT\'S TOBY, AND OVER THERE IN THE PLAYPEN IS LITTLE BABY JOEY.\r\n'),
	(7, '2f93af4285ec0cc04a1a0d45f7fa36a0', 'ARTICLE TITLE 7\r\nBUSEY IPSUM DOLOR SIT AMET...\r\n\rBUSEY IPSUM DOLOR SIT AMET. HAVE YOU URINATED? HAVE YOU DRAINED YOUR BLADDER? ARE YOU FREE? BECAUSE IF YOU HAVEN\'T IT WILL ONLY COME OUT LATER. I\'M GIVING YOU SOME INFORMATION THAT YOUR BODILY FLUIDS MAY PENETRATE YOUR CLOTHING FIBRE\'S WITHOUT WARNING.YOU EVER ROASTED DOUGHNUTS?\rYOU EVER ROASTED DOUGHNUTS?THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING.SOMETIMES HORSES COUGH AND FART AT THE SAME TIME, SO STAY OUT OF THE RANGE OF ITS BUTT MUSCLE BECAUSE A HORSES BUTT MUSCLE IS THICK.\rGO WITH THE FEELING OF THE NATURE. TAKE IT EASY. KNOW WHY YOU\'RE HERE. AND REMEMBER TO BALANCE YOUR INTERNAL ENERGY WITH THE ENVIRONMENT.THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING.\rIT\'S GOOD TO YELL AT PEOPLE AND TELL PEOPLE THAT YOU\'RE FROM TENNESEE, SO THAT WAY YOU\'LL BE SAFE.THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING.\rDID YOU FEEL THAT? LOOK AT ME - I\'M NOT OUT OF BREATH ANYMORE!WHEN YOU GET LOST IN YOUR IMAGINATORY VAGUENESS, YOUR FORESIGHT WILL BECOME A NIMBLE VAGRANT.GO WITH THE FEELING OF THE NATURE. TAKE IT EASY. KNOW WHY YOU\'RE HERE. AND REMEMBER TO BALANCE YOUR INTERNAL ENERGY WITH THE ENVIRONMENT.\r\n'),
	(8, '0474adcfd65215c33ee66721e6067f98', 'ARTICLE TITLE 8\r\nLISTEN TO THE SILENCE...\r\n\rBUSEY IPSUM DOLOR SIT AMET. LISTEN TO THE SILENCE. AND WHEN THE SILENCE IS DEAFENING, YOU\'RE IN THE CENTER OF YOUR OWN UNIVERSE.I WRESTLED A BEAR ONCE. A 750LBS BLACK BEAR.THE MAGIC INDIAN IS A MYSTERIOUS SPIRITUAL FORCE, AND WE\'RE GOING TO CATHEDRAL ROCK, AND THAT\'S THE VORTEX OF THE HEART.\rHAVE YOU URINATED? HAVE YOU DRAINED YOUR BLADDER? ARE YOU FREE? BECAUSE IF YOU HAVEN\'T IT WILL ONLY COME OUT LATER. I\'M GIVING YOU SOME INFORMATION THAT YOUR BODILY FLUIDS MAY PENETRATE YOUR CLOTHING FIBRE\'S WITHOUT WARNING.IT\'S OK TO GET RIB-GREASE ON YOUR FACE, BECAUSE YOU\'RE ALLOWING PEOPLE TO SEE THAT YOU\'RE PROUD OF THESE RIBS.\rI WOULD LIKE TO GIVE YOU A BACKSTAGE PASS TO MY IMAGINATION.LISTEN TO THE SILENCE. AND WHEN THE SILENCE IS DEAFENING, YOU\'RE IN THE CENTER OF YOUR OWN UNIVERSE.HAVE YOU URINATED? HAVE YOU DRAINED YOUR BLADDER? ARE YOU FREE? BECAUSE IF YOU HAVEN\'T IT WILL ONLY COME OUT LATER. I\'M GIVING YOU SOME INFORMATION THAT YOUR BODILY FLUIDS MAY PENETRATE YOUR CLOTHING FIBRE\'S WITHOUT WARNING.\rTHE MAGIC INDIAN IS A MYSTERIOUS SPIRITUAL FORCE, AND WE\'RE GOING TO CATHEDRAL ROCK, AND THAT\'S THE VORTEX OF THE HEART.I WRESTLED A BEAR ONCE. A 750LBS BLACK BEAR.LISTEN TO THE SILENCE. AND WHEN THE SILENCE IS DEAFENING, YOU\'RE IN THE CENTER OF YOUR OWN UNIVERSE.\rYOU GOTTA GO THROUGH IT TO SEE THERE AIN\'T NOTHING TO IT.IT\'S GOOD TO YELL AT PEOPLE AND TELL PEOPLE THAT YOU\'RE FROM TENNESEE, SO THAT WAY YOU\'LL BE SAFE.THE BEST WAY TO COMMUNICATE IS COMPATIBLE. COMPATIBLE COMMUNICATION IS LISTENING WITH OPEN EARS AND AN OPEN MIND, AND NOT BEING FEARFUL OR JUDGEMENTAL ABOUT WHAT YOU\'RE HEARING.\r\n'),
	(9, '7d1b81ca612cb1e361a9c3f9944e56b3', 'ARTICLE TITLE 9\r\nVEGGIES ES BONUS VOBIS, PROINDE VOS POSTULO...\r\n\rVEGGIES ES BONUS VOBIS, PROINDE VOS POSTULO ESSUM MAGIS KOHLRABI WELSH ONION DAIKON AMARANTH TATSOI TOMATILLO MELON AZUKI BEAN GARLIC.\rGUMBO BEET GREENS CORN SOKO ENDIVE GUMBO GOURD. PARSLEY SHALLOT COURGETTE TATSOI PEA SPROUTS FAVA BEAN COLLARD GREENS DANDELION OKRA WAKAME TOMATO. DANDELION CUCUMBER EARTHNUT PEA PEANUT SOKO ZUCCHINI.\rTURNIP GREENS YARROW RICEBEAN RUTABAGA ENDIVE CAULIFLOWER SEA LETTUCE KOHLRABI AMARANTH WATER SPINACH AVOCADO DAIKON NAPA CABBAGE ASPARAGUS WINTER PURSLANE KALE. CELERY POTATO SCALLION DESERT RAISIN HORSERADISH SPINACH CARROT SOKO. LOTUS ROOT WATER SPINACH FENNEL KOMBU MAIZE BAMBOO SHOOT GREEN BEAN SWISS CHARD SEAKALE PUMPKIN ONION CHICKPEA GRAM CORN PEA. BRUSSELS SPROUT CORIANDER WATER CHESTNUT GOURD SWISS CHARD WAKAME KOHLRABI BEETROOT CARROT WATERCRESS. CORN AMARANTH SALSIFY BUNYA NUTS NORI AZUKI BEAN CHICKWEED POTATO BELL PEPPER ARTICHOKE.\rNORI GRAPE SILVER BEET BROCCOLI KOMBU BEET GREENS FAVA BEAN POTATO QUANDONG CELERY. BUNYA NUTS BLACK-EYED PEA PRAIRIE TURNIP LEEK LENTIL TURNIP GREENS PARSNIP. SEA LETTUCE LETTUCE WATER CHESTNUT EGGPLANT WINTER PURSLANE FENNEL AZUKI BEAN EARTHNUT PEA SIERRA LEONE BOLOGI LEEK SOKO CHICORY CELTUCE PARSLEY JÍCAMA SALSIFY.\rCELERY QUANDONG SWISS CHARD CHICORY EARTHNUT PEA POTATO. SALSIFY TARO CATSEAR GARLIC GRAM CELERY BITTERLEAF WATTLE SEED COLLARD GREENS NORI. GRAPE WATTLE SEED KOMBU BEETROOT HORSERADISH CARROT SQUASH BRUSSELS SPROUT CHARD.\rPEA HORSERADISH AZUKI BEAN LETTUCE AVOCADO ASPARAGUS OKRA. KOHLRABI RADISH OKRA AZUKI BEAN CORN FAVA BEAN MUSTARD TIGERNUT JÍCAMA GREEN BEAN CELTUCE COLLARD GREENS AVOCADO QUANDONG FENNEL GUMBO BLACK-EYED PEA. GRAPE SILVER BEET WATERCRESS POTATO TIGERNUT CORN GROUNDNUT. CHICKWEED OKRA PEA WINTER PURSLANE CORIANDER YARROW SWEET PEPPER RADISH GARLIC BRUSSELS SPROUT GROUNDNUT SUMMER PURSLANE EARTHNUT PEA TOMATO SPRING ONION AZUKI BEAN GOURD. GUMBO KAKADU PLUM KOMATSUNA BLACK-EYED PEA GREEN BEAN ZUCCHINI GOURD WINTER PURSLANE SILVER BEET ROCK MELON RADISH ASPARAGUS SPINACH.\rBEETROOT WATER SPINACH OKRA WATER CHESTNUT RICEBEAN PEA CATSEAR COURGETTE SUMMER PURSLANE. WATER SPINACH ARUGULA PEA TATSOI AUBERGINE SPRING ONION BUSH TOMATO KALE RADICCHIO TURNIP CHICORY SALSIFY PEA SPROUTS FAVA BEAN. DANDELION ZUCCHINI BURDOCK YARROW CHICKPEA DANDELION SORREL COURGETTE TURNIP GREENS TIGERNUT SOYBEAN RADISH ARTICHOKE WATTLE SEED ENDIVE GROUNDNUT BROCCOLI ARUGULA.\rSOKO RADICCHIO BUNYA NUTS GRAM DULSE SILVER BEET PARSNIP NAPA CABBAGE LOTUS ROOT SEA LETTUCE BRUSSELS SPROUT CABBAGE. CATSEAR CAULIFLOWER GARBANZO YARROW SALSIFY CHICORY GARLIC BELL PEPPER NAPA CABBAGE LETTUCE TOMATO KALE ARUGULA MELON SIERRA LEONE BOLOGI RUTABAGA TIGERNUT. SEA LETTUCE GUMBO GRAPE KALE KOMBU CAULIFLOWER SALSIFY KOHLRABI OKRA SEA LETTUCE BROCCOLI CELERY LOTUS ROOT CARROT WINTER PURSLANE TURNIP GREENS GARLIC. JÍCAMA GARLIC COURGETTE CORIANDER RADICCHIO PLANTAIN SCALLION CAULIFLOWER FAVA BEAN DESERT RAISIN SPRING ONION CHICORY BUNYA NUTS. SEA LETTUCE WATER SPINACH GRAM FAVA BEAN LEEK DANDELION SILVER BEET EGGPLANT BUSH TOMATO.\r\n'),
	(10, '318d21048b3b819e39b9c974839b4dd2', 'ARTICLE TITLE 10\r\nPOMMY IPSUM ELEMENTARY MY DEAR WATSON...\r\n\rPOMMY IPSUM ELEMENTARY MY DEAR WATSON ASK YOUR MOTHER IF DOWN THE VILLAGE GREEN A TOTAL JESSIE IT\'S ME PEEPERS, SMEG 10 PENCE MIX NAFF OFF SHEPHERD\'S PIE. GOT HIS END AWAY THROW A PADDY CONKED HIM ONE ON THE NOSE A REET BOBBYDAZZLER, 10 PENCE MIX HALF-INCH IT UNION JACK, WIND UP CHALLENGE YOU TO A DUEL. MIDDLE CLASS COBBLES WORKING CLASS CORGI EY UP CHUCK ON HIS TOD, PANTS DOING MY HEAD IN UPPER CLASS ON THE PULL SLING ONE\'S HOOK, TERRIBLY SCONES BARMY NOSE RAG. HALF-INCH IT PENNYBOY BAD WOLF IN THE JACKSY FLABBERGASTED GOLLY GOSH BLOKE I COULD REET FANCY A, PORK DRIPPING HEDGEHOG BECAUSE THERE WAS NOTHING ON THE GOGGLEBOX TALLY-HO THE BLACK DEATH ALRIGHT DUCK, CORGI DOWN THE LOCAL FOOTBALL WHIZZ MUSH A BOTTLE OF PLONK.\rFANCIED A FLUTTER APPLE AND PEARS CONKERS RATHER SCATTERBRAINED CHALLENGE YOU TO A DUEL IT\'S NICKED FOOTBALL RIDICULOUS, FRIED TOAST SCATTERBRAINED DOCTOR WHO BOSSY BRITCHES PANTS EY UP DUCK. HAVE A GANDER RIVETTING STUFF IT\'S THE BEES KNEES UTTER SHAMBLES AMELIA POND FLOG A DEAD HORSE PORKY-PIES SPIFFING CHAV, GUTTED WILLY THAT\'S ACE MORRIS DANCERS SCALLY MEAT AND TWO VEG. SLING ONE\'S HOOK DAMN HAVE A BUTCHER\'S AT THIS BENT AS A NINE BOB NOTE BIG LIGHT KATE AND WILL SUPERB, GIVE YOU A BELL YOU \'AVIN A LAUGH FISH AND CHIPS SOD\'S LAW THE FUZZ GOD SAVE THE QUEEN DARLING, PULLED A RIGHT CORKER DOING MY HEAD IN AT THE BOOZER IS SHE \'AVIN A LAUGH ABSOLUTE TWODDLE.\rDOWN THE VILLAGE GREEN MORIARTY JOLLY BOWLER HAT BARGAIN BETTY, ESSEX GIRLS SCROTE BEEFEATER. DARLING TERRIBLY LUG HOLE SWEET FANNY ADAMS AND THUS KATE AND WILL, DAFT COW SORTED IT CUP OF TEA IT\'S NICKED. VICTORIA SPONGE CAKE 221B BAKER STREET BAG EGG\'S OLD BOY HAD A BARNEY WITH THE INLAWS PICALILLY A BOTTLE OF PLONK COTTON ON, NARKY EY UP CHUCK RAMBUNCTIOUS BOBBY GRAVY CHEESE AND CHIPS DOWN THE LOCAL, VICTORIA SPONGE CAKE COCKNEY RIDICULE I\'M OFF TO BEDFORDSHIRE BOVVER BOOTS. ESSEX GIRLS THE LAKES BRILLIANT BOG ROLL FOOTBALL SCONES BISCUITS, WIBBLY-WOBBLY TIMEY-WIMEY STUFF ROUND OUR GAFF THE CHIPPY PILLOCK SCONES A RIGHT TOFF FISH AND CHIPS, SKIVE REAL ALE DOOFER OFF WITH HER HEAD SCONES.\rOLD GIRL A REET BOBBYDAZZLER COLLYWOBBLES SCONES LOO ONE FEELS THAT, POT NOODLE UP NORTH KNACKERED APPLE AND PEARS. SUPERB NONSENSE DRIVING A MINI LOST HER MARBLES NUMPTY EE BAH GUM BAFFLED HAVE A KIP, THROW A SPANNER IN THE WORKS COULD MURDER A PINT DOOLALLY BOSSY BRITCHES CHAV INDEED. CHUFFED COR BLIMEY\' CLOCK ROUND THE EARHOLE BLACK PUDDING GOBSMACKED IT\'S CRACKING FLAGS SLING ONE\'S HOOK, A RIGHT ROYAL KNEES UP CHAPS WEEPING ANGELS TWIGLETS AMELIA POND GUINNESS, EVER SO LOVELY BOTTLED IT DEVONSHIRE CREAM TEA BLUMMIN\' ESSEX GIRLS. COMPLETELY CRACKERS QUID WELLIES A WEEK ON SUNDAY GOSH GOLLY WELL FIT, WHAT A DODDLE JOLLY GOOD PIE-EYED COPPER ACCORDINGLY EASY PEASY, PRINCE CHARLES ABSOLUTE ON HIS TOD OFF WITH HER HEAD CORNISH PASTY.\rTHE HOUNDS OF BASKERVILLE NOSH TAKING THE MICK OFF T\'SHOP SEE A MAN ABOUT A DOG, BROWN SAUCE ARGY-BARGY CLOCK ROUND THE EARHOLE SOUTHENERS PULLED A RIGHT CORKER, WHAT A MUG OFF WITH HER HEAD CONKERS. DR. WATSON PIE-EYED FLABBERGASTED WHAT A LOAD OF COBBLERS HAVE A GANDER GUINNESS OOPSY-DAISIES, BOVVER BOOTS OFF THE HOOK A RIGHT CORKER IT\'S ME PEEPERS. A WEEK ON SUNDAY CHAP ABSOLUTE NOSE RAG FLOG, NARKY ALRIGHT GEEZER.\r\n'),
	(11, '6ceaf8ae6dcb22daa364d1441da27d99', 'RR BLOG\r\n\r\n'),
	(12, '748a631c49acb531bd803074b2217bdf', 'CONTACT US\r\n\r\n'),
	(13, '9805ff3f9fa419000bada5833c4d6c5b', 'СООБЩЕНИЕ ОТПРАВЛЕНО\r\n\r\n');
/*!40000 ALTER TABLE `b_search_content_text` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_content_title
CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы forms_bitrix.b_search_content_title: ~34 rows (приблизительно)
DELETE FROM `b_search_content_title`;
/*!40000 ALTER TABLE `b_search_content_title` DISABLE KEYS */;
INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
	(1, 's1', 14, '1'),
	(1, 's1', 0, 'ARTICLE'),
	(1, 's1', 8, 'TITLE'),
	(2, 's1', 14, '2'),
	(2, 's1', 0, 'ARTICLE'),
	(2, 's1', 8, 'TITLE'),
	(3, 's1', 14, '3'),
	(3, 's1', 0, 'ARTICLE'),
	(3, 's1', 8, 'TITLE'),
	(4, 's1', 14, '4'),
	(4, 's1', 0, 'ARTICLE'),
	(4, 's1', 8, 'TITLE'),
	(5, 's1', 14, '5'),
	(5, 's1', 0, 'ARTICLE'),
	(5, 's1', 8, 'TITLE'),
	(6, 's1', 14, '6'),
	(6, 's1', 0, 'ARTICLE'),
	(6, 's1', 8, 'TITLE'),
	(7, 's1', 14, '7'),
	(7, 's1', 0, 'ARTICLE'),
	(7, 's1', 8, 'TITLE'),
	(8, 's1', 14, '8'),
	(8, 's1', 0, 'ARTICLE'),
	(8, 's1', 8, 'TITLE'),
	(9, 's1', 14, '9'),
	(9, 's1', 0, 'ARTICLE'),
	(9, 's1', 8, 'TITLE'),
	(10, 's1', 14, '10'),
	(10, 's1', 0, 'ARTICLE'),
	(10, 's1', 8, 'TITLE'),
	(11, 's1', 3, 'BLOG'),
	(11, 's1', 0, 'RR'),
	(12, 's1', 0, 'CONTACT'),
	(12, 's1', 8, 'US'),
	(13, 's1', 10, 'ОТПРАВЛЕНО'),
	(13, 's1', 0, 'СООБЩЕНИЕ');
/*!40000 ALTER TABLE `b_search_content_title` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_custom_rank
CREATE TABLE IF NOT EXISTS `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_custom_rank: ~0 rows (приблизительно)
DELETE FROM `b_search_custom_rank`;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_phrase
CREATE TABLE IF NOT EXISTS `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_phrase: ~0 rows (приблизительно)
DELETE FROM `b_search_phrase`;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_stem
CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=1322 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_stem: ~1 314 rows (приблизительно)
DELETE FROM `b_search_stem`;
/*!40000 ALTER TABLE `b_search_stem` DISABLE KEYS */;
INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
	(1051, '10'),
	(769, '18'),
	(768, '1985'),
	(712, '20'),
	(1206, '221B'),
	(752, '25'),
	(767, '26'),
	(894, '750LBS'),
	(91, 'AB'),
	(665, 'ABOUT'),
	(1184, 'ABSOLUTE'),
	(42, 'AC'),
	(511, 'ACCEDENS'),
	(339, 'ACCEDUNT'),
	(1292, 'ACCORDINGLY'),
	(76, 'ACCUMSAN'),
	(1150, 'ACE'),
	(716, 'ACTUALLY'),
	(488, 'AD'),
	(1198, 'ADAMS'),
	(9, 'ADIPISCING'),
	(386, 'ADLARD'),
	(124, 'ADVENTUS'),
	(40, 'AENEAN'),
	(367, 'AERE'),
	(481, 'AFTER'),
	(728, 'AGE'),
	(470, 'AGITE'),
	(917, 'AIN'),
	(191, 'ALCATRA'),
	(1239, 'ALE'),
	(354, 'ALII'),
	(357, 'ALIORUM'),
	(21, 'ALIQUA'),
	(85, 'ALIQUAM'),
	(28, 'ALIQUET'),
	(670, 'ALL'),
	(910, 'ALLOWING'),
	(808, 'ALREADY'),
	(1113, 'ALRIGHT'),
	(413, 'ALYPSE'),
	(932, 'AMARANTH'),
	(391, 'AMARUS'),
	(332, 'AMBULABAT'),
	(401, 'AMBULABUNT'),
	(1141, 'AMELIA'),
	(7, 'AMET'),
	(161, 'AN'),
	(365, 'AND'),
	(206, 'ANDOUILLE'),
	(1276, 'ANGELS'),
	(101, 'ANIMATA'),
	(132, 'ANIMATED'),
	(421, 'ANTE'),
	(793, 'ANY'),
	(633, 'ANYBODY'),
	(878, 'ANYMORE'),
	(334, 'APATHETIC'),
	(534, 'APERIRE'),
	(108, 'APOCALYPSI'),
	(537, 'APPLE'),
	(475, 'APUD'),
	(244, 'ARCU'),
	(616, 'ARE'),
	(1306, 'ARGY-BARGY'),
	(378, 'ARM'),
	(383, 'ARMIS'),
	(1010, 'ARTICHOKE'),
	(1, 'ARTICLE'),
	(1041, 'ARUGULA'),
	(1160, 'AS'),
	(739, 'ASK'),
	(973, 'ASPARAGUS'),
	(25, 'AT'),
	(517, 'ATE'),
	(794, 'ATTENTION'),
	(408, 'ATTONITOS'),
	(1042, 'AUBERGINE'),
	(80, 'AUCTOR'),
	(26, 'AUGUE'),
	(392, 'AURAS'),
	(1168, 'AVIN'),
	(492, 'AVIUM'),
	(970, 'AVOCADO'),
	(789, 'AW'),
	(1069, 'AWAY'),
	(936, 'AZUKI'),
	(697, 'BABY'),
	(410, 'BACK'),
	(913, 'BACKSTAGE'),
	(175, 'BACON'),
	(1100, 'BAD'),
	(1257, 'BAFFLED'),
	(1209, 'BAG'),
	(1255, 'BAH'),
	(1207, 'BAKER'),
	(867, 'BALANCE'),
	(225, 'BALL'),
	(988, 'BAMBOO'),
	(579, 'BAR'),
	(1190, 'BARGAIN'),
	(1097, 'BARMY'),
	(1213, 'BARNEY'),
	(1299, 'BASKERVILLE'),
	(135, 'BAT'),
	(627, 'BE'),
	(937, 'BEAN'),
	(563, 'BEANS'),
	(575, 'BEAR'),
	(587, 'BEARS'),
	(821, 'BECAUSE'),
	(883, 'BECOME'),
	(1223, 'BEDFORDSHIRE'),
	(216, 'BEEF'),
	(1194, 'BEEFEATER'),
	(1137, 'BEES'),
	(940, 'BEET'),
	(1001, 'BEETROOT'),
	(438, 'BEHEADING'),
	(846, 'BEING'),
	(1008, 'BELL'),
	(423, 'BELLO'),
	(192, 'BELLY'),
	(1159, 'BENT'),
	(838, 'BEST'),
	(1191, 'BETTY'),
	(287, 'BIBENDUM'),
	(412, 'BIEAPOC'),
	(468, 'BIEHIG'),
	(613, 'BIFF'),
	(1164, 'BIG'),
	(200, 'BILTONG'),
	(577, 'BISCUIT'),
	(1229, 'BISCUITS'),
	(1029, 'BITTERLEAF'),
	(895, 'BLACK'),
	(1015, 'BLACK-EYED'),
	(819, 'BLADDER'),
	(245, 'BLANDIT'),
	(1267, 'BLIMEY'),
	(1316, 'BLOG'),
	(1106, 'BLOKE'),
	(1282, 'BLUMMIN'),
	(1162, 'BOB'),
	(1218, 'BOBBY'),
	(1075, 'BOBBYDAZZLER'),
	(827, 'BODILY'),
	(1228, 'BOG'),
	(1023, 'BOLOGI'),
	(554, 'BONBON'),
	(921, 'BONUS'),
	(1225, 'BOOTS'),
	(1182, 'BOOZER'),
	(1132, 'BOSSY'),
	(1119, 'BOTTLE'),
	(1280, 'BOTTLED'),
	(242, 'BOUDIN'),
	(1224, 'BOVVER'),
	(1188, 'BOWLER'),
	(731, 'BOY'),
	(671, 'BOYFRIENDS'),
	(726, 'BOYS'),
	(416, 'BRAAAIIIINS'),
	(362, 'BRAINDEAD'),
	(105, 'BRAINS'),
	(624, 'BRAND'),
	(877, 'BREATH'),
	(217, 'BRESAOLA'),
	(346, 'BRID'),
	(1227, 'BRILLIANT'),
	(210, 'BRISKET'),
	(1133, 'BRITCHES'),
	(1013, 'BROCCOLI'),
	(757, 'BROWN'),
	(570, 'BROWNIE'),
	(137, 'BRUCKS'),
	(997, 'BRUSSELS'),
	(179, 'BUFFALO'),
	(1004, 'BUNYA'),
	(1045, 'BURDOCK'),
	(178, 'BURGDOGGEN'),
	(455, 'BURIAL'),
	(442, 'BURSTING'),
	(816, 'BUSEY'),
	(1043, 'BUSH'),
	(680, 'BUT'),
	(1158, 'BUTCHER'),
	(859, 'BUTT'),
	(972, 'CABBAGE'),
	(387, 'CAERULEUM'),
	(567, 'CAKE'),
	(694, 'CALCULATIONS'),
	(662, 'CALL'),
	(733, 'CALLED'),
	(667, 'CAN'),
	(544, 'CANDY'),
	(545, 'CANES'),
	(496, 'CANUM'),
	(196, 'CAPICOLA'),
	(628, 'CAR'),
	(574, 'CARAMELS'),
	(691, 'CARE'),
	(99, 'CARNE'),
	(149, 'CARNEM'),
	(483, 'CARNIS'),
	(529, 'CARO'),
	(572, 'CARROT'),
	(903, 'CATHEDRAL'),
	(1028, 'CATSEAR'),
	(532, 'CAULE'),
	(965, 'CAULIFLOWER'),
	(977, 'CELERY'),
	(1025, 'CELTUCE'),
	(439, 'CEMETERY'),
	(889, 'CENTER'),
	(129, 'CEREBELLA'),
	(97, 'CEREBRO'),
	(451, 'CHAINSAW'),
	(1080, 'CHALLENGE'),
	(747, 'CHANGE'),
	(1313, 'CHAP'),
	(1274, 'CHAPS'),
	(992, 'CHARD'),
	(1295, 'CHARLES'),
	(730, 'CHASED'),
	(725, 'CHASING'),
	(1147, 'CHAV'),
	(1220, 'CHEESE'),
	(543, 'CHEESECAKE'),
	(1000, 'CHESTNUT'),
	(201, 'CHICKEN'),
	(995, 'CHICKPEA'),
	(1007, 'CHICKWEED'),
	(1024, 'CHICORY'),
	(1234, 'CHIPPY'),
	(1171, 'CHIPS'),
	(187, 'CHISLIC'),
	(542, 'CHOCOLATE'),
	(186, 'CHOP'),
	(219, 'CHUCK'),
	(1265, 'CHUFFED'),
	(564, 'CHUPA'),
	(565, 'CHUPS'),
	(419, 'CLAIRVIUS'),
	(1083, 'CLASS'),
	(576, 'CLAW'),
	(677, 'CLEANED'),
	(1268, 'CLOCK'),
	(831, 'CLOTHING'),
	(1311, 'COBBLERS'),
	(1084, 'COBBLES'),
	(1221, 'COCKNEY'),
	(952, 'COLLARD'),
	(1242, 'COLLYWOBBLES'),
	(803, 'COME'),
	(128, 'COMEDAT'),
	(148, 'COMEDERE'),
	(295, 'COMMODO'),
	(840, 'COMMUNICATE'),
	(842, 'COMMUNICATION'),
	(841, 'COMPATIBLE'),
	(1283, 'COMPLETELY'),
	(293, 'CONDIMENTUM'),
	(390, 'CONGRESS'),
	(262, 'CONGUE'),
	(1072, 'CONKED'),
	(1124, 'CONKERS'),
	(8, 'CONSECTETUR'),
	(257, 'CONSEQUAT'),
	(1317, 'CONTACT'),
	(338, 'CONTAGIUM'),
	(555, 'COOKIE'),
	(349, 'COPIA'),
	(1291, 'COPPER'),
	(1266, 'COR'),
	(1086, 'CORGI'),
	(999, 'CORIANDER'),
	(1181, 'CORKER'),
	(942, 'CORN'),
	(240, 'CORNED'),
	(1296, 'CORNISH'),
	(102, 'CORPORA'),
	(133, 'CORPSE'),
	(326, 'CORPSES'),
	(695, 'CORRECT'),
	(569, 'COTTON'),
	(852, 'COUGH'),
	(1107, 'COULD'),
	(458, 'COUP'),
	(948, 'COURGETTE'),
	(209, 'COW'),
	(359, 'CRABS'),
	(1284, 'CRACKERS'),
	(1271, 'CRACKING'),
	(248, 'CRAS'),
	(425, 'CRAVEN'),
	(315, 'CRAZED'),
	(584, 'CREAM'),
	(119, 'CREATURAS'),
	(317, 'CREATURIS'),
	(377, 'CREEPY'),
	(134, 'CRICKET'),
	(552, 'CROISSANT'),
	(957, 'CUCUMBER'),
	(266, 'CUM'),
	(1202, 'CUP'),
	(571, 'CUPCAKE'),
	(197, 'CUPIM'),
	(310, 'CURABITUR'),
	(462, 'CURRERE'),
	(36, 'CURSUS'),
	(505, 'DAEMONUM'),
	(1200, 'DAFT'),
	(931, 'DAIKON'),
	(1157, 'DAMN'),
	(681, 'DANCE'),
	(1152, 'DANCERS'),
	(953, 'DANDELION'),
	(556, 'DANISH'),
	(55, 'DAPIBUS'),
	(374, 'DARK'),
	(380, 'DARKNESS'),
	(1178, 'DARLING'),
	(518, 'DAZE'),
	(98, 'DE'),
	(313, 'DEAD'),
	(447, 'DEADGURL'),
	(512, 'DEADSENTIO'),
	(888, 'DEAFENING'),
	(1054, 'DEAR'),
	(482, 'DEATH'),
	(464, 'DECAY'),
	(331, 'DECAYING'),
	(503, 'DEFORMIS'),
	(157, 'DEFUNCTIS'),
	(126, 'DENTEVIL'),
	(980, 'DESERT'),
	(561, 'DESSERT'),
	(1281, 'DEVONSHIRE'),
	(60, 'DIAM'),
	(113, 'DICTUM'),
	(706, 'DID'),
	(32, 'DIGNISSIM'),
	(805, 'DINNER'),
	(432, 'DIRI'),
	(298, 'DIS'),
	(709, 'DISPLACEMENT'),
	(12, 'DO'),
	(657, 'DOC'),
	(755, 'DOCTOR'),
	(1289, 'DODDLE'),
	(1304, 'DOG'),
	(617, 'DOING'),
	(5, 'DOLOR'),
	(19, 'DOLORE'),
	(663, 'DON'),
	(52, 'DONEC'),
	(213, 'DONER'),
	(557, 'DONUT'),
	(1240, 'DOOFER'),
	(1263, 'DOOLALLY'),
	(837, 'DOUGHNUTS'),
	(776, 'DOWN'),
	(1309, 'DR'),
	(539, 'DRAGÉE'),
	(818, 'DRAINED'),
	(604, 'DRINK'),
	(1109, 'DRIPPING'),
	(1250, 'DRIVING'),
	(547, 'DROPS'),
	(177, 'DRUMSTICK'),
	(1114, 'DUCK'),
	(720, 'DUE'),
	(1081, 'DUEL'),
	(250, 'DUI'),
	(275, 'DUIS'),
	(1048, 'DULSE'),
	(1269, 'EARHOLE'),
	(845, 'EARS'),
	(958, 'EARTHNUT'),
	(864, 'EASY'),
	(145, 'EATER'),
	(530, 'EATERS'),
	(491, 'EATING'),
	(1254, 'EE'),
	(779, 'EFFECT'),
	(38, 'EGESTAS'),
	(27, 'EGET'),
	(1210, 'EGG'),
	(1020, 'EGGPLANT'),
	(699, 'EIGHTY-EIGHT'),
	(774, 'EINY'),
	(13, 'EIUSMOD'),
	(1053, 'ELEMENTARY'),
	(291, 'ELEMENTUM'),
	(10, 'ELIT'),
	(169, 'ELIV'),
	(743, 'ELSE'),
	(756, 'EMMETT'),
	(1068, 'END'),
	(944, 'ENDIVE'),
	(869, 'ENERGY'),
	(33, 'ENIM'),
	(870, 'ENVIRONMENT'),
	(347, 'EOF'),
	(156, 'EORUM'),
	(523, 'EPIDEMIC'),
	(288, 'ERAT'),
	(51, 'EROS'),
	(920, 'ES'),
	(1192, 'ESSEX'),
	(926, 'ESSUM'),
	(301, 'EST'),
	(18, 'ET'),
	(278, 'ETIAM'),
	(263, 'EU'),
	(71, 'EUISMOD'),
	(754, 'EVENING'),
	(835, 'EVER'),
	(790, 'EVERYTHING'),
	(121, 'EVIL'),
	(711, 'EXACTLY'),
	(672, 'EXCUSE'),
	(376, 'EXPANSIS'),
	(770, 'EXPERIMENT'),
	(1087, 'EY'),
	(443, 'EYEBALLS'),
	(909, 'FACE'),
	(304, 'FACILISI'),
	(300, 'FACILISIS'),
	(783, 'FALL'),
	(303, 'FAMES'),
	(1121, 'FANCIED'),
	(1108, 'FANCY'),
	(1197, 'FANNY'),
	(853, 'FART'),
	(437, 'FASCINATI'),
	(232, 'FATBACK'),
	(62, 'FAUCIBUS'),
	(951, 'FAVA'),
	(683, 'FAVORITE'),
	(847, 'FEARFUL'),
	(454, 'FECIMUS'),
	(319, 'FEEDING'),
	(876, 'FEEL'),
	(862, 'FEELING'),
	(1244, 'FEELS'),
	(48, 'FELIS'),
	(985, 'FENNEL'),
	(498, 'FERAE'),
	(294, 'FERMENTUM'),
	(23, 'FEUGIAT'),
	(832, 'FIBRE'),
	(687, 'FICTION'),
	(801, 'FIDDLING'),
	(717, 'FIGURED'),
	(223, 'FILET'),
	(525, 'FINEM'),
	(510, 'FINIS'),
	(654, 'FIRED'),
	(1170, 'FISH'),
	(463, 'FIT'),
	(1103, 'FLABBERGASTED'),
	(1272, 'FLAGS'),
	(190, 'FLANK'),
	(144, 'FLESH'),
	(1143, 'FLOG'),
	(777, 'FLORENCE'),
	(828, 'FLUIDS'),
	(1122, 'FLUTTER'),
	(1116, 'FOOTBALL'),
	(153, 'FOR'),
	(900, 'FORCE'),
	(882, 'FORESIGHT'),
	(446, 'FORSITAN'),
	(370, 'FOUR'),
	(227, 'FRANKFURTER'),
	(820, 'FREE'),
	(1129, 'FRIED'),
	(281, 'FRINGILLA'),
	(873, 'FROM'),
	(551, 'FRUITCAKE'),
	(497, 'FUGERE'),
	(372, 'FULCI'),
	(292, 'FUSCE'),
	(1174, 'FUZZ'),
	(1233, 'GAFF'),
	(1134, 'GANDER'),
	(1049, 'GARBANZO'),
	(938, 'GARLIC'),
	(1314, 'GEEZER'),
	(397, 'GELIDA'),
	(641, 'GET'),
	(494, 'GHOULS'),
	(550, 'GINGERBREAD'),
	(1241, 'GIRL'),
	(724, 'GIRLS'),
	(661, 'GIVE'),
	(825, 'GIVING'),
	(406, 'GLASSY-EYED'),
	(158, 'GO'),
	(1270, 'GOBSMACKED'),
	(1175, 'GOD'),
	(1111, 'GOGGLEBOX'),
	(902, 'GOING'),
	(606, 'GOLDIE'),
	(1104, 'GOLLY'),
	(434, 'GOLUMS'),
	(626, 'GONNA'),
	(753, 'GOOD'),
	(109, 'GORGER'),
	(1105, 'GOSH'),
	(1067, 'GOT'),
	(637, 'GOTTA'),
	(945, 'GOURD'),
	(996, 'GRAM'),
	(1011, 'GRAPE'),
	(318, 'GRAVE'),
	(259, 'GRAVIDA'),
	(1219, 'GRAVY'),
	(791, 'GREAT'),
	(990, 'GREEN'),
	(941, 'GREENS'),
	(95, 'GRIMES'),
	(238, 'GROUND'),
	(1036, 'GROUNDNUT'),
	(484, 'GRUSOME'),
	(1278, 'GUINNESS'),
	(1256, 'GUM'),
	(939, 'GUMBO'),
	(586, 'GUMMI'),
	(566, 'GUMMIES'),
	(493, 'GUTS'),
	(1148, 'GUTTED'),
	(614, 'GUYS'),
	(705, 'HA'),
	(253, 'HABITANT'),
	(1212, 'HAD'),
	(330, 'HAEC'),
	(1076, 'HALF-INCH'),
	(560, 'HALVAH'),
	(193, 'HAM'),
	(648, 'HAND'),
	(652, 'HANDWRITING'),
	(646, 'HAPPEN'),
	(780, 'HAPPENS'),
	(1189, 'HAT'),
	(638, 'HAVE'),
	(822, 'HAVEN'),
	(796, 'HE'),
	(1090, 'HEAD'),
	(849, 'HEARING'),
	(906, 'HEART'),
	(1110, 'HEDGEHOG'),
	(632, 'HELLO'),
	(658, 'HELP-'),
	(258, 'HENDRERIT'),
	(630, 'HER'),
	(804, 'HERE'),
	(612, 'HEY'),
	(115, 'HI'),
	(795, 'HIM'),
	(797, 'HIS'),
	(433, 'HISTORIARUM'),
	(698, 'HITS'),
	(414, 'HOC'),
	(194, 'HOCK'),
	(1196, 'HOLE'),
	(634, 'HOME'),
	(1094, 'HOOK'),
	(500, 'HORRENDA'),
	(311, 'HORRIBILEM'),
	(453, 'HORRIFYING'),
	(166, 'HORROR'),
	(1144, 'HORSE'),
	(982, 'HORSERADISH'),
	(851, 'HORSES'),
	(394, 'HORUM'),
	(781, 'HOSPITALS'),
	(1298, 'HOUNDS'),
	(701, 'HOUR'),
	(615, 'HOW'),
	(469, 'HWAY'),
	(308, 'IACULIS'),
	(341, 'IAM'),
	(583, 'ICE'),
	(582, 'ICING'),
	(59, 'ID'),
	(647, 'IF'),
	(448, 'ILLUD'),
	(915, 'IMAGINATION'),
	(880, 'IMAGINATORY'),
	(120, 'IMO'),
	(285, 'IMPERDIET'),
	(489, 'IMPETUM'),
	(368, 'IMPLENT'),
	(57, 'IN'),
	(139, 'INCESSU'),
	(15, 'INCIDIDUNT'),
	(418, 'INCIPERE'),
	(1264, 'INDEED'),
	(456, 'INDEFLEXUS'),
	(897, 'INDIAN'),
	(409, 'INDIFFERENT'),
	(366, 'INFECT'),
	(499, 'INFECTI'),
	(509, 'INFERI'),
	(93, 'INFERNO'),
	(826, 'INFORMATION'),
	(170, 'INGDEAD'),
	(1214, 'INLAWS'),
	(273, 'INTEGER'),
	(68, 'INTERDUM'),
	(868, 'INTERNAL'),
	(327, 'IPSA'),
	(4, 'IPSUM'),
	(320, 'IRIDE'),
	(422, 'IS'),
	(623, 'IT'),
	(858, 'ITS'),
	(1078, 'JACK'),
	(1102, 'JACKSY'),
	(540, 'JELLY'),
	(578, 'JELLY-O'),
	(176, 'JERKY'),
	(1059, 'JESSIE'),
	(815, 'JOEY'),
	(1187, 'JOLLY'),
	(181, 'JOWL'),
	(848, 'JUDGEMENTAL'),
	(573, 'JUJUBES'),
	(737, 'JUST'),
	(1026, 'JÍCAMA'),
	(1039, 'KAKADU'),
	(976, 'KALE'),
	(1166, 'KATE'),
	(668, 'KEEP'),
	(189, 'KEVIN'),
	(787, 'KID'),
	(243, 'KIELBASA'),
	(364, 'KILL'),
	(522, 'KINGDEAD'),
	(1258, 'KIP'),
	(384, 'KIRKMAN'),
	(1248, 'KNACKERED'),
	(1138, 'KNEES'),
	(666, 'KNOW'),
	(928, 'KOHLRABI'),
	(1040, 'KOMATSUNA'),
	(986, 'KOMBU'),
	(17, 'LABORE'),
	(72, 'LACINIA'),
	(261, 'LACUS'),
	(1226, 'LAKES'),
	(180, 'LANDJAEGER'),
	(824, 'LATER'),
	(1169, 'LAUGH'),
	(1173, 'LAW'),
	(220, 'LEBERKAS'),
	(64, 'LECTUS'),
	(1017, 'LEEK'),
	(369, 'LEFT'),
	(353, 'LEGIONIS'),
	(519, 'LEIGHTER'),
	(546, 'LEMON'),
	(1018, 'LENTIL'),
	(272, 'LEO'),
	(1022, 'LEONE'),
	(807, 'LET'),
	(967, 'LETTUCE'),
	(246, 'LIBERO'),
	(1165, 'LIGHT'),
	(608, 'LIKE'),
	(559, 'LIQUORICE'),
	(886, 'LISTEN'),
	(843, 'LISTENING'),
	(814, 'LITTLE'),
	(479, 'LIVING'),
	(653, 'LL'),
	(1310, 'LOAD'),
	(22, 'LOBORTIS'),
	(1115, 'LOCAL'),
	(388, 'LOCIS'),
	(218, 'LOIN'),
	(585, 'LOLLIPOP'),
	(1243, 'LOO'),
	(736, 'LOOK'),
	(679, 'LOOKS'),
	(3, 'LOREM'),
	(740, 'LORRAINE'),
	(879, 'LOST'),
	(760, 'LOT'),
	(983, 'LOTUS'),
	(784, 'LOVE'),
	(1279, 'LOVELY'),
	(371, 'LUCIO'),
	(86, 'LUCTUS'),
	(1195, 'LUG'),
	(159, 'LUM'),
	(100, 'LUMBERING'),
	(597, 'MACAROON'),
	(531, 'MAGGOTS'),
	(896, 'MAGIC'),
	(927, 'MAGIS'),
	(20, 'MAGNA'),
	(297, 'MAGNIS'),
	(987, 'MAIZE'),
	(746, 'MAKE'),
	(107, 'MALEFICIA'),
	(265, 'MALESUADA'),
	(763, 'MALL'),
	(96, 'MALUM'),
	(164, 'MALUS'),
	(440, 'MAN'),
	(1252, 'MARBLES'),
	(568, 'MARSHMALLOW'),
	(580, 'MARZIPAN'),
	(45, 'MASSA'),
	(66, 'MATTIS'),
	(114, 'MAURIS'),
	(136, 'MAX'),
	(829, 'MAY'),
	(605, 'MAYOR'),
	(636, 'MCFLY'),
	(673, 'ME'),
	(619, 'MEAN'),
	(1154, 'MEAT'),
	(211, 'MEATBALL'),
	(207, 'MEATLOAF'),
	(935, 'MELON'),
	(427, 'MEMORIA'),
	(283, 'METUS'),
	(1302, 'MICK'),
	(1082, 'MIDDLE'),
	(224, 'MIGNON'),
	(700, 'MILES'),
	(809, 'MILTON'),
	(748, 'MIND'),
	(116, 'MINDLESS'),
	(1251, 'MINI'),
	(750, 'MINUTE'),
	(682, 'MISS'),
	(355, 'MISSING'),
	(1063, 'MIX'),
	(441, 'MODERN'),
	(63, 'MOLESTIE'),
	(290, 'MOLLIS'),
	(773, 'MON'),
	(722, 'MONDAY-'),
	(123, 'MONSTRA'),
	(798, 'MOODS'),
	(385, 'MOORE'),
	(254, 'MORBI'),
	(106, 'MORBO'),
	(1186, 'MORIARTY'),
	(765, 'MORNING'),
	(1151, 'MORRIS'),
	(474, 'MORTUA'),
	(340, 'MORTUI'),
	(117, 'MORTUIS'),
	(147, 'MORTUOS'),
	(405, 'MORTUUM'),
	(1056, 'MOTHER'),
	(345, 'MOVERI'),
	(174, 'MOVIE'),
	(541, 'MUFFIN'),
	(1308, 'MUG'),
	(424, 'MUNDI'),
	(1261, 'MURDER'),
	(306, 'MUS'),
	(860, 'MUSCLE'),
	(1118, 'MUSH'),
	(1034, 'MUSTARD'),
	(649, 'MY'),
	(898, 'MYSTERIOUS'),
	(1064, 'NAFF'),
	(84, 'NAM'),
	(971, 'NAPA'),
	(420, 'NARCISSE'),
	(1216, 'NARKY'),
	(268, 'NATOQUE'),
	(863, 'NATURE'),
	(29, 'NEC'),
	(81, 'NEQUE'),
	(160, 'NESCIO'),
	(307, 'NETUS'),
	(729, 'NEVER'),
	(625, 'NEW'),
	(256, 'NIBH'),
	(1127, 'NICKED'),
	(167, 'NIGH'),
	(477, 'NIGHT'),
	(778, 'NIGHTINGALE'),
	(393, 'NIHIL'),
	(884, 'NIMBLE'),
	(1161, 'NINE'),
	(78, 'NISI'),
	(77, 'NISL'),
	(788, 'NO'),
	(533, 'NOBIS'),
	(70, 'NON'),
	(1249, 'NONSENSE'),
	(1246, 'NOODLE'),
	(742, 'NOR'),
	(1006, 'NORI'),
	(1247, 'NORTH'),
	(476, 'NOS'),
	(1073, 'NOSE'),
	(1300, 'NOSH'),
	(465, 'NOSTRA'),
	(360, 'NOSTRAM'),
	(693, 'NOT'),
	(1163, 'NOTE'),
	(918, 'NOTHING'),
	(806, 'NOW'),
	(264, 'NULLA'),
	(47, 'NULLAM'),
	(771, 'NUMBER'),
	(1253, 'NUMPTY'),
	(49, 'NUNC'),
	(782, 'NURSES'),
	(1005, 'NUTS'),
	(596, 'OAT'),
	(710, 'OCCURRED'),
	(766, 'OCTOBER'),
	(155, 'OCULI'),
	(356, 'OCULIS'),
	(407, 'OCULOS'),
	(53, 'ODIO'),
	(363, 'ODORES'),
	(478, 'OF'),
	(1065, 'OFF'),
	(171, 'OFFENDERIT'),
	(324, 'OFTHE'),
	(611, 'OH'),
	(907, 'OK'),
	(954, 'OKRA'),
	(1211, 'OLD'),
	(110, 'OMERO'),
	(426, 'OMNI'),
	(744, 'ON'),
	(893, 'ONCE'),
	(772, 'ONE'),
	(930, 'ONION'),
	(823, 'ONLY'),
	(1312, 'OOPSY-DAISIES'),
	(844, 'OPEN'),
	(732, 'OR'),
	(54, 'ORCI'),
	(486, 'ORGANA'),
	(249, 'ORNARE'),
	(1232, 'OUR'),
	(741, 'OUT'),
	(812, 'OVER'),
	(890, 'OWN'),
	(1071, 'PADDY'),
	(504, 'PALE'),
	(182, 'PANCETTA'),
	(506, 'PANDUNTUR'),
	(1089, 'PANTS'),
	(735, 'PARKED'),
	(759, 'PARKING'),
	(946, 'PARSLEY'),
	(1019, 'PARSNIP'),
	(299, 'PARTURIENT'),
	(914, 'PASS'),
	(231, 'PASTRAMI'),
	(548, 'PASTRY'),
	(1297, 'PASTY'),
	(786, 'PATIENTS'),
	(428, 'PATRIAE'),
	(792, 'PAY'),
	(949, 'PEA'),
	(959, 'PEANUT'),
	(1123, 'PEARS'),
	(1293, 'PEASY'),
	(1060, 'PEEPERS'),
	(83, 'PELLENTESQUE'),
	(269, 'PENATIBUS'),
	(1062, 'PENCE'),
	(830, 'PENETRATE'),
	(1099, 'PENNYBOY'),
	(872, 'PEOPLE'),
	(1009, 'PEPPER'),
	(460, 'PER'),
	(444, 'PERHSAPS'),
	(514, 'PERTERRITUS'),
	(322, 'PESTILENTIA'),
	(41, 'PHARETRA'),
	(1215, 'PICALILLY'),
	(241, 'PICANHA'),
	(538, 'PIE'),
	(1290, 'PIE-EYED'),
	(230, 'PIG'),
	(1235, 'PILLOCK'),
	(762, 'PINES'),
	(1262, 'PINT'),
	(678, 'PLACE'),
	(43, 'PLACERAT'),
	(329, 'PLAGUE'),
	(335, 'PLAN'),
	(745, 'PLANET'),
	(1050, 'PLANTAIN'),
	(461, 'PLATEAS'),
	(813, 'PLAYPEN'),
	(1120, 'PLONK'),
	(593, 'PLUM'),
	(450, 'POENAE'),
	(466, 'POENITENTIAM'),
	(1052, 'POMMY'),
	(1142, 'POND'),
	(202, 'PORCHETTA'),
	(185, 'PORK'),
	(1145, 'PORKY-PIES'),
	(289, 'PORTA'),
	(507, 'PORTAE'),
	(399, 'PORTENTA'),
	(296, 'PORTTITOR'),
	(925, 'POSTULO'),
	(69, 'POSUERE'),
	(1245, 'POT'),
	(978, 'POTATO'),
	(87, 'POTENTI'),
	(459, 'POUDRE'),
	(553, 'POWDER'),
	(255, 'PRAESENT'),
	(1016, 'PRAIRIE'),
	(39, 'PRETIUM'),
	(1294, 'PRINCE'),
	(685, 'PROGRAM'),
	(286, 'PROIN'),
	(923, 'PROINDE'),
	(215, 'PROSCIUTTO'),
	(911, 'PROUD'),
	(581, 'PUDDING'),
	(1092, 'PULL'),
	(1179, 'PULLED'),
	(252, 'PULVINAR'),
	(994, 'PUMPKIN'),
	(975, 'PURSLANE'),
	(74, 'PURUS'),
	(165, 'PUTRID'),
	(361, 'PUTRIDI'),
	(472, 'PŒNITENTIAM'),
	(103, 'QUAERITIS'),
	(61, 'QUAM'),
	(1014, 'QUANDONG'),
	(1177, 'QUEEN'),
	(131, 'QUI'),
	(1285, 'QUID'),
	(73, 'QUIS'),
	(58, 'QUISQUE'),
	(800, 'QUIT'),
	(1044, 'RADICCHIO'),
	(1033, 'RADISH'),
	(1098, 'RAG'),
	(436, 'RAIMI'),
	(981, 'RAISIN'),
	(1217, 'RAMBUNCTIOUS'),
	(857, 'RANGE'),
	(172, 'RAPTO'),
	(1125, 'RATHER'),
	(471, 'RE'),
	(643, 'RE-TYPED'),
	(738, 'READY'),
	(1238, 'REAL'),
	(644, 'REALIZE'),
	(676, 'REALLY'),
	(348, 'REANIMATOR'),
	(1074, 'REET'),
	(430, 'RELIGIONIS'),
	(866, 'REMEMBER'),
	(650, 'REPORTS'),
	(125, 'RESI'),
	(314, 'RESURGERE'),
	(90, 'REVERSUS'),
	(309, 'RHONCUS'),
	(908, 'RIB-GREASE'),
	(203, 'RIBEYE'),
	(205, 'RIBS'),
	(963, 'RICEBEAN'),
	(94, 'RICK'),
	(1222, 'RIDICULE'),
	(1128, 'RIDICULOUS'),
	(305, 'RIDICULUS'),
	(1180, 'RIGHT'),
	(31, 'RISUS'),
	(1135, 'RIVETTING'),
	(836, 'ROASTED'),
	(904, 'ROCK'),
	(591, 'ROLL'),
	(389, 'ROMERO'),
	(984, 'ROOT'),
	(508, 'ROTTING'),
	(239, 'ROUND'),
	(1273, 'ROYAL'),
	(1315, 'RR'),
	(199, 'RUMP'),
	(964, 'RUTABAGA'),
	(260, 'RUTRUM'),
	(143, 'SACERDOS'),
	(875, 'SAFE'),
	(271, 'SAGITTIS'),
	(229, 'SALAMI'),
	(810, 'SALLY'),
	(1003, 'SALSIFY'),
	(799, 'SAM'),
	(854, 'SAME'),
	(270, 'SAPIEN'),
	(734, 'SAT'),
	(764, 'SATURDAY'),
	(1305, 'SAUCE'),
	(208, 'SAUSAGE'),
	(1176, 'SAVE'),
	(979, 'SCALLION'),
	(1153, 'SCALLY'),
	(1126, 'SCATTERBRAINED'),
	(251, 'SCELERISQUE'),
	(686, 'SCIENCE'),
	(1096, 'SCONES'),
	(328, 'SCREAMS'),
	(1193, 'SCROTE'),
	(325, 'SCYTHE'),
	(966, 'SEA'),
	(993, 'SEAKALE'),
	(173, 'SEARCH'),
	(714, 'SECONDS'),
	(11, 'SED'),
	(702, 'SEE'),
	(1031, 'SEED'),
	(621, 'SEEN'),
	(280, 'SEM'),
	(79, 'SEMPER'),
	(536, 'SENTIO'),
	(528, 'SENTIT'),
	(316, 'SEPULCRIS'),
	(704, 'SERIOUS'),
	(321, 'SERPENS'),
	(358, 'SERPERE'),
	(598, 'SESAME'),
	(947, 'SHALLOT'),
	(1140, 'SHAMBLES'),
	(188, 'SHANK'),
	(235, 'SHANKLE'),
	(323, 'SHAUN'),
	(1183, 'SHE'),
	(1066, 'SHEPHERD'),
	(631, 'SHIT'),
	(989, 'SHOOT'),
	(1303, 'SHOP'),
	(233, 'SHORT'),
	(457, 'SHOTGUN'),
	(184, 'SHOULDER'),
	(603, 'SHOULDN'),
	(163, 'SICUT'),
	(1021, 'SIERRA'),
	(524, 'SIGNIFICANT'),
	(887, 'SILENCE'),
	(1012, 'SILVER'),
	(718, 'SINCE'),
	(350, 'SINT'),
	(228, 'SIRLOIN'),
	(6, 'SIT'),
	(1237, 'SKIVE'),
	(396, 'SLACK-JAWED'),
	(1093, 'SLING'),
	(1061, 'SMEG'),
	(599, 'SNAPS'),
	(415, 'SNOW'),
	(855, 'SO'),
	(267, 'SOCIIS'),
	(417, 'SOCIOPATHIC'),
	(1172, 'SOD'),
	(279, 'SODALES'),
	(943, 'SOKO'),
	(277, 'SOLLICITUDIN'),
	(154, 'SOLUM'),
	(703, 'SOME'),
	(850, 'SOMETIMES'),
	(1046, 'SORREL'),
	(1201, 'SORTED'),
	(549, 'SOUFFLÉ'),
	(404, 'SOULESS'),
	(118, 'SOULLESS'),
	(609, 'SOUND'),
	(1307, 'SOUTHENERS'),
	(1047, 'SOYBEAN'),
	(1259, 'SPANNER'),
	(204, 'SPARE'),
	(487, 'SPARGIT'),
	(1146, 'SPIFFING'),
	(969, 'SPINACH'),
	(899, 'SPIRITUAL'),
	(1205, 'SPONGE'),
	(1038, 'SPRING'),
	(998, 'SPROUT'),
	(950, 'SPROUTS'),
	(1032, 'SQUASH'),
	(449, 'STAGGERING'),
	(122, 'STALKING'),
	(758, 'STANDING'),
	(856, 'STAY'),
	(222, 'STEAK'),
	(1208, 'STREET'),
	(221, 'STRIP'),
	(1136, 'STUFF'),
	(592, 'SUGAR'),
	(1037, 'SUMMER'),
	(104, 'SUMMUS'),
	(1288, 'SUNDAY'),
	(431, 'SUNT'),
	(402, 'SUPER'),
	(1167, 'SUPERB'),
	(527, 'SUPERESSE'),
	(490, 'SUPERSUMUS'),
	(398, 'SURVIVAL'),
	(112, 'SURVIVOR'),
	(146, 'SUSCITAT'),
	(67, 'SUSPENDISSE'),
	(590, 'SWEET'),
	(991, 'SWISS'),
	(236, 'T-BONE'),
	(520, 'TAEDIUM'),
	(212, 'TAIL'),
	(690, 'TAKE'),
	(1301, 'TAKING'),
	(1112, 'TALLY-HO'),
	(344, 'TARDIUS'),
	(1027, 'TARO'),
	(558, 'TART'),
	(933, 'TATSOI'),
	(152, 'TATTERED'),
	(1203, 'TEA'),
	(516, 'TEE'),
	(684, 'TELEVISION'),
	(707, 'TELL'),
	(751, 'TELLING'),
	(302, 'TELLUS'),
	(14, 'TEMPOR'),
	(708, 'TEMPORAL'),
	(44, 'TEMPUS'),
	(237, 'TENDERLOIN'),
	(874, 'TENNESEE'),
	(403, 'TERRAM'),
	(445, 'TERRENTI'),
	(138, 'TERRIBILEM'),
	(351, 'TERRIBILES'),
	(723, 'TERRIBLE'),
	(1095, 'TERRIBLY'),
	(336, 'TERROR'),
	(513, 'TERRORE'),
	(1319, 'TEXT'),
	(610, 'THAT'),
	(141, 'THE'),
	(688, 'THEATER'),
	(785, 'THEIR'),
	(642, 'THEM'),
	(659, 'THEN'),
	(775, 'THERE'),
	(912, 'THESE'),
	(675, 'THEY'),
	(861, 'THICK'),
	(802, 'THING'),
	(635, 'THINK'),
	(622, 'THIS'),
	(916, 'THROUGH'),
	(1070, 'THROW'),
	(1199, 'THUS'),
	(1035, 'TIGERNUT'),
	(721, 'TILL'),
	(639, 'TIME'),
	(1231, 'TIMEY-WIMEY'),
	(395, 'TINCIDUNT'),
	(226, 'TIP'),
	(562, 'TIRAMISU'),
	(2, 'TITLE'),
	(640, 'TO'),
	(1130, 'TOAST'),
	(811, 'TOBY'),
	(1088, 'TOD'),
	(1236, 'TOFF'),
	(588, 'TOFFEE'),
	(168, 'TOFTH'),
	(934, 'TOMATILLO'),
	(956, 'TOMATO'),
	(198, 'TONGUE'),
	(594, 'TOOTSIE'),
	(589, 'TOPPING'),
	(88, 'TORTOR'),
	(1058, 'TOTAL'),
	(373, 'TREMOR'),
	(234, 'TRI-TIP'),
	(276, 'TRISTIQUE'),
	(195, 'TURDUCKEN'),
	(183, 'TURKEY'),
	(961, 'TURNIP'),
	(37, 'TURPIS'),
	(515, 'TWEN'),
	(502, 'TWENTY-EIGHT'),
	(1277, 'TWIGLETS'),
	(761, 'TWIN'),
	(1155, 'TWO'),
	(1185, 'TWODDLE'),
	(715, 'UH'),
	(30, 'ULLAMCORPER'),
	(381, 'ULNIS'),
	(56, 'ULTRICES'),
	(46, 'ULTRICIES'),
	(111, 'UNDEAD'),
	(352, 'UNDEATH'),
	(495, 'UNHOLY'),
	(1077, 'UNION'),
	(891, 'UNIVERSE'),
	(400, 'UNLEASHED'),
	(343, 'UNLIFE'),
	(435, 'UNRELENTING'),
	(526, 'UNUM'),
	(669, 'UP'),
	(1091, 'UPPER'),
	(817, 'URINATED'),
	(35, 'URNA'),
	(1318, 'US'),
	(16, 'UT'),
	(1139, 'UTTER'),
	(885, 'VAGRANT'),
	(881, 'VAGUENESS'),
	(282, 'VARIUS'),
	(620, 'VE'),
	(1156, 'VEG'),
	(919, 'VEGGIES'),
	(50, 'VEL'),
	(274, 'VELIT'),
	(34, 'VENENATIS'),
	(214, 'VENISON'),
	(65, 'VESTIBULUM'),
	(1204, 'VICTORIA'),
	(501, 'VIDEMUS'),
	(535, 'VIDEO'),
	(1057, 'VILLAGE'),
	(467, 'VIOLENT'),
	(92, 'VIRAL'),
	(150, 'VIRUS'),
	(485, 'VISCERA'),
	(82, 'VITAE'),
	(342, 'VIVAM'),
	(24, 'VIVAMUS'),
	(473, 'VIVENS'),
	(130, 'VIVENTIUM'),
	(75, 'VIVERRA'),
	(375, 'VIVOS'),
	(922, 'VOBIS'),
	(247, 'VOLUTPAT'),
	(142, 'VOODOO'),
	(905, 'VORTEX'),
	(924, 'VOS'),
	(337, 'VULNERUM'),
	(284, 'VULPUTATE'),
	(127, 'VULTUS'),
	(595, 'WAFER'),
	(749, 'WAIT'),
	(955, 'WAKAME'),
	(521, 'WAL'),
	(312, 'WALKING'),
	(660, 'WANNA'),
	(656, 'WANT'),
	(834, 'WARNING'),
	(727, 'WAS'),
	(719, 'WASN'),
	(692, 'WATCH'),
	(968, 'WATER'),
	(1002, 'WATERCRESS'),
	(1055, 'WATSON'),
	(1030, 'WATTLE'),
	(839, 'WAY'),
	(901, 'WE'),
	(1287, 'WEEK'),
	(1275, 'WEEPING'),
	(601, 'WELL'),
	(1286, 'WELLIES'),
	(929, 'WELSH'),
	(618, 'WHAT'),
	(696, 'WHEN'),
	(1117, 'WHIZZ'),
	(1131, 'WHO'),
	(674, 'WHOA'),
	(865, 'WHY'),
	(480, 'WHYT'),
	(1230, 'WIBBLY-WOBBLY'),
	(689, 'WILL'),
	(1149, 'WILLY'),
	(607, 'WILSON'),
	(1079, 'WIND'),
	(974, 'WINTER'),
	(382, 'WITCHCRAFT'),
	(629, 'WITH'),
	(833, 'WITHOUT'),
	(1101, 'WOLF'),
	(1085, 'WORKING'),
	(1260, 'WORKS'),
	(664, 'WORRY'),
	(645, 'WOULD'),
	(655, 'WOULDN'),
	(892, 'WRESTLED'),
	(962, 'YARROW'),
	(600, 'YEAH'),
	(871, 'YELL'),
	(379, 'YOF'),
	(602, 'YOU'),
	(651, 'YOUR'),
	(333, 'ZEDER'),
	(713, 'ZERO'),
	(411, 'ZOM'),
	(452, 'ZOMBI'),
	(89, 'ZOMBIE'),
	(429, 'ZOMBIELAND'),
	(162, 'ZOMBIES'),
	(140, 'ZOMBY'),
	(151, 'ZONBI'),
	(960, 'ZUCCHINI'),
	(1321, 'ОТПРАВЛ'),
	(1320, 'СООБЩЕН');
/*!40000 ALTER TABLE `b_search_stem` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_suggest
CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_suggest: ~0 rows (приблизительно)
DELETE FROM `b_search_suggest`;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_tags
CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы forms_bitrix.b_search_tags: ~0 rows (приблизительно)
DELETE FROM `b_search_tags`;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_search_user_right
CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_search_user_right: ~0 rows (приблизительно)
DELETE FROM `b_search_user_right`;
/*!40000 ALTER TABLE `b_search_user_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_user_right` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_security_sitecheck
CREATE TABLE IF NOT EXISTS `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_security_sitecheck: ~0 rows (приблизительно)
DELETE FROM `b_security_sitecheck`;
/*!40000 ALTER TABLE `b_security_sitecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_security_sitecheck` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_filter_mask
CREATE TABLE IF NOT EXISTS `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_filter_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_filter_mask`;
/*!40000 ALTER TABLE `b_sec_filter_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_filter_mask` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_frame_mask
CREATE TABLE IF NOT EXISTS `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_frame_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_frame_mask`;
/*!40000 ALTER TABLE `b_sec_frame_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_frame_mask` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_iprule
CREATE TABLE IF NOT EXISTS `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_iprule: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule`;
/*!40000 ALTER TABLE `b_sec_iprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_iprule_excl_ip
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_iprule_excl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_ip`;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_iprule_excl_mask
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_iprule_excl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_mask`;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_iprule_incl_ip
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_iprule_incl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_ip`;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_iprule_incl_mask
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_iprule_incl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_mask`;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_recovery_codes
CREATE TABLE IF NOT EXISTS `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_recovery_codes: ~0 rows (приблизительно)
DELETE FROM `b_sec_recovery_codes`;
/*!40000 ALTER TABLE `b_sec_recovery_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_recovery_codes` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_redirect_url
CREATE TABLE IF NOT EXISTS `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_redirect_url: ~2 rows (приблизительно)
DELETE FROM `b_sec_redirect_url`;
/*!40000 ALTER TABLE `b_sec_redirect_url` DISABLE KEYS */;
INSERT INTO `b_sec_redirect_url` (`IS_SYSTEM`, `SORT`, `URL`, `PARAMETER_NAME`) VALUES
	('Y', 10, '/bitrix/redirect.php', 'goto'),
	('Y', 20, '/bitrix/rk.php', 'goto'),
	('Y', 30, '/bitrix/click.php', 'goto');
/*!40000 ALTER TABLE `b_sec_redirect_url` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_session
CREATE TABLE IF NOT EXISTS `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_session: ~0 rows (приблизительно)
DELETE FROM `b_sec_session`;
/*!40000 ALTER TABLE `b_sec_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_session` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_user
CREATE TABLE IF NOT EXISTS `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_user: ~0 rows (приблизительно)
DELETE FROM `b_sec_user`;
/*!40000 ALTER TABLE `b_sec_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_user` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_virus
CREATE TABLE IF NOT EXISTS `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_virus: ~0 rows (приблизительно)
DELETE FROM `b_sec_virus`;
/*!40000 ALTER TABLE `b_sec_virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_virus` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sec_white_list
CREATE TABLE IF NOT EXISTS `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sec_white_list: ~0 rows (приблизительно)
DELETE FROM `b_sec_white_list`;
/*!40000 ALTER TABLE `b_sec_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_white_list` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_autolog
CREATE TABLE IF NOT EXISTS `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_autolog: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_autolog`;
/*!40000 ALTER TABLE `b_seo_adv_autolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_autolog` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_banner
CREATE TABLE IF NOT EXISTS `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_banner: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_banner`;
/*!40000 ALTER TABLE `b_seo_adv_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_banner` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_campaign
CREATE TABLE IF NOT EXISTS `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_campaign: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_campaign`;
/*!40000 ALTER TABLE `b_seo_adv_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_campaign` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_group
CREATE TABLE IF NOT EXISTS `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_group: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_group`;
/*!40000 ALTER TABLE `b_seo_adv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_link
CREATE TABLE IF NOT EXISTS `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_link: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_link`;
/*!40000 ALTER TABLE `b_seo_adv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_link` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_log
CREATE TABLE IF NOT EXISTS `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_log`;
/*!40000 ALTER TABLE `b_seo_adv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_log` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_order
CREATE TABLE IF NOT EXISTS `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_order: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_order`;
/*!40000 ALTER TABLE `b_seo_adv_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_order` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_adv_region
CREATE TABLE IF NOT EXISTS `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_adv_region: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_region`;
/*!40000 ALTER TABLE `b_seo_adv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_region` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_keywords
CREATE TABLE IF NOT EXISTS `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_keywords: ~0 rows (приблизительно)
DELETE FROM `b_seo_keywords`;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_search_engine
CREATE TABLE IF NOT EXISTS `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_search_engine: ~3 rows (приблизительно)
DELETE FROM `b_seo_search_engine`;
/*!40000 ALTER TABLE `b_seo_search_engine` DISABLE KEYS */;
INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
	(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
	(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
	(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);
/*!40000 ALTER TABLE `b_seo_search_engine` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_service_log
CREATE TABLE IF NOT EXISTS `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_service_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_log`;
/*!40000 ALTER TABLE `b_seo_service_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_log` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_service_rtg_queue
CREATE TABLE IF NOT EXISTS `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_service_rtg_queue: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_rtg_queue`;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_service_subscription
CREATE TABLE IF NOT EXISTS `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_service_subscription: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_subscription`;
/*!40000 ALTER TABLE `b_seo_service_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_subscription` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_service_webhook
CREATE TABLE IF NOT EXISTS `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_service_webhook: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_webhook`;
/*!40000 ALTER TABLE `b_seo_service_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_webhook` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_sitemap
CREATE TABLE IF NOT EXISTS `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_sitemap: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap`;
/*!40000 ALTER TABLE `b_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_sitemap_entity
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_sitemap_entity: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_entity`;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_sitemap_iblock
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_sitemap_iblock: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_iblock`;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_sitemap_runtime
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_sitemap_runtime: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_runtime`;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_seo_yandex_direct_stat
CREATE TABLE IF NOT EXISTS `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_seo_yandex_direct_stat: ~0 rows (приблизительно)
DELETE FROM `b_seo_yandex_direct_stat`;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_short_uri
CREATE TABLE IF NOT EXISTS `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_short_uri: ~0 rows (приблизительно)
DELETE FROM `b_short_uri`;
/*!40000 ALTER TABLE `b_short_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_short_uri` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_site_template
CREATE TABLE IF NOT EXISTS `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_site_template: ~0 rows (приблизительно)
DELETE FROM `b_site_template`;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
	(1, 's1', '', 1, 'blog_rr');
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_smile
CREATE TABLE IF NOT EXISTS `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_smile: ~24 rows (приблизительно)
DELETE FROM `b_smile`;
/*!40000 ALTER TABLE `b_smile` DISABLE KEYS */;
INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
	(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
	(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
	(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
	(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
	(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
	(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
	(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
	(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
	(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
	(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
	(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
	(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
	(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
	(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
	(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
	(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
	(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
	(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
	(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
	(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
	(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
	(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
	(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
	(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);
/*!40000 ALTER TABLE `b_smile` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_smile_lang
CREATE TABLE IF NOT EXISTS `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_smile_lang: ~38 rows (приблизительно)
DELETE FROM `b_smile_lang`;
/*!40000 ALTER TABLE `b_smile_lang` DISABLE KEYS */;
INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
	(1, 'P', 1, 'ru', 'Стандартная галерея'),
	(2, 'P', 1, 'en', 'Standard gallery'),
	(3, 'G', 2, 'ru', 'Основной набор'),
	(4, 'G', 2, 'en', 'Default pack'),
	(5, 'S', 1, 'ru', 'С улыбкой'),
	(6, 'S', 1, 'en', 'Smile'),
	(7, 'S', 2, 'ru', 'Шутливо'),
	(8, 'S', 2, 'en', 'Wink'),
	(9, 'S', 3, 'ru', 'Широкая улыбка'),
	(10, 'S', 3, 'en', 'Big grin'),
	(11, 'S', 4, 'ru', 'Здорово'),
	(12, 'S', 4, 'en', 'Cool'),
	(13, 'S', 5, 'ru', 'Разочарование'),
	(14, 'S', 5, 'en', 'Facepalm'),
	(15, 'S', 6, 'ru', 'Поцелуй'),
	(16, 'S', 6, 'en', 'Kiss'),
	(17, 'S', 7, 'ru', 'Печально'),
	(18, 'S', 7, 'en', 'Sad'),
	(19, 'S', 8, 'ru', 'Скептически'),
	(20, 'S', 8, 'en', 'Skeptic'),
	(21, 'S', 9, 'ru', 'Смущенный'),
	(22, 'S', 9, 'en', 'Embarrassed'),
	(23, 'S', 10, 'ru', 'Очень грустно'),
	(24, 'S', 10, 'en', 'Crying'),
	(25, 'S', 11, 'ru', 'Со злостью'),
	(26, 'S', 11, 'en', 'Angry'),
	(27, 'S', 12, 'ru', 'Удивленно'),
	(28, 'S', 12, 'en', 'Surprised'),
	(29, 'S', 13, 'ru', 'Смущенно'),
	(30, 'S', 13, 'en', 'Confused'),
	(31, 'S', 14, 'ru', 'Идея'),
	(32, 'S', 14, 'en', 'Idea'),
	(33, 'S', 15, 'ru', 'Вопрос'),
	(34, 'S', 15, 'en', 'Question'),
	(35, 'S', 16, 'ru', 'Восклицание'),
	(36, 'S', 16, 'en', 'Exclamation'),
	(37, 'S', 17, 'ru', 'Нравится'),
	(38, 'S', 17, 'en', 'Like');
/*!40000 ALTER TABLE `b_smile_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_smile_set
CREATE TABLE IF NOT EXISTS `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_smile_set: ~2 rows (приблизительно)
DELETE FROM `b_smile_set`;
/*!40000 ALTER TABLE `b_smile_set` DISABLE KEYS */;
INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
	(1, 'P', 0, 'bitrix', 150),
	(2, 'G', 1, 'bitrix_main', 150);
/*!40000 ALTER TABLE `b_smile_set` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sms_template
CREATE TABLE IF NOT EXISTS `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sms_template: ~2 rows (приблизительно)
DELETE FROM `b_sms_template`;
/*!40000 ALTER TABLE `b_sms_template` DISABLE KEYS */;
INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
	(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
	(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL);
/*!40000 ALTER TABLE `b_sms_template` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sms_template_site
CREATE TABLE IF NOT EXISTS `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sms_template_site: ~2 rows (приблизительно)
DELETE FROM `b_sms_template_site`;
/*!40000 ALTER TABLE `b_sms_template_site` DISABLE KEYS */;
INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1');
/*!40000 ALTER TABLE `b_sms_template_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sm_version_history
CREATE TABLE IF NOT EXISTS `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sm_version_history: ~0 rows (приблизительно)
DELETE FROM `b_sm_version_history`;
/*!40000 ALTER TABLE `b_sm_version_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sm_version_history` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_socialservices_ap
CREATE TABLE IF NOT EXISTS `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_socialservices_ap: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_ap`;
/*!40000 ALTER TABLE `b_socialservices_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_ap` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_socialservices_contact
CREATE TABLE IF NOT EXISTS `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_socialservices_contact: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact`;
/*!40000 ALTER TABLE `b_socialservices_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_socialservices_contact_connect
CREATE TABLE IF NOT EXISTS `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_socialservices_contact_connect: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact_connect`;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_socialservices_message
CREATE TABLE IF NOT EXISTS `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_socialservices_message: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_message`;
/*!40000 ALTER TABLE `b_socialservices_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_socialservices_user
CREATE TABLE IF NOT EXISTS `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_socialservices_user: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user`;
/*!40000 ALTER TABLE `b_socialservices_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_socialservices_user_link
CREATE TABLE IF NOT EXISTS `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_socialservices_user_link: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user_link`;
/*!40000 ALTER TABLE `b_socialservices_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user_link` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sticker
CREATE TABLE IF NOT EXISTS `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sticker: ~0 rows (приблизительно)
DELETE FROM `b_sticker`;
/*!40000 ALTER TABLE `b_sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_sticker_group_task
CREATE TABLE IF NOT EXISTS `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_sticker_group_task: ~0 rows (приблизительно)
DELETE FROM `b_sticker_group_task`;
/*!40000 ALTER TABLE `b_sticker_group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker_group_task` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_subscription
CREATE TABLE IF NOT EXISTS `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_subscription: ~0 rows (приблизительно)
DELETE FROM `b_subscription`;
/*!40000 ALTER TABLE `b_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_subscription_rubric
CREATE TABLE IF NOT EXISTS `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_subscription_rubric: ~0 rows (приблизительно)
DELETE FROM `b_subscription_rubric`;
/*!40000 ALTER TABLE `b_subscription_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_task
CREATE TABLE IF NOT EXISTS `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_task: ~54 rows (приблизительно)
DELETE FROM `b_task`;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
	(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
	(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
	(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
	(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
	(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
	(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
	(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
	(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
	(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
	(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
	(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
	(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
	(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
	(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
	(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
	(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
	(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
	(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
	(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
	(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
	(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
	(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
	(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
	(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
	(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
	(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
	(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
	(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
	(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
	(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
	(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
	(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
	(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
	(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
	(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
	(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
	(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
	(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
	(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
	(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
	(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
	(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
	(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
	(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
	(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
	(47, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
	(48, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
	(49, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
	(50, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
	(51, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
	(52, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
	(53, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
	(54, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_task_operation
CREATE TABLE IF NOT EXISTS `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_task_operation: ~230 rows (приблизительно)
DELETE FROM `b_task_operation`;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(5, 2),
	(5, 3),
	(5, 5),
	(5, 6),
	(5, 7),
	(5, 8),
	(5, 9),
	(6, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 10),
	(6, 11),
	(6, 12),
	(6, 13),
	(6, 14),
	(6, 15),
	(6, 16),
	(6, 17),
	(6, 18),
	(8, 19),
	(8, 20),
	(8, 21),
	(9, 19),
	(9, 20),
	(9, 21),
	(9, 22),
	(9, 23),
	(9, 24),
	(9, 25),
	(9, 26),
	(9, 27),
	(9, 28),
	(9, 29),
	(9, 30),
	(9, 31),
	(9, 32),
	(9, 33),
	(9, 34),
	(10, 19),
	(10, 20),
	(10, 21),
	(10, 22),
	(10, 23),
	(10, 24),
	(10, 25),
	(10, 26),
	(10, 27),
	(10, 28),
	(10, 29),
	(10, 30),
	(10, 31),
	(10, 32),
	(10, 33),
	(10, 34),
	(10, 35),
	(11, 19),
	(11, 20),
	(11, 21),
	(11, 24),
	(11, 28),
	(13, 36),
	(13, 37),
	(13, 38),
	(15, 39),
	(16, 39),
	(16, 40),
	(17, 39),
	(17, 40),
	(17, 41),
	(19, 44),
	(19, 45),
	(19, 46),
	(19, 47),
	(19, 48),
	(19, 49),
	(19, 50),
	(19, 52),
	(19, 53),
	(20, 42),
	(20, 43),
	(20, 44),
	(20, 45),
	(20, 46),
	(20, 47),
	(20, 48),
	(20, 49),
	(20, 50),
	(20, 51),
	(20, 52),
	(20, 53),
	(20, 54),
	(22, 55),
	(23, 55),
	(23, 56),
	(23, 60),
	(24, 55),
	(24, 60),
	(24, 61),
	(24, 62),
	(25, 55),
	(25, 56),
	(25, 57),
	(25, 58),
	(25, 60),
	(25, 61),
	(25, 62),
	(26, 55),
	(26, 56),
	(26, 57),
	(26, 58),
	(26, 59),
	(26, 60),
	(26, 61),
	(26, 62),
	(28, 63),
	(29, 63),
	(29, 64),
	(29, 65),
	(29, 66),
	(31, 67),
	(32, 68),
	(32, 69),
	(34, 70),
	(34, 71),
	(35, 72),
	(36, 70),
	(36, 71),
	(36, 73),
	(37, 70),
	(37, 71),
	(37, 72),
	(37, 73),
	(38, 70),
	(38, 71),
	(38, 72),
	(38, 73),
	(38, 74),
	(38, 75),
	(38, 76),
	(38, 77),
	(39, 70),
	(39, 71),
	(39, 72),
	(39, 73),
	(39, 74),
	(39, 75),
	(39, 76),
	(39, 77),
	(39, 78),
	(39, 79),
	(39, 80),
	(39, 81),
	(40, 70),
	(40, 71),
	(40, 72),
	(40, 73),
	(40, 74),
	(40, 75),
	(40, 76),
	(40, 77),
	(40, 78),
	(40, 79),
	(40, 80),
	(40, 81),
	(40, 82),
	(40, 83),
	(40, 84),
	(40, 85),
	(40, 86),
	(40, 87),
	(42, 88),
	(43, 89),
	(44, 90),
	(45, 91),
	(46, 92),
	(48, 93),
	(49, 94),
	(50, 95),
	(50, 96),
	(50, 97),
	(50, 98),
	(50, 99),
	(50, 100),
	(50, 101),
	(50, 102),
	(50, 103),
	(50, 104),
	(50, 105),
	(51, 93),
	(51, 94),
	(51, 95),
	(51, 96),
	(51, 97),
	(51, 98),
	(51, 99),
	(51, 100),
	(51, 101),
	(51, 102),
	(51, 103),
	(51, 104),
	(51, 105),
	(51, 106),
	(51, 107),
	(51, 108),
	(51, 109),
	(51, 110),
	(51, 111),
	(51, 112),
	(51, 113),
	(51, 114),
	(51, 115),
	(51, 116),
	(51, 117),
	(51, 118),
	(53, 120),
	(54, 119),
	(54, 120);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_undo
CREATE TABLE IF NOT EXISTS `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_undo: ~7 rows (приблизительно)
DELETE FROM `b_undo`;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
	('113261569e82017004c1c2641d811b4a1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:54:"G:/server/WORK/forms-rusrobotics-bitrix/contact-us.php";s:7:"content";s:2837:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Contact us");\n?><?$APPLICATION->IncludeComponent("bitrix:form", "contact_us_form", Array(\n	"AJAX_MODE" => "N",	// Включить режим AJAX\n		"AJAX_OPTION_ADDITIONAL" => "",	// Дополнительный идентификатор\n		"AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера\n		"AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента\n		"AJAX_OPTION_STYLE" => "Y",	// Включить подгрузку стилей\n		"CACHE_TIME" => "3600",	// Время кеширования (сек.)\n		"CACHE_TYPE" => "A",	// Тип кеширования\n		"CHAIN_ITEM_LINK" => "",	// Ссылка на дополнительном пункте в навигационной цепочке\n		"CHAIN_ITEM_TEXT" => "",	// Название дополнительного пункта в навигационной цепочке\n		"EDIT_ADDITIONAL" => "N",	// Выводить на редактирование дополнительные поля\n		"EDIT_STATUS" => "Y",	// Выводить форму смены статуса\n		"IGNORE_CUSTOM_TEMPLATE" => "N",	// Игнорировать свой шаблон\n		"NOT_SHOW_FILTER" => "",	// Коды полей, которые нельзя показывать в фильтре (через запятую)\n		"NOT_SHOW_TABLE" => "",	// Коды полей, которые нельзя показывать в таблице\n		"RESULT_ID" => $_REQUEST[RESULT_ID],	// ID результата\n		"SEF_MODE" => "N",	// Включить поддержку ЧПУ\n		"SHOW_ADDITIONAL" => "N",	// Показать дополнительные поля веб-формы\n		"SHOW_ANSWER_VALUE" => "N",	// Показать значение параметра ANSWER_VALUE\n		"SHOW_EDIT_PAGE" => "Y",	// Показывать страницу редактирования результата\n		"SHOW_LIST_PAGE" => "Y",	// Показывать страницу со списком результатов\n		"SHOW_STATUS" => "Y",	// Показать текущий статус результата\n		"SHOW_VIEW_PAGE" => "Y",	// Показывать страницу просмотра результата\n		"START_PAGE" => "new",	// Начальная страница\n		"SUCCESS_URL" => "",	// Страница с сообщением об успешной отправке\n		"USE_EXTENDED_ERRORS" => "N",	// Использовать расширенный вывод сообщений об ошибках\n		"VARIABLE_ALIASES" => array(\n			"action" => "action",\n		),\n		"WEB_FORM_ID" => $_REQUEST[WEB_FORM_ID],	// ID веб-формы\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1579429481),
	('141a96956c27900ad6d096b5fa01d8282', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:4:{s:7:"absPath";s:51:"G:/server/WORK/forms-rusrobotics-bitrix/success.php";s:4:"path";s:12:"/success.php";s:4:"site";s:2:"s1";s:6:"public";s:1:"Y";}', 1, 1579428820),
	('142579bb86295a04bac436bee56769c42', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:54:"G:/server/WORK/forms-rusrobotics-bitrix/contact-us.php";s:7:"content";s:2854:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Contact us");\n?><?$APPLICATION->IncludeComponent("bitrix:form", "contact_us_form", Array(\n	"AJAX_MODE" => "N",	// Включить режим AJAX\n		"AJAX_OPTION_ADDITIONAL" => "",	// Дополнительный идентификатор\n		"AJAX_OPTION_HISTORY" => "N",	// Включить эмуляцию навигации браузера\n		"AJAX_OPTION_JUMP" => "N",	// Включить прокрутку к началу компонента\n		"AJAX_OPTION_STYLE" => "Y",	// Включить подгрузку стилей\n		"CACHE_TIME" => "3600",	// Время кеширования (сек.)\n		"CACHE_TYPE" => "A",	// Тип кеширования\n		"CHAIN_ITEM_LINK" => "",	// Ссылка на дополнительном пункте в навигационной цепочке\n		"CHAIN_ITEM_TEXT" => "",	// Название дополнительного пункта в навигационной цепочке\n		"EDIT_ADDITIONAL" => "N",	// Выводить на редактирование дополнительные поля\n		"EDIT_STATUS" => "Y",	// Выводить форму смены статуса\n		"IGNORE_CUSTOM_TEMPLATE" => "N",	// Игнорировать свой шаблон\n		"NOT_SHOW_FILTER" => array(	// Коды полей, которые нельзя показывать в фильтре\n			0 => "",\n			1 => "",\n		),\n		"NOT_SHOW_TABLE" => array(	// Коды полей, которые нельзя показывать в таблице\n			0 => "",\n			1 => "",\n		),\n		"RESULT_ID" => $_REQUEST[RESULT_ID],	// ID результата\n		"SEF_MODE" => "N",	// Включить поддержку ЧПУ\n		"SHOW_ADDITIONAL" => "N",	// Показать дополнительные поля веб-формы\n		"SHOW_ANSWER_VALUE" => "N",	// Показать значение параметра ANSWER_VALUE\n		"SHOW_EDIT_PAGE" => "Y",	// Показывать страницу редактирования результата\n		"SHOW_LIST_PAGE" => "Y",	// Показывать страницу со списком результатов\n		"SHOW_STATUS" => "Y",	// Показать текущий статус результата\n		"SHOW_VIEW_PAGE" => "Y",	// Показывать страницу просмотра результата\n		"START_PAGE" => "new",	// Начальная страница\n		"SUCCESS_URL" => "",	// Страница с сообщением об успешной отправке\n		"USE_EXTENDED_ERRORS" => "N",	// Использовать расширенный вывод сообщений об ошибках\n		"VARIABLE_ALIASES" => array(\n			"action" => "action",\n		),\n		"WEB_FORM_ID" => "1",	// ID веб-формы\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1579428770),
	('14a219bea9c7fd9be2e1e8eebdc505d4c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:54:"G:/server/WORK/forms-rusrobotics-bitrix/contact-us.php";s:7:"content";s:1152:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Contact us");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form", \n	"contact_us_form", \n	array(\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_TIME" => "3600",\n		"CACHE_TYPE" => "A",\n		"CHAIN_ITEM_LINK" => "",\n		"CHAIN_ITEM_TEXT" => "",\n		"EDIT_ADDITIONAL" => "N",\n		"EDIT_STATUS" => "Y",\n		"IGNORE_CUSTOM_TEMPLATE" => "N",\n		"NOT_SHOW_FILTER" => array(\n			0 => "",\n			1 => "",\n		),\n		"NOT_SHOW_TABLE" => array(\n			0 => "",\n			1 => "",\n		),\n		"RESULT_ID" => $_REQUEST[RESULT_ID],\n		"SEF_MODE" => "N",\n		"SHOW_ADDITIONAL" => "N",\n		"SHOW_ANSWER_VALUE" => "N",\n		"SHOW_EDIT_PAGE" => "Y",\n		"SHOW_LIST_PAGE" => "Y",\n		"SHOW_STATUS" => "Y",\n		"SHOW_VIEW_PAGE" => "Y",\n		"START_PAGE" => "new",\n		"SUCCESS_URL" => "success.php",\n		"USE_EXTENDED_ERRORS" => "N",\n		"WEB_FORM_ID" => "2",\n		"COMPONENT_TEMPLATE" => "contact_us_form",\n		"VARIABLE_ALIASES" => array(\n			"action" => "action",\n		)\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1579430531),
	('1713f81610c7c802299eaf06353f5b748', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:54:"G:/server/WORK/forms-rusrobotics-bitrix/contact-us.php";s:7:"content";s:1032:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Contact us");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form",\n	"contact_us_form",\n	Array(\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_TIME" => "3600",\n		"CACHE_TYPE" => "A",\n		"CHAIN_ITEM_LINK" => "",\n		"CHAIN_ITEM_TEXT" => "",\n		"EDIT_ADDITIONAL" => "N",\n		"EDIT_STATUS" => "Y",\n		"IGNORE_CUSTOM_TEMPLATE" => "N",\n		"NOT_SHOW_FILTER" => array("",""),\n		"NOT_SHOW_TABLE" => array("",""),\n		"RESULT_ID" => $_REQUEST[RESULT_ID],\n		"SEF_MODE" => "N",\n		"SHOW_ADDITIONAL" => "N",\n		"SHOW_ANSWER_VALUE" => "N",\n		"SHOW_EDIT_PAGE" => "Y",\n		"SHOW_LIST_PAGE" => "Y",\n		"SHOW_STATUS" => "Y",\n		"SHOW_VIEW_PAGE" => "Y",\n		"START_PAGE" => "new",\n		"SUCCESS_URL" => "",\n		"USE_EXTENDED_ERRORS" => "N",\n		"VARIABLE_ALIASES" => Array("action"=>"action"),\n		"WEB_FORM_ID" => "1"\n	)\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1579428981),
	('19a183f657c63760a52434e246de8c020', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:54:"G:/server/WORK/forms-rusrobotics-bitrix/contact-us.php";s:7:"content";s:1153:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Contact us");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form", \n	"contact_us_form", \n	array(\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_TIME" => "3600",\n		"CACHE_TYPE" => "A",\n		"CHAIN_ITEM_LINK" => "",\n		"CHAIN_ITEM_TEXT" => "",\n		"EDIT_ADDITIONAL" => "N",\n		"EDIT_STATUS" => "Y",\n		"IGNORE_CUSTOM_TEMPLATE" => "N",\n		"NOT_SHOW_FILTER" => array(\n			0 => "",\n			1 => "",\n		),\n		"NOT_SHOW_TABLE" => array(\n			0 => "",\n			1 => "",\n		),\n		"RESULT_ID" => $_REQUEST[RESULT_ID],\n		"SEF_MODE" => "N",\n		"SHOW_ADDITIONAL" => "N",\n		"SHOW_ANSWER_VALUE" => "N",\n		"SHOW_EDIT_PAGE" => "Y",\n		"SHOW_LIST_PAGE" => "Y",\n		"SHOW_STATUS" => "Y",\n		"SHOW_VIEW_PAGE" => "Y",\n		"START_PAGE" => "new",\n		"SUCCESS_URL" => " success.php",\n		"USE_EXTENDED_ERRORS" => "N",\n		"WEB_FORM_ID" => "2",\n		"COMPONENT_TEMPLATE" => "contact_us_form",\n		"VARIABLE_ALIASES" => array(\n			"action" => "action",\n		)\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1579429073),
	('1d3b55fbb7362f59c4aa7bf155df2ced3', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:54:"G:/server/WORK/forms-rusrobotics-bitrix/contact-us.php";s:7:"content";s:1152:"<?\nrequire($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");\n$APPLICATION->SetTitle("Contact us");\n?><?$APPLICATION->IncludeComponent(\n	"bitrix:form", \n	"contact_us_form", \n	array(\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"CACHE_TIME" => "3600",\n		"CACHE_TYPE" => "A",\n		"CHAIN_ITEM_LINK" => "",\n		"CHAIN_ITEM_TEXT" => "",\n		"EDIT_ADDITIONAL" => "N",\n		"EDIT_STATUS" => "Y",\n		"IGNORE_CUSTOM_TEMPLATE" => "N",\n		"NOT_SHOW_FILTER" => array(\n			0 => "",\n			1 => "",\n		),\n		"NOT_SHOW_TABLE" => array(\n			0 => "",\n			1 => "",\n		),\n		"RESULT_ID" => $_REQUEST[RESULT_ID],\n		"SEF_MODE" => "N",\n		"SHOW_ADDITIONAL" => "N",\n		"SHOW_ANSWER_VALUE" => "N",\n		"SHOW_EDIT_PAGE" => "Y",\n		"SHOW_LIST_PAGE" => "Y",\n		"SHOW_STATUS" => "Y",\n		"SHOW_VIEW_PAGE" => "Y",\n		"START_PAGE" => "new",\n		"SUCCESS_URL" => "success.php",\n		"USE_EXTENDED_ERRORS" => "N",\n		"WEB_FORM_ID" => "3",\n		"COMPONENT_TEMPLATE" => "contact_us_form",\n		"VARIABLE_ALIASES" => array(\n			"action" => "action",\n		)\n	),\n	false\n);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>";}', 1, 1579430776);
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_urlpreview_metadata
CREATE TABLE IF NOT EXISTS `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_urlpreview_metadata: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_metadata`;
/*!40000 ALTER TABLE `b_urlpreview_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_metadata` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_urlpreview_route
CREATE TABLE IF NOT EXISTS `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_urlpreview_route: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_route`;
/*!40000 ALTER TABLE `b_urlpreview_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_route` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user
CREATE TABLE IF NOT EXISTS `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user: ~1 rows (приблизительно)
DELETE FROM `b_user`;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`) VALUES
	(1, NULL, 'admin', 'uBZaeYFJ4f046796c26e61a33e111137dc4d5b64', 'qp3OGuhO7857910aa13afa77f29fc0c452baf202', 'Y', '', '', 'music.dll@mail.ru', '2020-01-20 01:12:43', '2020-01-14 14:58:14', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-14 14:58:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_access
CREATE TABLE IF NOT EXISTS `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_access: ~6 rows (приблизительно)
DELETE FROM `b_user_access`;
/*!40000 ALTER TABLE `b_user_access` DISABLE KEYS */;
INSERT INTO `b_user_access` (`USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
	(0, 'group', 'G2'),
	(1, 'group', 'G1'),
	(1, 'group', 'G3'),
	(1, 'group', 'G4'),
	(1, 'group', 'G2'),
	(1, 'user', 'U1');
/*!40000 ALTER TABLE `b_user_access` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_access_check
CREATE TABLE IF NOT EXISTS `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_access_check: ~2 rows (приблизительно)
DELETE FROM `b_user_access_check`;
/*!40000 ALTER TABLE `b_user_access_check` DISABLE KEYS */;
INSERT INTO `b_user_access_check` (`USER_ID`, `PROVIDER_ID`) VALUES
	(1, 'group'),
	(1, 'user');
/*!40000 ALTER TABLE `b_user_access_check` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_auth_action
CREATE TABLE IF NOT EXISTS `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_auth_action: ~0 rows (приблизительно)
DELETE FROM `b_user_auth_action`;
/*!40000 ALTER TABLE `b_user_auth_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_auth_action` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_counter
CREATE TABLE IF NOT EXISTS `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_counter: ~0 rows (приблизительно)
DELETE FROM `b_user_counter`;
/*!40000 ALTER TABLE `b_user_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_counter` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_digest
CREATE TABLE IF NOT EXISTS `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_digest: ~0 rows (приблизительно)
DELETE FROM `b_user_digest`;
/*!40000 ALTER TABLE `b_user_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_digest` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_field
CREATE TABLE IF NOT EXISTS `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_field: ~5 rows (приблизительно)
DELETE FROM `b_user_field`;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
	(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(3, 'BLOG_POST', 'UF_BLOG_POST_URL_PRV', 'url_preview', 'UF_BLOG_POST_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(4, 'BLOG_COMMENT', 'UF_BLOG_COMM_URL_PRV', 'url_preview', 'UF_BLOG_COMM_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(5, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
	(6, 'FORUM_MESSAGE', 'UF_FORUM_MES_URL_PRV', 'url_preview', 'UF_FORUM_MES_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_field_confirm
CREATE TABLE IF NOT EXISTS `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_field_confirm: ~0 rows (приблизительно)
DELETE FROM `b_user_field_confirm`;
/*!40000 ALTER TABLE `b_user_field_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_confirm` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_field_enum
CREATE TABLE IF NOT EXISTS `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_field_enum: ~0 rows (приблизительно)
DELETE FROM `b_user_field_enum`;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_field_lang
CREATE TABLE IF NOT EXISTS `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_field_lang: ~0 rows (приблизительно)
DELETE FROM `b_user_field_lang`;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_group
CREATE TABLE IF NOT EXISTS `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_group: ~3 rows (приблизительно)
DELETE FROM `b_user_group`;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
	(1, 1, NULL, NULL),
	(1, 3, NULL, NULL),
	(1, 4, NULL, NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_hit_auth
CREATE TABLE IF NOT EXISTS `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_hit_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_hit_auth`;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_index
CREATE TABLE IF NOT EXISTS `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_index: ~0 rows (приблизительно)
DELETE FROM `b_user_index`;
/*!40000 ALTER TABLE `b_user_index` DISABLE KEYS */;
INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
	(1, '001', '', '001 zhfvp qyy znvy zhfvp.qyy@znvy.eh nqzva', '', '', '', '', '');
/*!40000 ALTER TABLE `b_user_index` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_index_selector
CREATE TABLE IF NOT EXISTS `b_user_index_selector` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_SELECTOR_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_SELECTOR_1` (`SEARCH_SELECTOR_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_index_selector: ~0 rows (приблизительно)
DELETE FROM `b_user_index_selector`;
/*!40000 ALTER TABLE `b_user_index_selector` DISABLE KEYS */;
INSERT INTO `b_user_index_selector` (`USER_ID`, `SEARCH_SELECTOR_CONTENT`) VALUES
	(1, '');
/*!40000 ALTER TABLE `b_user_index_selector` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_option
CREATE TABLE IF NOT EXISTS `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_option: ~19 rows (приблизительно)
DELETE FROM `b_user_option`;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
	(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:"GADGETS";a:8:{s:20:"ADMIN_INFO@333333333";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:19:"HTML_AREA@444444444";a:5:{s:6:"COLUMN";i:0;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";s:8:"USERDATA";a:1:{s:7:"content";s:797:"<table class="bx-gadgets-info-site-table" cellspacing="0"><tr>	<td class="bx-gadget-gray">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class="bx-gadgets-info-site-logo" rowspan="5"><img src="/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png"></td></tr><tr>	<td class="bx-gadget-gray">Адрес сайта:</td>	<td><a href="http://www.1c-bitrix.ru">www.1c-bitrix.ru</a></td></tr><tr>	<td class="bx-gadget-gray">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class="bx-gadget-gray">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class="bx-gadget-gray">E-mail:</td>	<td><a href="mailto:info@1c-bitrix.ru">info@1c-bitrix.ru</a></td></tr></table>";}s:8:"SETTINGS";a:1:{s:9:"TITLE_STD";s:34:"Информация о сайте";}}s:25:"ADMIN_CHECKLIST@777888999";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:19:"RSSREADER@777777777";a:4:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";s:8:"SETTINGS";a:3:{s:9:"TITLE_STD";s:33:"Новости 1С-Битрикс";s:3:"CNT";i:10;s:7:"RSS_URL";s:45:"https://www.1c-bitrix.ru/about/life/news/rss/";}}s:24:"ADMIN_SECURITY@555555555";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:25:"ADMIN_SITESPEED@666666777";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_PERFMON@666666666";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_MARKETPALCE@22549";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";}}}}', 'Y'),
	(2, 1, 'admin_panel', 'settings', 'a:1:{s:4:"edit";s:3:"off";}', 'N'),
	(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
	(4, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:"stick";s:1:"N";}', 'N'),
	(10, 1, 'admin_menu', 'pos', 'a:3:{s:8:"sections";s:169:"menu_fileman,menu_fileman_site_s1_,menu_iblock,iblock_admin,menu_medialib,menu_system,menu_iblock_/articles,menu_webforms,menu_rating,menu_module_settings,menu_mobileapp";s:3:"ver";s:2:"on";s:5:"width";s:3:"487";}', 'N'),
	(19, 1, 'fileman', 'code_editor', 'a:1:{s:5:"theme";s:5:"light";}', 'N'),
	(29, 1, 'main.interface.grid', 'tbl_iblock_admin_750dd17d83198dd551018232269fa242', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(31, 1, 'main.interface.grid', 'tbl_iblock_admin_dba5d91846ce1a5e63734dfcbcb481cb', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(33, 1, 'main.interface.grid', 'tbl_iblock_dba5d91846ce1a5e63734dfcbcb481cb', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(34, 1, 'main.ui.filter', 'tbl_iblock_section_729f69bbdbc6c423526ea2cb8dac177b', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(40, 1, 'main.interface.grid', 'tbl_iblock_section_729f69bbdbc6c423526ea2cb8dac177b', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(47, 1, 'main.ui.filter', 'tbl_iblock_element_729f69bbdbc6c423526ea2cb8dac177b', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(52, 1, 'main.interface.grid', 'tbl_iblock_element_729f69bbdbc6c423526ea2cb8dac177b', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(53, 1, 'html_editor', 'type_selector_FORM_DESCRIPTION', 'a:1:{s:4:"type";s:6:"editor";}', 'N'),
	(55, 1, 'html_editor', 'user_settings_', 'a:1:{s:13:"taskbar_shown";s:1:"1";}', 'N'),
	(67, 1, 'fileman', 'last_pathes', 's:160:"a:3:{i:0;s:64:"/local/templates/.default/components/bitrix/form/contact_us_form";i:1;s:48:"/local/templates/.default/components/bitrix/form";i:2;s:7:"/bitrix";}";', 'N'),
	(78, 1, 'fileman', 'taskbar_settings_FORM_TEMPLATE', 's:250:"a:3:{s:19:"BXPropertiesTaskbar";a:3:{s:4:"show";b:1;s:3:"set";i:3;s:6:"active";b:1;}s:20:"BXComponents2Taskbar";a:3:{s:4:"show";b:1;s:3:"set";s:1:"2";s:6:"active";b:1;}s:21:"BXFormElementsTaskbar";a:3:{s:4:"show";b:1;s:3:"set";i:3;s:6:"active";b:1;}}";', 'N'),
	(79, 1, 'fileman', 'taskbarset_settings_FORM_TEMPLATE', 's:90:"a:2:{i:2;a:2:{s:4:"show";b:1;s:4:"size";i:200;}i:3;a:2:{s:4:"show";b:1;s:4:"size";i:160;}}";', 'N'),
	(86, 1, 'html_editor', 'type_selector_TITLE', 'a:1:{s:4:"type";s:4:"text";}', 'N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_phone_auth
CREATE TABLE IF NOT EXISTS `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_phone_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_phone_auth`;
/*!40000 ALTER TABLE `b_user_phone_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_phone_auth` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_profile_history
CREATE TABLE IF NOT EXISTS `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_profile_history: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_history`;
/*!40000 ALTER TABLE `b_user_profile_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_history` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_profile_record
CREATE TABLE IF NOT EXISTS `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_profile_record: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_record`;
/*!40000 ALTER TABLE `b_user_profile_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_record` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_user_stored_auth
CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_user_stored_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_stored_auth`;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
	(1, 1, '2020-01-14 14:58:15', '2020-01-14 14:58:15', '145f4a756636891631f11c79e854a68c', 'N', 2130706433);
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_utm_blog_comment
CREATE TABLE IF NOT EXISTS `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_utm_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_comment`;
/*!40000 ALTER TABLE `b_utm_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_utm_blog_post
CREATE TABLE IF NOT EXISTS `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_utm_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_post`;
/*!40000 ALTER TABLE `b_utm_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_utm_forum_message
CREATE TABLE IF NOT EXISTS `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_1` (`FIELD_ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_utm_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_utm_forum_message`;
/*!40000 ALTER TABLE `b_utm_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_uts_blog_comment
CREATE TABLE IF NOT EXISTS `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_uts_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_comment`;
/*!40000 ALTER TABLE `b_uts_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_uts_blog_post
CREATE TABLE IF NOT EXISTS `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_uts_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_post`;
/*!40000 ALTER TABLE `b_uts_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_uts_forum_message
CREATE TABLE IF NOT EXISTS `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_uts_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_uts_forum_message`;
/*!40000 ALTER TABLE `b_uts_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote
CREATE TABLE IF NOT EXISTS `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ANONYMITY` int(11) NOT NULL DEFAULT '0',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `OPTIONS` int(18) DEFAULT '1',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote: ~0 rows (приблизительно)
DELETE FROM `b_vote`;
/*!40000 ALTER TABLE `b_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_answer
CREATE TABLE IF NOT EXISTS `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_answer`;
/*!40000 ALTER TABLE `b_vote_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_answer` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_attached_object
CREATE TABLE IF NOT EXISTS `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_attached_object: ~0 rows (приблизительно)
DELETE FROM `b_vote_attached_object`;
/*!40000 ALTER TABLE `b_vote_attached_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_attached_object` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_channel
CREATE TABLE IF NOT EXISTS `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_channel: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel`;
/*!40000 ALTER TABLE `b_vote_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_channel_2_group
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_channel_2_group: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_group`;
/*!40000 ALTER TABLE `b_vote_channel_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_channel_2_site
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_channel_2_site: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_site`;
/*!40000 ALTER TABLE `b_vote_channel_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_site` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_event
CREATE TABLE IF NOT EXISTS `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_event: ~0 rows (приблизительно)
DELETE FROM `b_vote_event`;
/*!40000 ALTER TABLE `b_vote_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_event_answer
CREATE TABLE IF NOT EXISTS `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_event_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_answer`;
/*!40000 ALTER TABLE `b_vote_event_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_answer` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_event_question
CREATE TABLE IF NOT EXISTS `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_event_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_question`;
/*!40000 ALTER TABLE `b_vote_event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_question` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_question
CREATE TABLE IF NOT EXISTS `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_question`;
/*!40000 ALTER TABLE `b_vote_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_question` ENABLE KEYS */;

-- Дамп структуры для таблица forms_bitrix.b_vote_user
CREATE TABLE IF NOT EXISTS `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `COOKIE_ID` int(18) NOT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_VOTE_COOKIE_USER` (`COOKIE_ID`,`AUTH_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы forms_bitrix.b_vote_user: ~0 rows (приблизительно)
DELETE FROM `b_vote_user`;
/*!40000 ALTER TABLE `b_vote_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
