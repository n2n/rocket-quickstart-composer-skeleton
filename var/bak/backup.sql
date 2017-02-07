-- Mysql Backup of n2n7_test
-- Date 2017-02-07T14:56:51+01:00
-- Backup by 

DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`title` VARCHAR(64) NOT NULL, 
	`lead` VARCHAR(255) NOT NULL, 
	`content_html` TEXT NULL, 
	`url_part` VARCHAR(128) NOT NULL, 
	`online` TINYINT UNSIGNED NOT NULL DEFAULT '0'
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `blog_article` (`id`, `title`, `lead`, `content_html`, `url_part`, `online`) 
VALUES ( '1',  'n2n ist OpenSource',  'HNM unterstützt OpenSource und gibt n2n als OpenSource frei.',  '<p>Als Lizenz w&auml;hlt HNM die <strong>LGPL Lizenz</strong>.</p>\r\n',  'n2n-ist-open-source',  '1'),
( '2', 'Rocket erlaubt embedded Objects!', 'In einem Screen mehrere Objekte bearbeiten - mit Rocket ist das möglich!', '<p>Mit dem CMS n2n Rocket ist es m&ouml;glich, mehrere Objekte in einem Screen zu bearbeiten.</p>\r\n\r\n<p>Probieren Sie diese tolle Eigenschaft noch heute!</p>\r\n', 'rocket-erlaubt-embeded-objects', '1'),
( '3', 'n2n-Rocket: Das CMS von n2n', 'n2n ist ein PHP Framework. n2n-Rocket das passende Framework dazu.', '<p>Die Vorteile von Rocket sind:</p>\r\n\r\n<ul>\r\n	<li>einfache Bedienung</li>\r\n	<li>l&uuml;ckenlose Integration der Objekte des Frameworks</li>\r\n	<li>tolle Performance dank vielf&auml;lltigen Caching-M&ouml;glichkeiten</li>\r\n</ul>\r\n\r\n<p>Testen Sie n2n-Rocket noch heute!</p>\r\n', 'n2n-rocket-das-cms-von-n2n', '1');

