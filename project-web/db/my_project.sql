/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : my_project

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/07/2022 15:39:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for my_assets
-- ----------------------------
DROP TABLE IF EXISTS `my_assets`;
CREATE TABLE `my_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_assets` decimal(10,2) DEFAULT NULL COMMENT '总资产',
  `cash` decimal(10,2) DEFAULT '0.00' COMMENT '现金',
  `investment` decimal(10,2) DEFAULT NULL COMMENT '投资',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产';

-- ----------------------------
-- Records of my_assets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for my_cash
-- ----------------------------
DROP TABLE IF EXISTS `my_cash`;
CREATE TABLE `my_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '现金余额',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='现金表';

-- ----------------------------
-- Records of my_cash
-- ----------------------------
BEGIN;
INSERT INTO `my_cash` (`id`, `bank_name`, `amount`, `create_time`, `update_time`) VALUES (9, '平安银行', 44268.53, '2022-01-25 13:58:16', '2022-07-24 15:14:43');
INSERT INTO `my_cash` (`id`, `bank_name`, `amount`, `create_time`, `update_time`) VALUES (10, '招商银行', 721.77, '2022-01-25 13:58:32', '2022-07-24 15:14:52');
INSERT INTO `my_cash` (`id`, `bank_name`, `amount`, `create_time`, `update_time`) VALUES (11, '工商银行', 13.83, '2022-01-25 13:58:47', '2022-06-25 09:11:24');
INSERT INTO `my_cash` (`id`, `bank_name`, `amount`, `create_time`, `update_time`) VALUES (12, '农业银行', 412.38, '2022-01-25 13:59:12', '2022-06-25 09:11:42');
INSERT INTO `my_cash` (`id`, `bank_name`, `amount`, `create_time`, `update_time`) VALUES (13, '建设银行', 681.52, '2022-01-25 13:59:44', '2022-06-25 09:12:13');
INSERT INTO `my_cash` (`id`, `bank_name`, `amount`, `create_time`, `update_time`) VALUES (14, '北京银行', 3580.13, '2022-01-25 13:59:59', '2022-07-03 11:39:19');
COMMIT;

-- ----------------------------
-- Table structure for my_cash_detail
-- ----------------------------
DROP TABLE IF EXISTS `my_cash_detail`;
CREATE TABLE `my_cash_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `new_amount` decimal(10,2) DEFAULT NULL COMMENT '变动金额',
  `reason` varchar(500) DEFAULT NULL COMMENT '原因',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='现金明细表';

-- ----------------------------
-- Records of my_cash_detail
-- ----------------------------
BEGIN;
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (28, '平安银行', 91.13, '', '2022-02-19 18:45:48');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (29, '招商银行', 900.55, '', '2022-02-19 18:46:30');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (30, '招商银行', 880.60, '', '2022-02-26 09:48:43');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (31, '北京银行', 1113.72, '', '2022-03-05 09:39:06');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (32, '招商银行', 567.49, '', '2022-03-05 09:39:21');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (33, '平安银行', 363.50, '', '2022-03-05 09:39:44');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (34, '平安银行', 3543.50, '', '2022-03-12 17:55:28');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (35, '招商银行', 17288.40, '', '2022-03-12 17:55:45');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (36, '招商银行', 288.45, '', '2022-03-19 09:23:43');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (37, '平安银行', 33377.93, '', '2022-03-19 09:23:59');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (38, '平安银行', 877.68, '', '2022-03-26 10:01:30');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (39, '北京银行', 1114.49, '', '2022-03-26 10:01:48');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (40, '农业银行', 4126.00, '', '2022-03-26 10:02:43');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (41, '农业银行', 412.06, '', '2022-03-26 10:08:57');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (42, '招商银行', 290.80, '', '2022-03-26 10:09:19');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (43, '北京银行', 1730.49, '', '2022-04-04 10:57:01');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (44, '平安银行', 99.25, '', '2022-04-04 10:57:23');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (45, '招商银行', 166.86, '', '2022-04-04 10:57:40');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (46, '工商银行', 125.90, '', '2022-04-04 10:57:55');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (47, '建设银行', 681.00, '', '2022-04-04 10:58:38');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (48, '招商银行', 16307.42, '', '2022-04-09 21:21:55');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (49, '招商银行', 307.48, '', '2022-04-16 13:59:15');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (50, '平安银行', 397.82, '', '2022-04-16 13:59:28');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (51, '平安银行', 70.76, '', '2022-05-01 11:06:36');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (52, '招商银行', 307.50, '', '2022-05-01 11:07:14');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (53, '平安银行', 386.02, '', '2022-05-07 17:52:19');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (54, '北京银行', 2346.49, '', '2022-05-07 17:52:56');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (55, '平安银行', 372.08, '', '2022-05-14 13:44:24');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (56, '招商银行', 1130.41, '', '2022-05-14 13:44:37');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (57, '工商银行', 127.57, '', '2022-05-14 13:44:51');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (58, '平安银行', 20572.08, '', '2022-05-21 11:56:38');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (59, '招商银行', 1130.45, '', '2022-05-21 11:56:53');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (60, '工商银行', 473.54, '', '2022-05-21 11:57:06');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (61, '平安银行', 22480.38, '', '2022-05-28 17:28:14');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (62, '招商银行', 1130.51, '', '2022-05-28 17:28:34');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (63, '工商银行', 1013.54, '', '2022-05-28 17:28:43');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (64, '平安银行', 65185.46, '', '2022-06-11 10:21:35');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (65, '招商银行', 16813.91, '', '2022-06-11 10:23:18');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (66, '北京银行', 2962.49, '', '2022-06-11 10:24:10');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (67, '平安银行', 65783.60, '', '2022-06-18 14:44:48');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (68, '招商银行', 753.92, '', '2022-06-18 14:47:04');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (69, '工商银行', 13.54, '', '2022-06-18 14:47:14');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (70, '平安银行', 54446.61, '', '2022-06-25 09:10:42');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (71, '招商银行', 765.18, '', '2022-06-25 09:10:53');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (72, '工商银行', 13.83, '', '2022-06-25 09:11:24');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (73, '农业银行', 412.38, '', '2022-06-25 09:11:42');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (74, '建设银行', 681.52, '', '2022-06-25 09:12:13');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (75, '北京银行', 2964.13, '', '2022-06-25 09:12:25');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (76, '平安银行', 51874.17, '', '2022-07-03 11:38:33');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (77, '招商银行', 715.21, '', '2022-07-03 11:38:44');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (78, '北京银行', 3580.13, '', '2022-07-03 11:39:19');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (79, '平安银行', 46595.66, '', '2022-07-09 10:25:53');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (80, '招商银行', 16541.77, '', '2022-07-09 10:26:08');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (81, '平安银行', 44582.46, '', '2022-07-16 12:52:44');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (82, '招商银行', 871.77, '', '2022-07-16 12:52:55');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (83, '平安银行', 44268.53, '', '2022-07-24 15:14:43');
INSERT INTO `my_cash_detail` (`id`, `bank_name`, `new_amount`, `reason`, `create_time`) VALUES (84, '招商银行', 721.77, '', '2022-07-24 15:14:52');
COMMIT;

-- ----------------------------
-- Table structure for my_credit_card
-- ----------------------------
DROP TABLE IF EXISTS `my_credit_card`;
CREATE TABLE `my_credit_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '银行名',
  `limit_amount` int DEFAULT NULL COMMENT '信用卡额度',
  `left_amount` decimal(10,2) DEFAULT NULL COMMENT '剩余额度',
  `bill_date` int DEFAULT NULL COMMENT '账单日',
  `repayment_date` int DEFAULT NULL COMMENT '最后还款日',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of my_credit_card
-- ----------------------------
BEGIN;
INSERT INTO `my_credit_card` (`id`, `name`, `limit_amount`, `left_amount`, `bill_date`, `repayment_date`, `create_time`, `update_time`) VALUES (2, '平安银行', 38000, 34602.29, 10, 28, '2022-01-30 11:13:47', '2022-02-08 22:44:07');
INSERT INTO `my_credit_card` (`id`, `name`, `limit_amount`, `left_amount`, `bill_date`, `repayment_date`, `create_time`, `update_time`) VALUES (3, '招商银行', 24000, 24000.00, 16, 4, '2022-01-30 13:01:04', '2022-01-30 13:01:04');
COMMIT;

-- ----------------------------
-- Table structure for my_credit_card_detail
-- ----------------------------
DROP TABLE IF EXISTS `my_credit_card_detail`;
CREATE TABLE `my_credit_card_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_name` varchar(50) DEFAULT NULL COMMENT '信用卡',
  `change_amount` decimal(10,2) DEFAULT NULL COMMENT '变动金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '原因',
  `create_time` date DEFAULT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of my_credit_card_detail
-- ----------------------------
BEGIN;
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (1, '平安银行', 137.08, '美团', '2022-01-01');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (2, '平安银行', 83.86, '美团', '2022-01-02');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (3, '平安银行', -83.86, '美团-退款', '2022-01-02');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (4, '平安银行', 56.52, '美团', '2022-01-02');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (5, '平安银行', 2.10, '轨道交通', '2022-01-03');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (6, '平安银行', 15.80, '永旺超市', '2022-01-03');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (7, '平安银行', 1.20, '宏泰基业房地产有限公司', '2022-01-03');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (8, '平安银行', 4.50, '轨道交通', '2022-01-03');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (9, '平安银行', 64.80, '美团', '2022-01-03');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (10, '平安银行', 4.50, '轨道交通', '2022-01-04');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (11, '平安银行', 4.50, '轨道交通', '2022-01-05');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (12, '平安银行', 2.80, '轨道交通', '2022-01-05');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (13, '平安银行', 4.50, '轨道交通', '2022-01-06');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (14, '平安银行', 4.50, '轨道交通', '2022-01-07');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (15, '平安银行', 4.50, '轨道交通', '2022-01-08');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (16, '平安银行', 76.57, '美团', '2022-01-09');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (17, '平安银行', 36.53, '美团', '2022-01-09');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (18, '平安银行', -0.10, '美团-退款', '2022-01-09');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (19, '平安银行', 7.90, '拼多多', '2022-01-09');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (20, '平安银行', 7.90, '拼多多', '2022-01-09');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (21, '平安银行', 4.50, '轨道交通', '2022-01-10');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (22, '平安银行', 4.50, '轨道交通', '2022-01-11');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (23, '平安银行', 4.50, '轨道交通', '2022-01-12');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (24, '平安银行', 2.80, '轨道交通', '2022-01-12');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (25, '平安银行', 4.50, '轨道交通', '2022-01-13');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (26, '平安银行', 345.99, '火车票', '2022-01-13');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (27, '平安银行', 333.50, '火车票', '2022-01-13');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (28, '平安银行', -245.99, '火车票-退款', '2022-01-13');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (29, '平安银行', 4.50, '轨道交通', '2022-01-14');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (30, '平安银行', 2.80, '轨道交通', '2022-01-14');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (31, '平安银行', 79.89, '美团', '2022-01-15');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (32, '平安银行', -17.00, '支付宝-退款', '2022-01-15');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (33, '平安银行', 31.89, '美团', '2022-01-16');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (34, '平安银行', 51.50, '火车票', '2022-01-16');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (35, '平安银行', 51.50, '火车票', '2022-01-16');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (36, '平安银行', 4.50, '轨道交通', '2022-01-17');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (37, '平安银行', 2.80, '轨道交通', '2022-01-17');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (38, '平安银行', 39.00, '肯德基', '2022-01-17');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (39, '平安银行', -39.00, '肯德基-退款', '2022-01-17');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (40, '平安银行', 4.50, '轨道交通', '2022-01-18');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (41, '平安银行', -316.50, '支付宝-退款', '2022-01-19');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (42, '平安银行', 4.50, '轨道交通', '2022-01-19');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (43, '平安银行', 1789.00, '拼多多', '2022-01-19');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (44, '平安银行', 3.36, '轨道交通', '2022-01-20');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (45, '平安银行', 3.36, '轨道交通', '2022-01-21');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (46, '平安银行', 3.36, '轨道交通', '2022-01-22');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (47, '平安银行', 2.80, '轨道交通', '2022-01-22');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (48, '平安银行', 4.00, '轨道交通', '2022-01-22');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (49, '平安银行', 2.80, '轨道交通', '2022-01-23');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (50, '平安银行', 278.00, '火炉火', '2022-01-23');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (51, '平安银行', -51.50, '支付宝-退款', '2022-01-23');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (52, '平安银行', -51.50, '支付宝-退款', '2022-01-23');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (53, '平安银行', 62.86, '京客隆', '2022-01-23');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (54, '平安银行', 499.00, '保险', '2022-01-24');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (55, '平安银行', 15.90, '流量卡', '2022-01-28');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (56, '平安银行', 19.00, '庆云楼', '2022-01-28');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (57, '平安银行', 2.00, '支付宝', '2022-01-28');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (58, '招商银行', 0.00, '无', '2022-01-01');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (59, '平安银行', 14.99, '轨道交通', '2022-02-07');
INSERT INTO `my_credit_card_detail` (`id`, `credit_name`, `change_amount`, `remark`, `create_time`) VALUES (60, '平安银行', 5.00, '轨道交通', '2022-02-08');
COMMIT;

-- ----------------------------
-- Table structure for my_fund
-- ----------------------------
DROP TABLE IF EXISTS `my_fund`;
CREATE TABLE `my_fund` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fund_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '基金代码',
  `fund_name` varchar(100) DEFAULT NULL COMMENT '基金名称',
  `fund_money` decimal(10,2) DEFAULT NULL COMMENT '基金价值',
  `principal` decimal(10,2) DEFAULT NULL COMMENT '本金',
  `profit` decimal(10,4) DEFAULT NULL COMMENT '盈利',
  `profit_rate` decimal(10,4) DEFAULT NULL COMMENT '收益率',
  `type` tinyint DEFAULT NULL COMMENT '0-指数基金 1-主动基金',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='我的基金';

-- ----------------------------
-- Records of my_fund
-- ----------------------------
BEGIN;
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (12, '090010', '大成中证红利指数A', 0.00, 14.04, -14.0400, 0.0000, 0, '2022-02-12 00:00:00', '2022-06-18 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (13, '161725', '招商中证白酒指数(LOA)A', 0.00, 120.41, -120.4100, 0.0000, 0, '2022-02-12 00:00:00', '2022-03-12 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (14, '001027', '前海开源中证大农业指数', 0.00, 258.10, -258.1000, 0.0000, 0, '2022-02-12 00:00:00', '2022-04-30 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (15, '160225', '国泰国证新能源汽车(LOF)', 0.00, 228.60, -228.6000, 0.0000, 0, '2022-02-12 00:00:00', '2022-04-09 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (16, '160119', '南方中证500ETF联接(LOF)A', 3415.78, 3495.55, -79.7700, -2.2800, 0, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (17, '007301', '国联安中证全指半导体产品与设备ETF联接C', 0.00, 413.78, -413.7800, 0.0000, 0, '2022-02-12 00:00:00', '2022-04-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (18, '160219', '国泰国证医药卫生行业指数(LOF)', 0.00, 870.31, -870.3100, 0.0000, 0, '2022-02-12 00:00:00', '2022-06-11 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (19, '001717', '工银瑞信前沿医疗股票A', 5501.30, 6370.53, -869.2300, -13.6400, 0, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (20, '160222', '国泰国证食品饮料行业指数(LOF)', 0.00, 45.12, -45.1200, 0.0000, 0, '2022-02-12 00:00:00', '2022-02-19 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (21, '519737', '交银新成长混合', 0.00, 0.00, 0.0000, 0.0000, 1, '2022-02-12 00:00:00', '2022-05-28 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (22, '519069', '汇添富价值精选混合A', 0.00, 2372.81, -2372.8100, 0.0000, 1, '2022-02-12 00:00:00', '2022-04-02 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (23, '110011', '易方达优质精选混合(QDII)', 2477.33, 5512.35, -3035.0200, -55.0600, 1, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (24, '000083', '汇添富消费行业混合', 0.00, 0.00, 0.0000, 0.0000, 1, '2022-02-12 00:00:00', '2022-05-28 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (25, '001371', '富国沪港深价值混合A', 0.00, 0.00, 0.0000, 0.0000, 1, '2022-02-12 00:00:00', '2022-05-28 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (26, '162605', '景顺长城鼎益混合(LOF)', 0.00, 1790.74, -1790.7400, 0.0000, 1, '2022-02-12 00:00:00', '2022-03-12 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (27, 'TTXJGS01200001', '天天成长1号', 160354.95, 157749.46, 2605.4900, 1.6500, 2, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (32, '519702', '交银趋势混合A', 3096.59, 2960.97, 135.6200, 4.5100, 1, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (33, '002943', '广发多因子混合', 3208.17, 3069.55, 138.6200, 4.5100, 1, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (34, '007800', '申万菱信沪深300价值指数C', 0.00, 7.00, -7.0000, 0.0000, 0, '2022-02-12 00:00:00', '2022-06-18 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (36, '001694', '华安沪港深外延增长混合', 2847.11, 2674.68, 172.4300, 6.4400, 1, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (37, '121010', '国投瑞银瑞源灵活配置混合', 3061.06, 3044.73, 16.3300, 0.5300, 1, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (38, '320021', '诺安双利债券发起', 3057.92, 3044.39, 13.5300, 0.4400, 1, '2022-02-12 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (39, '007873', '华宝科技ETF联接A', 1811.62, 1875.59, -63.9700, -3.4100, 0, '2022-02-19 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (44, '000991', '工银战略转型股票A', 2929.37, 2955.65, -26.2800, -0.8900, 1, '2022-02-19 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (45, '090018', '大成新锐产业混合', 2947.78, 2921.82, 25.9600, 0.8800, 1, '2022-02-19 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (46, '001718', '工银物流产业股票A', 2965.20, 2825.72, 139.4800, 4.9300, 1, '2022-02-19 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (47, '003961', '易方达瑞程灵活配置混合A', 3060.94, 2666.78, 394.1600, 14.7800, 1, '2022-02-19 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (48, '519736', '交银新成长混合A(519736)', 3073.55, 2938.08, 135.4700, 4.6100, 1, '2022-02-19 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (49, 'DK1LK180002', '28天成长2号', 0.00, 0.00, 0.0000, 0.0000, 2, '2022-02-19 00:00:00', '2022-03-19 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (50, '160716', '嘉实中证锐联基本面50指数(LOF)A', 0.00, 7.72, -7.7200, 0.0000, 0, '2022-02-26 00:00:00', '2022-06-18 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (51, '519002', '华安安信消费混合A', 2877.46, 2816.19, 61.2700, 2.1700, 1, '2022-02-26 00:00:00', '2022-07-23 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (58, 'DK1LK180002-2', '28天成长2号-2', 0.00, 0.00, 0.0000, 0.0000, 2, '2022-02-26 00:00:00', '2022-03-26 00:00:00');
INSERT INTO `my_fund` (`id`, `fund_code`, `fund_name`, `fund_money`, `principal`, `profit`, `profit_rate`, `type`, `create_time`, `update_time`) VALUES (59, 'HUOQIBAO001', '活期宝', 23346.22, 23105.60, 240.6200, 1.0400, 2, '2022-05-14 00:00:00', '2022-07-23 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for my_fund_detail
-- ----------------------------
DROP TABLE IF EXISTS `my_fund_detail`;
CREATE TABLE `my_fund_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fund_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '基金代码',
  `fund_name` varchar(100) DEFAULT NULL COMMENT '基金名称',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '基金价值',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '盈利',
  `profit_rate` decimal(10,4) DEFAULT NULL COMMENT '收益率',
  `principal` decimal(10,2) DEFAULT NULL COMMENT '本金',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10669 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='我的基金明细';

