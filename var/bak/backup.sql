-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.9-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Struktur von Tabelle n2n7_test.page
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `internal_page_id` int(10) unsigned DEFAULT NULL,
  `external_url` varchar(255) DEFAULT NULL,
  `page_content_id` int(10) unsigned DEFAULT NULL,
  `subsystem_name` varchar(255) DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `in_path` tinyint(4) NOT NULL DEFAULT '1',
  `hook_key` varchar(255) DEFAULT NULL,
  `in_navigation` tinyint(4) NOT NULL DEFAULT '1',
  `nav_target_new_window` tinyint(4) NOT NULL DEFAULT '0',
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `last_mod` datetime DEFAULT NULL,
  `last_mod_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.page_content
CREATE TABLE IF NOT EXISTS `page_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subsystem_name` varchar(255) DEFAULT NULL,
  `page_controller_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `ssl` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page_content: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_content` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.page_content_t
CREATE TABLE IF NOT EXISTS `page_content_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n2n_locale` varchar(5) NOT NULL,
  `se_title` varchar(70) DEFAULT NULL,
  `se_description` varchar(255) DEFAULT NULL,
  `se_keywords` varchar(128) DEFAULT NULL,
  `page_content_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page_content_t: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page_content_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_content_t` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.page_controller
CREATE TABLE IF NOT EXISTS `page_controller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page_controller: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page_controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_controller` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.page_controller_t
CREATE TABLE IF NOT EXISTS `page_controller_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n2n_locale` varchar(16) NOT NULL,
  `page_controller_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page_controller_t: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page_controller_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_controller_t` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.page_controller_t_content_items
CREATE TABLE IF NOT EXISTS `page_controller_t_content_items` (
  `page_controller_t_id` int(10) unsigned NOT NULL,
  `content_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`page_controller_t_id`,`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page_controller_t_content_items: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page_controller_t_content_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_controller_t_content_items` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.page_t
CREATE TABLE IF NOT EXISTS `page_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n2n_locale` varchar(12) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `path_part` varchar(255) DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `path_part` (`path_part`),
  KEY `page_leaf_t_index_1` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.page_t: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `page_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_t` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_content_item
CREATE TABLE IF NOT EXISTS `rocket_content_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `order_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_content_item: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_content_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_content_item` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_critmod_save
CREATE TABLE IF NOT EXISTS `rocket_critmod_save` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ei_spec_id` varchar(255) NOT NULL,
  `ei_mask_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `filter_data_json` text NOT NULL,
  `sort_data_json` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ei_spec_id` (`ei_spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_critmod_save: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_critmod_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_critmod_save` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_custom_grant
CREATE TABLE IF NOT EXISTS `rocket_custom_grant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_spec_id` varchar(255) NOT NULL,
  `rocket_user_group_id` int(10) unsigned NOT NULL,
  `full` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access_json` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `script_id_user_group_id` (`custom_spec_id`,`rocket_user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_custom_grant: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_custom_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_custom_grant` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_ei_grant
CREATE TABLE IF NOT EXISTS `rocket_ei_grant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ei_spec_id` varchar(255) NOT NULL,
  `ei_mask_id` varchar(255) DEFAULT NULL,
  `rocket_user_group_id` int(10) unsigned NOT NULL,
  `full` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `script_id_user_group_id` (`rocket_user_group_id`,`ei_spec_id`,`ei_mask_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_ei_grant: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_ei_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_ei_grant` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_login
CREATE TABLE IF NOT EXISTS `rocket_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(16) DEFAULT NULL,
  `wrong_password` varchar(32) DEFAULT NULL,
  `power` enum('superadmin','admin','none') DEFAULT NULL,
  `successfull` tinyint(1) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_login: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_login` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_user
CREATE TABLE IF NOT EXISTS `rocket_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(128) NOT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `power` enum('superadmin','admin','none') NOT NULL DEFAULT 'none',
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_user: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_user` DISABLE KEYS */;
INSERT INTO `rocket_user` (`id`, `nick`, `firstname`, `lastname`, `email`, `power`, `password`) VALUES
	(1, 'super', 'Testerich', 'von Testen', 'testerich@von-testen.com', 'superadmin', '$2a$07$holeradioundholeradioe5FD29ANtu4PChE8W4mZDg.D1eKkBnwq');
/*!40000 ALTER TABLE `rocket_user` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_user_access_grant
CREATE TABLE IF NOT EXISTS `rocket_user_access_grant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `script_id` varchar(255) NOT NULL,
  `restricted` tinyint(4) NOT NULL,
  `privileges_json` text NOT NULL,
  `access_json` text NOT NULL,
  `restriction_json` text NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_id` (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_user_access_grant: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_user_access_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_user_access_grant` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_user_group
CREATE TABLE IF NOT EXISTS `rocket_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `nav_json` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_user_group: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_user_group` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_user_privileges_grant
CREATE TABLE IF NOT EXISTS `rocket_user_privileges_grant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ei_grant_id` int(10) unsigned NOT NULL,
  `ei_command_privilege_json` text,
  `ei_field_privilege_json` text,
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `restriction_group_json` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_user_privileges_grant: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_user_privileges_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_user_privileges_grant` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle n2n7_test.rocket_user_rocket_user_groups
CREATE TABLE IF NOT EXISTS `rocket_user_rocket_user_groups` (
  `rocket_user_id` int(10) unsigned NOT NULL,
  `rocket_user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rocket_user_id`,`rocket_user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle n2n7_test.rocket_user_rocket_user_groups: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `rocket_user_rocket_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `rocket_user_rocket_user_groups` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