DROP TABLE IF EXISTS `blog_article_categories`;
CREATE TABLE `blog_article_categories` ( 
	`blog_article_id` INT UNSIGNED NOT NULL, 
	`blog_category_id` INT UNSIGNED NOT NULL
	, PRIMARY KEY (`blog_article_id`, `blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `blog_article_categories` (`blog_article_id`, `blog_category_id`) 
VALUES ( '1',  '1'),
( '2', '2'),
( '3', '1'),
( '3', '2'),
( '4', '1');

DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(32) NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `blog_category` (`id`, `name`) 
VALUES ( '1',  'n2n'),
( '2', 'rocket');

DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`blog_article_id` INT UNSIGNED NOT NULL, 
	`email` VARCHAR(128) NOT NULL, 
	`image` VARCHAR(64) NULL, 
	`content` TEXT NOT NULL, 
	`created` DATETIME NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`internal_page_id` INT UNSIGNED NULL, 
	`external_url` VARCHAR(255) NULL, 
	`page_content_id` INT UNSIGNED NULL, 
	`subsystem_name` VARCHAR(255) NULL, 
	`online` TINYINT UNSIGNED NOT NULL DEFAULT '1', 
	`in_path` TINYINT NOT NULL DEFAULT '1', 
	`hook_key` VARCHAR(255) NULL, 
	`in_navigation` TINYINT NOT NULL DEFAULT '1', 
	`nav_target_new_window` TINYINT NOT NULL DEFAULT '0', 
	`lft` INT UNSIGNED NOT NULL, 
	`rgt` INT UNSIGNED NOT NULL, 
	`last_mod` DATETIME NULL, 
	`last_mod_by` INT UNSIGNED NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_content`;
CREATE TABLE `page_content` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`subsystem_name` VARCHAR(255) NULL, 
	`page_controller_id` INT UNSIGNED NOT NULL, 
	`page_id` INT UNSIGNED NULL, 
	`ssl` TINYINT UNSIGNED NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_content_t`;
CREATE TABLE `page_content_t` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`n2n_locale` VARCHAR(5) NOT NULL, 
	`se_title` VARCHAR(70) NULL, 
	`se_description` VARCHAR(255) NULL, 
	`se_keywords` VARCHAR(128) NULL, 
	`page_content_id` INT UNSIGNED NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_controller`;
CREATE TABLE `page_controller` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`method_name` VARCHAR(255) NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_controller_t`;
CREATE TABLE `page_controller_t` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`n2n_locale` VARCHAR(16) NOT NULL, 
	`page_controller_id` VARCHAR(128) NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_controller_t_content_items`;
CREATE TABLE `page_controller_t_content_items` ( 
	`page_controller_t_id` INT UNSIGNED NOT NULL, 
	`content_item_id` INT UNSIGNED NOT NULL
	, PRIMARY KEY (`page_controller_t_id`, `content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `page_t`;
CREATE TABLE `page_t` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`n2n_locale` VARCHAR(12) NULL, 
	`name` VARCHAR(255) NULL, 
	`title` VARCHAR(255) NULL, 
	`path_part` VARCHAR(255) NULL, 
	`page_id` INT UNSIGNED NULL, 
	`active` TINYINT UNSIGNED NOT NULL DEFAULT '1'
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `page_t` ADD INDEX `path_part` (`path_part`);
ALTER TABLE `page_t` ADD INDEX `page_leaf_t_index_1` (`page_id`);


DROP TABLE IF EXISTS `rocket_content_item`;
CREATE TABLE `rocket_content_item` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`panel` VARCHAR(32) NOT NULL, 
	`order_index` INT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci ;


DROP TABLE IF EXISTS `rocket_critmod_save`;
CREATE TABLE `rocket_critmod_save` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`ei_spec_id` VARCHAR(255) NOT NULL, 
	`ei_mask_id` VARCHAR(255) NULL, 
	`name` VARCHAR(255) NOT NULL, 
	`filter_data_json` TEXT NOT NULL, 
	`sort_data_json` TEXT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_critmod_save` ADD UNIQUE INDEX `name` (`name`);
ALTER TABLE `rocket_critmod_save` ADD INDEX `ei_spec_id` (`ei_spec_id`);


DROP TABLE IF EXISTS `rocket_custom_grant`;
CREATE TABLE `rocket_custom_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`custom_spec_id` VARCHAR(255) NOT NULL, 
	`rocket_user_group_id` INT UNSIGNED NOT NULL, 
	`full` TINYINT UNSIGNED NOT NULL DEFAULT '1', 
	`access_json` TEXT NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_custom_grant` ADD UNIQUE INDEX `script_id_user_group_id` (`custom_spec_id`, `rocket_user_group_id`);


DROP TABLE IF EXISTS `rocket_ei_grant`;
CREATE TABLE `rocket_ei_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`ei_spec_id` VARCHAR(255) NOT NULL, 
	`ei_mask_id` VARCHAR(255) NULL, 
	`rocket_user_group_id` INT UNSIGNED NOT NULL, 
	`full` TINYINT UNSIGNED NOT NULL DEFAULT '1'
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_ei_grant` ADD UNIQUE INDEX `script_id_user_group_id` (`rocket_user_group_id`, `ei_spec_id`, `ei_mask_id`);


DROP TABLE IF EXISTS `rocket_login`;
CREATE TABLE `rocket_login` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`nick` VARCHAR(16) NULL, 
	`wrong_password` VARCHAR(32) NULL, 
	`power` ENUM('superadmin','admin','none') NULL, 
	`successfull` TINYINT UNSIGNED NOT NULL, 
	`ip` VARCHAR(15) NOT NULL DEFAULT '', 
	`date_time` DATETIME NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;

INSERT INTO `rocket_login` (`id`, `nick`, `wrong_password`, `power`, `successfull`, `ip`, `date_time`) 
VALUES ( '64',  'super',  NULL,  'superadmin',  '1',  '127.0.0.1',  '2017-02-07 14:36:02');

DROP TABLE IF EXISTS `rocket_user`;
CREATE TABLE `rocket_user` ( 
	`id` INT NOT NULL AUTO_INCREMENT, 
	`nick` VARCHAR(128) NOT NULL, 
	`firstname` VARCHAR(32) NULL, 
	`lastname` VARCHAR(32) NULL, 
	`email` VARCHAR(128) NULL, 
	`power` ENUM('superadmin','admin','none') NOT NULL DEFAULT 'none', 
	`password` VARCHAR(128) NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_user` ADD UNIQUE INDEX `nick` (`nick`);

INSERT INTO `rocket_user` (`id`, `nick`, `firstname`, `lastname`, `email`, `power`, `password`) 
VALUES ( '1',  'super',  'Testerich',  'von Testen',  'testerich@von-testen.com',  'superadmin',  '$2a$07$holeradioundholeradioe5FD29ANtu4PChE8W4mZDg.D1eKkBnwq');

DROP TABLE IF EXISTS `rocket_user_access_grant`;
CREATE TABLE `rocket_user_access_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`script_id` VARCHAR(255) NOT NULL, 
	`restricted` TINYINT NOT NULL, 
	`privileges_json` TEXT NOT NULL, 
	`access_json` TEXT NOT NULL, 
	`restriction_json` TEXT NOT NULL, 
	`user_group_id` INT UNSIGNED NOT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;
ALTER TABLE `rocket_user_access_grant` ADD INDEX `user_group_id` (`user_group_id`);


DROP TABLE IF EXISTS `rocket_user_group`;
CREATE TABLE `rocket_user_group` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`name` VARCHAR(64) NOT NULL, 
	`nav_json` TEXT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `rocket_user_privileges_grant`;
CREATE TABLE `rocket_user_privileges_grant` ( 
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	`ei_grant_id` INT UNSIGNED NOT NULL, 
	`ei_command_privilege_json` TEXT NULL, 
	`ei_field_privilege_json` TEXT NULL, 
	`restricted` TINYINT NOT NULL DEFAULT '0', 
	`restriction_group_json` TEXT NULL
	, PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


DROP TABLE IF EXISTS `rocket_user_rocket_user_groups`;
CREATE TABLE `rocket_user_rocket_user_groups` ( 
	`rocket_user_id` INT UNSIGNED NOT NULL, 
	`rocket_user_group_id` INT UNSIGNED NOT NULL
	, PRIMARY KEY (`rocket_user_id`, `rocket_user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci ;