-- ----------------------------
-- Records of my_fund_detail
-- ----------------------------
BEGIN;
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10099, '090010', '大成中证红利指数A', 1432.63, 22.10, 1.5700, 1410.53, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10100, '161725', '招商中证白酒指数(LOA)A', 1779.91, -68.74, -3.5700, 1848.65, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10101, '001027', '前海开源中证大农业指数', 2051.47, -48.53, -2.3100, 2100.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10102, '160225', '国泰国证新能源汽车(LOF)', 1518.06, -206.94, -12.0000, 1725.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10103, '160119', '南方中证500ETF联接(LOF)A', 1529.68, -80.85, -5.0200, 1610.53, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10104, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1381.50, -243.50, -14.9800, 1625.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10105, '160219', '国泰国证医药卫生行业指数(LOF)', 3212.86, -637.14, -16.5500, 3850.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10106, '001717', '工银瑞信前沿医疗股票A', 4535.46, -1264.54, -21.8000, 5800.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10107, '160222', '国泰国证食品饮料行业指数(LOF)', 358.26, -25.15, -6.5600, 383.41, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10108, '007800', '申万菱信沪深300价值指数C', 111.17, 0.64, 0.5800, 110.53, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10109, '519737', '交银新成长混合', 8724.53, -1275.47, -12.7600, 10000.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10110, '519069', '汇添富价值精选混合A', 6546.08, -1719.27, -20.8100, 8265.35, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10111, '110011', '易方达优质精选混合(QDII)', 7233.21, -1834.43, -20.2400, 9067.64, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10112, '000083', '汇添富消费行业混合', 7653.84, -2346.16, -23.4700, 10000.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10113, '001371', '富国沪港深价值混合A', 8759.04, -2142.74, -19.6600, 10901.78, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10114, '162605', '景顺长城鼎益混合(LOF)', 5522.00, -2653.21, -32.4600, 8175.21, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10115, '519702', '交银趋势混合A', 129.43, -0.38, -0.2900, 129.81, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10116, '002943', '广发多因子混合', 128.24, -1.57, -1.2100, 129.81, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10117, '001694', '华安沪港深外延增长混合', 123.24, 0.00, 0.0000, 123.24, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10118, '121010', '国投瑞银瑞源灵活配置混合', 123.24, 0.00, 0.0000, 123.24, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10119, '320021', '诺安双利债券发起', 123.24, 0.00, 0.0000, 123.24, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10120, 'TTXJGS01200001', '天天成长1号', 121302.42, 952.96, 0.8000, 120349.46, '2022-02-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10121, '090010', '大成中证红利指数A', 1541.17, 29.01, 1.9200, 1512.16, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10122, '161725', '招商中证白酒指数(LOA)A', 1845.20, -3.45, -0.1800, 1848.65, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10123, '001027', '前海开源中证大农业指数', 2045.31, -54.69, -2.6000, 2100.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10124, '160225', '国泰国证新能源汽车(LOF)', 1606.62, -118.38, -6.8600, 1725.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10125, '160119', '南方中证500ETF联接(LOF)A', 1548.88, -61.65, -3.8300, 1610.53, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10126, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1409.57, -215.43, -13.2600, 1625.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10127, '160219', '国泰国证医药卫生行业指数(LOF)', 3365.11, -484.89, -12.5900, 3850.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10128, '001717', '工银瑞信前沿医疗股票A', 4883.61, -916.39, -15.8000, 5800.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10129, '160222', '国泰国证食品饮料行业指数(LOF)', 0.00, -45.12, 0.0000, 45.12, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10130, '007800', '申万菱信沪深300价值指数C', 315.47, 1.71, 0.5500, 313.76, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10131, '007873', '华宝科技ETF联接A', 49.47, 0.06, 0.1300, 49.41, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10136, '000991', '工银战略转型股票A', 141.96, 2.50, 1.7900, 139.46, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10137, '090018', '大成新锐产业混合', 104.77, 0.79, 0.7600, 103.98, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10138, '121010', '国投瑞银瑞源灵活配置混合', 228.03, 0.81, 0.3600, 227.22, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10139, '001718', '工银物流产业股票A', 109.79, 0.26, 0.2400, 109.53, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10140, '519702', '交银趋势混合A', 265.88, 0.59, 0.2200, 265.29, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10141, '003961', '易方达瑞程灵活配置混合A', 149.21, 0.27, 0.1800, 148.94, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10142, '001694', '华安沪港深外延增长混合', 227.07, 0.15, -0.0700, 226.92, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10143, '519736', '交银新成长混合A(519736)', 252.53, -0.69, -0.2700, 253.22, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10144, '320021', '诺安双利债券发起', 226.34, -0.88, -0.3900, 227.22, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10145, '002943', '广发多因子混合', 245.30, -1.20, -0.4900, 246.50, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10146, '519737', '交银新成长混合', 8817.54, -1182.46, -11.8300, 10000.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10147, '001371', '富国沪港深价值混合A', 8805.00, -2096.78, -19.2400, 10901.78, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10148, '000083', '汇添富消费行业混合', 8063.68, -2063.84, -20.3800, 10127.52, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10149, '110011', '易方达优质精选混合(QDII)', 7320.86, -1874.30, -20.3900, 9195.16, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10150, '519069', '汇添富价值精选混合A', 6566.83, -1698.52, -20.5500, 8265.35, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10151, '162605', '景顺长城鼎益混合(LOF)', 4892.60, -2490.07, -33.7300, 7382.67, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10153, 'DK1LK180002', '28天成长2号', 86009.16, 9.17, 0.0300, 85999.99, '2022-02-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10154, '007873', '华宝科技ETF联接A', 151.40, 1.51, 1.0100, 149.89, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10155, '090010', '大成中证红利指数A', 1606.62, -6.03, -0.3700, 1612.65, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10156, '160716', '嘉实中证锐联基本面50指数(LOF)A', 100.00, -0.48, -0.4800, 100.48, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10157, '007800', '申万菱信沪深300价值指数C', 404.35, -9.89, -2.3900, 414.24, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10158, '001027', '前海开源中证大农业指数', 2028.35, -71.65, -3.4100, 2100.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10159, '160225', '国泰国证新能源汽车(LOF)', 1661.75, -63.25, -3.6700, 1725.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10160, '160119', '南方中证500ETF联接(LOF)A', 1646.67, -64.34, -3.7600, 1711.01, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10161, '161725', '招商中证白酒指数(LOA)A', 1239.96, -55.78, -4.1300, 1295.74, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10162, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1479.59, -145.41, -8.9500, 1625.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10163, '160219', '国泰国证医药卫生行业指数(LOF)', 3296.43, -428.53, -11.5000, 3724.96, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10164, '001717', '工银瑞信前沿医疗股票A', 5122.81, -780.10, -13.2200, 5902.91, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10165, '519737', '交银新成长混合', 8802.04, -1197.96, -11.9800, 10000.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10166, '001371', '富国沪港深价值混合A', 8581.76, -2320.02, -21.2900, 10901.78, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10167, '000083', '汇添富消费行业混合', 7891.24, -2236.28, -22.0900, 10127.52, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10168, '110011', '易方达优质精选混合(QDII)', 7173.66, -2267.38, -24.0200, 9441.04, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10169, '519069', '汇添富价值精选混合A', 6417.80, -1847.55, -22.3600, 8265.35, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10170, '162605', '景顺长城鼎益混合(LOF)', 1618.73, -2664.81, -26.6300, 4283.54, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10171, '519702', '交银趋势混合A', 519.02, 7.85, 1.5300, 511.17, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10172, '519736', '交银新成长混合A(519736)', 502.12, 3.02, 0.6000, 499.10, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10173, '002943', '广发多因子混合', 487.89, -4.49, -0.9200, 492.38, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10174, '001694', '华安沪港深外延增长混合', 472.72, -0.38, -0.0800, 473.10, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10175, '320021', '诺安双利债券发起', 472.21, -0.89, -0.1900, 473.10, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10176, '121010', '国投瑞银瑞源灵活配置混合', 471.23, -1.87, -0.4000, 473.10, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10177, '003961', '易方达瑞程灵活配置混合A', 397.81, 2.99, 0.7500, 394.82, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10178, '000991', '工银战略转型股票A', 381.57, -3.77, -0.9800, 385.34, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10179, '001718', '工银物流产业股票A', 355.43, 0.02, 0.0000, 355.41, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10180, '090018', '大成新锐产业混合', 352.13, 2.27, 0.6500, 349.86, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10181, '519002', '华安安信消费混合A', 247.99, 2.11, 0.8500, 245.88, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10183, 'TTXJGS01200001', '天天成长1号', 50289.27, 1039.81, 2.1100, 49249.46, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10193, 'DK1LK180002', '28天成长2号', 26011.46, 11.46, 0.0400, 26000.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10194, 'DK1LK180002-2', '28天成长2号-2', 60005.28, 5.28, 0.0000, 60000.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10195, '090010', '大成中证红利指数A', 1738.40, 25.43, 1.4800, 1712.97, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10196, '160716', '嘉实中证锐联基本面50指数(LOF)A', 200.05, -0.77, -0.3800, 200.82, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10197, '007873', '华宝科技ETF联接A', 246.53, -3.68, -1.4700, 250.21, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10198, '007800', '申万菱信沪深300价值指数C', 505.00, -9.57, -1.8600, 514.57, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10199, '001027', '前海开源中证大农业指数', 2034.52, -65.48, -3.1200, 2100.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10200, '160119', '南方中证500ETF联接(LOF)A', 1743.02, -68.33, -3.7700, 1811.35, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10201, '161725', '招商中证白酒指数(LOA)A', 587.64, -44.61, -6.7800, 632.25, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10202, '160225', '国泰国证新能源汽车(LOF)', 1551.97, -173.03, -10.0300, 1725.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10203, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1452.90, -172.10, -10.5900, 1625.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10204, '160219', '国泰国证医药卫生行业指数(LOF)', 3261.44, -463.52, -12.4400, 3724.96, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10205, '001717', '工银瑞信前沿医疗股票A', 5233.13, -770.11, -12.8300, 6003.24, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10206, '519737', '交银新成长混合', 8489.81, -1510.19, -15.1100, 10000.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10207, '001371', '富国沪港深价值混合A', 8273.16, -2628.62, -24.1200, 10901.78, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10208, '000083', '汇添富消费行业混合', 7578.62, -2548.90, -25.1700, 10127.52, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10209, '110011', '易方达优质精选混合(QDII)', 7027.57, -2550.13, -26.6300, 9577.70, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10210, '519069', '汇添富价值精选混合A', 6257.45, -2007.90, -24.3000, 8265.35, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10211, '162605', '景顺长城鼎益混合(LOF)', 0.00, -1790.74, 0.0000, 2705.58, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10212, '519702', '交银趋势混合A', 633.08, -2.81, -0.4500, 635.89, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10213, '519736', '交银新成长混合A(519736)', 607.61, -16.21, -2.6000, 623.82, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10214, '002943', '广发多因子混合', 599.82, -17.28, -2.8100, 617.10, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10215, '121010', '国投瑞银瑞源灵活配置混合', 600.86, 3.04, 0.5000, 597.82, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10216, '320021', '诺安双利债券发起', 594.82, -3.00, -0.5100, 597.82, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10217, '001694', '华安沪港深外延增长混合', 590.79, -7.03, -1.1800, 597.82, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10218, '000991', '工银战略转型股票A', 506.99, -3.07, -0.6100, 510.06, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10219, '003961', '易方达瑞程灵活配置混合A', 504.77, -14.77, -2.8500, 519.54, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10220, '090018', '大成新锐产业混合', 470.24, -4.34, -0.9200, 474.58, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10221, '001718', '工银物流产业股票A', 468.90, -11.23, -2.3400, 480.13, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10222, '519002', '华安安信消费混合A', 372.13, 1.53, 0.4100, 370.60, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10223, 'DK1LK180002', '28天成长2号', 26016.04, 16.04, 0.0600, 26000.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10224, 'DK1LK180002-2', '28天成长2号-2', 60015.86, 15.86, 0.0200, 60000.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10225, 'TTXJGS01200001', '天天成长1号', 48114.78, 1065.32, 2.2600, 47049.46, '2022-03-05 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10226, '161725', '招商中证白酒指数(LOA)A', 0.00, -120.41, 0.0000, 120.41, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10227, '090010', '大成中证红利指数A', 1773.77, -38.09, -2.1000, 1811.86, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10228, '160716', '嘉实中证锐联基本面50指数(LOF)A', 290.38, -9.35, -3.1200, 299.73, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10229, '007873', '华宝科技ETF联接A', 336.16, -12.95, -3.7100, 349.11, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10230, '007800', '申万菱信沪深300价值指数C', 579.82, -33.65, -5.4900, 613.47, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10231, '001027', '前海开源中证大农业指数', 1942.04, -157.96, -7.5200, 2100.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10232, '160119', '南方中证500ETF联接(LOF)A', 1761.54, -148.71, -7.7800, 1910.25, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10233, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1427.01, -197.99, -12.1800, 1625.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10234, '160225', '国泰国证新能源汽车(LOF)', 1460.52, -220.43, -13.1100, 1680.95, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10235, '001717', '工银瑞信前沿医疗股票A', 5287.99, -821.90, -13.4500, 6109.89, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10236, '160219', '国泰国证医药卫生行业指数(LOF)', 3170.73, -554.24, -14.8800, 3724.97, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10237, '320021', '诺安双利债券发起', 695.77, -8.26, -1.1800, 704.03, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10238, '121010', '国投瑞银瑞源灵活配置混合', 691.81, -12.22, -1.7400, 704.03, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10239, '519002', '华安安信消费混合A', 463.98, -12.83, -2.6900, 476.81, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10240, '519702', '交银趋势混合A', 716.53, -25.57, -3.4500, 742.10, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10241, '000991', '工银战略转型股票A', 593.43, -22.84, -3.7100, 616.27, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10242, '090018', '大成新锐产业混合', 552.45, -28.34, -4.8800, 580.79, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10243, '001718', '工银物流产业股票A', 555.68, -30.66, -5.2300, 586.34, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10244, '003961', '易方达瑞程灵活配置混合A', 592.04, -33.71, -5.3900, 625.75, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10245, '519736', '交银新成长混合A(519736)', 689.49, -40.54, -5.5600, 730.03, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10246, '001694', '华安沪港深外延增长混合', 660.96, -43.07, -6.1200, 704.03, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10247, '002943', '广发多因子混合', 677.11, -46.20, -6.3900, 723.31, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10248, '519737', '交银新成长混合', 8155.45, -1844.55, -18.4500, 10000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10249, '000083', '汇添富消费行业混合', 7447.34, -2680.18, -26.4700, 10127.52, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10250, '001371', '富国沪港深价值混合A', 7971.12, -2877.26, -26.5300, 10848.38, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10251, '110011', '易方达优质精选混合(QDII)', 6757.57, -2897.94, -30.0200, 9655.51, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10254, '519069', '汇添富价值精选混合A', 4672.20, -2253.35, -32.5400, 6925.55, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10256, 'TTXJGS01200001', '天天成长1号', 40739.73, 1090.27, 2.7500, 39649.46, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10257, 'DK1LK180002', '28天成长2号', 26020.63, 20.63, 0.0700, 26000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10258, 'DK1LK180002-2', '28天成长2号-2', 60026.45, 26.45, 0.0400, 60000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10259, '160716', '嘉实中证锐联基本面50指数(LOF)A', 386.34, -10.25, -2.5800, 396.59, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10260, '007873', '华宝科技ETF联接A', 432.46, -13.50, -3.0300, 445.96, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10261, '090010', '大成中证红利指数A', 1842.75, -65.96, -3.4600, 1908.71, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10262, '007800', '申万菱信沪深300价值指数C', 674.85, -35.48, -4.9900, 710.33, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10263, '160119', '南方中证500ETF联接(LOF)A', 1822.58, -184.53, -9.1900, 2007.11, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10264, '001027', '前海开源中证大农业指数', 1258.19, -146.95, -10.4600, 1405.14, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10265, '160225', '国泰国证新能源汽车(LOF)', 1496.38, -184.56, -10.9800, 1680.94, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10266, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1417.17, -207.83, -12.7900, 1625.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10267, '160219', '国泰国证医药卫生行业指数(LOF)', 3199.67, -525.30, -14.1000, 3724.97, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10268, '001717', '工银瑞信前沿医疗股票A', 5317.77, -888.99, -14.3200, 6206.76, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10269, '320021', '诺安双利债券发起', 814.47, -9.14, -1.1100, 823.61, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10270, '121010', '国投瑞银瑞源灵活配置混合', 804.42, -19.19, -2.3300, 823.61, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10271, '000991', '工银战略转型股票A', 716.27, -19.58, -2.6600, 735.85, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10272, '519002', '华安安信消费混合A', 576.31, -20.08, -3.3700, 596.39, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10273, '001694', '华安沪港深外延增长混合', 790.33, -33.28, -4.0500, 823.61, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10274, '519702', '交银趋势混合A', 820.78, -40.90, -4.7500, 861.68, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10275, '090018', '大成新锐产业混合', 666.76, -33.61, -4.8000, 700.37, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10276, '003961', '易方达瑞程灵活配置混合A', 705.25, -40.08, -5.3800, 745.33, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10277, '519736', '交银新成长混合A(519736)', 802.82, -46.79, -5.5100, 849.61, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10278, '002943', '广发多因子混合', 794.51, -48.38, -5.7400, 842.89, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10279, '001718', '工银物流产业股票A', 665.40, -40.52, -5.7500, 705.92, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10280, '519737', '交银新成长混合', 8102.30, -1897.70, -18.9800, 10000.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10281, '001371', '富国沪港深价值混合A', 7971.12, -2930.66, -26.8900, 10901.78, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10282, '000083', '汇添富消费行业混合', 7287.13, -2840.39, -28.0500, 10127.52, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10283, '110011', '易方达优质精选混合(QDII)', 6975.07, -2828.42, -28.8600, 9803.49, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10284, '519069', '汇添富价值精选混合A', 3117.27, -2303.84, -42.5000, 5421.11, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10285, 'DK1LK180002', '28天成长2号', 0.00, 0.00, 0.0000, 0.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10286, 'DK1LK180002-2', '28天成长2号-2', 60052.91, 52.91, 0.0800, 60000.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10287, 'TTXJGS01200001', '天天成长1号', 50765.96, 1116.50, 2.2500, 49649.46, '2022-03-19 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10288, '090010', '大成中证红利指数A', 1976.01, -33.45, -1.6600, 2009.46, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10289, '160716', '嘉实中证锐联基本面50指数(LOF)A', 485.23, -12.10, -2.4300, 497.33, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10290, '007873', '华宝科技ETF联接A', 520.21, -26.49, -4.8500, 546.70, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10291, '007800', '申万菱信沪深300价值指数C', 769.33, -41.74, -5.1500, 811.07, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10292, '160119', '南方中证500ETF联接(LOF)A', 1904.92, -202.92, -9.6300, 2107.84, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10293, '001027', '前海开源中证大农业指数', 1256.74, -148.39, -10.5600, 1405.13, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10294, '001717', '工银瑞信前沿医疗股票A', 5526.51, -781.00, -12.3800, 6307.51, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10295, '160225', '国泰国证新能源汽车(LOF)', 824.61, -129.39, -13.5600, 954.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10296, '160219', '国泰国证医药卫生行业指数(LOF)', 3191.46, -533.51, -14.3200, 3724.97, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10297, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1357.98, -267.02, -16.4300, 1625.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10298, '320021', '诺安双利债券发起', 929.79, -11.61, -1.2400, 941.40, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10299, '121010', '国投瑞银瑞源灵活配置混合', 929.21, -12.19, -1.3000, 941.40, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10300, '090018', '大成新锐产业混合', 800.96, -17.20, -2.1100, 818.16, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10301, '000991', '工银战略转型股票A', 833.32, -20.32, -2.3800, 853.64, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10302, '519702', '交银趋势混合A', 945.33, -34.14, -3.4900, 979.47, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10303, '519002', '华安安信消费混合A', 686.72, -27.46, -3.8500, 714.18, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10304, '002943', '广发多因子混合', 895.88, -64.80, -6.7500, 960.68, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10305, '519736', '交银新成长混合A(519736)', 899.50, -67.90, -7.0200, 967.40, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10306, '003961', '易方达瑞程灵活配置混合A', 799.04, -64.08, -7.4300, 863.12, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10307, '001694', '华安沪港深外延增长混合', 870.57, -70.83, -7.5400, 941.40, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10308, '001718', '工银物流产业股票A', 758.11, -65.60, -7.9700, 823.71, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10309, '519737', '交银新成长混合', 7914.08, -2085.92, -20.8600, 10000.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10310, '001371', '富国沪港深价值混合A', 7852.93, -3048.85, -27.9700, 10901.78, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10311, '000083', '汇添富消费行业混合', 7047.94, -3079.58, -30.4100, 10127.52, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10312, '110011', '易方达优质精选混合(QDII)', 6835.02, -3086.26, -31.1100, 9921.28, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10313, '519069', '汇添富价值精选混合A', 1543.24, -2391.67, -60.7900, 3934.91, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10314, 'DK1LK180002-2', '28天成长2号-2', 0.00, 0.00, 0.0000, 0.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10315, 'TTXJGS01200001', '天天成长1号', 139812.89, 1163.43, 0.8400, 138649.46, '2022-03-26 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10316, '090010', '大成中证红利指数A', 2158.62, 51.26, 2.4300, 2107.36, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10317, '160716', '嘉实中证锐联基本面50指数(LOF)A', 605.67, 10.44, 1.7500, 595.23, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10318, '007800', '申万菱信沪深300价值指数C', 899.01, -9.96, -1.1000, 908.97, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10319, '007873', '华宝科技ETF联接A', 610.95, -33.65, -5.2200, 644.60, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10320, '160119', '南方中证500ETF联接(LOF)A', 2032.14, -173.59, -7.8700, 2205.73, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10321, '001027', '前海开源中证大农业指数', 1290.57, -114.56, -8.1500, 1405.13, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10322, '001717', '工银瑞信前沿医疗股票A', 5693.68, -711.74, -11.1100, 6405.42, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10323, '160225', '国泰国证新能源汽车(LOF)', 198.08, -28.97, -12.7600, 227.05, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10324, '160219', '国泰国证医药卫生行业指数(LOF)', 3213.49, -511.47, -13.7300, 3724.96, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10325, '007301', '国联安中证全指半导体产品与设备ETF联接C', 1317.09, -307.91, -18.9500, 1625.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10326, '000991', '工银战略转型股票A', 1016.70, 16.25, 1.6200, 1000.45, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10327, '121010', '国投瑞银瑞源灵活配置混合', 1093.07, 4.86, 0.4400, 1088.21, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10328, '090018', '大成新锐产业混合', 956.87, -8.10, -0.8400, 964.97, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10329, '320021', '诺安双利债券发起', 1078.48, -9.73, -0.9000, 1088.21, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10330, '519002', '华安安信消费混合A', 841.66, -19.33, -2.2500, 860.99, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10331, '519702', '交银趋势混合A', 1103.15, -31.94, -2.8200, 1135.09, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10332, '002943', '广发多因子混合', 1061.02, -52.35, -4.7100, 1113.37, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10333, '001694', '华安沪港深外延增长混合', 893.66, -47.74, -5.0800, 941.40, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10334, '519736', '交银新成长混合A(519736)', 1059.12, -59.44, -5.3200, 1118.56, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10335, '003961', '易方达瑞程灵活配置混合A', 942.61, -67.32, -6.6700, 1009.93, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10336, '001718', '工银物流产业股票A', 904.30, -66.22, -6.8300, 970.52, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10337, '519737', '交银新成长混合', 7989.37, -2010.63, -20.1100, 10000.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10338, '001371', '富国沪港深价值混合A', 7971.12, -2930.66, -26.8900, 10901.78, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10339, '000083', '汇添富消费行业混合', 7109.34, -2937.18, -29.0100, 10046.52, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10340, '110011', '易方达优质精选混合(QDII)', 7005.03, -2916.25, -29.4000, 9921.28, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10341, '519069', '汇添富价值精选混合A', 0.00, -2372.81, 0.0000, 2372.81, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10342, 'TTXJGS01200001', '天天成长1号', 139212.06, 1262.60, 0.9200, 137949.46, '2022-04-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10343, '160716', '嘉实中证锐联基本面50指数(LOF)A', 704.27, 25.54, 3.7600, 678.73, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10344, '090010', '大成中证红利指数A', 2270.25, 68.69, 3.1200, 2201.56, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10345, '160225', '国泰国证新能源汽车(LOF)', 0.00, -228.60, 0.0000, 228.60, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10346, '007800', '申万菱信沪深300价值指数C', 1002.98, -0.18, -0.0200, 1003.16, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10347, '007873', '华宝科技ETF联接A', 679.65, -60.46, -8.1700, 740.11, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10348, '160119', '南方中证500ETF联接(LOF)A', 2083.16, -216.76, -9.4200, 2299.92, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10349, '001027', '前海开源中证大农业指数', 1260.66, -144.47, -10.2800, 1405.13, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10350, '001717', '工银瑞信前沿医疗股票A', 5539.80, -959.83, -14.7700, 6499.63, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10351, '160219', '国泰国证医药卫生行业指数(LOF)', 3124.94, -600.03, -16.1100, 3724.97, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10352, '007301', '国联安中证全指半导体产品与设备ETF联接C', 837.15, -246.64, -22.7600, 1083.79, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10353, '000991', '工银战略转型股票A', 1161.64, 39.60, 3.9500, 1122.04, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10354, '121010', '国投瑞银瑞源灵活配置混合', 1197.70, 1.52, 0.1200, 1196.18, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10355, '090018', '大成新锐产业混合', 1068.62, -2.85, -0.3000, 1071.47, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10356, '320021', '诺安双利债券发起', 1183.35, -12.83, -1.0800, 1196.18, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10357, '519002', '华安安信消费混合A', 955.54, -27.04, -3.1400, 982.58, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10358, '519702', '交银趋势混合A', 1194.08, -42.20, -3.7200, 1236.28, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10359, '002943', '广发多因子混合', 1143.02, -78.32, -6.4200, 1221.34, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10360, '519736', '交银新成长混合A(519736)', 1140.94, -78.81, -7.0500, 1219.75, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10361, '001694', '华安沪港深外延增长混合', 978.93, -68.97, -7.3300, 1047.90, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10362, '001718', '工银物流产业股票A', 1003.79, -88.32, -9.1000, 1092.11, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10363, '003961', '易方达瑞程灵活配置混合A', 993.22, -123.21, -12.2000, 1116.43, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10364, '519737', '交银新成长混合', 7471.31, -2163.92, -22.4600, 9635.23, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10365, '001371', '富国沪港深价值混合A', 7541.64, -3056.57, -28.8500, 10598.21, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10366, '110011', '易方达优质精选混合(QDII)', 6695.61, -3007.36, -31.3300, 9702.97, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10367, '000083', '汇添富消费行业混合', 6660.33, -3126.96, -31.9500, 9787.29, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10368, 'TTXJGS01200001', '天天成长1号', 138266.92, 1317.46, 0.9600, 136949.46, '2022-04-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10369, '160716', '嘉实中证锐联基本面50指数(LOF)A', 793.90, 22.88, 2.9700, 771.02, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10370, '090010', '大成中证红利指数A', 2344.14, 47.67, 2.0800, 2296.47, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10371, '007800', '申万菱信沪深300价值指数C', 1090.29, -5.16, -0.4700, 1095.45, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10372, '001027', '前海开源中证大农业指数', 969.29, -88.41, -8.3600, 1057.70, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10373, '007873', '华宝科技ETF联接A', 747.11, -85.28, -10.2500, 832.39, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10374, '160119', '南方中证500ETF联接(LOF)A', 2128.99, -265.83, -11.1000, 2394.82, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10375, '001717', '工银瑞信前沿医疗股票A', 5622.14, -972.40, -14.7500, 6594.54, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10376, '160219', '国泰国证医药卫生行业指数(LOF)', 3102.47, -622.49, -16.7100, 3724.96, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10377, '007301', '国联安中证全指半导体产品与设备ETF联接C', 474.58, -166.40, -25.9600, 640.98, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10378, '000991', '工银战略转型股票A', 1263.13, 33.83, 2.7500, 1229.30, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10379, '121010', '国投瑞银瑞源灵活配置混合', 1326.83, 13.90, 1.0500, 1312.93, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10380, '320021', '诺安双利债券发起', 1301.00, -11.93, -0.9100, 1312.93, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10381, '090018', '大成新锐产业混合', 1154.22, -34.72, -2.9300, 1188.94, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10382, '519002', '华安安信消费混合A', 1047.22, -42.61, -3.9100, 1089.83, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10383, '519702', '交银趋势混合A', 1268.56, -73.79, -5.5000, 1342.35, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10384, '001694', '华安沪港深外延增长混合', 1086.77, -78.60, -6.7500, 1165.37, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10385, '001718', '工银物流产业股票A', 1107.75, -91.61, -7.6400, 1199.36, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10386, '519736', '交银新成长混合A(519736)', 1218.29, -107.53, -8.1200, 1325.82, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10387, '002943', '广发多因子混合', 1226.51, -111.58, -8.3400, 1338.09, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10388, '003961', '易方达瑞程灵活配置混合A', 1067.55, -166.35, -13.4900, 1233.90, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10389, '519737', '交银新成长混合', 6954.11, -2359.37, -25.3400, 9313.48, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10390, '001371', '富国沪港深价值混合A', 7153.09, -3094.87, -30.2000, 10247.96, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10391, '000083', '汇添富消费行业混合', 6593.34, -2860.44, -30.2600, 9453.78, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10392, '110011', '易方达优质精选混合(QDII)', 6544.15, -2912.48, -30.8000, 9456.63, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10393, 'TTXJGS01200001', '天天成长1号', 152347.09, 1397.63, 0.9300, 150949.46, '2022-04-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10394, '160716', '嘉实中证锐联基本面50指数(LOF)A', 861.04, 1.23, 0.1400, 859.81, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10395, '090010', '大成中证红利指数A', 2344.68, -40.56, -1.7000, 2385.24, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10396, '007800', '申万菱信沪深300价值指数C', 1142.79, -41.44, -3.5000, 1184.23, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10397, '001027', '前海开源中证大农业指数', 813.60, -106.49, -11.5700, 920.09, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10398, '007873', '华宝科技ETF联接A', 804.49, -116.68, -12.6700, 921.17, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10399, '160119', '南方中证500ETF联接(LOF)A', 2107.19, -375.37, -15.1200, 2482.56, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10400, '001717', '工银瑞信前沿医疗股票A', 5377.05, -1307.69, -19.5600, 6684.74, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10401, '160219', '国泰国证医药卫生行业指数(LOF)', 2900.31, -824.66, -22.1400, 3724.97, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10402, '007301', '国联安中证全指半导体产品与设备ETF联接C', 0.00, -413.78, 0.0000, 413.78, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10403, '000991', '工银战略转型股票A', 1328.40, -7.43, -0.5600, 1335.83, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10404, '320021', '诺安双利债券发起', 1404.76, -24.42, -1.7100, 1429.18, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10405, '121010', '国投瑞银瑞源灵活配置混合', 1404.16, -25.02, -1.7600, 1429.18, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10406, '519002', '华安安信消费混合A', 1117.54, -78.83, -6.5900, 1196.37, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10407, '090018', '大成新锐产业混合', 1209.81, -95.54, -7.3200, 1305.35, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10408, '519702', '交银趋势混合A', 1325.70, -118.52, -8.2100, 1444.22, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10409, '001694', '华安沪港深外延增长混合', 1156.13, -125.65, -9.8100, 1281.78, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10410, '001718', '工银物流产业股票A', 1173.52, -132.38, -10.1400, 1305.90, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10411, '002943', '广发多因子混合', 1292.07, -162.27, -11.1600, 1454.34, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10412, '519736', '交银新成长混合A(519736)', 1268.48, -159.21, -11.1600, 1427.69, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10413, '003961', '易方达瑞程灵活配置混合A', 1135.24, -215.07, -15.9300, 1350.31, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10414, '519737', '交银新成长混合', 6342.59, -2651.27, -29.4800, 8993.86, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10415, '001371', '富国沪港深价值混合A', 6636.18, -3263.03, -32.9700, 9899.21, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10416, '000083', '汇添富消费行业混合', 6079.76, -3052.42, -33.4300, 9132.18, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10417, '110011', '易方达优质精选混合(QDII)', 6061.98, -3147.29, -34.1800, 9209.27, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10418, 'TTXJGS01200001', '天天成长1号', 151729.64, 1480.18, 0.9900, 150249.46, '2022-04-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10419, '160716', '嘉实中证锐联基本面50指数(LOF)A', 981.36, 1.48, 0.1500, 979.88, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10420, '090010', '大成中证红利指数A', 2420.31, -85.00, -3.3900, 2505.31, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10421, '007800', '申万菱信沪深300价值指数C', 1239.35, -64.95, -4.9800, 1304.30, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10422, '007873', '华宝科技ETF联接A', 934.31, -117.83, -11.2000, 1052.14, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10423, '160119', '南方中证500ETF联接(LOF)A', 2205.37, -408.17, -15.6200, 2613.54, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10424, '001717', '工银瑞信前沿医疗股票A', 5492.54, -1307.16, -19.2200, 6799.70, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10425, '160219', '国泰国证医药卫生行业指数(LOF)', 2884.76, -840.21, -22.5600, 3724.97, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10426, '001027', '前海开源中证大农业指数', 0.00, -258.10, 0.0000, 258.10, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10427, '000991', '工银战略转型股票A', 1463.89, 15.62, 1.0700, 1448.27, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10428, '320021', '诺安双利债券发起', 1516.90, -27.19, -1.7700, 1544.09, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10429, '121010', '国投瑞银瑞源灵活配置混合', 1511.19, -33.24, -2.1600, 1544.43, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10430, '090018', '大成新锐产业混合', 1328.11, -92.49, -6.5100, 1420.60, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10431, '519002', '华安安信消费混合A', 1217.22, -91.59, -7.0000, 1308.81, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10432, '519702', '交银趋势混合A', 1449.32, -109.81, -7.0500, 1559.13, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10433, '519736', '交银新成长混合A(519736)', 1412.39, -124.80, -8.1200, 1537.19, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10434, '001718', '工银物流产业股票A', 1296.80, -121.54, -8.5700, 1418.34, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10435, '001694', '华安沪港深外延增长混合', 1158.41, -123.37, -9.6300, 1281.78, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10436, '002943', '广发多因子混合', 1393.59, -175.66, -11.2000, 1569.25, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10437, '003961', '易方达瑞程灵活配置混合A', 1292.79, -172.77, -11.7900, 1465.56, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10438, '519737', '交银新成长混合', 6142.05, -2514.49, -29.0500, 8656.54, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10439, '110011', '易方达优质精选混合(QDII)', 6120.44, -2744.10, -30.9600, 8864.54, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10440, '001371', '富国沪港深价值混合A', 6422.85, -3130.61, -32.7700, 9553.46, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10441, '000083', '汇添富消费行业混合', 6052.44, -2964.52, -32.8800, 9016.96, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10443, 'TTXJGS01200001', '天天成长1号', 146520.47, 1571.01, 1.0800, 144949.46, '2022-04-30 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10444, '160716', '嘉实中证锐联基本面50指数(LOF)A', 954.01, -25.87, -2.6400, 979.88, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10445, '090010', '大成中证红利指数A', 2376.09, -129.22, -5.1600, 2505.31, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10446, '007800', '申万菱信沪深300价值指数C', 1211.66, -92.64, -7.1000, 1304.30, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10447, '007873', '华宝科技ETF联接A', 903.99, -148.15, -14.0800, 1052.14, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10448, '160119', '南方中证500ETF联接(LOF)A', 2181.19, -432.35, -16.5400, 2613.54, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10449, '001717', '工银瑞信前沿医疗股票A', 5346.05, -1453.65, -21.3800, 6799.70, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10450, '160219', '国泰国证医药卫生行业指数(LOF)', 2854.52, -683.05, -23.3700, 3537.57, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10451, '320021', '诺安双利债券发起', 1635.58, -26.03, -1.6900, 1661.61, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10452, '000991', '工银战略转型股票A', 1539.53, -26.26, -1.8200, 1565.79, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10453, '121010', '国投瑞银瑞源灵活配置混合', 1607.14, -54.81, -3.5500, 1661.95, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10454, '090018', '大成新锐产业混合', 1439.43, -98.69, -6.9500, 1538.12, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10455, '519702', '交银趋势混合A', 1565.15, -111.50, -7.1600, 1676.65, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10456, '519002', '华安安信消费混合A', 1322.73, -103.60, -7.9200, 1426.33, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10457, '519736', '交银新成长混合A(519736)', 1514.91, -139.80, -9.1000, 1654.71, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10458, '001718', '工银物流产业股票A', 1396.02, -139.84, -9.8600, 1535.86, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10459, '003961', '易方达瑞程灵活配置混合A', 1404.61, -178.47, -12.1800, 1583.08, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10460, '002943', '广发多因子混合', 1494.18, -192.59, -12.2800, 1686.77, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10461, '001694', '华安沪港深外延增长混合', 1216.10, -174.88, -12.5800, 1390.98, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10462, '519737', '交银新成长混合', 6076.80, -2579.74, -29.8100, 8656.54, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10463, '001371', '富国沪港深价值混合A', 6249.70, -3303.76, -34.5900, 9553.46, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10464, '110011', '易方达优质精选混合(QDII)', 5828.91, -3144.83, -35.0500, 8973.74, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10465, '000083', '汇添富消费行业混合', 5574.08, -3213.26, -36.5700, 8787.34, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10466, 'TTXJGS01200001', '天天成长1号', 141587.03, 1637.57, 1.1700, 139949.46, '2022-05-07 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10467, '160716', '嘉实中证锐联基本面50指数(LOF)A', 1155.69, -20.06, -1.7100, 1175.75, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10468, '090010', '大成中证红利指数A', 2633.41, -67.74, -2.5100, 2701.15, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10469, '007800', '申万菱信沪深300价值指数C', 1418.71, -81.44, -5.4300, 1500.15, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10470, '007873', '华宝科技ETF联接A', 1129.03, -118.95, -9.5300, 1247.98, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10471, '160119', '南方中证500ETF联接(LOF)A', 2471.11, -338.29, -12.0400, 2809.40, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10472, '001717', '工银瑞信前沿医疗股票A', 5784.66, -1210.89, -17.3100, 6995.55, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10473, '160219', '国泰国证医药卫生行业指数(LOF)', 1703.51, -443.44, -20.6500, 2146.95, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10474, '000991', '工银战略转型股票A', 1676.34, -8.56, -0.5100, 1684.90, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10475, '320021', '诺安双利债券发起', 1758.65, -18.61, -1.0500, 1777.26, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10476, '121010', '国投瑞银瑞源灵活配置混合', 1744.18, -33.42, -1.8800, 1777.60, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10477, '519702', '交银趋势混合A', 1722.96, -69.94, -3.9100, 1792.90, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10478, '519002', '华安安信消费混合A', 1484.98, -60.46, -3.9200, 1545.44, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10479, '519736', '交银新成长混合A(519736)', 1687.14, -83.22, -4.7100, 1770.36, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10480, '090018', '大成新锐产业混合', 1562.76, -91.61, -5.5400, 1654.37, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10481, '001718', '工银物流产业股票A', 1555.73, -99.24, -6.0000, 1654.97, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10482, '003961', '易方达瑞程灵活配置混合A', 1594.53, -104.80, -6.1700, 1699.33, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10483, '002943', '广发多因子混合', 1660.03, -142.39, -7.9000, 1802.42, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10484, '001694', '华安沪港深外延增长混合', 1382.08, -125.15, -8.3100, 1507.23, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10485, '519737', '交银新成长混合', 5468.63, -2371.16, -30.2500, 7839.79, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10486, '001371', '富国沪港深价值混合A', 5775.33, -3196.88, -35.6400, 8972.21, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10487, '110011', '易方达优质精选混合(QDII)', 4914.40, -3137.61, -38.9700, 8052.01, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10488, '000083', '汇添富消费行业混合', 3808.05, -3119.86, -45.0400, 6927.91, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10489, 'TTXJGS01200001', '天天成长1号', 213683.84, 1734.38, 0.8200, 211949.46, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10490, 'HUOQIBAO001', '活期宝', 21037.02, 142.65, 0.6800, 20894.37, '2022-05-14 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10491, '001717', '工银瑞信前沿医疗股票A', 5800.86, -1289.61, -18.1900, 7090.47, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10492, '090010', '大成中证红利指数A', 2756.87, -39.20, -1.4000, 2796.07, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10493, '160716', '嘉实中证锐联基本面50指数(LOF)A', 1262.49, -8.17, -0.6400, 1270.66, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10494, '007800', '申万菱信沪深300价值指数C', 1531.00, -64.06, -4.0200, 1595.06, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10495, '007873', '华宝科技ETF联接A', 1250.26, -92.63, -6.9000, 1342.89, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10496, '160119', '南方中证500ETF联接(LOF)A', 2623.16, -281.15, -9.6800, 2904.31, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10497, '160219', '国泰国证医药卫生行业指数(LOF)', 1073.90, -296.98, -21.6600, 1370.88, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10498, '121010', '国投瑞银瑞源灵活配置混合', 1887.71, -7.02, -0.3800, 1894.73, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10499, '000991', '工银战略转型股票A', 1797.80, -7.85, -0.4400, 1805.65, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10500, '003961', '易方达瑞程灵活配置混合A', 1806.77, -10.01, -0.5600, 1816.78, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10501, '090018', '大成新锐产业混合', 1756.58, -15.24, -0.8600, 1771.82, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10502, '320021', '诺安双利债券发起', 1877.24, -17.15, -0.9100, 1894.39, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10503, '519736', '交银新成长混合A(519736)', 1847.84, -40.24, -2.1400, 1888.08, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10504, '519702', '交银趋势混合A', 1869.40, -41.22, -2.1600, 1910.62, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10505, '519002', '华安安信消费混合A', 1628.79, -37.40, -2.2500, 1666.19, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10506, '001718', '工银物流产业股票A', 1696.95, -78.77, -4.4400, 1775.72, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10507, '002943', '广发多因子混合', 1817.83, -101.72, -5.3000, 1919.55, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10508, '001694', '华安沪港深外延增长混合', 1536.82, -87.86, -5.4100, 1624.68, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10509, '519737', '交银新成长混合', 5228.16, -2249.38, -30.0900, 7477.54, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10510, '001371', '富国沪港深价值混合A', 5473.25, -3146.61, -36.5100, 8619.86, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10511, '110011', '易方达优质精选混合(QDII)', 4809.14, -3009.20, -38.4900, 7818.34, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10513, '000083', '汇添富消费行业混合', 3477.68, -3079.70, -46.9700, 6557.38, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10514, 'HUOQIBAO001', '活期宝', 21699.51, 149.13, 0.6900, 21550.38, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10515, 'TTXJGS01200001', '天天成长1号', 193593.63, 1844.17, 0.9600, 191749.46, '2022-05-21 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10516, '090010', '大成中证红利指数A', 1384.31, -13.73, -0.9800, 1398.04, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10517, '160716', '嘉实中证锐联基本面50指数(LOF)A', 626.50, -8.82, -1.3900, 635.32, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10518, '007800', '申万菱信沪深300价值指数C', 1524.58, -70.48, -4.4200, 1595.06, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10519, '007873', '华宝科技ETF联接A', 1217.36, -125.53, -9.3500, 1342.89, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10520, '160119', '南方中证500ETF联接(LOF)A', 2614.22, -290.09, -9.9900, 2904.31, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10521, '001717', '工银瑞信前沿医疗股票A', 5643.10, -1447.37, -20.4100, 7090.47, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10522, '160219', '国泰国证医药卫生行业指数(LOF)', 1040.68, -330.20, -24.0900, 1370.88, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10523, '090018', '大成新锐产业混合', 1877.70, 5.88, 0.3100, 1871.82, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10524, '121010', '国投瑞银瑞源灵活配置混合', 1997.26, 2.53, 0.1200, 1994.73, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10525, '320021', '诺安双利债券发起', 1985.63, -8.76, -0.4400, 1994.39, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10526, '003961', '易方达瑞程灵活配置混合A', 1882.23, -34.55, -1.8100, 1916.78, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10527, '000991', '工银战略转型股票A', 1869.85, -35.80, -1.8800, 1905.65, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10528, '519002', '华安安信消费混合A', 1730.96, -35.23, -2.0000, 1766.19, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10529, '519702', '交银趋势混合A', 1968.33, -42.29, -2.1100, 2010.62, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10530, '519736', '交银新成长混合A(519736)', 1910.93, -77.15, -3.8900, 1988.08, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10531, '001718', '工银物流产业股票A', 1790.37, -85.35, -4.5500, 1875.72, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10532, '002943', '广发多因子混合', 1896.14, -123.41, -6.1200, 2019.55, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10533, '001694', '华安沪港深外延增长混合', 1619.28, -105.40, -6.1200, 1724.68, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10534, '110011', '易方达优质精选混合(QDII)', 1308.65, -3153.70, -70.6800, 4462.35, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10535, '000083', '汇添富消费行业混合', 0.00, 0.00, 0.0000, 0.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10536, '001371', '富国沪港深价值混合A', 0.00, 0.00, 0.0000, 0.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10537, '519737', '交银新成长混合', 0.00, 0.00, 0.0000, 0.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10538, 'HUOQIBAO001', '活期宝', 37162.69, 156.06, 0.4200, 37006.63, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10539, 'TTXJGS01200001', '天天成长1号', 183697.00, 1947.54, 1.0700, 181749.46, '2022-05-28 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10540, '090010', '大成中证红利指数A', 1505.45, 12.09, 0.8100, 1493.36, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10541, '160219', '国泰国证医药卫生行业指数(LOF)', 0.00, -870.31, 0.0000, 870.31, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10542, '160716', '嘉实中证锐联基本面50指数(LOF)A', 823.99, -4.42, -0.5300, 828.41, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10543, '007800', '申万菱信沪深300价值指数C', 1743.24, -44.90, -2.5100, 1788.14, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10544, '007873', '华宝科技ETF联接A', 1480.60, -55.35, -3.6000, 1535.95, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10545, '160119', '南方中证500ETF联接(LOF)A', 3027.38, -128.52, -4.0700, 3155.90, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10546, '001717', '工银瑞信前沿医疗股票A', 6097.77, -1088.00, -15.1400, 7185.77, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10547, '003961', '易方达瑞程灵活配置混合A', 2444.26, 177.48, 7.8200, 2266.78, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10548, '519736', '交银新成长混合A(519736)', 2452.40, 114.32, 4.8800, 2338.08, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10549, '090018', '大成新锐产业混合', 2329.86, 108.04, 4.8600, 2221.82, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10550, '121010', '国投瑞银瑞源灵活配置混合', 2416.74, 71.01, 3.0700, 2345.73, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10551, '519702', '交银趋势混合A', 2424.78, 64.16, 2.7100, 2360.62, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10552, '519002', '华安安信消费混合A', 2171.50, 55.31, 2.6100, 2116.19, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10553, '002943', '广发多因子混合', 2428.90, 59.35, 2.5000, 2369.55, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10554, '001718', '工银物流产业股票A', 2256.81, 31.09, 1.3900, 2225.72, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10555, '320021', '诺安双利债券发起', 2349.75, 5.36, 0.2200, 2344.39, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10556, '001694', '华安沪港深外延增长混合', 2064.28, -10.40, -0.5100, 2074.68, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10557, '000991', '工银战略转型股票A', 2232.89, -22.76, -1.0100, 2255.65, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10559, '110011', '易方达优质精选混合(QDII)', 1807.82, -3004.53, -62.4400, 4812.35, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10560, 'HUOQIBAO001', '活期宝', 31989.09, 182.64, 0.5700, 31806.45, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10561, 'TTXJGS01200001', '天天成长1号', 133855.25, 2105.79, 1.6000, 131749.46, '2022-06-11 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10562, '160119', '南方中证500ETF联接(LOF)A', 3167.67, -88.38, -2.7100, 3256.05, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10563, '007873', '华宝科技ETF联接A', 1590.24, -45.86, -2.8000, 1636.10, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10564, '001717', '工银瑞信前沿医疗股票A', 5982.18, -959.02, -13.8200, 6941.20, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10565, '007800', '申万菱信沪深300价值指数C', 0.00, -7.00, 0.0000, 7.00, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10566, '090010', '大成中证红利指数A', 0.00, -14.04, 0.0000, 14.04, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10567, '160716', '嘉实中证锐联基本面50指数(LOF)A', 0.00, -7.72, 0.0000, 7.72, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10568, '003961', '易方达瑞程灵活配置混合A', 2685.08, 218.30, 8.8400, 2466.78, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10569, '519736', '交银新成长混合A(519736)', 2677.29, 139.21, 5.4800, 2538.08, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10570, '002943', '广发多因子混合', 2688.27, 118.72, 4.6200, 2569.55, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10571, '519002', '华安安信消费混合A', 2386.56, 70.37, 3.0300, 2316.19, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10572, '519702', '交银趋势混合A', 2637.12, 76.50, 2.9800, 2560.62, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10575, '090018', '大成新锐产业混合', 2489.23, 67.41, 2.7800, 2421.82, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10576, '001718', '工银物流产业股票A', 2480.88, 55.16, 2.2700, 2425.72, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10577, '001694', '华安沪港深外延增长混合', 2280.83, 6.15, 0.2700, 2274.68, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10578, '320021', '诺安双利债券发起', 2550.63, 6.24, 0.2400, 2544.39, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10579, '000991', '工银战略转型股票A', 2424.17, -31.48, -1.2900, 2455.65, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10580, '110011', '易方达优质精选混合(QDII)', 2000.91, -3011.44, -60.0900, 5012.35, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10581, '121010', '国投瑞银瑞源灵活配置混合', 2613.76, 69.03, 2.7100, 2544.73, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10582, 'HUOQIBAO001', '活期宝', 29598.85, 192.47, 0.6500, 29406.38, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10583, 'TTXJGS01200001', '天天成长1号', 149932.97, 2183.51, 1.4800, 147749.46, '2022-06-18 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10584, '160119', '南方中证500ETF联接(LOF)A', 3298.68, -57.73, -1.7200, 3356.41, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10585, '007873', '华宝科技ETF联接A', 1700.91, -35.55, -2.0500, 1736.46, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10586, '001717', '工银瑞信前沿医疗股票A', 5955.40, -741.23, -11.0700, 6696.63, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10587, '003961', '易方达瑞程灵活配置混合A', 2942.44, 375.66, 14.6300, 2566.78, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10588, '002943', '广发多因子混合', 2982.11, 212.56, 7.6700, 2769.55, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10589, '519736', '交银新成长混合A(519736)', 2944.98, 206.90, 7.5500, 2738.08, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10590, '001718', '工银物流产业股票A', 2744.07, 118.35, 4.5000, 2625.72, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10591, '001694', '华安沪港深外延增长混合', 2577.68, 103.00, 4.1600, 2474.68, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10592, '519002', '华安安信消费混合A', 2620.84, 104.65, 4.1500, 2516.19, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10593, '519702', '交银趋势混合A', 2842.81, 82.19, 2.9700, 2760.62, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10594, '121010', '国投瑞银瑞源灵活配置混合', 2805.43, 60.70, 2.2100, 2744.73, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10595, '320021', '诺安双利债券发起', 2753.81, 9.42, 0.3400, 2744.39, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10596, '000991', '工银战略转型股票A', 2646.80, -8.85, -0.3400, 2655.65, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10597, '090018', '大成新锐产业混合', 2603.77, -18.05, -0.6900, 2621.82, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10598, '110011', '易方达优质精选混合(QDII)', 2255.26, -2957.09, -56.7400, 5212.35, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10599, 'HUOQIBAO001', '活期宝', 27308.86, 203.32, 0.7500, 27105.54, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10600, 'TTXJGS01200001', '天天成长1号', 150014.16, 2264.70, 1.5300, 147749.46, '2022-06-25 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10601, '007873', '华宝科技ETF联接A', 1752.99, 16.53, 0.9500, 1736.46, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10602, '160119', '南方中证500ETF联接(LOF)A', 3337.83, -18.59, -0.5500, 3356.42, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10603, '001717', '工银瑞信前沿医疗股票A', 6003.05, -693.58, -10.3600, 6696.63, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10604, '003961', '易方达瑞程灵活配置混合A', 2844.99, 278.21, 10.8300, 2566.78, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10605, '519736', '交银新成长混合A(519736)', 2979.33, 241.25, 8.8100, 2738.08, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10606, '001694', '华安沪港深外延增长混合', 2648.45, 173.77, 7.0200, 2474.68, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10607, '002943', '广发多因子混合', 2944.90, 175.35, 6.3300, 2769.55, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10608, '519002', '华安安信消费混合A', 2672.62, 156.43, 6.2100, 2516.19, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10609, '519702', '交银趋势混合A', 2883.47, 122.85, 4.4500, 2760.62, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10610, '121010', '国投瑞银瑞源灵活配置混合', 2857.22, 112.49, 4.0900, 2744.73, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10611, '001718', '工银物流产业股票A', 2723.18, 97.46, 3.7100, 2625.72, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10612, '090018', '大成新锐产业混合', 2679.05, 57.23, 2.1800, 2621.82, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10613, '320021', '诺安双利债券发起', 2760.03, 15.64, 0.5700, 2744.39, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10614, '000991', '工银战略转型股票A', 2744.49, 88.84, 3.3400, 2655.65, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10615, '110011', '易方达优质精选混合(QDII)', 2310.83, -2901.52, -55.6700, 5212.35, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10616, 'HUOQIBAO001', '活期宝', 27231.92, 216.80, 0.8000, 27015.12, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10617, 'TTXJGS01200001', '天天成长1号', 150106.94, 2357.48, 1.6000, 147749.46, '2022-07-02 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10618, '007873', '华宝科技ETF联接A', 1733.27, -3.19, -0.1800, 1736.46, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10619, '160119', '南方中证500ETF联接(LOF)A', 3325.10, -31.32, -0.9300, 3356.42, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10620, '001717', '工银瑞信前沿医疗股票A', 6216.62, -480.01, -7.1700, 6696.63, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10621, '003961', '易方达瑞程灵活配置混合A', 3035.88, 369.10, 13.8400, 2666.78, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10622, '519736', '交银新成长混合A(519736)', 3151.62, 213.54, 7.2600, 2938.08, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10623, '001694', '华安沪港深外延增长混合', 2856.89, 182.21, 6.8100, 2674.68, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10624, '519002', '华安安信消费混合A', 2852.64, 136.45, 5.0200, 2716.19, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10625, '002943', '广发多因子混合', 3096.40, 126.85, 4.2700, 2969.55, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10626, '519702', '交银趋势混合A', 2975.51, 114.89, 4.0100, 2860.62, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10627, '121010', '国投瑞银瑞源灵活配置混合', 3055.43, 110.70, 3.7500, 2944.73, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10628, '001718', '工银物流产业股票A', 2924.65, 98.93, 3.5000, 2825.72, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10629, '000991', '工银战略转型股票A', 2902.38, 46.73, 1.6300, 2855.65, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10630, '090018', '大成新锐产业混合', 2852.63, 30.81, 1.0900, 2821.82, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10631, '320021', '诺安双利债券发起', 2958.82, 14.43, 0.4900, 2944.39, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10632, '110011', '易方达优质精选混合(QDII)', 2469.13, -2943.22, -54.3800, 5412.35, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10633, 'HUOQIBAO001', '活期宝', 25130.89, 224.11, 0.9000, 24906.78, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10634, 'TTXJGS01200001', '天天成长1号', 150177.21, 2427.75, 1.6400, 147749.46, '2022-07-09 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10635, '160119', '南方中证500ETF联接(LOF)A', 3227.56, -128.86, -3.8400, 3356.42, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10636, '007873', '华宝科技ETF联接A', 1658.77, -77.69, -4.4700, 1736.46, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10637, '001717', '工银瑞信前沿医疗股票A', 5960.33, -700.44, -11.0000, 6660.77, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10638, '003961', '易方达瑞程灵活配置混合A', 3080.49, 413.71, 15.5100, 2666.78, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10639, '001694', '华安沪港深外延增长混合', 2865.28, 190.60, 7.1200, 2674.68, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10640, '001718', '工银物流产业股票A', 2942.77, 117.05, 4.1400, 2825.72, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10641, '519736', '交银新成长混合A(519736)', 3056.02, 117.94, 4.0100, 2938.08, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10642, '519002', '华安安信消费混合A', 2883.80, 67.61, 2.4800, 2816.19, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10643, '002943', '广发多因子混合', 3131.27, 61.72, 2.0700, 3069.55, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10644, '519702', '交银趋势混合A', 3013.11, 52.49, 1.8300, 2960.62, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10645, '121010', '国投瑞银瑞源灵活配置混合', 3065.06, 20.33, 0.6900, 3044.73, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10646, '320021', '诺安双利债券发起', 3048.82, 4.43, 0.1500, 3044.39, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10647, '000991', '工银战略转型股票A', 2927.98, -27.67, -0.9700, 2955.65, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10648, '090018', '大成新锐产业混合', 2862.63, -59.19, -2.1000, 2921.82, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10649, '110011', '易方达优质精选混合(QDII)', 2457.01, -3055.34, -56.4600, 5512.35, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10650, 'HUOQIBAO001', '活期宝', 23338.62, 231.94, 1.0000, 23106.68, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10651, 'TTXJGS01200001', '天天成长1号', 160258.89, 2509.43, 1.5900, 157749.46, '2022-07-16 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10652, '160119', '南方中证500ETF联接(LOF)A', 3415.78, -79.77, -2.2800, 3495.55, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10653, '007873', '华宝科技ETF联接A', 1811.62, -63.97, -3.4100, 1875.59, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10654, '001717', '工银瑞信前沿医疗股票A', 5501.30, -869.23, -13.6400, 6370.53, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10655, '003961', '易方达瑞程灵活配置混合A', 3060.94, 394.16, 14.7800, 2666.78, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10656, '001694', '华安沪港深外延增长混合', 2847.11, 172.43, 6.4400, 2674.68, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10657, '001718', '工银物流产业股票A', 2965.20, 139.48, 4.9300, 2825.72, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10658, '519736', '交银新成长混合A(519736)', 3073.55, 135.47, 4.6100, 2938.08, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10659, '519702', '交银趋势混合A', 3096.59, 135.62, 4.5100, 2960.97, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10660, '002943', '广发多因子混合', 3208.17, 138.62, 4.5100, 3069.55, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10661, '519002', '华安安信消费混合A', 2877.46, 61.27, 2.1700, 2816.19, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10662, '090018', '大成新锐产业混合', 2947.78, 25.96, 0.8800, 2921.82, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10663, '121010', '国投瑞银瑞源灵活配置混合', 3061.06, 16.33, 0.5300, 3044.73, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10664, '320021', '诺安双利债券发起', 3057.92, 13.53, 0.4400, 3044.39, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10665, '000991', '工银战略转型股票A', 2929.37, -26.28, -0.8900, 2955.65, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10666, '110011', '易方达优质精选混合(QDII)', 2477.33, -3035.02, -55.0600, 5512.35, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10667, 'HUOQIBAO001', '活期宝', 23346.22, 240.62, 1.0400, 23105.60, '2022-07-23 00:00:00');
INSERT INTO `my_fund_detail` (`id`, `fund_code`, `fund_name`, `new_money`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (10668, 'TTXJGS01200001', '天天成长1号', 160354.95, 2605.49, 1.6500, 157749.46, '2022-07-23 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for my_fund_portfolio
-- ----------------------------
DROP TABLE IF EXISTS `my_fund_portfolio`;
CREATE TABLE `my_fund_portfolio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '组合名称',
  `money` decimal(10,2) DEFAULT NULL COMMENT '价值',
  `account_id` int DEFAULT NULL COMMENT '账户id',
  `account_name` varchar(100) DEFAULT NULL COMMENT '账户名称',
  `principal` decimal(10,2) DEFAULT NULL COMMENT '本金',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '盈利',
  `profit_rate` decimal(10,4) DEFAULT NULL COMMENT '收益率',
  `type` tinyint DEFAULT NULL COMMENT '组合类型 0-稳健 1-积极 2-定投',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='基金组合表';

-- ----------------------------
-- Records of my_fund_portfolio
-- ----------------------------
BEGIN;
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (3, '螺丝钉银钉宝365天', 30283.04, 0, '蛋卷平台', 30460.05, -177.01, -0.5800, 0, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (4, '中欧超级股票全明星', 8561.54, 0, '蛋卷平台', 8526.05, 35.49, 0.4200, 1, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (5, '我要稳稳的幸福', 21241.72, 0, '蛋卷平台', 21000.00, 241.72, 1.1500, 0, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (6, '兴全低波动小确幸', 0.00, 0, '蛋卷平台', 0.00, 0.00, 0.0000, 0, '2022-05-14 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (7, '兴全进取派牛基', 0.00, 0, '蛋卷平台', 0.00, 0.00, 0.0000, 1, '2022-05-07 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (8, '赢定投', 0.00, 0, '蛋卷平台', 0.00, 0.00, 0.0000, 1, '2022-05-07 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (9, '为你创金', 0.00, 0, '蛋卷平台', 0.00, 0.00, 0.0000, 1, '2022-03-19 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (10, '工银积极进取', 0.00, 0, '蛋卷平台', 0.00, 0.00, 0.0000, 1, '2022-03-19 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (11, '春华秋实', 39082.00, 1, '且慢平台', 39699.67, -617.67, -1.5600, 0, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (12, '长赢指数投资计划-150', 21303.81, 1, '且慢平台', 22000.00, -696.19, -3.1600, 1, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (13, '长赢指数投资计划-S定投', 19103.16, 1, '且慢平台', 19000.00, 103.16, -0.5400, 1, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (14, '周周同行', 8528.04, 1, '且慢平台', 8791.13, -263.09, -2.9900, 2, '2022-07-23 00:00:00', '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio` (`id`, `name`, `money`, `account_id`, `account_name`, `principal`, `profit`, `profit_rate`, `type`, `update_time`, `create_time`) VALUES (18, '兴证全球进取派优选', 7445.74, 0, '蛋卷平台', 7000.00, 445.74, 6.3700, 1, '2022-07-23 00:00:00', '2022-05-07 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for my_fund_portfolio_detail
-- ----------------------------
DROP TABLE IF EXISTS `my_fund_portfolio_detail`;
CREATE TABLE `my_fund_portfolio_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fund_portfolio_id` int DEFAULT NULL COMMENT '组合id',
  `fund_portfolio_name` varchar(100) DEFAULT NULL COMMENT '基金组合名称',
  `new_assets` decimal(10,2) DEFAULT NULL COMMENT '新资产',
  `profit` decimal(10,2) DEFAULT NULL COMMENT '盈利',
  `profit_rate` decimal(10,4) DEFAULT NULL COMMENT '收益率',
  `principal` decimal(10,2) DEFAULT NULL COMMENT '本金',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组合变动明细';

-- ----------------------------
-- Records of my_fund_portfolio_detail
-- ----------------------------
BEGIN;
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20052, 3, '螺丝钉银钉宝365天', 30449.38, -93.13, -0.3000, 30542.51, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20053, 4, '中欧超级股票全明星', 2053.27, -80.82, -3.7900, 2134.09, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20054, 5, '我要稳稳的幸福', 40355.22, 355.22, 0.8800, 40000.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20055, 6, '兴全低波动小确幸', 20158.25, 158.25, 0.7900, 20000.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20056, 7, '兴全进取派牛基', 1719.60, -80.40, -4.0500, 1800.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20057, 8, '赢定投', 1757.18, -192.82, -9.8000, 1950.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20058, 9, '为你创金', 1281.65, -218.35, -14.4000, 1500.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20060, 10, '工银积极进取', 1894.80, -265.20, -12.5400, 2160.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20062, 12, '长赢指数投资计划-150', 9856.24, -143.76, -1.4400, 10000.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20063, 13, '长赢指数投资计划-S定投', 4253.01, -246.99, -5.4900, 4500.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20064, 14, '周周同行', 3588.92, -211.08, -5.5500, 3800.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20065, 11, '春华秋实', 39763.28, -736.72, -1.8200, 40500.00, '2022-02-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20066, 5, '我要稳稳的幸福', 40428.12, 428.12, 1.0600, 40000.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20067, 6, '兴全低波动小确幸', 20201.90, 201.90, 1.0100, 20000.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20068, 3, '螺丝钉银钉宝365天', 30473.74, -68.77, -0.2300, 30542.51, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20069, 4, '中欧超级股票全明星', 2093.13, -40.96, -1.9200, 2134.09, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20070, 7, '兴全进取派牛基', 1745.04, -54.96, -2.6300, 1800.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20071, 8, '赢定投', 1819.64, -130.36, -6.5900, 1950.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20072, 10, '工银积极进取', 1950.93, -209.07, -9.9500, 2160.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20073, 9, '为你创金', 1331.96, -168.04, -11.0400, 1500.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20074, 11, '春华秋实', 39870.93, -629.07, -1.5500, 40500.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20075, 12, '长赢指数投资计划-150', 10305.68, -194.32, -1.8500, 10500.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20076, 13, '长赢指数投资计划-S定投', 4219.05, -280.95, -6.2400, 4500.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20077, 14, '周周同行', 3824.04, -175.96, -4.4000, 4000.00, '2022-02-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20078, 5, '我要稳稳的幸福', 40400.59, 400.59, 0.9900, 40000.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20079, 6, '兴全低波动小确幸', 20212.28, 212.28, 1.0600, 20000.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20080, 3, '螺丝钉银钉宝365天', 30354.76, -187.75, -0.6100, 30542.51, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20081, 4, '中欧超级股票全明星', 3100.05, -34.04, -1.0900, 3134.09, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20082, 7, '兴全进取派牛基', 1751.04, -48.96, -2.2900, 1800.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20083, 8, '赢定投', 1834.69, -115.31, -5.8200, 1950.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20084, 10, '工银积极进取', 1955.47, -204.53, -9.7400, 2160.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20085, 9, '为你创金', 1350.07, -149.93, -9.8300, 1500.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20086, 11, '春华秋实', 39916.69, -583.31, -1.4400, 40500.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20087, 12, '长赢指数投资计划-150', 9741.60, -758.40, -7.2200, 10500.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20088, 13, '长赢指数投资计划-S定投', 3954.80, -545.20, -12.1200, 4500.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20089, 14, '周周同行', 4008.91, -191.09, -4.5500, 4200.00, '2022-02-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20090, 11, '春华秋实', 39547.51, -952.49, -2.3500, 40500.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20091, 14, '周周同行', 4135.94, -264.06, -6.0000, 4400.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20092, 12, '长赢指数投资计划-150', 9516.42, -983.58, -9.3700, 10500.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20093, 13, '长赢指数投资计划-S定投', 3807.75, -692.25, -15.3800, 4500.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20095, 5, '我要稳稳的幸福', 40317.92, 317.92, 0.7800, 40000.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20096, 6, '兴全低波动小确幸', 20130.83, 130.83, 0.6500, 20000.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20097, 7, '兴全进取派牛基', 1708.28, -91.72, -4.6800, 1800.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20098, 8, '赢定投', 1802.54, -147.46, -7.4700, 1950.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20099, 9, '为你创金', 1310.32, -189.68, -12.4900, 1500.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20100, 10, '工银积极进取', 1910.35, -249.65, -11.8200, 2160.00, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20102, 3, '螺丝钉银钉宝365天', 30260.21, -282.30, -0.9200, 30542.51, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20103, 4, '中欧超级股票全明星', 3020.87, -113.22, -3.6100, 3134.09, '2022-03-05 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20104, 5, '我要稳稳的幸福', 40059.54, 59.54, 0.1400, 40000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20105, 6, '兴全低波动小确幸', 19980.26, -19.74, -0.1000, 20000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20106, 7, '兴全进取派牛基', 1626.59, -173.41, -9.2400, 1800.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20107, 8, '赢定投', 1747.11, -202.89, -10.3100, 1950.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20108, 9, '为你创金', 1133.30, -241.12, -15.9000, 1374.42, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20109, 10, '工银积极进取', 1863.51, -296.49, -13.9900, 2160.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20110, 4, '中欧超级股票全明星', 2904.65, -229.44, -7.3200, 3134.09, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20111, 3, '螺丝钉银钉宝365天', 29961.48, -581.03, -1.9000, 30542.51, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20112, 11, '春华秋实', 39074.08, -1425.92, -3.5200, 40500.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20113, 12, '长赢指数投资计划-150', 10382.31, -1617.69, -13.4800, 12000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20114, 13, '长赢指数投资计划-S定投', 3993.80, -1006.20, -20.1200, 5000.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20115, 14, '周周同行', 4134.78, -465.22, -10.1100, 4600.00, '2022-03-12 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20116, 5, '我要稳稳的幸福', 40002.03, 2.03, -0.0100, 40000.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20117, 6, '兴全低波动小确幸', 19960.21, -39.79, -0.2000, 20000.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20118, 3, '螺丝钉银钉宝365天', 29935.01, -607.50, -1.9900, 30542.51, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20119, 4, '中欧超级股票全明星', 2880.22, -215.65, -6.9700, 3095.87, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20120, 7, '兴全进取派牛基', 1607.44, -192.56, -10.3100, 1800.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20121, 8, '赢定投', 1716.97, -233.03, -11.8600, 1950.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20122, 10, '工银积极进取', 0.00, 0.00, 0.0000, 0.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20123, 9, '为你创金', 0.00, 0.00, 0.0000, 0.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20124, 11, '春华秋实', 38762.22, -1737.78, -4.2900, 40500.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20125, 14, '周周同行', 4312.97, -487.03, -10.1500, 4800.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20126, 12, '长赢指数投资计划-150', 12151.10, -1348.90, -10.7900, 13500.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20127, 13, '长赢指数投资计划-S定投', 5692.75, -807.25, -14.6800, 6500.00, '2022-03-19 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20128, 5, '我要稳稳的幸福', 39935.37, -64.63, -0.1700, 40000.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20129, 6, '兴全低波动小确幸', 19896.30, -103.70, -0.5200, 20000.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20130, 7, '兴全进取派牛基', 1562.43, -237.57, -12.8200, 1800.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20131, 8, '赢定投', 1695.68, -254.32, -12.9500, 1950.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20132, 4, '中欧超级股票全明星', 3813.60, -320.49, -6.8900, 4134.09, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20133, 3, '螺丝钉银钉宝365天', 29825.21, -717.30, -2.3500, 30542.51, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20134, 11, '春华秋实', 38682.59, -1817.41, -4.4900, 40500.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20135, 14, '周周同行', 4473.51, -526.49, -10.5300, 5000.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20136, 12, '长赢指数投资计划-150', 12127.56, -1372.44, -10.1700, 13500.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20137, 13, '长赢指数投资计划-S定投', 5689.96, -810.04, -12.4600, 6500.00, '2022-03-26 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20138, 5, '我要稳稳的幸福', 40050.22, 52.19, 0.1200, 39998.03, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20139, 6, '兴全低波动小确幸', 19944.02, -55.98, -0.2800, 20000.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20140, 3, '螺丝钉银钉宝365天', 30011.69, -450.47, -1.6600, 30462.16, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20141, 4, '中欧超级股票全明星', 3834.63, -245.75, -6.0000, 4080.38, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20142, 7, '兴全进取派牛基', 1570.95, -229.05, -12.3400, 1800.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20143, 8, '赢定投', 1722.23, -227.77, -11.5900, 1950.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20144, 11, '春华秋实', 38839.27, -1660.73, -4.1000, 40500.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20145, 12, '长赢指数投资计划-150', 12387.71, -1112.29, -8.2400, 13500.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20146, 13, '长赢指数投资计划-S定投', 5771.32, -728.68, -11.2100, 6500.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20147, 14, '周周同行', 4734.05, -465.95, -8.9600, 5200.00, '2022-04-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20148, 5, '我要稳稳的幸福', 40041.03, 41.03, 0.0900, 40000.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20149, 6, '兴全低波动小确幸', 19885.84, -114.16, -0.5700, 20000.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20150, 3, '螺丝钉银钉宝365天', 30017.16, -525.35, -1.4500, 30542.51, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20151, 4, '中欧超级股票全明星', 3736.17, -397.92, -8.7800, 4134.09, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20152, 8, '赢定投', 1682.68, -267.32, -13.6200, 1950.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20153, 7, '兴全进取派牛基', 1522.88, -277.12, -15.0200, 1800.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20155, 12, '长赢指数投资计划-150', 12143.05, -1356.96, -10.0500, 13500.01, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20156, 13, '长赢指数投资计划-S定投', 6675.85, -824.15, -12.6800, 7500.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20157, 14, '周周同行', 4671.20, -528.80, -10.1700, 5200.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20158, 11, '春华秋实', 38599.03, -1900.97, -4.6900, 40500.00, '2022-04-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20159, 5, '我要稳稳的幸福', 39967.05, -29.40, -0.0900, 39996.45, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20160, 6, '兴全低波动小确幸', 19840.67, -159.33, -0.8000, 20000.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20161, 8, '赢定投', 1686.51, -263.49, -13.4200, 1950.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20162, 7, '兴全进取派牛基', 1489.16, -310.84, -16.9100, 1800.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20163, 4, '中欧超级股票全明星', 3644.42, -489.79, -11.0300, 4134.21, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20164, 3, '螺丝钉银钉宝365天', 30005.96, -537.55, -1.4900, 30543.51, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20165, 11, '春华秋实', 38356.78, -2143.22, -5.2900, 40500.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20166, 12, '长赢指数投资计划-150', 12823.98, -1676.02, -11.5600, 14500.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20167, 13, '长赢指数投资计划-S定投', 7059.98, -940.02, -11.7500, 8000.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20168, 14, '周周同行', 4773.44, -626.56, -11.6000, 5400.00, '2022-04-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20169, 5, '我要稳稳的幸福', 39843.09, -156.91, -0.4000, 40000.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20170, 6, '兴全低波动小确幸', 19750.19, -249.81, -1.2500, 20000.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20171, 3, '螺丝钉银钉宝365天', 29789.22, -670.83, -2.2000, 30460.05, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20172, 4, '中欧超级股票全明星', 3502.72, -593.15, -14.4800, 4095.87, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20173, 8, '赢定投', 1620.99, -329.01, -16.7900, 1950.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20174, 7, '兴全进取派牛基', 1435.23, -364.77, -19.9200, 1800.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20175, 11, '春华秋实', 38015.63, -2484.37, -6.1300, 40500.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20176, 12, '长赢指数投资计划-150', 12733.29, -2266.71, -15.6300, 15000.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20177, 13, '长赢指数投资计划-S定投', 6712.55, -1287.45, -16.0900, 8000.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20178, 14, '周周同行', 4812.06, -787.94, -14.0700, 5600.00, '2022-04-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20179, 5, '我要稳稳的幸福', 39973.44, -52.18, -0.1400, 40025.62, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20180, 6, '兴全低波动小确幸', 19789.79, -210.21, -1.0500, 20000.00, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20181, 3, '螺丝钉银钉宝365天', 29839.62, -716.20, -2.0800, 30555.82, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20182, 4, '中欧超级股票全明星', 4641.28, -555.40, -10.1500, 5196.68, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20183, 8, '赢定投', 1661.09, -288.91, -14.7300, 1950.00, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20184, 7, '兴全进取派牛基', 1452.68, -347.32, -18.9400, 1800.00, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20186, 11, '春华秋实', 36620.52, -2259.24, -5.8100, 38879.76, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20187, 12, '长赢指数投资计划-150', 15712.48, -1787.52, -10.2100, 17500.00, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20188, 13, '长赢指数投资计划-S定投', 9617.99, -882.01, -8.4000, 10500.00, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20189, 14, '周周同行', 5074.62, -725.38, -12.5100, 5800.00, '2022-04-30 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20190, 5, '我要稳稳的幸福', 0.00, 0.00, 0.0000, 0.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20192, 6, '兴全低波动小确幸', 2469.30, -223.89, -1.2300, 2693.19, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20193, 3, '螺丝钉银钉宝365天', 29719.34, -740.70, -2.4300, 30460.04, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20194, 4, '中欧超级股票全明星', 4550.85, -545.02, -10.7000, 5095.87, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20195, 5, '我要稳稳的幸福', 10000.00, 0.00, 0.0000, 10000.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20196, 18, '兴证全球进取派优选', 2000.00, 0.00, 0.0000, 2000.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20197, 11, '春华秋实', 35534.91, -2284.61, -6.0400, 37819.52, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20198, 13, '长赢指数投资计划-S定投', 10820.00, -1172.00, -11.1600, 11992.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20199, 12, '长赢指数投资计划-150', 15266.63, -2233.38, -12.7600, 17500.01, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20200, 14, '周周同行', 5014.81, -785.19, -13.5400, 5800.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20201, 7, '兴全进取派牛基', 0.00, 0.00, 0.0000, 0.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20202, 8, '赢定投', 0.00, 0.00, 0.0000, 0.00, '2022-05-07 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20203, 5, '我要稳稳的幸福', 10045.06, 45.06, 0.4500, 10000.00, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20204, 18, '兴证全球进取派优选', 2067.93, 67.93, 3.4000, 2000.00, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20205, 6, '兴全低波动小确幸', 0.00, 0.00, 0.0000, 0.00, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20206, 4, '中欧超级股票全明星', 4716.25, -417.84, -7.4500, 5134.09, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20207, 3, '螺丝钉银钉宝365天', 29876.42, -583.62, -1.9200, 30460.04, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20208, 11, '春华秋实', 33842.42, -1857.25, -5.2000, 35699.67, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20209, 12, '长赢指数投资计划-150', 15479.36, -2020.64, -11.5500, 17500.00, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20210, 13, '长赢指数投资计划-S定投', 11018.99, -981.01, -8.1800, 12000.00, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20211, 14, '周周同行', 5330.12, -669.88, -11.1600, 6000.00, '2022-05-14 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20212, 18, '兴证全球进取派优选', 2121.19, 121.19, 6.0600, 2000.00, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20213, 5, '我要稳稳的幸福', 10071.02, 71.02, 0.7100, 10000.00, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20214, 3, '螺丝钉银钉宝365天', 30022.49, -437.56, -1.4400, 30460.05, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20215, 4, '中欧超级股票全明星', 4819.77, -276.10, -5.4200, 5095.87, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20216, 11, '春华秋实', 34149.02, -1550.65, -4.3400, 35699.67, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20217, 13, '长赢指数投资计划-S定投', 11775.38, -724.62, -5.8000, 12500.00, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20218, 12, '长赢指数投资计划-150', 15846.22, -1653.78, -9.4500, 17500.00, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20219, 14, '周周同行', 5667.45, -532.55, -8.5900, 6200.00, '2022-05-21 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20220, 18, '兴证全球进取派优选', 3100.74, 100.74, 3.3600, 3000.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20221, 5, '我要稳稳的幸福', 12062.39, 62.39, 0.5200, 12000.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20222, 3, '螺丝钉银钉宝365天', 29962.45, -497.60, -1.6300, 30460.05, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20223, 4, '中欧超级股票全明星', 5235.44, -360.43, -6.4400, 5595.87, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20224, 11, '春华秋实', 34241.09, -1658.59, -4.6200, 35899.68, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20225, 12, '长赢指数投资计划-150', 16714.20, -1785.80, -9.6500, 18500.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20226, 13, '长赢指数投资计划-S定投', 13615.08, -884.92, -6.5500, 14500.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20227, 14, '周周同行', 5888.17, -611.83, -9.4100, 6500.00, '2022-05-28 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20228, 18, '兴证全球进取派优选', 4291.15, 291.15, 7.2800, 4000.00, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20229, 5, '我要稳稳的幸福', 14135.96, 135.96, 0.9700, 14000.00, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20230, 3, '螺丝钉银钉宝365天', 30202.72, -252.32, -0.8400, 30455.04, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20231, 4, '中欧超级股票全明星', 6062.56, 36.51, 0.6100, 6026.05, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20232, 11, '春华秋实', 35504.78, -1194.89, -3.2600, 36699.67, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20233, 13, '长赢指数投资计划-S定投', 16691.73, 191.73, 1.2000, 16500.00, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20234, 12, '长赢指数投资计划-150', 20033.58, -466.42, -2.3300, 20500.00, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20235, 14, '周周同行', 6764.40, -235.60, -3.3700, 7000.00, '2022-06-11 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20236, 5, '我要稳稳的幸福', 15168.18, 168.18, 1.1200, 15000.00, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20237, 18, '兴证全球进取派优选', 4336.17, 336.17, 8.4000, 4000.00, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20238, 4, '中欧超级股票全明星', 6078.36, 52.31, 0.8700, 6026.05, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20239, 3, '螺丝钉银钉宝365天', 30285.22, -174.82, -0.5700, 30460.04, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20240, 13, '长赢指数投资计划-S定投', 17677.07, 177.07, 1.0100, 17500.00, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20241, 12, '长赢指数投资计划-150', 19840.17, -659.83, -3.2200, 20500.00, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20242, 11, '春华秋实', 36698.35, -1001.33, -2.6600, 37699.68, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20243, 14, '周周同行', 7057.05, -242.95, -3.3300, 7300.00, '2022-06-18 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20244, 18, '兴证全球进取派优选', 5445.54, 445.54, 8.9100, 5000.00, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20245, 5, '我要稳稳的幸福', 18214.04, 214.04, 1.1900, 18000.00, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20246, 4, '中欧超级股票全明星', 7233.70, 207.65, 2.9600, 7026.05, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20247, 3, '螺丝钉银钉宝365天', 30374.15, -85.89, -0.2800, 30460.04, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20248, 13, '长赢指数投资计划-S定投', 18133.76, 633.76, 3.6200, 17500.00, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20249, 12, '长赢指数投资计划-150', 20828.73, -171.27, -0.8200, 21000.00, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20250, 11, '春华秋实', 38013.78, -685.90, -1.7700, 38699.68, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20251, 14, '周周同行', 7440.37, -159.63, -2.1000, 7600.00, '2022-06-25 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20252, 18, '兴证全球进取派优选', 5513.48, 513.48, 10.2700, 5000.00, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20253, 5, '我要稳稳的幸福', 18259.40, 259.40, 1.4400, 18000.00, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20254, 4, '中欧超级股票全明星', 7296.48, 280.34, 3.9900, 7016.14, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20255, 3, '螺丝钉银钉宝365天', 30504.43, 46.60, 0.1500, 30457.83, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20256, 13, '长赢指数投资计划-S定投', 18876.41, 876.41, 5.0100, 18000.00, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20257, 12, '长赢指数投资计划-150', 21532.95, 32.95, 0.1600, 21500.00, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20258, 11, '春华秋实', 38188.05, -511.63, -1.3200, 38699.68, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20259, 14, '周周同行', 7880.67, -19.33, -0.2400, 7900.00, '2022-07-02 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20260, 18, '兴证全球进取派优选', 6486.01, 486.01, 8.1000, 6000.00, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20261, 5, '我要稳稳的幸福', 20235.91, 235.91, 1.1800, 20000.00, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20262, 4, '中欧超级股票全明星', 8250.47, 224.41, 2.8000, 8026.06, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20263, 3, '螺丝钉银钉宝365天', 30388.36, -71.68, -0.2400, 30460.04, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20264, 11, '春华秋实', 39128.15, -571.52, -1.4400, 39699.67, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20265, 14, '周周同行', 8095.48, -104.52, -1.2700, 8200.00, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20266, 12, '长赢指数投资计划-150', 21502.57, 2.57, 0.0100, 21500.00, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20267, 13, '长赢指数投资计划-S定投', 19800.06, 800.06, 4.2100, 19000.00, '2022-07-09 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20268, 18, '兴证全球进取派优选', 7368.82, 368.82, 5.2700, 7000.00, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20269, 5, '我要稳稳的幸福', 21189.88, 189.88, 0.9000, 21000.00, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20270, 4, '中欧超级股票全明星', 8534.17, 8.11, 0.1000, 8526.06, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20271, 3, '螺丝钉银钉宝365天', 30224.09, -235.96, -0.7700, 30460.05, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20272, 12, '长赢指数投资计划-150', 20959.21, -1040.79, -4.7300, 22000.00, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20273, 13, '长赢指数投资计划-S定投', 18844.72, -155.27, -0.8200, 18999.99, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20274, 11, '春华秋实', 38987.38, -712.30, -1.7900, 39699.68, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20275, 14, '周周同行', 8152.38, -338.75, -3.9900, 8491.13, '2022-07-16 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20276, 18, '兴证全球进取派优选', 7445.74, 445.74, 6.3700, 7000.00, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20277, 5, '我要稳稳的幸福', 21241.72, 241.72, 1.1500, 21000.00, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20278, 4, '中欧超级股票全明星', 8561.54, 35.49, 0.4200, 8526.05, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20279, 3, '螺丝钉银钉宝365天', 30283.04, -177.01, -0.5800, 30460.05, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20280, 13, '长赢指数投资计划-S定投', 19103.16, 103.16, -0.5400, 19000.00, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20281, 11, '春华秋实', 39082.00, -617.67, -1.5600, 39699.67, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20282, 14, '周周同行', 8528.04, -263.09, -2.9900, 8791.13, '2022-07-23 00:00:00');
INSERT INTO `my_fund_portfolio_detail` (`id`, `fund_portfolio_id`, `fund_portfolio_name`, `new_assets`, `profit`, `profit_rate`, `principal`, `create_time`) VALUES (20283, 12, '长赢指数投资计划-150', 21303.81, -696.19, -3.1600, 22000.00, '2022-07-23 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for my_invest_account
-- ----------------------------
DROP TABLE IF EXISTS `my_invest_account`;
CREATE TABLE `my_invest_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '账户名称',
  `total_money` decimal(10,4) DEFAULT NULL COMMENT '账户总资产',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投资账户表';

-- ----------------------------
-- Records of my_invest_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for my_roles
-- ----------------------------
DROP TABLE IF EXISTS `my_roles`;
CREATE TABLE `my_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL COMMENT '权限代码',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';

-- ----------------------------
-- Records of my_roles
-- ----------------------------
BEGIN;
INSERT INTO `my_roles` (`id`, `name`, `code`, `create_time`) VALUES (1, '张三', 'admin', '2021-12-18 16:38:08');
COMMIT;

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of my_user
-- ----------------------------
BEGIN;
INSERT INTO `my_user` (`id`, `username`, `password`, `create_time`) VALUES (1, 'maze', 'cc8c87fe58258ed145fbe3c17d81bb99', '2021-12-18 16:15:05');
COMMIT;

-- ----------------------------
-- Table structure for my_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `my_user_roles`;
CREATE TABLE `my_user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL,
  `role_id` int DEFAULT NULL COMMENT '权限id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';

-- ----------------------------
-- Records of my_user_roles
-- ----------------------------
BEGIN;
INSERT INTO `my_user_roles` (`id`, `user_id`, `user_name`, `role_id`, `create_time`) VALUES (1, 1, 'maze', 1, '2021-12-18 16:37:42');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
