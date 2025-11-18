/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 90500 (9.5.0)
 Source Host           : localhost:3306
 Source Schema         : tecfix

 Target Server Type    : MySQL
 Target Server Version : 90500 (9.5.0)
 File Encoding         : 65001

 Date: 17/11/2025 19:04:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carrito
-- ----------------------------
DROP TABLE IF EXISTS `carrito`;
CREATE TABLE `carrito`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actualizado` datetime(6) NULL DEFAULT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKkg5h8ejijsgwfr68aoggh4l8m`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `FKkg5h8ejijsgwfr68aoggh4l8m` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carrito
-- ----------------------------

-- ----------------------------
-- Table structure for carrito_items
-- ----------------------------
DROP TABLE IF EXISTS `carrito_items`;
CREATE TABLE `carrito_items`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `id_carrito` bigint NOT NULL,
  `id_producto` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKcc218gq624lg8gjolv5g7lgic`(`id_carrito` ASC) USING BTREE,
  INDEX `FKnl3cynhq3tkm9urlflr505bb3`(`id_producto` ASC) USING BTREE,
  CONSTRAINT `FKcc218gq624lg8gjolv5g7lgic` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnl3cynhq3tkm9urlflr505bb3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carrito_items
-- ----------------------------

-- ----------------------------
-- Table structure for compra_detalles
-- ----------------------------
DROP TABLE IF EXISTS `compra_detalles`;
CREATE TABLE `compra_detalles`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `id_compra` bigint NOT NULL,
  `id_producto` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK50kr7uaexdinxq683hnigplom`(`id_compra` ASC) USING BTREE,
  INDEX `FKqpx4fnwj1cdqc5uju2ymq22fk`(`id_producto` ASC) USING BTREE,
  CONSTRAINT `FK50kr7uaexdinxq683hnigplom` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqpx4fnwj1cdqc5uju2ymq22fk` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of compra_detalles
-- ----------------------------
INSERT INTO `compra_detalles` VALUES (1, 1, 480, 38, 173);
INSERT INTO `compra_detalles` VALUES (2, 9, 216, 24, 24);
INSERT INTO `compra_detalles` VALUES (3, 9, 3933, 8, 30);
INSERT INTO `compra_detalles` VALUES (4, 10, 4210, 35, 96);
INSERT INTO `compra_detalles` VALUES (5, 9, 6345, 3, 90);
INSERT INTO `compra_detalles` VALUES (6, 2, 1900, 12, 123);
INSERT INTO `compra_detalles` VALUES (7, 9, 5031, 21, 188);
INSERT INTO `compra_detalles` VALUES (8, 4, 824, 21, 171);
INSERT INTO `compra_detalles` VALUES (9, 7, 2758, 18, 89);
INSERT INTO `compra_detalles` VALUES (10, 6, 4422, 11, 49);
INSERT INTO `compra_detalles` VALUES (11, 3, 2211, 35, 49);
INSERT INTO `compra_detalles` VALUES (12, 7, 4515, 40, 118);
INSERT INTO `compra_detalles` VALUES (13, 2, 1204, 21, 152);
INSERT INTO `compra_detalles` VALUES (14, 8, 2672, 13, 200);
INSERT INTO `compra_detalles` VALUES (15, 2, 272, 43, 72);
INSERT INTO `compra_detalles` VALUES (16, 9, 2340, 40, 138);
INSERT INTO `compra_detalles` VALUES (17, 3, 72, 17, 24);
INSERT INTO `compra_detalles` VALUES (18, 6, 1416, 6, 31);
INSERT INTO `compra_detalles` VALUES (19, 1, 437, 30, 30);
INSERT INTO `compra_detalles` VALUES (20, 10, 9900, 11, 10);
INSERT INTO `compra_detalles` VALUES (21, 5, 2700, 17, 181);
INSERT INTO `compra_detalles` VALUES (22, 10, 7310, 27, 185);
INSERT INTO `compra_detalles` VALUES (23, 3, 390, 16, 47);
INSERT INTO `compra_detalles` VALUES (24, 10, 6140, 46, 131);
INSERT INTO `compra_detalles` VALUES (25, 8, 7400, 17, 81);
INSERT INTO `compra_detalles` VALUES (26, 5, 4480, 45, 127);
INSERT INTO `compra_detalles` VALUES (27, 4, 1612, 44, 164);
INSERT INTO `compra_detalles` VALUES (28, 7, 3283, 50, 132);
INSERT INTO `compra_detalles` VALUES (29, 2, 788, 12, 89);
INSERT INTO `compra_detalles` VALUES (30, 6, 546, 17, 5);
INSERT INTO `compra_detalles` VALUES (31, 3, 2301, 6, 77);
INSERT INTO `compra_detalles` VALUES (32, 9, 7416, 28, 168);
INSERT INTO `compra_detalles` VALUES (33, 2, 800, 50, 104);
INSERT INTO `compra_detalles` VALUES (34, 10, 6910, 2, 167);
INSERT INTO `compra_detalles` VALUES (35, 10, 5690, 22, 62);
INSERT INTO `compra_detalles` VALUES (36, 8, 5320, 22, 32);
INSERT INTO `compra_detalles` VALUES (37, 3, 1869, 38, 199);
INSERT INTO `compra_detalles` VALUES (38, 7, 4508, 50, 187);
INSERT INTO `compra_detalles` VALUES (39, 7, 3465, 30, 196);
INSERT INTO `compra_detalles` VALUES (40, 6, 5628, 48, 197);
INSERT INTO `compra_detalles` VALUES (41, 8, 2816, 46, 155);
INSERT INTO `compra_detalles` VALUES (42, 2, 344, 24, 3);
INSERT INTO `compra_detalles` VALUES (43, 5, 2885, 36, 86);
INSERT INTO `compra_detalles` VALUES (44, 1, 983, 32, 148);
INSERT INTO `compra_detalles` VALUES (45, 2, 1272, 24, 154);
INSERT INTO `compra_detalles` VALUES (46, 5, 2295, 16, 94);
INSERT INTO `compra_detalles` VALUES (47, 3, 528, 14, 189);
INSERT INTO `compra_detalles` VALUES (48, 5, 2860, 30, 71);
INSERT INTO `compra_detalles` VALUES (49, 8, 6552, 14, 186);
INSERT INTO `compra_detalles` VALUES (50, 4, 2344, 17, 112);
INSERT INTO `compra_detalles` VALUES (51, 2, 806, 24, 164);
INSERT INTO `compra_detalles` VALUES (52, 9, 2268, 38, 180);
INSERT INTO `compra_detalles` VALUES (53, 4, 2344, 14, 112);
INSERT INTO `compra_detalles` VALUES (54, 9, 5625, 42, 92);
INSERT INTO `compra_detalles` VALUES (55, 8, 4472, 32, 188);
INSERT INTO `compra_detalles` VALUES (56, 9, 5940, 42, 145);
INSERT INTO `compra_detalles` VALUES (57, 6, 780, 23, 47);
INSERT INTO `compra_detalles` VALUES (58, 4, 2308, 20, 86);
INSERT INTO `compra_detalles` VALUES (59, 8, 1208, 11, 22);
INSERT INTO `compra_detalles` VALUES (60, 9, 3942, 34, 8);
INSERT INTO `compra_detalles` VALUES (61, 9, 5769, 40, 29);
INSERT INTO `compra_detalles` VALUES (62, 9, 1665, 50, 192);
INSERT INTO `compra_detalles` VALUES (63, 9, 7767, 26, 42);
INSERT INTO `compra_detalles` VALUES (64, 5, 1845, 49, 198);
INSERT INTO `compra_detalles` VALUES (65, 4, 3484, 27, 1);
INSERT INTO `compra_detalles` VALUES (66, 8, 6856, 10, 193);
INSERT INTO `compra_detalles` VALUES (67, 4, 944, 42, 31);
INSERT INTO `compra_detalles` VALUES (68, 8, 5800, 21, 124);
INSERT INTO `compra_detalles` VALUES (69, 10, 6700, 31, 15);
INSERT INTO `compra_detalles` VALUES (70, 8, 5640, 50, 90);
INSERT INTO `compra_detalles` VALUES (71, 7, 6811, 25, 40);
INSERT INTO `compra_detalles` VALUES (72, 6, 3702, 11, 135);
INSERT INTO `compra_detalles` VALUES (73, 1, 437, 46, 30);
INSERT INTO `compra_detalles` VALUES (74, 7, 49, 10, 129);
INSERT INTO `compra_detalles` VALUES (75, 8, 2080, 39, 138);
INSERT INTO `compra_detalles` VALUES (76, 3, 2739, 16, 120);
INSERT INTO `compra_detalles` VALUES (77, 6, 4800, 21, 18);
INSERT INTO `compra_detalles` VALUES (78, 9, 522, 35, 109);
INSERT INTO `compra_detalles` VALUES (79, 7, 3283, 13, 66);
INSERT INTO `compra_detalles` VALUES (80, 4, 3584, 45, 127);
INSERT INTO `compra_detalles` VALUES (81, 3, 1182, 43, 89);
INSERT INTO `compra_detalles` VALUES (82, 1, 540, 7, 181);
INSERT INTO `compra_detalles` VALUES (83, 7, 1071, 4, 69);
INSERT INTO `compra_detalles` VALUES (84, 5, 2785, 6, 83);
INSERT INTO `compra_detalles` VALUES (85, 8, 7696, 33, 178);
INSERT INTO `compra_detalles` VALUES (86, 7, 1246, 16, 140);
INSERT INTO `compra_detalles` VALUES (87, 9, 1206, 41, 107);
INSERT INTO `compra_detalles` VALUES (88, 2, 180, 27, 101);
INSERT INTO `compra_detalles` VALUES (89, 8, 5280, 21, 145);
INSERT INTO `compra_detalles` VALUES (90, 4, 920, 10, 58);
INSERT INTO `compra_detalles` VALUES (91, 5, 2140, 39, 4);
INSERT INTO `compra_detalles` VALUES (92, 1, 564, 28, 121);
INSERT INTO `compra_detalles` VALUES (93, 10, 7630, 26, 146);
INSERT INTO `compra_detalles` VALUES (94, 3, 627, 2, 169);
INSERT INTO `compra_detalles` VALUES (95, 8, 7696, 22, 178);
INSERT INTO `compra_detalles` VALUES (96, 2, 1360, 36, 50);
INSERT INTO `compra_detalles` VALUES (97, 8, 6752, 6, 64);
INSERT INTO `compra_detalles` VALUES (98, 4, 2880, 41, 117);
INSERT INTO `compra_detalles` VALUES (99, 9, 3915, 50, 134);
INSERT INTO `compra_detalles` VALUES (100, 7, 3045, 21, 134);
INSERT INTO `compra_detalles` VALUES (101, 4, 1600, 38, 104);
INSERT INTO `compra_detalles` VALUES (102, 2, 918, 5, 94);
INSERT INTO `compra_detalles` VALUES (103, 3, 2640, 5, 157);
INSERT INTO `compra_detalles` VALUES (104, 3, 2013, 16, 162);
INSERT INTO `compra_detalles` VALUES (105, 1, 301, 32, 80);
INSERT INTO `compra_detalles` VALUES (106, 7, 1071, 33, 69);
INSERT INTO `compra_detalles` VALUES (107, 3, 219, 14, 33);
INSERT INTO `compra_detalles` VALUES (108, 7, 1204, 10, 3);
INSERT INTO `compra_detalles` VALUES (109, 5, 670, 34, 107);
INSERT INTO `compra_detalles` VALUES (110, 6, 3564, 28, 119);
INSERT INTO `compra_detalles` VALUES (111, 3, 2049, 2, 12);
INSERT INTO `compra_detalles` VALUES (112, 1, 485, 3, 2);
INSERT INTO `compra_detalles` VALUES (113, 7, 2548, 24, 115);
INSERT INTO `compra_detalles` VALUES (114, 2, 1114, 15, 83);
INSERT INTO `compra_detalles` VALUES (115, 4, 3052, 45, 146);
INSERT INTO `compra_detalles` VALUES (116, 6, 1440, 9, 14);
INSERT INTO `compra_detalles` VALUES (117, 4, 1040, 24, 138);
INSERT INTO `compra_detalles` VALUES (118, 4, 960, 39, 14);
INSERT INTO `compra_detalles` VALUES (119, 8, 5128, 44, 29);
INSERT INTO `compra_detalles` VALUES (120, 6, 3462, 43, 86);
INSERT INTO `compra_detalles` VALUES (121, 4, 692, 4, 98);
INSERT INTO `compra_detalles` VALUES (122, 10, 2630, 9, 79);
INSERT INTO `compra_detalles` VALUES (123, 5, 2200, 28, 88);
INSERT INTO `compra_detalles` VALUES (124, 3, 558, 29, 53);
INSERT INTO `compra_detalles` VALUES (125, 2, 1932, 7, 97);
INSERT INTO `compra_detalles` VALUES (126, 4, 272, 1, 102);
INSERT INTO `compra_detalles` VALUES (127, 5, 2860, 27, 71);
INSERT INTO `compra_detalles` VALUES (128, 10, 8570, 38, 193);
INSERT INTO `compra_detalles` VALUES (129, 10, 5490, 19, 105);
INSERT INTO `compra_detalles` VALUES (130, 10, 4210, 29, 96);
INSERT INTO `compra_detalles` VALUES (131, 6, 4620, 29, 136);
INSERT INTO `compra_detalles` VALUES (132, 6, 3894, 3, 84);
INSERT INTO `compra_detalles` VALUES (133, 10, 1300, 40, 47);
INSERT INTO `compra_detalles` VALUES (134, 6, 852, 45, 149);
INSERT INTO `compra_detalles` VALUES (135, 1, 776, 26, 26);
INSERT INTO `compra_detalles` VALUES (136, 6, 804, 41, 107);
INSERT INTO `compra_detalles` VALUES (137, 2, 428, 4, 143);
INSERT INTO `compra_detalles` VALUES (138, 9, 5796, 23, 187);
INSERT INTO `compra_detalles` VALUES (139, 5, 2795, 29, 188);
INSERT INTO `compra_detalles` VALUES (140, 4, 920, 26, 58);
INSERT INTO `compra_detalles` VALUES (141, 9, 6273, 50, 103);
INSERT INTO `compra_detalles` VALUES (142, 9, 6480, 11, 117);
INSERT INTO `compra_detalles` VALUES (143, 6, 4656, 16, 26);
INSERT INTO `compra_detalles` VALUES (144, 7, 1057, 31, 22);
INSERT INTO `compra_detalles` VALUES (145, 8, 6160, 4, 136);
INSERT INTO `compra_detalles` VALUES (146, 3, 1359, 43, 125);
INSERT INTO `compra_detalles` VALUES (147, 4, 744, 36, 53);
INSERT INTO `compra_detalles` VALUES (148, 10, 6230, 33, 199);
INSERT INTO `compra_detalles` VALUES (149, 7, 1820, 34, 138);
INSERT INTO `compra_detalles` VALUES (150, 10, 2630, 20, 79);
INSERT INTO `compra_detalles` VALUES (151, 5, 2060, 34, 91);
INSERT INTO `compra_detalles` VALUES (152, 3, 1236, 13, 91);
INSERT INTO `compra_detalles` VALUES (153, 4, 3652, 10, 100);
INSERT INTO `compra_detalles` VALUES (154, 5, 925, 19, 192);
INSERT INTO `compra_detalles` VALUES (155, 8, 2952, 2, 198);
INSERT INTO `compra_detalles` VALUES (156, 4, 944, 1, 31);
INSERT INTO `compra_detalles` VALUES (157, 7, 4116, 11, 76);
INSERT INTO `compra_detalles` VALUES (158, 8, 7016, 15, 23);
INSERT INTO `compra_detalles` VALUES (159, 3, 2229, 13, 85);
INSERT INTO `compra_detalles` VALUES (160, 5, 3355, 31, 162);
INSERT INTO `compra_detalles` VALUES (161, 4, 2276, 7, 62);
INSERT INTO `compra_detalles` VALUES (162, 1, 831, 37, 113);
INSERT INTO `compra_detalles` VALUES (163, 5, 455, 38, 5);
INSERT INTO `compra_detalles` VALUES (164, 6, 816, 27, 72);
INSERT INTO `compra_detalles` VALUES (165, 9, 7200, 43, 18);
INSERT INTO `compra_detalles` VALUES (166, 9, 63, 6, 170);
INSERT INTO `compra_detalles` VALUES (167, 8, 4688, 41, 112);
INSERT INTO `compra_detalles` VALUES (168, 8, 5960, 15, 144);
INSERT INTO `compra_detalles` VALUES (169, 6, 3612, 29, 152);
INSERT INTO `compra_detalles` VALUES (170, 9, 1206, 11, 190);
INSERT INTO `compra_detalles` VALUES (171, 5, 3400, 9, 50);
INSERT INTO `compra_detalles` VALUES (172, 6, 996, 2, 172);
INSERT INTO `compra_detalles` VALUES (173, 8, 5368, 22, 162);
INSERT INTO `compra_detalles` VALUES (174, 9, 3096, 29, 106);
INSERT INTO `compra_detalles` VALUES (175, 5, 3920, 19, 93);
INSERT INTO `compra_detalles` VALUES (176, 1, 563, 30, 141);
INSERT INTO `compra_detalles` VALUES (177, 6, 828, 23, 160);
INSERT INTO `compra_detalles` VALUES (178, 9, 4860, 17, 181);
INSERT INTO `compra_detalles` VALUES (179, 4, 2336, 10, 116);
INSERT INTO `compra_detalles` VALUES (180, 2, 290, 33, 174);
INSERT INTO `compra_detalles` VALUES (181, 10, 70, 48, 129);
INSERT INTO `compra_detalles` VALUES (182, 7, 2800, 24, 104);
INSERT INTO `compra_detalles` VALUES (183, 4, 3204, 27, 13);
INSERT INTO `compra_detalles` VALUES (184, 5, 4865, 36, 40);
INSERT INTO `compra_detalles` VALUES (185, 8, 1320, 30, 7);
INSERT INTO `compra_detalles` VALUES (186, 6, 5910, 26, 65);
INSERT INTO `compra_detalles` VALUES (187, 2, 266, 44, 159);
INSERT INTO `compra_detalles` VALUES (188, 6, 2568, 6, 4);
INSERT INTO `compra_detalles` VALUES (189, 9, 1485, 37, 7);
INSERT INTO `compra_detalles` VALUES (190, 2, 654, 3, 163);
INSERT INTO `compra_detalles` VALUES (191, 7, 5166, 25, 46);
INSERT INTO `compra_detalles` VALUES (192, 3, 1146, 1, 11);
INSERT INTO `compra_detalles` VALUES (193, 6, 3750, 22, 92);
INSERT INTO `compra_detalles` VALUES (194, 5, 665, 18, 159);
INSERT INTO `compra_detalles` VALUES (195, 8, 2616, 36, 163);
INSERT INTO `compra_detalles` VALUES (196, 7, 3465, 15, 196);
INSERT INTO `compra_detalles` VALUES (197, 5, 2690, 21, 130);
INSERT INTO `compra_detalles` VALUES (198, 10, 8810, 14, 51);
INSERT INTO `compra_detalles` VALUES (199, 3, 1707, 34, 62);
INSERT INTO `compra_detalles` VALUES (200, 4, 3716, 21, 182);

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fecha` datetime(6) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `id_direccion` bigint NOT NULL,
  `id_metodo_pago` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8scdv0bx0vt6uyic7cs3fc8ey`(`id_direccion` ASC) USING BTREE,
  INDEX `FK3nx4uo53ne74x6auw8p20fq07`(`id_metodo_pago` ASC) USING BTREE,
  INDEX `FKsfjim1druo8tc28uvbb799tc4`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `FK3nx4uo53ne74x6auw8p20fq07` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8scdv0bx0vt6uyic7cs3fc8ey` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsfjim1druo8tc28uvbb799tc4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of compras
