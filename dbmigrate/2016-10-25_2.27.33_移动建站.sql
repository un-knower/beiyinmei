/************************************************/
-- Date:2016-10-25，operator:戴倚天

-- 1.创建表np_mob_page_cate，用于移动建站分类
-- 移动端-页面 分类表
CREATE TABLE `np_mob_page_cate` (
  `page_cate_id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号' ,
  `name`  varchar(100) NOT NULL ,
  `remark`  varchar(255) NULL ,
  `delflag`  enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除 0：未删除 1：已删除' ,
  `create_user_id`  bigint(20) NULL DEFAULT NULL COMMENT '创建人' ,
  `create_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `update_user_id`  bigint(20) NULL DEFAULT NULL COMMENT '更新人' ,
  `update_date`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
  PRIMARY KEY (`page_cate_id`)
);

-- 2.修改表np_mob_home_page，用于移动建站分类
-- 移动端-页面设置表
ALTER TABLE `np_mob_home_page`
  MODIFY COLUMN `temp1`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'toke值' AFTER `update_date`,
  MODIFY COLUMN `temp2`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否首页 0:否1:是' AFTER `temp1`,
  MODIFY COLUMN `temp3`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '类型 0:页面1:模板' AFTER `temp2`,
  MODIFY COLUMN `temp4`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '禁用状态 0:可用1:禁用' AFTER `temp3`,
  MODIFY COLUMN `isthird`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 0 AFTER `author`,
  MODIFY COLUMN `store_id`  bigint(20) NULL DEFAULT 0 AFTER `isthird`,
  ADD COLUMN `page_cate_id` bigint(20) NULL DEFAULT NULL COMMENT '页面分类id' AFTER `store_id`,
  ADD COLUMN `page_state` int(11) NULL AFTER `page_cate_id`,
  ADD COLUMN `sort`  int(11) NULL AFTER `page_state`,
  ADD COLUMN `create_date` timestamp NULL AFTER `sort`;

-- 3.更新表np_mob_home_page，用于移动建站分类
-- 移动端-页面设置表，完善信息
update np_mob_home_page set isthird= 0 where isthird is null;
update np_mob_home_page set store_id= 0 where store_id is null;
update np_mob_home_page set sort= 0 where sort is null;
update np_mob_home_page set temp4= 0 where temp4 is null;
update np_mob_home_page set temp3= 0 where temp3 is null;

-- 4.初始化np_mob_home_page表数据，用于移动建站分类页面
-- 权限数据
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3368', '页面设置', 'queryMobPageList.htm', '', '', '1773', '4', '0', '1', '移动端 页面设置', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3369', '删除页面设置', 'deleteMobPage.htm', '', '', '3368', '4', '5', '2', '移动端 页面设置', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3370', '添加魔方', 'addMF.htm', '', '', '3368', '4', '0', '2', '移动端 页面设置', '2014-10-21 15:49:06', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3371', '修改魔方', 'updateMF.htm', '', '', '3368', '4', '1', '2', '移动端 页面设置', '2014-10-21 15:52:47', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3372', '删除魔方', 'deleteMF.htm', '', '', '3368', '4', '2', '2', '移动端 页面设置', '2014-10-21 15:53:42', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3373', '保存广告', 'saveAdv.htm', '', '', '3368', '4', '3', '2', '移动端 页面设置', '2014-10-21 16:07:35', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3374', '删除广告', 'deleteAdv.htm', '', '', '3368', '4', '4', '2', '移动端 页面设置', '2014-10-21 16:08:29', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3375', '新增页面设置', 'addMobPage.htm', '', '', '3368', '4', '6', '2', '移动端 页面设置', '2014-10-21 16:08:29', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3376', '页面分类', 'queryMobPageCateByPageBean.htm', '', '', '1773', '3', '5', '1', '移动端 页面分类', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3377', '新增页面分类', 'addMobPageCate.htm', '', '', '3376', '4', '0', '2', '移动端 页面分类', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3378', '修改页面分类', 'updateMobPageCate.htm', '', '', '3376', '4', '0', '2', '移动端 页面分类', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3379', '删除页面分类', 'delMobPageCate.htm', '', '', '3376', '4', '0', '2', '移动端 页面分类', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');
INSERT INTO `kstore_v2`.`np_page` (`id`, `designation`, `url`, `img_url`, `img_url_selected`, `parentId`, `grade`, `sort`, `type`, `characterization`, `create_time`, `mod_time`, `flag`, `bar_sort`, `bundle_name`) VALUES ('3380', '页面分类查询', 'ajaxQueryMobPageCateList.htm', '', '', '3376', '4', '0', '2', '移动端 页面分类', '2014-12-18 17:43:11', '0000-00-00 00:00:00', '0', NULL, '');

/************************************************/


/************************************************/
-- Date:2016-10-27，operator:戴倚天
-- 1.修改表np_third_store_info，第三方信息添加字段is_choice，表示是否精选
ALTER TABLE `np_third_store_info`
  ADD COLUMN `is_choice`  enum('1','0') NULL DEFAULT '0' COMMENT ' 是否精选' AFTER `logo_url`;
/************************************************/