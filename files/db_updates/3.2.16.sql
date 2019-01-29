ALTER TABLE `sma_sales` ADD `payment_method` VARCHAR(55) NULL;
ALTER TABLE `sma_settings` CHANGE `barcode_separator` `barcode_separator` VARCHAR(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-';
UPDATE `sma_settings` SET `version` = '3.2.16' WHERE `setting_id` = 1;