-- ----------------------------
INSERT INTO `compras` VALUES (1, 'Proceso', '2010-05-24 01:53:24.000000', 2362, 1, 2, 2);
INSERT INTO `compras` VALUES (2, 'Proceso', '2015-03-08 16:01:27.000000', 13534, 1, 2, 2);
INSERT INTO `compras` VALUES (3, 'Proceso', '2008-07-02 00:03:45.000000', 11378, 1, 2, 2);
INSERT INTO `compras` VALUES (4, 'Proceso', '2005-12-08 11:39:24.000000', 8351, 1, 2, 2);
INSERT INTO `compras` VALUES (5, 'Proceso', '2004-07-09 10:59:34.000000', 3558, 1, 2, 2);
INSERT INTO `compras` VALUES (6, 'Proceso', '2016-05-13 03:21:53.000000', 15885, 1, 2, 2);
INSERT INTO `compras` VALUES (7, 'Proceso', '2024-08-28 01:29:00.000000', 4748, 1, 2, 2);
INSERT INTO `compras` VALUES (8, 'Proceso', '2000-12-16 19:30:16.000000', 3933, 1, 2, 2);
INSERT INTO `compras` VALUES (9, 'Proceso', '2013-06-28 10:52:30.000000', 7470, 1, 2, 2);
INSERT INTO `compras` VALUES (10, 'Proceso', '2001-06-21 11:14:39.000000', 15017, 1, 2, 2);
INSERT INTO `compras` VALUES (11, 'Proceso', '2016-06-12 06:41:12.000000', 31034, 2, 1, 3);
INSERT INTO `compras` VALUES (12, 'Proceso', '2012-11-23 03:56:03.000000', 2688, 2, 1, 3);
INSERT INTO `compras` VALUES (13, 'Proceso', '2016-05-11 13:29:32.000000', 9420, 2, 1, 3);
INSERT INTO `compras` VALUES (14, 'Proceso', '2001-03-11 02:04:24.000000', 18453, 2, 1, 3);
INSERT INTO `compras` VALUES (15, 'Proceso', '2012-03-01 10:43:18.000000', 17555, 2, 1, 3);
INSERT INTO `compras` VALUES (16, 'Proceso', '2014-04-05 23:30:18.000000', 13339, 2, 1, 3);
INSERT INTO `compras` VALUES (17, 'Proceso', '2008-03-15 00:10:07.000000', 17922, 2, 1, 3);
INSERT INTO `compras` VALUES (18, 'Proceso', '2023-08-30 10:49:16.000000', 3423, 2, 1, 3);
INSERT INTO `compras` VALUES (19, 'Proceso', '2023-10-07 06:27:43.000000', 10335, 2, 1, 3);
INSERT INTO `compras` VALUES (20, 'Proceso', '2000-10-12 11:47:16.000000', 4938, 2, 1, 3);
INSERT INTO `compras` VALUES (21, 'Proceso', '2016-06-12 06:41:12.000000', 32390, 3, 3, 4);
INSERT INTO `compras` VALUES (22, 'Proceso', '2012-11-23 03:56:03.000000', 27824, 3, 3, 4);
INSERT INTO `compras` VALUES (23, 'Proceso', '2016-05-11 13:29:32.000000', 7404, 3, 3, 4);
INSERT INTO `compras` VALUES (24, 'Proceso', '2001-03-11 02:04:24.000000', 9026, 3, 3, 4);
INSERT INTO `compras` VALUES (25, 'Proceso', '2012-03-01 10:43:18.000000', 11977, 3, 3, 4);
INSERT INTO `compras` VALUES (26, 'Proceso', '2014-04-05 23:30:18.000000', 23003, 3, 3, 4);
INSERT INTO `compras` VALUES (27, 'Proceso', '2008-03-15 00:10:07.000000', 17854, 3, 3, 4);
INSERT INTO `compras` VALUES (28, 'Proceso', '2023-08-30 10:49:16.000000', 13744, 3, 3, 4);
INSERT INTO `compras` VALUES (29, 'Proceso', '2023-10-07 06:27:43.000000', 18891, 3, 3, 4);
INSERT INTO `compras` VALUES (30, 'Proceso', '2000-10-12 11:47:16.000000', 8645, 3, 3, 4);
INSERT INTO `compras` VALUES (31, 'Proceso', '2016-06-12 06:41:12.000000', 11112, 4, 4, 5);
INSERT INTO `compras` VALUES (32, 'Proceso', '2012-11-23 03:56:03.000000', 5756, 4, 4, 5);
INSERT INTO `compras` VALUES (33, 'Proceso', '2016-05-11 13:29:32.000000', 15287, 4, 4, 5);
INSERT INTO `compras` VALUES (34, 'Proceso', '2001-03-11 02:04:24.000000', 10199, 4, 4, 5);
INSERT INTO `compras` VALUES (35, 'Proceso', '2012-03-01 10:43:18.000000', 6943, 4, 4, 5);
INSERT INTO `compras` VALUES (36, 'Proceso', '2014-04-05 23:30:18.000000', 12470, 4, 4, 5);
INSERT INTO `compras` VALUES (37, 'Proceso', '2008-03-15 00:10:07.000000', 2316, 4, 4, 5);
INSERT INTO `compras` VALUES (38, 'Proceso', '2023-08-30 10:49:16.000000', 15242, 4, 4, 5);
INSERT INTO `compras` VALUES (39, 'Proceso', '2023-10-07 06:27:43.000000', 5180, 4, 4, 5);
INSERT INTO `compras` VALUES (40, 'Proceso', '2000-10-12 11:47:16.000000', 13924, 4, 4, 5);
INSERT INTO `compras` VALUES (41, 'Proceso', '2016-06-12 06:41:12.000000', 9578, 5, 5, 6);
INSERT INTO `compras` VALUES (42, 'Proceso', '2012-11-23 03:56:03.000000', 12509, 5, 5, 6);
INSERT INTO `compras` VALUES (43, 'Proceso', '2016-05-11 13:29:32.000000', 13475, 5, 5, 6);
INSERT INTO `compras` VALUES (44, 'Proceso', '2001-03-11 02:04:24.000000', 7006, 5, 5, 6);
INSERT INTO `compras` VALUES (45, 'Proceso', '2012-03-01 10:43:18.000000', 11968, 5, 5, 6);
INSERT INTO `compras` VALUES (46, 'Proceso', '2014-04-05 23:30:18.000000', 9393, 5, 5, 6);
INSERT INTO `compras` VALUES (47, 'Proceso', '2008-03-15 00:10:07.000000', NULL, 5, 5, 6);
INSERT INTO `compras` VALUES (48, 'Proceso', '2023-08-30 10:49:16.000000', 5698, 5, 5, 6);
INSERT INTO `compras` VALUES (49, 'Proceso', '2023-10-07 06:27:43.000000', 1845, 5, 5, 6);
INSERT INTO `compras` VALUES (50, 'Proceso', '2000-10-12 11:47:16.000000', 26084, 5, 5, 6);

