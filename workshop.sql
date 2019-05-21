/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : workshop

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 21/05/2019 22:42:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `equipment_id` int(11) NOT NULL COMMENT '主键ID',
  `enqipment_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `workshop_id` int(11) NULL DEFAULT NULL COMMENT '工作车间号，外键',
  `model` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `user_id` int(12) NULL DEFAULT NULL COMMENT '负责人，外键',
  `order_date` date NULL DEFAULT NULL COMMENT '采购时间',
  `exfactory_date` date NULL DEFAULT NULL COMMENT '出厂时间',
  PRIMARY KEY (`equipment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `workshop_id`(`workshop_id`) USING BTREE,
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`workshop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (1, '201', 1, '20175632', 1, '2019-05-20', '2019-05-19');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, '管理员');
INSERT INTO `role` VALUES (1, '生产员');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `employee_number` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `role` int(255) NULL DEFAULT NULL COMMENT '角色，0为管理，1为生产人员',
  `hire_date` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `workshop_id` int(11) NULL DEFAULT NULL COMMENT '工作车间',
  `mac` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mac地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role`(`role`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '哈哈', '123456', '20171234', '15896548526', 1, '2019-05-08 21:19:35', 1, '1568452');
INSERT INTO `user` VALUES (3, 'admin', '777', '20171234', '15896556522', 1, NULL, 1, '1568452');

-- ----------------------------
-- Table structure for workshop
-- ----------------------------
DROP TABLE IF EXISTS `workshop`;
CREATE TABLE `workshop`  (
  `workshop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `workshop_number` int(11) NULL DEFAULT NULL COMMENT '车间号',
  PRIMARY KEY (`workshop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workshop
-- ----------------------------
INSERT INTO `workshop` VALUES (1, 101);
INSERT INTO `workshop` VALUES (2, 202);
INSERT INTO `workshop` VALUES (6, 555);

SET FOREIGN_KEY_CHECKS = 1;