-- ----------------------------
-- Table structure for direcciones
-- ----------------------------
DROP TABLE IF EXISTS `direcciones`;
CREATE TABLE `direcciones`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `referencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKk9knhuryk5fsqnn5blyo4f57`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `FKk9knhuryk5fsqnn5blyo4f57` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of direcciones
-- ----------------------------
INSERT INTO `direcciones` VALUES (1, 'casa', 'Calle 1', 'Ciudad 1', '1', 'Guerrero', '1', 'Referencia 1', 2);
INSERT INTO `direcciones` VALUES (2, 'hogar', 'Calle 2', 'Ciudad 2', '2', 'Michoacán', '2', 'Referencia 2', 3);
INSERT INTO `direcciones` VALUES (3, 'oficina', 'Calle 3', 'Ciudad 3', '3', 'Morelos', '3', 'Referencia 3', 4);
INSERT INTO `direcciones` VALUES (4, 'escuela', 'Calle 4', 'Ciudad 4', '4', 'CDMX', '4', 'Referencia 4', 5);
INSERT INTO `direcciones` VALUES (5, 'Casa', 'Calle 5', 'Ciudad 5', '5', 'Nayarit', '5', 'Referencia 5', 6);

-- ----------------------------
-- Table structure for favoritos
-- ----------------------------
DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE `favoritos`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_producto` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8en5ejbt3ivyp0qi7qrtcuvm6`(`id_producto` ASC) USING BTREE,
  INDEX `FK8ixb8kaxp9dq6p40cgvhqc96w`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `FK8en5ejbt3ivyp0qi7qrtcuvm6` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ixb8kaxp9dq6p40cgvhqc96w` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favoritos
-- ----------------------------

-- ----------------------------
-- Table structure for metodos_pago
-- ----------------------------
DROP TABLE IF EXISTS `metodos_pago`;
CREATE TABLE `metodos_pago`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo_seguridad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fecha_expiracion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numero_cuenta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `proveedor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKaoiyjy5dag150kny8b2xw1ut8`(`id_usuario` ASC) USING BTREE,
  CONSTRAINT `FKaoiyjy5dag150kny8b2xw1ut8` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metodos_pago
-- ----------------------------
INSERT INTO `metodos_pago` VALUES (1, '123', '12/12', '1', 'Visa', 'Credito', 3);
INSERT INTO `metodos_pago` VALUES (2, '123', '12/12', '1', 'Visa', 'Debito', 2);
INSERT INTO `metodos_pago` VALUES (3, '123', '11/11', '1', 'Visa', 'Debito', 4);
INSERT INTO `metodos_pago` VALUES (4, '123', '10/10', '1', 'Visa', 'Debito', 5);
INSERT INTO `metodos_pago` VALUES (5, '123', '10/10', '1', 'Visa', 'Debito', 6);

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creado_en` datetime(6) NULL DEFAULT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `disponible` bit(1) NOT NULL,
  `imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, '2014-11-30 05:23:24.000000', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication.', b'1', NULL, 'dango core', 871.00, 958);
INSERT INTO `productos` VALUES (2, '2002-04-15 14:07:23.000000', 'After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection                   ', b'1', NULL, 'Pluots', 485.00, 19);
INSERT INTO `productos` VALUES (3, '2021-06-23 16:32:26.000000', 'The reason why a great man is great is that he resolves to be a great man. If you wait, all that happens is you get older. Navicat Monitor requires a repository to store alerts and metrics for historical analysis.', b'1', NULL, 'Pluots plus', 172.00, 726);
INSERT INTO `productos` VALUES (4, '2016-12-20 03:36:14.000000', 'Typically, it is employed as an encrypted version of Telnet. If it scares you, it might be a good thing to try. To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source.', b'1', NULL, 'Kiwi', 428.00, 653);
INSERT INTO `productos` VALUES (5, '2000-01-15 12:33:46.000000', 'Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not                  ', b'1', NULL, 'npple elite', 91.00, 430);
INSERT INTO `productos` VALUES (6, '2007-11-07 21:31:35.000000', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. I may not have gone where I intended to go, but I think I                   ', b'1', NULL, 'iOrange', 597.00, 886);
INSERT INTO `productos` VALUES (7, '2001-04-30 13:42:53.000000', 'There is no way to happiness. Happiness is the way. Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually.       ', b'1', NULL, 'Rambutan pi', 165.00, 344);
INSERT INTO `productos` VALUES (8, '2021-05-12 13:10:15.000000', 'You cannot save people, you can just love them. Navicat Monitor requires a repository to store alerts and metrics for historical analysis.', b'1', NULL, 'Raspberry', 438.00, 289);
INSERT INTO `productos` VALUES (9, '2004-07-06 20:28:57.000000', 'Anyone who has never made a mistake has never tried anything new. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections.', b'1', NULL, 'Strawberry pi', 596.00, 328);
INSERT INTO `productos` VALUES (10, '2010-10-09 23:56:37.000000', 'If opportunity doesn’t knock, build a door. It wasn’t raining when Noah built the ark. Creativity is intelligence having fun. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set                 ', b'1', NULL, 'Strawberry', 990.00, 926);
INSERT INTO `productos` VALUES (11, '2021-05-19 10:58:15.000000', 'You must be the change you wish to see in the world. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. Monitored servers include MySQL, MariaDB and SQL Server, and compatible with                   ', b'1', NULL, 'Plcots', 382.00, 329);
INSERT INTO `productos` VALUES (12, '2023-08-30 23:34:05.000000', 'Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platforms.', b'1', NULL, 'Orange', 683.00, 999);
INSERT INTO `productos` VALUES (13, '2021-10-21 05:31:55.000000', 'If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution.', b'1', NULL, 'fiwi mini', 801.00, 508);
INSERT INTO `productos` VALUES (14, '2014-10-09 17:25:03.000000', 'The past has no power over the present moment. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab.', b'1', NULL, 'omni-Kiwi', 240.00, 711);
INSERT INTO `productos` VALUES (15, '2022-10-25 23:48:44.000000', 'You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. Difficult circumstances serve as a textbook of life for people.', b'1', NULL, 'ultra-Pluots', 670.00, 185);
INSERT INTO `productos` VALUES (16, '2015-03-13 18:12:13.000000', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication.', b'1', NULL, 'pango', 194.00, 424);
INSERT INTO `productos` VALUES (17, '2011-01-20 00:39:35.000000', 'The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', b'1', NULL, 'Rasvberry', 302.00, 721);
INSERT INTO `productos` VALUES (18, '2009-05-16 20:56:50.000000', 'To connect to a database or schema, simply double-click it in the pane. Anyone who has ever made anything of importance was disciplined. Creativity is intelligence having fun. Actually it is just in an idea when feel oneself can achieve              ', b'1', NULL, 'Apple', 800.00, 843);
INSERT INTO `productos` VALUES (19, '2009-06-29 12:49:58.000000', 'You must be the change you wish to see in the world. To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. To connect to a database or schema, simply double-click it in the pane.', b'1', NULL, 'vtrawberry', 742.00, 304);
INSERT INTO `productos` VALUES (20, '2002-03-19 21:41:54.000000', 'I destroy my enemies when I make them my friends. The reason why a great man is great is that he resolves to be a great man.', b'1', NULL, 'Pluots', 763.00, 273);
INSERT INTO `productos` VALUES (21, '2013-03-26 09:06:11.000000', 'If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. The Navigation pane employs tree structure which allows you to take action upon the database            ', b'1', NULL, 'ierape', 753.00, 663);
INSERT INTO `productos` VALUES (22, '2023-11-16 01:32:42.000000', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication.', b'1', NULL, 'iMango', 151.00, 260);
INSERT INTO `productos` VALUES (23, '2023-09-01 15:07:52.000000', 'Genius is an infinite capacity for taking pains. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models.', b'1', NULL, 'Apple premium', 877.00, 818);
INSERT INTO `productos` VALUES (24, '2022-10-23 00:49:21.000000', 'Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. Genius is an infinite capacity for taking pains.', b'1', NULL, 'xeaspberry', 24.00, 141);
INSERT INTO `productos` VALUES (25, '2010-12-01 01:45:24.000000', 'To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. To clear or reload various internal caches, flush tables, or acquire locks, control-click your                  ', b'1', NULL, 'Orange mini', 458.00, 583);
INSERT INTO `productos` VALUES (26, '2004-01-25 07:09:39.000000', 'Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually. What you get by achieving your goals is                   ', b'1', NULL, 'Grape', 776.00, 397);
INSERT INTO `productos` VALUES (27, '2011-05-01 19:14:39.000000', 'Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from one machine to another. In the Objects tab, you can use the List List, Detail Detail and ER Diagram              ', b'1', NULL, 'Apple', 114.00, 39);
INSERT INTO `productos` VALUES (28, '2002-03-08 15:10:25.000000', 'SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol                ', b'1', NULL, 'Cherry pi', 62.00, 913);
INSERT INTO `productos` VALUES (29, '2006-02-12 20:53:57.000000', 'The On Startup feature allows you to control what tabs appear when you launch Navicat. Creativity is intelligence having fun.', b'1', NULL, 'ultra-Oranbe', 641.00, 471);
INSERT INTO `productos` VALUES (30, '2001-01-02 12:13:59.000000', 'If you wait, all that happens is you get older. A man is not old until regrets take the place of dreams. Optimism is the one quality more associated with success and happiness than any other. It is used while your ISPs do not allow                   ', b'1', NULL, 'Kiwi', 437.00, 198);
INSERT INTO `productos` VALUES (31, '2002-10-07 09:04:27.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. A comfort zone is a beautiful place, but nothing ever grows there.', b'1', NULL, 'Mango air', 236.00, 922);
INSERT INTO `productos` VALUES (32, '2001-04-20 18:04:04.000000', 'A comfort zone is a beautiful place, but nothing ever grows there. Champions keep playing until they get it right. With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and easily create, organize, access and                 ', b'1', NULL, 'Apple', 665.00, 297);
INSERT INTO `productos` VALUES (33, '2004-06-06 07:29:57.000000', 'If it scares you, it might be a good thing to try. In the middle of winter I at last discovered that there was in me an invincible summer. All the Navicat Cloud objects are located under different projects. You can share the project                  ', b'1', NULL, 'Orange', 73.00, 332);
INSERT INTO `productos` VALUES (34, '2016-04-15 08:25:27.000000', 'If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) / HTTP is another solution. I may not have gone where I intended to go, but I think I have ended up where I needed to be.           ', b'1', NULL, 'Strawbeory', 547.00, 810);
INSERT INTO `productos` VALUES (35, '2005-10-10 10:43:38.000000', 'Creativity is intelligence having fun. You can select any connections, objects or projects, and then select the corresponding buttons on the Information Pane. There is no way to happiness. Happiness is the way. Navicat provides powerful              ', b'1', NULL, 'Manvo', 787.00, 542);
INSERT INTO `productos` VALUES (36, '2020-03-13 17:45:58.000000', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from.', b'1', NULL, 'Strawlerry', 728.00, 377);
INSERT INTO `productos` VALUES (37, '2024-07-10 23:55:15.000000', 'Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on                  ', b'1', NULL, 'Orange', 836.00, 608);
INSERT INTO `productos` VALUES (38, '2017-01-09 04:24:03.000000', 'Success consists of going from failure to failure without loss of enthusiasm. Navicat Monitor requires a repository to store alerts and metrics for historical analysis. The reason why a great man is great is that he resolves to be a great man.', b'1', NULL, 'piwi', 208.00, 214);
INSERT INTO `productos` VALUES (39, '2011-10-23 06:02:23.000000', 'The Synchronize to Database function will give you a full picture of all database differences. Always keep your eyes open. Keep watching. Because whatever you see can inspire you. The Information Pane shows the detailed object information,           ', b'1', NULL, 'Mango mini', 424.00, 450);
INSERT INTO `productos` VALUES (40, '2020-04-07 06:18:36.000000', 'Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over                   ', b'1', NULL, 'Raapberry', 973.00, 320);
INSERT INTO `productos` VALUES (41, '2016-07-29 11:19:36.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. Navicat is a multi-connections Database Administration tool allowing you to connect to MySQL, Oracle, PostgreSQL, SQLite, SQL Server, MariaDB and/or              ', b'1', NULL, 'Mavgo', 198.00, 240);
INSERT INTO `productos` VALUES (42, '2015-08-28 02:09:19.000000', 'Creativity is intelligence having fun. The Synchronize to Database function will give you a full picture of all database differences.', b'1', NULL, 'Strawbfrry', 863.00, 100);
INSERT INTO `productos` VALUES (43, '2013-01-17 04:28:55.000000', 'A comfort zone is a beautiful place, but nothing ever grows there. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. Navicat provides a wide range advanced features, such as compelling                    ', b'1', NULL, 'Rambutan se', 429.00, 263);
INSERT INTO `productos` VALUES (44, '2024-01-01 14:06:55.000000', 'To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. Navicat provides powerful tools for working with queries: Query Editor for editing             ', b'1', NULL, 'Rambjtan', 5.00, 662);
INSERT INTO `productos` VALUES (45, '2022-12-21 22:20:00.000000', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections.', b'1', NULL, 'Orange', 610.00, 124);
INSERT INTO `productos` VALUES (46, '2018-04-02 23:30:30.000000', 'Anyone who has never made a mistake has never tried anything new. The first step is as good as half over. Flexible settings enable you to set up a custom key for comparison and synchronization. It provides strong authentication and                   ', b'1', NULL, 'Rambutan', 738.00, 268);
INSERT INTO `productos` VALUES (47, '2002-01-07 12:59:19.000000', 'To open a query using an external editor, control-click it and select Open with External Editor. You can set the file path of an external editor in Preferences. Navicat Data Modeler is a powerful and cost-effective database design                    ', b'1', NULL, 'Raspberry', 130.00, 454);
INSERT INTO `productos` VALUES (48, '2005-10-19 15:01:05.000000', 'It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling),                  ', b'1', NULL, 'Rambotan core', 132.00, 928);
INSERT INTO `productos` VALUES (49, '2023-12-23 03:33:38.000000', 'To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login               ', b'1', NULL, 'iRaspberry', 737.00, 984);
INSERT INTO `productos` VALUES (50, '2005-04-23 23:12:57.000000', 'If opportunity doesn’t knock, build a door. The On Startup feature allows you to control what tabs appear when you launch Navicat. Always keep your eyes open. Keep watching. Because whatever you see can inspire you.', b'1', NULL, 'ambi-Orabge', 680.00, 421);
INSERT INTO `productos` VALUES (51, '2000-08-02 12:19:24.000000', 'How we spend our days is, of course, how we spend our lives. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information in the General tab.', b'1', NULL, 'iOeange', 881.00, 555);
INSERT INTO `productos` VALUES (52, '2014-06-06 09:29:53.000000', 'To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more.', b'1', NULL, 'Mango', 723.00, 478);
INSERT INTO `productos` VALUES (53, '2004-10-04 13:13:13.000000', 'Difficult circumstances serve as a textbook of life for people. The reason why a great man is great is that he resolves to be a great man.', b'1', NULL, 'Chervy air', 186.00, 686);
INSERT INTO `productos` VALUES (54, '2002-04-02 22:17:25.000000', 'What you get by achieving your goals is not as important as what you become by achieving your goals. How we spend our days is, of course, how we spend our lives.', b'1', NULL, 'vluots', 669.00, 30);
INSERT INTO `productos` VALUES (55, '2015-08-18 03:37:07.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. To successfully establish a new connection to local/remote server - no matter via SSL, SSH or HTTP, set the database login information in the General tab.', b'1', NULL, 'Grahe core', 732.00, 411);
INSERT INTO `productos` VALUES (56, '2000-03-21 17:44:31.000000', 'Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information         ', b'1', NULL, 'aiwi', 676.00, 366);
INSERT INTO `productos` VALUES (57, '2022-12-14 00:05:45.000000', 'The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily. Remember that failure is an event, not a person.', b'1', NULL, 'arange pi', 283.00, 477);
INSERT INTO `productos` VALUES (58, '2000-12-12 14:10:12.000000', 'To connect to a database or schema, simply double-click it in the pane. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information in the General tab.                              ', b'1', NULL, 'Chermy se', 230.00, 524);
INSERT INTO `productos` VALUES (59, '2019-05-12 00:19:32.000000', 'I may not have gone where I intended to go, but I think I have ended up where I needed to be. If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane.', b'1', NULL, 'Manfo', 373.00, 977);
INSERT INTO `productos` VALUES (60, '2015-05-17 19:44:23.000000', 'Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences.', b'1', NULL, 'Kiwi', 183.00, 736);
INSERT INTO `productos` VALUES (61, '2022-07-21 01:33:25.000000', 'After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion,               ', b'1', NULL, 'ambi-Raspberry', 128.00, 733);
INSERT INTO `productos` VALUES (62, '2017-03-04 10:59:29.000000', 'Genius is an infinite capacity for taking pains. You must be the change you wish to see in the world. Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet. Optimism is the one quality more associated            ', b'1', NULL, 'Raspberry', 569.00, 859);
INSERT INTO `productos` VALUES (63, '2010-02-10 00:21:30.000000', 'If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. The Synchronize to Database function will give you a full picture of all database differences.', b'1', NULL, 'xGrame', 321.00, 739);
INSERT INTO `productos` VALUES (64, '2021-12-11 14:47:46.000000', 'It wasn’t raining when Noah built the ark. Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet.', b'1', NULL, 'Grape se', 844.00, 166);
INSERT INTO `productos` VALUES (65, '2012-09-10 03:55:47.000000', 'It wasn’t raining when Noah built the ark. In the middle of winter I at last discovered that there was in me an invincible summer. To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection            ', b'1', NULL, 'Pxuots', 985.00, 670);
INSERT INTO `productos` VALUES (66, '2003-12-04 12:10:41.000000', 'The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview.', b'1', NULL, 'Apple se', 469.00, 399);
INSERT INTO `productos` VALUES (67, '2002-11-13 21:05:46.000000', 'Navicat Monitor requires a repository to store alerts and metrics for historical analysis. Anyone who has ever made anything of importance was disciplined. Success consists of going from failure to failure without loss of enthusiasm.', b'1', NULL, 'Matgo elite', 751.00, 635);
INSERT INTO `productos` VALUES (68, '2021-04-24 20:31:11.000000', 'To connect to a database or schema, simply double-click it in the pane. The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. Actually it is just in an idea when feel oneself can                   ', b'1', NULL, 'omni-Raspberey', 425.00, 620);
INSERT INTO `productos` VALUES (69, '2007-07-28 23:20:30.000000', 'All journeys have secret destinations of which the traveler is unaware. Genius is an infinite capacity for taking pains. A comfort zone is a beautiful place, but nothing ever grows there.', b'1', NULL, 'Radpberry elite', 153.00, 990);
INSERT INTO `productos` VALUES (70, '2009-06-18 15:18:31.000000', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view.', b'1', NULL, 'Rambutan se', 87.00, 244);
INSERT INTO `productos` VALUES (71, '2002-07-17 10:08:52.000000', 'There is no way to happiness. Happiness is the way. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections.', b'1', NULL, 'iRambutan', 572.00, 402);
INSERT INTO `productos` VALUES (72, '2006-07-13 05:51:08.000000', 'It can also manage cloud databases such as Amazon Redshift, Amazon RDS, Alibaba Cloud. Features in Navicat are sophisticated enough to provide professional developers for all their specific needs, yet easy to learn for users who are                  ', b'1', NULL, 'Kici mini', 136.00, 455);
INSERT INTO `productos` VALUES (73, '2010-11-12 23:29:24.000000', 'Remember that failure is an event, not a person. Champions keep playing until they get it right. Navicat Monitor requires a repository to store alerts and metrics for historical analysis. It can also manage cloud databases such as                    ', b'1', NULL, 'Rambutan air', 786.00, 71);
INSERT INTO `productos` VALUES (74, '2003-10-12 10:06:56.000000', 'Difficult circumstances serve as a textbook of life for people. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. Optimism is the one quality more associated with success and happiness              ', b'1', NULL, 'Raspbevry', 576.00, 61);
INSERT INTO `productos` VALUES (75, '2020-02-11 05:05:11.000000', 'I may not have gone where I intended to go, but I think I have ended up where I needed to be. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections.', b'1', NULL, 'Kili', 307.00, 758);
INSERT INTO `productos` VALUES (76, '2007-03-26 13:39:11.000000', 'If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. You will succeed because most people are lazy. There is no way to happiness. Happiness is the way.', b'1', NULL, 'ambi-Mavgo', 588.00, 535);
INSERT INTO `productos` VALUES (77, '2018-07-10 09:23:52.000000', 'Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not                  ', b'1', NULL, 'Pluats', 767.00, 34);
INSERT INTO `productos` VALUES (78, '2024-01-08 18:13:33.000000', 'The first step is as good as half over. You will succeed because most people are lazy. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections.', b'1', NULL, 'aluots', 864.00, 570);
INSERT INTO `productos` VALUES (79, '2002-07-13 00:37:44.000000', 'If you wait, all that happens is you get older. Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually.', b'1', NULL, 'Pluots premium', 263.00, 37);
INSERT INTO `productos` VALUES (80, '2023-04-21 16:05:47.000000', 'Sometimes you win, sometimes you learn. Flexible settings enable you to set up a custom key for comparison and synchronization. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view.', b'1', NULL, 'Plqots', 301.00, 620);
INSERT INTO `productos` VALUES (81, '2012-06-05 08:17:02.000000', 'Champions keep playing until they get it right. Champions keep playing until they get it right. If the plan doesn’t work, change the plan, but never the goal. Anyone who has never made a mistake has never tried anything new.', b'1', NULL, 'Mango', 925.00, 420);
INSERT INTO `productos` VALUES (82, '2002-01-27 00:41:21.000000', 'Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. The Synchronize to Database function will give you a full picture of all database differences.', b'1', NULL, 'Maago', 951.00, 859);
INSERT INTO `productos` VALUES (83, '2011-02-11 03:45:19.000000', 'The reason why a great man is great is that he resolves to be a great man. A man’s best friends are his ten fingers. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. Anyone who has never               ', b'1', NULL, 'ambi-Pluoes', 557.00, 885);
INSERT INTO `productos` VALUES (84, '2000-09-19 23:44:47.000000', 'Optimism is the one quality more associated with success and happiness than any other. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more.', b'1', NULL, 'Strawberry', 649.00, 888);
INSERT INTO `productos` VALUES (85, '2025-03-30 22:10:57.000000', 'Difficult circumstances serve as a textbook of life for people. Anyone who has never made a mistake has never tried anything new.', b'1', NULL, 'Mazgo air', 743.00, 155);
INSERT INTO `productos` VALUES (86, '2021-10-05 12:32:46.000000', 'Always keep your eyes open. Keep watching. Because whatever you see can inspire you. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does.', b'1', NULL, 'Ploots', 577.00, 532);
INSERT INTO `productos` VALUES (87, '2014-03-17 07:40:23.000000', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. I may not have gone where I intended to go, but I think I have ended up where I needed to be. A man is not old until regrets                   ', b'1', NULL, 'Grape pi', 500.00, 13);
INSERT INTO `productos` VALUES (88, '2018-08-22 14:13:39.000000', 'Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually. In other words, Navicat provides the ability              ', b'1', NULL, 'Rambuhan mini', 440.00, 404);
INSERT INTO `productos` VALUES (89, '2017-02-20 04:44:57.000000', 'What you get by achieving your goals is not as important as what you become by achieving your goals. Sometimes you win, sometimes you learn. You can select any connections, objects or projects, and then select the corresponding buttons               ', b'1', NULL, 'Apple mini', 394.00, 296);
INSERT INTO `productos` VALUES (90, '2024-12-14 11:40:53.000000', 'Creativity is intelligence having fun. Anyone who has never made a mistake has never tried anything new. I may not have gone where I intended to go, but I think I have ended up where I needed to be.', b'1', NULL, 'Cderry', 705.00, 463);
INSERT INTO `productos` VALUES (91, '2000-01-15 10:03:02.000000', 'Anyone who has never made a mistake has never tried anything new. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. The Main Window consists of several toolbars and panes for you                 ', b'1', NULL, 'Orange premium', 412.00, 256);
INSERT INTO `productos` VALUES (92, '2014-07-10 15:18:41.000000', 'Genius is an infinite capacity for taking pains. You cannot save people, you can just love them. Navicat Monitor requires a repository to store alerts and metrics for historical analysis.', b'1', NULL, 'iRaspbkrry', 625.00, 293);
INSERT INTO `productos` VALUES (93, '2019-07-22 05:46:00.000000', 'If you wait, all that happens is you get older. Navicat 15 has added support for the system-wide dark mode. What you get by achieving your goals is not as important as what you become by achieving your goals.', b'1', NULL, 'ultra-Kiwi', 784.00, 127);
INSERT INTO `productos` VALUES (94, '2023-09-01 16:02:03.000000', 'Anyone who has never made a mistake has never tried anything new. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP.', b'1', NULL, 'nrange', 459.00, 802);
INSERT INTO `productos` VALUES (95, '2000-06-16 03:20:58.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process.', b'1', NULL, 'Raspbercy premium', 197.00, 404);
INSERT INTO `productos` VALUES (96, '2019-07-09 18:30:26.000000', 'Success consists of going from failure to failure without loss of enthusiasm. Remember that failure is an event, not a person. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group               ', b'1', NULL, 'xKiwi', 421.00, 300);
INSERT INTO `productos` VALUES (97, '2002-08-13 09:46:41.000000', 'To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window.', b'1', NULL, 'Aplle', 966.00, 653);
INSERT INTO `productos` VALUES (98, '2023-01-15 02:45:02.000000', 'Anyone who has ever made anything of importance was disciplined. After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target.', b'1', NULL, 'Cherry', 173.00, 594);
INSERT INTO `productos` VALUES (99, '2003-03-05 03:08:12.000000', 'In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information.', b'1', NULL, 'Grape', 928.00, 597);
INSERT INTO `productos` VALUES (100, '2006-08-15 15:01:40.000000', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and                   ', b'1', NULL, 'Chnrry', 913.00, 53);
INSERT INTO `productos` VALUES (101, '2021-08-27 20:04:13.000000', 'Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH)                    ', b'1', NULL, 'ultra-Mango', 90.00, 51);
INSERT INTO `productos` VALUES (102, '2007-05-22 20:29:51.000000', 'The first step is as good as half over. Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet. Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more.', b'1', NULL, 'Appae premium', 68.00, 123);
INSERT INTO `productos` VALUES (103, '2011-03-06 16:39:04.000000', 'You will succeed because most people are lazy. I may not have gone where I intended to go, but I think I have ended up where I needed to be.', b'1', NULL, 'Strawberry se', 697.00, 498);
INSERT INTO `productos` VALUES (104, '2013-06-01 23:00:30.000000', 'Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet. Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet.', b'1', NULL, 'Strawberry', 400.00, 753);
INSERT INTO `productos` VALUES (105, '2001-04-23 14:03:26.000000', 'Navicat is a multi-connections Database Administration tool allowing you to connect to MySQL, Oracle, PostgreSQL, SQLite, SQL Server, MariaDB and/or MongoDB databases, making database administration to multiple kinds of database so easy.', b'1', NULL, 'Rambutan plus', 549.00, 582);
INSERT INTO `productos` VALUES (106, '2015-10-03 15:23:14.000000', 'It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. You must be the change you wish to see in the world.', b'1', NULL, 'Orange', 344.00, 784);
INSERT INTO `productos` VALUES (107, '2021-01-03 14:29:54.000000', 'After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security.', b'1', NULL, 'Cherry', 134.00, 580);
INSERT INTO `productos` VALUES (108, '2012-02-16 12:54:19.000000', 'A man’s best friends are his ten fingers. Creativity is intelligence having fun. Actually it is just in an idea when feel oneself can achieve and cannot achieve. If the plan doesn’t work, change the plan, but never the goal.                      ', b'1', NULL, 'Kiwi mini', 746.00, 722);
INSERT INTO `productos` VALUES (109, '2004-01-25 22:55:56.000000', 'SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view.', b'1', NULL, 'Sqrawberry', 58.00, 22);
INSERT INTO `productos` VALUES (110, '2021-06-14 11:34:47.000000', 'If you wait, all that happens is you get older. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. If the plan doesn’t work, change the plan, but never the goal.', b'1', NULL, 'omni-hango', 648.00, 261);
INSERT INTO `productos` VALUES (111, '2022-03-14 06:46:59.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. Instead of wondering when your next vacation is, maybe you should set up a life you don’t need to escape from.', b'1', NULL, 'Kiwi', 534.00, 308);
INSERT INTO `productos` VALUES (112, '2008-10-31 03:39:19.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. The past has no power over the present moment.', b'1', NULL, 'Apple core', 586.00, 108);
INSERT INTO `productos` VALUES (113, '2003-10-26 16:14:29.000000', 'Typically, it is employed as an encrypted version of Telnet. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible.                           ', b'1', NULL, 'Pluots', 831.00, 44);
INSERT INTO `productos` VALUES (114, '2006-07-26 05:39:47.000000', 'It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network. Navicat 15 has added support for the system-wide dark mode.', b'1', NULL, 'omni-Orange', 258.00, 40);
INSERT INTO `productos` VALUES (115, '2022-02-18 12:02:39.000000', 'To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding              ', b'1', NULL, 'vango premium', 364.00, 140);
INSERT INTO `productos` VALUES (116, '2016-11-03 11:54:26.000000', 'SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date              ', b'1', NULL, 'Mango mini', 584.00, 989);
INSERT INTO `productos` VALUES (117, '2021-03-30 10:57:57.000000', 'Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet. The Synchronize to Database function will give you a full picture of all database differences.', b'1', NULL, 'Orange', 720.00, 110);
INSERT INTO `productos` VALUES (118, '2024-02-02 10:35:13.000000', 'The reason why a great man is great is that he resolves to be a great man. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. Sometimes you win, sometimes you learn.', b'1', NULL, 'Orange', 645.00, 557);
INSERT INTO `productos` VALUES (119, '2015-12-04 22:39:19.000000', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature.', b'1', NULL, 'Oraige premium', 594.00, 865);
INSERT INTO `productos` VALUES (120, '2022-08-06 12:47:38.000000', 'It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. Success consists of going from failure to failure without loss of enthusiasm.', b'1', NULL, 'Raspberry', 913.00, 385);
INSERT INTO `productos` VALUES (121, '2004-10-19 16:25:52.000000', 'Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. You will succeed because most people are lazy. If it scares you, it might be a good thing to try.', b'1', NULL, 'Mango se', 564.00, 669);
INSERT INTO `productos` VALUES (122, '2006-06-14 12:19:48.000000', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature.', b'1', NULL, 'Strawberry core', 941.00, 619);
INSERT INTO `productos` VALUES (123, '2018-01-01 21:41:18.000000', 'How we spend our days is, of course, how we spend our lives. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication.', b'1', NULL, 'Raspberry core', 950.00, 433);
INSERT INTO `productos` VALUES (124, '2006-11-13 19:43:46.000000', 'In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. Actually it is just in an idea when feel oneself can achieve and cannot achieve.', b'1', NULL, 'xPludts', 725.00, 147);
INSERT INTO `productos` VALUES (125, '2015-09-24 10:07:58.000000', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication.', b'1', NULL, 'Orange', 453.00, 974);
INSERT INTO `productos` VALUES (126, '2003-09-13 11:32:10.000000', 'Flexible settings enable you to set up a custom key for comparison and synchronization. How we spend our days is, of course, how we spend our lives.', b'1', NULL, 'Pluoqs', 913.00, 280);
INSERT INTO `productos` VALUES (127, '2001-01-23 13:12:43.000000', 'If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane.', b'1', NULL, 'Oranre pro', 896.00, 870);
INSERT INTO `productos` VALUES (128, '2020-03-10 08:33:43.000000', 'All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration.', b'1', NULL, 'iStraaberry', 246.00, 395);
INSERT INTO `productos` VALUES (129, '2021-10-29 08:19:02.000000', 'Remember that failure is an event, not a person. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. Navicat provides a wide range advanced features, such as compelling code editing                   ', b'1', NULL, 'Oranse', 7.00, 930);
INSERT INTO `productos` VALUES (130, '2002-01-20 19:11:50.000000', 'Anyone who has ever made anything of importance was disciplined. To open a query using an external editor, control-click it and select Open with External Editor. You can set the file path of an external editor in Preferences.', b'1', NULL, 'aango', 538.00, 40);
INSERT INTO `productos` VALUES (131, '2018-01-20 16:16:52.000000', 'Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication. Secure Sockets Layer(SSL) is a protocol for transmitting                    ', b'1', NULL, 'omni-Mango', 614.00, 974);
INSERT INTO `productos` VALUES (132, '2014-11-08 19:02:06.000000', 'Navicat Monitor can be installed on any local computer or virtual machine and does not require any software installation on the servers being monitored. How we spend our days is, of course, how we spend our lives.', b'1', NULL, 'Strawuerry pro', 469.00, 997);
INSERT INTO `productos` VALUES (133, '2001-10-19 21:08:16.000000', 'Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not                  ', b'1', NULL, 'Strawberry', 204.00, 983);
INSERT INTO `productos` VALUES (134, '2025-02-03 03:18:04.000000', 'Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from one machine to another. It can also manage cloud databases such as Amazon Redshift, Amazon RDS,                  ', b'1', NULL, 'Kiwi', 435.00, 163);
INSERT INTO `productos` VALUES (135, '2006-08-16 06:00:20.000000', 'Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually.', b'1', NULL, 'ultra-mluots', 617.00, 482);
INSERT INTO `productos` VALUES (136, '2017-12-15 23:28:10.000000', 'In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view.', b'1', NULL, 'Gaape', 770.00, 832);
INSERT INTO `productos` VALUES (137, '2017-04-28 22:09:12.000000', 'SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools.', b'1', NULL, 'Rambutan pi', 770.00, 817);
INSERT INTO `productos` VALUES (138, '2016-03-08 10:49:59.000000', 'Champions keep playing until they get it right. In the middle of winter I at last discovered that there was in me an invincible summer. The Navigation pane employs tree structure which allows you to take action upon the database and                  ', b'1', NULL, 'Strawberry', 260.00, 263);
INSERT INTO `productos` VALUES (139, '2007-07-22 10:49:25.000000', 'You cannot save people, you can just love them. The Synchronize to Database function will give you a full picture of all database differences.', b'1', NULL, 'nango plus', 711.00, 688);
INSERT INTO `productos` VALUES (140, '2002-01-16 11:15:58.000000', 'HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does. Champions keep playing until they get it right. SQL Editor allows you to create and edit                    ', b'1', NULL, 'ultra-Agple', 178.00, 760);
INSERT INTO `productos` VALUES (141, '2002-11-08 03:45:01.000000', 'Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from                  ', b'1', NULL, 'sambutan', 563.00, 584);
INSERT INTO `productos` VALUES (142, '2009-03-26 14:42:52.000000', 'In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information. The reason why a great man is great is that he resolves to be a great man.', b'1', NULL, 'Rambutan', 118.00, 677);
INSERT INTO `productos` VALUES (143, '2004-05-13 12:05:42.000000', 'Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more.', b'1', NULL, 'Raspberry air', 214.00, 200);
INSERT INTO `productos` VALUES (144, '2020-05-27 22:19:00.000000', 'How we spend our days is, of course, how we spend our lives. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences.', b'1', NULL, 'Grafe air', 745.00, 438);
INSERT INTO `productos` VALUES (145, '2021-04-08 22:55:10.000000', 'Flexible settings enable you to set up a custom key for comparison and synchronization. Champions keep playing until they get it right.', b'1', NULL, 'mambutan', 660.00, 865);
INSERT INTO `productos` VALUES (146, '2012-05-12 10:01:59.000000', 'Navicat Monitor requires a repository to store alerts and metrics for historical analysis. To connect to a database or schema, simply double-click it in the pane. I may not have gone where I intended to go, but I think I have ended                   ', b'1', NULL, 'mpple air', 763.00, 672);
INSERT INTO `productos` VALUES (147, '2025-03-29 16:09:08.000000', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. If you wait, all that happens is you get older. Creativity is intelligence having fun.', b'1', NULL, 'uango pi', 204.00, 263);
INSERT INTO `productos` VALUES (148, '2024-05-05 17:30:17.000000', 'Sometimes you win, sometimes you learn. HTTP Tunneling is a method for connecting to a server that uses the same protocol (http://) and the same port (port 80) as a web server does.', b'1', NULL, 'Kqwi', 983.00, 876);
INSERT INTO `productos` VALUES (149, '2001-08-22 19:03:15.000000', 'The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily. Success consists of going from failure to failure without loss of enthusiasm.', b'1', NULL, 'Rambuaan pro', 142.00, 920);
INSERT INTO `productos` VALUES (150, '2017-01-27 12:43:33.000000', 'Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. To successfully establish a new connection to local/remote server - no matter via SSL or SSH, set the database login information         ', b'1', NULL, 'Grype', 668.00, 407);
INSERT INTO `productos` VALUES (151, '2022-01-07 14:56:16.000000', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections.', b'1', NULL, 'ambi-Pluots', 544.00, 272);
INSERT INTO `productos` VALUES (152, '2019-04-16 05:09:12.000000', 'Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible. Anyone who has ever made anything of importance was disciplined.', b'1', NULL, 'Grape', 602.00, 428);
INSERT INTO `productos` VALUES (153, '2024-08-10 18:25:10.000000', 'A man is not old until regrets take the place of dreams. It can also manage cloud databases such as Amazon Redshift, Amazon RDS, Alibaba Cloud. Features in Navicat are sophisticated enough to provide professional developers for all                   ', b'1', NULL, 'nango', 723.00, 133);
INSERT INTO `productos` VALUES (154, '2015-09-06 05:39:51.000000', 'I may not have gone where I intended to go, but I think I have ended up where I needed to be. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring                 ', b'1', NULL, 'Grape core', 636.00, 309);
INSERT INTO `productos` VALUES (155, '2002-05-01 04:22:32.000000', 'Optimism is the one quality more associated with success and happiness than any other. After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. Remember that failure is an                  ', b'1', NULL, 'Raspbermy', 352.00, 702);
INSERT INTO `productos` VALUES (156, '2004-10-12 13:05:00.000000', 'After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target. Navicat 15 has added support for the system-wide dark mode. Navicat authorizes you to make connection to remote servers             ', b'1', NULL, 'Orange mini', 167.00, 43);
INSERT INTO `productos` VALUES (157, '2021-12-14 08:00:03.000000', 'It can also manage cloud databases such as Amazon Redshift, Amazon RDS, Alibaba Cloud. Features in Navicat are sophisticated enough to provide professional developers for all their specific needs, yet easy to learn for users who are                  ', b'1', NULL, 'Rambutan', 880.00, 38);
INSERT INTO `productos` VALUES (158, '2015-06-06 14:49:20.000000', 'Champions keep playing until they get it right. Optimism is the one quality more associated with success and happiness than any other. Always keep your eyes open. Keep watching. Because whatever you see can inspire you.', b'1', NULL, 'xgambutan', 880.00, 38);
INSERT INTO `productos` VALUES (159, '2021-08-15 21:30:00.000000', 'A comfort zone is a beautiful place, but nothing ever grows there. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window.', b'1', NULL, 'Raspberry', 133.00, 651);
INSERT INTO `productos` VALUES (160, '2020-09-17 06:06:57.000000', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. In the middle of winter I at last discovered that there was in me an invincible summer. If opportunity doesn’t knock, build a door.', b'1', NULL, 'Makgo', 138.00, 578);
INSERT INTO `productos` VALUES (161, '2015-08-16 13:15:08.000000', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family              ', b'1', NULL, 'Manvo', 695.00, 119);
INSERT INTO `productos` VALUES (162, '2018-08-09 20:00:34.000000', 'If it scares you, it might be a good thing to try. You will succeed because most people are lazy. I destroy my enemies when I make them my friends. Success consists of going from failure to failure without loss of enthusiasm.', b'1', NULL, 'Cherry', 671.00, 309);
INSERT INTO `productos` VALUES (163, '2001-12-21 16:06:25.000000', 'If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane.', b'1', NULL, 'Churry plus', 327.00, 509);
INSERT INTO `productos` VALUES (164, '2015-04-15 10:37:56.000000', 'If you wait, all that happens is you get older. Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models.', b'1', NULL, 'Raspberry', 403.00, 938);
INSERT INTO `productos` VALUES (165, '2014-05-23 09:22:08.000000', 'Navicat provides powerful tools for working with queries: Query Editor for editing the query text directly, and Query Builder, Find Builder or Aggregate Builder for building queries visually.', b'1', NULL, 'Mango', 504.00, 25);
INSERT INTO `productos` VALUES (166, '2012-08-21 00:48:51.000000', 'Difficult circumstances serve as a textbook of life for people. The reason why a great man is great is that he resolves to be a great man. Champions keep playing until they get it right.', b'1', NULL, 'Graee elite', 108.00, 238);
INSERT INTO `productos` VALUES (167, '2015-07-14 07:17:34.000000', 'Secure SHell (SSH) is a program to log in into another computer over a network, execute commands on a remote server, and move files from one machine to another.', b'1', NULL, 'Orfnge air', 691.00, 56);
INSERT INTO `productos` VALUES (168, '2023-01-31 08:25:48.000000', 'Remember that failure is an event, not a person. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration.', b'1', NULL, 'Ogange', 824.00, 641);
INSERT INTO `productos` VALUES (169, '2017-11-09 07:37:13.000000', 'The first step is as good as half over. Such sessions are also susceptible to session hijacking, where a malicious user takes over your session once you have authenticated.', b'1', NULL, 'Mango', 209.00, 507);
INSERT INTO `productos` VALUES (170, '2025-10-23 00:34:28.000000', 'All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. A query is used to extract data from the database in a readable format according to the user\'s request.', b'1', NULL, 'Mango air', 7.00, 770);
INSERT INTO `productos` VALUES (171, '2004-12-31 23:38:06.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP.', b'1', NULL, 'Pluots', 206.00, 589);
INSERT INTO `productos` VALUES (172, '2014-10-15 05:55:07.000000', 'Navicat is a multi-connections Database Administration tool allowing you to connect to MySQL, Oracle, PostgreSQL, SQLite, SQL Server, MariaDB and/or MongoDB databases, making database administration to multiple kinds of database so easy.', b'1', NULL, 'Raqpberry', 166.00, 721);
INSERT INTO `productos` VALUES (173, '2021-08-08 22:30:44.000000', 'The reason why a great man is great is that he resolves to be a great man. In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information.', b'1', NULL, 'iRaspberry', 480.00, 945);
INSERT INTO `productos` VALUES (174, '2007-08-31 10:20:40.000000', 'It can also manage cloud databases such as Amazon Redshift, Amazon RDS, Alibaba Cloud. Features in Navicat are sophisticated enough to provide professional developers for all their specific needs, yet easy to learn for users who are                  ', b'1', NULL, 'Rcmbutan', 145.00, 692);
INSERT INTO `productos` VALUES (175, '2005-10-05 20:10:42.000000', 'To connect to a database or schema, simply double-click it in the pane. I destroy my enemies when I make them my friends. I may not have gone where I intended to go, but I think I have ended up where I needed to be.', b'1', NULL, 'Raspberry', 957.00, 523);
INSERT INTO `productos` VALUES (176, '2022-01-09 12:01:10.000000', 'Always keep your eyes open. Keep watching. Because whatever you see can inspire you. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily.', b'1', NULL, 'Cherry', 305.00, 418);
INSERT INTO `productos` VALUES (177, '2023-03-08 06:25:28.000000', 'To connect to a database or schema, simply double-click it in the pane. With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and easily create, organize, access and share information in a secure and easy way.', b'1', NULL, 'ambi-Ppuots', 807.00, 363);
INSERT INTO `productos` VALUES (178, '2025-09-16 09:09:16.000000', 'The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. To start working with your server in Navicat, you should first establish a connection or several connections                  ', b'1', NULL, 'Kjwi', 962.00, 15);
INSERT INTO `productos` VALUES (179, '2003-10-04 15:59:56.000000', 'It wasn’t raining when Noah built the ark. Navicat is a multi-connections Database Administration tool allowing you to connect to MySQL, Oracle, PostgreSQL, SQLite, SQL Server, MariaDB and/or MongoDB databases, making database administration       ', b'1', NULL, 'ultra-Chetry', 92.00, 721);
INSERT INTO `productos` VALUES (180, '2004-01-26 21:33:06.000000', 'If you wait, all that happens is you get older. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window.', b'1', NULL, 'Mango mini', 252.00, 693);
INSERT INTO `productos` VALUES (181, '2007-01-29 09:45:15.000000', 'A man’s best friends are his ten fingers. I may not have gone where I intended to go, but I think I have ended up where I needed to be. To successfully establish a new connection to local/remote server - no matter via SSL or SSH,                   ', b'1', NULL, 'Strawserry', 540.00, 393);
INSERT INTO `productos` VALUES (182, '2001-12-24 08:10:02.000000', 'You cannot save people, you can just love them. SQL Editor allows you to create and edit SQL text, prepare and execute selected queries. You can select any connections, objects or projects, and then select the corresponding buttons                   ', b'1', NULL, 'Rambutan core', 929.00, 75);
INSERT INTO `productos` VALUES (183, '2021-04-12 22:04:20.000000', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature.                    ', b'1', NULL, 'Rambutan air', 493.00, 86);
INSERT INTO `productos` VALUES (184, '2022-11-18 02:08:06.000000', 'In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. All journeys have secret destinations of which the traveler is unaware.', b'1', NULL, 'Oringe pro', 234.00, 447);
INSERT INTO `productos` VALUES (185, '2009-10-16 23:48:32.000000', 'Anyone who has ever made anything of importance was disciplined. You must be the change you wish to see in the world. A query is used to extract data from the database in a readable format according to the user\'s request.                             ', b'1', NULL, 'Chyrry', 731.00, 240);
INSERT INTO `productos` VALUES (186, '2009-03-28 14:12:38.000000', 'In the middle of winter I at last discovered that there was in me an invincible summer. It provides strong authentication and secure encrypted communications between two hosts, known as SSH Port Forwarding (Tunneling), over an insecure network.', b'1', NULL, 'Stiawberry se', 819.00, 539);
INSERT INTO `productos` VALUES (187, '2006-06-23 10:12:57.000000', 'Genius is an infinite capacity for taking pains. In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information. Creativity is                   ', b'1', NULL, 'Mango', 644.00, 635);
INSERT INTO `productos` VALUES (188, '2012-01-28 17:20:53.000000', 'A man is not old until regrets take the place of dreams. Champions keep playing until they get it right. Always keep your eyes open. Keep watching. Because whatever you see can inspire you.', b'1', NULL, 'Otange core', 559.00, 863);
INSERT INTO `productos` VALUES (189, '2021-03-03 23:41:50.000000', 'The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. Such sessions are also susceptible to session hijacking, where a malicious user takes over your session once                  ', b'1', NULL, 'yrange', 176.00, 60);
INSERT INTO `productos` VALUES (190, '2017-02-04 21:30:20.000000', 'Export Wizard allows you to export data from tables, collections, views, or query results to any available formats. After logged in the Navicat Cloud feature, the Navigation pane will be divided into Navicat Cloud and My Connections sections.        ', b'1', NULL, 'Graue se', 134.00, 781);
INSERT INTO `productos` VALUES (191, '2015-10-03 21:51:28.000000', 'There is no way to happiness. Happiness is the way. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. With its well-designed Graphical User Interface(GUI), Navicat lets you quickly               ', b'1', NULL, 'Plsots air', 480.00, 213);
INSERT INTO `productos` VALUES (192, '2023-07-27 02:21:14.000000', 'SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s shell without compromising security. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol                ', b'1', NULL, 'Strawberry', 185.00, 27);
INSERT INTO `productos` VALUES (193, '2007-10-21 05:19:13.000000', 'SQL Editor allows you to create and edit SQL text, prepare and execute selected queries. Anyone who has never made a mistake has never tried anything new. After comparing data, the window shows the number of records that will be inserted,            ', b'1', NULL, 'Rambuban', 857.00, 552);
INSERT INTO `productos` VALUES (194, '2014-05-21 02:39:56.000000', 'Export Wizard allows you to export data from tables, collections, views, or query results to any available formats. To open a query using an external editor, control-click it and select Open with External Editor. You can set the file                 ', b'1', NULL, 'Cherry', 357.00, 662);
INSERT INTO `productos` VALUES (195, '2007-01-12 08:44:09.000000', 'To open a query using an external editor, control-click it and select Open with External Editor. You can set the file path of an external editor in Preferences. You cannot save people, you can just love them. SSH serves to prevent                    ', b'1', NULL, 'Pluots core', 598.00, 34);
INSERT INTO `productos` VALUES (196, '2021-05-24 07:30:59.000000', 'It is used while your ISPs do not allow direct connections, but allows establishing HTTP connections. Creativity is intelligence having fun. To get a secure connection, the first thing you need to do is to install OpenSSL Library and                 ', b'1', NULL, 'Orange pi', 495.00, 815);
INSERT INTO `productos` VALUES (197, '2000-06-27 10:22:06.000000', 'Flexible settings enable you to set up a custom key for comparison and synchronization. With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and easily create, organize, access and share information in a secure and easy way.', b'1', NULL, 'Pluots pro', 938.00, 471);
INSERT INTO `productos` VALUES (198, '2011-12-04 15:04:57.000000', 'If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. Remember that failure is an event, not a person.', b'1', NULL, 'frape', 369.00, 202);
INSERT INTO `productos` VALUES (199, '2024-06-07 08:33:37.000000', 'You cannot save people, you can just love them. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. To start working with your server in Navicat,                   ', b'1', NULL, 'mrape core', 623.00, 629);
INSERT INTO `productos` VALUES (200, '2024-03-15 05:16:54.000000', 'Success consists of going from failure to failure without loss of enthusiasm. Navicat Data Modeler enables you to build high-quality conceptual, logical and physical data models for a wide variety of audiences. Navicat provides powerful              ', b'1', NULL, 'Cherxy mini', 334.00, 952);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido_materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `apellido_paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `rol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'Hernandez', 'Cazares', 'f@f.com', 'Fabrizzio', '$2a$10$4PJY2Nv6DwPXbwTWQjtgCuSWl3kKLMRMHeIROeL2ldVJfFczAimI6', 'admin');
INSERT INTO `usuarios` VALUES (2, 'Cazares', 'Hernandez', 'e@e.com', 'Ernesto', '$2a$10$qQ9AAsHmN107jIfh2dx6auu.fNRHOSKpVPo.Q.0.2E7cuIhXnUfbq', 'usuario');
INSERT INTO `usuarios` VALUES (3, 'Hernandez', 'Cazares', 'j@j.com', 'Julieta', '$2a$10$lcjk.nWAWEfwZzUS4X2FVu/apRhUZLy.x8UglSAzYcBLsvuNFBVl.', 'usuario');
INSERT INTO `usuarios` VALUES (4, 'Cazares', 'Hernandez', 'a@a.com', 'Alejandra', '$2a$10$d4h/h6u/Z0ihIOXL8o9JFOIbDaYR6JwNjsAU.2WKdD6r0uxpGi/cG', 'usuario');
INSERT INTO `usuarios` VALUES (5, 'Galindo', 'Hernandez', 't@t.com', 'Trinidad', '$2a$10$QwSWuubElGDMuSY2Q2xKiO8GtZi5jm7EO5vUd3T6VriofzWtFQHZa', 'usuario');
INSERT INTO `usuarios` VALUES (6, 'Escobar', 'Conde', 'm@m.com', 'Moises', '$2a$10$zT9tn9G5ZGoFR.rPO2uBteHDj.8nU6D.Oo4wvclf2en5fdIgoh4lK', 'usuario');

SET FOREIGN_KEY_CHECKS = 1;
