-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-06-19 02:12:24
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmf`
--

-- --------------------------------------------------------

--
-- 表的结构 `cmf_admin_menu`
--

CREATE TABLE `cmf_admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

--
-- 转存表中的数据 `cmf_admin_menu`
--

INSERT INTO `cmf_admin_menu` (`id`, `parent_id`, `type`, `status`, `list_order`, `app`, `controller`, `action`, `param`, `name`, `icon`, `remark`) VALUES
(1, 0, 0, 0, 20, 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心'),
(2, 1, 1, 1, 10000, 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理'),
(3, 2, 1, 0, 10000, 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理'),
(4, 2, 2, 0, 10000, 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序'),
(5, 2, 1, 0, 10000, 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子'),
(6, 0, 0, 0, 0, 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口'),
(7, 6, 1, 1, 50, 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理'),
(8, 7, 1, 0, 10000, 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接'),
(9, 7, 2, 0, 10000, 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存'),
(10, 7, 1, 0, 10000, 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接'),
(11, 7, 2, 0, 10000, 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存'),
(12, 7, 2, 0, 10000, 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接'),
(13, 7, 2, 0, 10000, 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序'),
(14, 7, 2, 0, 10000, 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏'),
(15, 6, 1, 1, 10, 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置'),
(16, 15, 2, 0, 10000, 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存'),
(17, 15, 1, 0, 10000, 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板'),
(18, 15, 2, 0, 10000, 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交'),
(19, 15, 1, 0, 10000, 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试'),
(20, 6, 1, 0, 10000, 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理'),
(21, 20, 1, 0, 10000, 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表'),
(22, 20, 1, 0, 10000, 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加'),
(23, 20, 2, 0, 10000, 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存'),
(24, 20, 1, 0, 10000, 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑'),
(25, 20, 2, 0, 10000, 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存'),
(26, 20, 2, 0, 10000, 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除'),
(27, 20, 2, 0, 10000, 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序'),
(28, 20, 1, 0, 10000, 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单'),
(29, 6, 1, 1, 30, 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理'),
(30, 29, 1, 0, 10000, 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航'),
(31, 29, 2, 0, 10000, 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存'),
(32, 29, 1, 0, 10000, 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航'),
(33, 29, 2, 0, 10000, 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存'),
(34, 29, 2, 0, 10000, 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航'),
(35, 29, 1, 0, 10000, 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单'),
(36, 35, 1, 0, 10000, 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单'),
(37, 35, 2, 0, 10000, 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存'),
(38, 35, 1, 0, 10000, 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单'),
(39, 35, 2, 0, 10000, 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存'),
(40, 35, 2, 0, 10000, 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单'),
(41, 35, 2, 0, 10000, 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序'),
(42, 1, 1, 1, 10000, 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表'),
(43, 42, 2, 0, 10000, 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用'),
(44, 42, 1, 0, 10000, 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置'),
(45, 42, 2, 0, 10000, 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交'),
(46, 42, 2, 0, 10000, 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装'),
(47, 42, 2, 0, 10000, 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新'),
(48, 42, 2, 0, 10000, 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件'),
(49, 110, 0, 1, 10000, 'admin', 'User', 'default', '', '管理组', '', '管理组'),
(50, 49, 1, 1, 10000, 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理'),
(51, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色'),
(52, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交'),
(53, 50, 1, 0, 10000, 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色'),
(54, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交'),
(55, 50, 2, 0, 10000, 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色'),
(56, 50, 1, 0, 10000, 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限'),
(57, 50, 2, 0, 10000, 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交'),
(58, 0, 1, 0, 10000, 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站'),
(59, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原'),
(60, 58, 2, 0, 10000, 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除'),
(61, 6, 1, 1, 10000, 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理'),
(62, 61, 1, 0, 10000, 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则'),
(63, 61, 2, 0, 10000, 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交'),
(64, 61, 1, 0, 10000, 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑'),
(65, 61, 2, 0, 10000, 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交'),
(66, 61, 2, 0, 10000, 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除'),
(67, 61, 2, 0, 10000, 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用'),
(68, 61, 2, 0, 10000, 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用'),
(69, 61, 2, 0, 10000, 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序'),
(70, 61, 1, 0, 10000, 'admin', 'Route', 'select', '', '选择URL', '', '选择URL'),
(71, 6, 1, 1, 0, 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息'),
(72, 71, 2, 0, 10000, 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交'),
(73, 6, 1, 0, 10000, 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改'),
(74, 73, 2, 0, 10000, 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交'),
(75, 6, 1, 1, 10000, 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置'),
(76, 75, 2, 0, 10000, 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交'),
(77, 6, 1, 0, 10000, 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存'),
(78, 6, 1, 1, 40, 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理'),
(79, 78, 1, 0, 10000, 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片'),
(80, 78, 2, 0, 10000, 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交'),
(81, 78, 1, 0, 10000, 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片'),
(82, 78, 2, 0, 10000, 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交'),
(83, 78, 2, 0, 10000, 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片'),
(84, 78, 1, 0, 10000, 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表'),
(85, 84, 1, 0, 10000, 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加'),
(86, 84, 2, 0, 10000, 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交'),
(87, 84, 1, 0, 10000, 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑'),
(88, 84, 2, 0, 10000, 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交'),
(89, 84, 2, 0, 10000, 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除'),
(90, 84, 2, 0, 10000, 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏'),
(91, 84, 2, 0, 10000, 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示'),
(92, 84, 2, 0, 10000, 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序'),
(93, 6, 1, 1, 10000, 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储'),
(94, 93, 2, 0, 10000, 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交'),
(95, 6, 1, 1, 20, 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理'),
(96, 95, 1, 0, 10000, 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板'),
(97, 95, 2, 0, 10000, 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板'),
(98, 95, 2, 0, 10000, 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装'),
(99, 95, 2, 0, 10000, 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新'),
(100, 95, 2, 0, 10000, 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板'),
(101, 95, 1, 0, 10000, 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板'),
(102, 95, 1, 0, 10000, 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置'),
(103, 95, 1, 0, 10000, 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表'),
(104, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑'),
(105, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存'),
(106, 95, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除'),
(107, 95, 2, 0, 10000, 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存'),
(108, 95, 1, 0, 10000, 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源'),
(109, 95, 1, 0, 10000, 'admin', 'Theme', 'design', '', '模板设计', '', '模板设计'),
(110, 0, 0, 1, 10, 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理'),
(111, 49, 1, 1, 10000, 'admin', 'User', 'index', '', '管理员', '', '管理员管理'),
(112, 111, 1, 0, 10000, 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加'),
(113, 111, 2, 0, 10000, 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交'),
(114, 111, 1, 0, 10000, 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑'),
(115, 111, 2, 0, 10000, 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交'),
(116, 111, 1, 0, 10000, 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改'),
(117, 111, 2, 0, 10000, 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交'),
(118, 111, 2, 0, 10000, 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除'),
(119, 111, 2, 0, 10000, 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员'),
(120, 111, 2, 0, 10000, 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员'),
(121, 0, 0, 1, 30, 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理'),
(122, 121, 1, 1, 10000, 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表'),
(123, 122, 1, 0, 10000, 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章'),
(124, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交'),
(125, 122, 1, 0, 10000, 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章'),
(126, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交'),
(127, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除'),
(128, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布'),
(129, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶'),
(130, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐'),
(131, 122, 2, 0, 10000, 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序'),
(132, 121, 1, 1, 10000, 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表'),
(133, 132, 1, 0, 10000, 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类'),
(134, 132, 2, 0, 10000, 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交'),
(135, 132, 1, 0, 10000, 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类'),
(136, 132, 2, 0, 10000, 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交'),
(137, 132, 1, 0, 10000, 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框'),
(138, 132, 2, 0, 10000, 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序'),
(139, 132, 2, 0, 10000, 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类'),
(140, 121, 1, 1, 10000, 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理'),
(141, 140, 1, 0, 10000, 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面'),
(142, 140, 2, 0, 10000, 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交'),
(143, 140, 1, 0, 10000, 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面'),
(144, 140, 2, 0, 10000, 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交'),
(145, 140, 2, 0, 10000, 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面'),
(146, 121, 1, 1, 10000, 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签'),
(147, 146, 1, 0, 10000, 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签'),
(148, 146, 2, 0, 10000, 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交'),
(149, 146, 2, 0, 10000, 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态'),
(150, 146, 2, 0, 10000, 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签'),
(151, 0, 1, 0, 10000, 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表'),
(152, 151, 2, 0, 10000, 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件'),
(153, 110, 0, 1, 10000, 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组'),
(154, 153, 1, 1, 10000, 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户'),
(155, 154, 2, 0, 10000, 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑'),
(156, 154, 2, 0, 10000, 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用'),
(157, 153, 1, 1, 10000, 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户'),
(158, 157, 2, 0, 10000, 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定'),
(159, 6, 1, 1, 10000, 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理'),
(160, 159, 1, 0, 10000, 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作'),
(161, 159, 2, 0, 10000, 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交'),
(162, 159, 1, 0, 10000, 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作'),
(163, 0, 1, 1, 10000, 'admin', 'sys', 'myOrder', '', '我的任务', '', ''),
(164, 0, 1, 1, 10000, 'admin', 'sys', 'processadmin', '', '流程管理', '', ''),
(165, 163, 2, 0, 10000, 'admin', 'sys', 'finishorder', '', '完成任务', '', ''),
(166, 167, 1, 0, 10000, 'admin', 'sys', 'upcommodity', '', '上传产品信息', '', ''),
(167, 0, 1, 1, 10000, 'admin', 'sys', 'commoditylist', '', '产品列表', '', ''),
(168, 0, 1, 0, 10000, 'admin', 'sys', 'ordershow', '', '流程查看', '', ''),
(169, 0, 1, 0, 10000, 'admin', 'sys', 'taskshow', '', '任务查看', '', ''),
(170, 0, 1, 1, 10000, 'admin', 'sys', 'addprocess', '', '添加流程', '', ''),
(171, 163, 1, 0, 10000, 'admin', 'sys', 'qrCodeverification', '', '二维码验证地址', '', ''),
(172, 0, 1, 1, 10000, 'admin', 'sys', 'qrcode', '', '二维码生成器', '', ''),
(173, 0, 1, 1, 10000, 'admin', 'sys', 'taskRepresentations', '', '任务申述', '', ''),
(174, 0, 1, 1, 10000, 'admin', 'sys', 'queenList', '', '库存匹配列表', '', ''),
(175, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'BlankingSupervisor', '', '下料管理', '', ''),
(176, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'FaceSupervisor', '', '面部管理', '', ''),
(177, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'WarehouseSupervisor', '', '仓库管理', '', ''),
(178, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'BottomSupervisor', '', '底部管理', '', ''),
(179, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'ProductionSupervisor', '', '生产管理', '', ''),
(180, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'processTaskBack', '', '撤回请求', '', ''),
(181, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'priceSetting', '', '任务单价设置', '', ''),
(182, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'salaryCalculation', '', '薪资计算', '', ''),
(183, 0, 1, 1, 10000, 'admin', 'Sysmanage', 'leaveTask', '', '请假任务转移列表', '', ''),
(184, 0, 1, 1, 10000, 'admin', 'sys', 'passwordmpdify', '', '密码修改', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_asset`
--

CREATE TABLE `cmf_asset` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

--
-- 转存表中的数据 `cmf_asset`
--

INSERT INTO `cmf_asset` (`id`, `user_id`, `file_size`, `create_time`, `status`, `download_times`, `file_key`, `filename`, `file_path`, `file_md5`, `file_sha1`, `suffix`, `more`) VALUES
(1, 1, 41735, 1552371757, 1, 0, 'bc4d4880ed76d1cd18436319c19bcb1aabbad7e0594bbb375040bda2dfb8bda5', 'u=2757041836,3300653395&fm=26&gp=0.jpg', 'portal/20190312/4876384b09d035a93ce76c3ec6bc2878.jpg', 'bc4d4880ed76d1cd18436319c19bcb1a', 'cfbad339f421fc3e5d55b7998f5bf95a5f7cd1e7', 'jpg', NULL),
(2, 1, 13168, 1552371874, 1, 0, '97243833e9a8a8333ce39f2cf5c57e3e062b6a2a23d69a757a05ce2c8870791f', '11360.gif.jpg', 'default/20190312/ca8f20444ac5763e447670291bc4e498.jpg', '97243833e9a8a8333ce39f2cf5c57e3e', '971b67fca35860d06e75578857c579da9b74406f', 'jpg', NULL),
(3, 3, 1782, 1585100311, 1, 0, '0b7d71cf6dc0b61eb3945c74e5324d539475ec57b492ca47b64a40fb64fc1890', 'CommodityBrand.txt', 'admin/20200325/53f4ea8295038bb10c96c7310257fae0.txt', '0b7d71cf6dc0b61eb3945c74e5324d53', '78eac6ab12dac28e10c487b71ba3d1ac758de237', 'txt', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_access`
--

CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

--
-- 转存表中的数据 `cmf_auth_access`
--

INSERT INTO `cmf_auth_access` (`id`, `role_id`, `rule_name`, `type`) VALUES
(43, 19, 'admin/sys/myorder', 'admin_url'),
(44, 19, 'admin/sys/finishorder', 'admin_url'),
(45, 19, 'admin/sys/commoditylist', 'admin_url'),
(46, 19, 'admin/sys/upcommodity', 'admin_url'),
(55, 21, 'admin/sys/myorder', 'admin_url'),
(56, 21, 'admin/sys/finishorder', 'admin_url'),
(57, 17, 'admin/sys/myorder', 'admin_url'),
(58, 17, 'admin/sys/finishorder', 'admin_url'),
(59, 17, 'admin/sys/commoditylist', 'admin_url'),
(60, 17, 'admin/sys/upcommodity', 'admin_url'),
(65, 8, 'admin/sys/myorder', 'admin_url'),
(66, 8, 'admin/sys/finishorder', 'admin_url'),
(67, 8, 'admin/sys/commoditylist', 'admin_url'),
(68, 8, 'admin/sys/upcommodity', 'admin_url'),
(73, 9, 'admin/sys/myorder', 'admin_url'),
(74, 9, 'admin/sys/finishorder', 'admin_url'),
(75, 9, 'admin/sys/commoditylist', 'admin_url'),
(76, 9, 'admin/sys/upcommodity', 'admin_url'),
(77, 13, 'admin/sys/myorder', 'admin_url'),
(78, 13, 'admin/sys/finishorder', 'admin_url'),
(79, 13, 'admin/sys/commoditylist', 'admin_url'),
(80, 13, 'admin/sys/upcommodity', 'admin_url'),
(81, 14, 'admin/sys/myorder', 'admin_url'),
(82, 14, 'admin/sys/finishorder', 'admin_url'),
(83, 14, 'admin/sys/commoditylist', 'admin_url'),
(84, 14, 'admin/sys/upcommodity', 'admin_url'),
(89, 16, 'admin/sys/myorder', 'admin_url'),
(90, 16, 'admin/sys/finishorder', 'admin_url'),
(91, 16, 'admin/sys/commoditylist', 'admin_url'),
(92, 16, 'admin/sys/upcommodity', 'admin_url'),
(93, 18, 'admin/sys/myorder', 'admin_url'),
(94, 18, 'admin/sys/finishorder', 'admin_url'),
(95, 18, 'admin/sys/commoditylist', 'admin_url'),
(96, 18, 'admin/sys/upcommodity', 'admin_url'),
(97, 2, 'admin/sys/processadmin', 'admin_url'),
(98, 2, 'admin/sys/ordershow', 'admin_url'),
(99, 15, 'admin/sys/myorder', 'admin_url'),
(100, 15, 'admin/sys/finishorder', 'admin_url'),
(101, 15, 'admin/sys/commoditylist', 'admin_url'),
(102, 15, 'admin/sys/upcommodity', 'admin_url'),
(103, 15, 'admin/sys/qrcodeverification', 'admin_url'),
(104, 3, 'admin/sys/myorder', 'admin_url'),
(105, 3, 'admin/sys/finishorder', 'admin_url'),
(106, 3, 'admin/sys/commoditylist', 'admin_url'),
(107, 3, 'admin/sys/upcommodity', 'admin_url'),
(108, 3, 'admin/sys/qrcodeverification', 'admin_url'),
(109, 4, 'admin/sys/myorder', 'admin_url'),
(110, 4, 'admin/sys/finishorder', 'admin_url'),
(111, 4, 'admin/sys/qrcodeverification', 'admin_url'),
(112, 4, 'admin/sys/commoditylist', 'admin_url'),
(113, 4, 'admin/sys/upcommodity', 'admin_url'),
(114, 10, 'admin/sys/myorder', 'admin_url'),
(115, 10, 'admin/sys/finishorder', 'admin_url'),
(116, 10, 'admin/sys/qrcodeverification', 'admin_url'),
(120, 12, 'admin/sys/myorder', 'admin_url'),
(121, 12, 'admin/sys/finishorder', 'admin_url'),
(122, 12, 'admin/sys/qrcodeverification', 'admin_url'),
(123, 12, 'admin/sys/commoditylist', 'admin_url'),
(124, 12, 'admin/sys/upcommodity', 'admin_url'),
(130, 20, 'admin/sys/myorder', 'admin_url'),
(131, 20, 'admin/sys/finishorder', 'admin_url'),
(132, 20, 'admin/sys/qrcodeverification', 'admin_url'),
(133, 20, 'admin/sys/commoditylist', 'admin_url'),
(134, 20, 'admin/sys/upcommodity', 'admin_url'),
(135, 20, 'admin/sys/taskshow', 'admin_url'),
(136, 20, 'admin/sys/qrcode', 'admin_url'),
(137, 5, 'admin/sys/myorder', 'admin_url'),
(138, 5, 'admin/sys/finishorder', 'admin_url'),
(139, 5, 'admin/sys/qrcodeverification', 'admin_url'),
(140, 6, 'admin/sys/myorder', 'admin_url'),
(141, 6, 'admin/sys/finishorder', 'admin_url'),
(142, 6, 'admin/sys/qrcodeverification', 'admin_url'),
(143, 6, 'admin/sys/commoditylist', 'admin_url'),
(144, 6, 'admin/sys/upcommodity', 'admin_url'),
(145, 7, 'admin/sys/myorder', 'admin_url'),
(146, 7, 'admin/sys/finishorder', 'admin_url'),
(147, 7, 'admin/sys/qrcodeverification', 'admin_url'),
(148, 7, 'admin/sys/commoditylist', 'admin_url'),
(149, 7, 'admin/sys/upcommodity', 'admin_url'),
(150, 22, 'admin/sys/myorder', 'admin_url'),
(151, 22, 'admin/sys/finishorder', 'admin_url'),
(152, 22, 'admin/sys/qrcodeverification', 'admin_url'),
(153, 11, 'admin/sys/myorder', 'admin_url'),
(154, 11, 'admin/sys/finishorder', 'admin_url'),
(155, 11, 'admin/sys/qrcodeverification', 'admin_url'),
(156, 11, 'admin/sys/commoditylist', 'admin_url'),
(157, 11, 'admin/sys/upcommodity', 'admin_url');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_rule`
--

CREATE TABLE `cmf_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '规则id,自增主键',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限规则表';

--
-- 转存表中的数据 `cmf_auth_rule`
--

INSERT INTO `cmf_auth_rule` (`id`, `status`, `app`, `type`, `name`, `param`, `title`, `condition`) VALUES
(1, 1, 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', ''),
(2, 1, 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', ''),
(3, 1, 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', ''),
(4, 1, 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', ''),
(5, 1, 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', ''),
(6, 1, 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', ''),
(7, 1, 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', ''),
(8, 1, 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', ''),
(9, 1, 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', ''),
(10, 1, 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', ''),
(11, 1, 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', ''),
(12, 1, 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', ''),
(13, 1, 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', ''),
(14, 1, 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', ''),
(15, 1, 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', ''),
(16, 1, 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', ''),
(17, 1, 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', ''),
(18, 1, 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', ''),
(19, 1, 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', ''),
(20, 1, 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', ''),
(21, 1, 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', ''),
(22, 1, 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', ''),
(23, 1, 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', ''),
(24, 1, 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', ''),
(25, 1, 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', ''),
(26, 1, 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', ''),
(27, 1, 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', ''),
(28, 1, 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', ''),
(29, 1, 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', ''),
(30, 1, 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', ''),
(31, 1, 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', ''),
(32, 1, 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', ''),
(33, 1, 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', ''),
(34, 1, 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', ''),
(35, 1, 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', ''),
(36, 1, 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', ''),
(37, 1, 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', ''),
(38, 1, 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', ''),
(39, 1, 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', ''),
(40, 1, 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', ''),
(41, 1, 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', ''),
(42, 1, 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', ''),
(43, 1, 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', ''),
(44, 1, 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', ''),
(45, 1, 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', ''),
(46, 1, 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', ''),
(47, 1, 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', ''),
(48, 1, 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', ''),
(49, 1, 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', ''),
(50, 1, 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', ''),
(51, 1, 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', ''),
(52, 1, 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', ''),
(53, 1, 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', ''),
(54, 1, 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', ''),
(55, 1, 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', ''),
(56, 1, 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', ''),
(57, 1, 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', ''),
(58, 1, 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', ''),
(59, 1, 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', ''),
(60, 1, 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', ''),
(61, 1, 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', ''),
(62, 1, 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', ''),
(63, 1, 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', ''),
(64, 1, 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', ''),
(65, 1, 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', ''),
(66, 1, 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', ''),
(67, 1, 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', ''),
(68, 1, 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', ''),
(69, 1, 'admin', 'admin_url', 'admin/Setting/default', '', '设置', ''),
(70, 1, 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', ''),
(71, 1, 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', ''),
(72, 1, 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', ''),
(73, 1, 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', ''),
(74, 1, 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', ''),
(75, 1, 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', ''),
(76, 1, 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', ''),
(77, 1, 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', ''),
(78, 1, 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', ''),
(79, 1, 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', ''),
(80, 1, 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', ''),
(81, 1, 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', ''),
(82, 1, 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', ''),
(83, 1, 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', ''),
(84, 1, 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', ''),
(85, 1, 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', ''),
(86, 1, 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', ''),
(87, 1, 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', ''),
(88, 1, 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', ''),
(89, 1, 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', ''),
(90, 1, 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', ''),
(91, 1, 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', ''),
(92, 1, 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', ''),
(93, 1, 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', ''),
(94, 1, 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', ''),
(95, 1, 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', ''),
(96, 1, 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', ''),
(97, 1, 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', ''),
(98, 1, 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', ''),
(99, 1, 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', ''),
(100, 1, 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', ''),
(101, 1, 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', ''),
(102, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', ''),
(103, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', ''),
(104, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', ''),
(105, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', ''),
(106, 1, 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', ''),
(107, 1, 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', ''),
(108, 1, 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', ''),
(109, 1, 'admin', 'admin_url', 'admin/User/default', '', '管理组', ''),
(110, 1, 'admin', 'admin_url', 'admin/User/index', '', '管理员', ''),
(111, 1, 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', ''),
(112, 1, 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', ''),
(113, 1, 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', ''),
(114, 1, 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', ''),
(115, 1, 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', ''),
(116, 1, 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', ''),
(117, 1, 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', ''),
(118, 1, 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', ''),
(119, 1, 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', ''),
(120, 1, 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', ''),
(121, 1, 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', ''),
(122, 1, 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', ''),
(123, 1, 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', ''),
(124, 1, 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', ''),
(125, 1, 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', ''),
(126, 1, 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', ''),
(127, 1, 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', ''),
(128, 1, 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', ''),
(129, 1, 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', ''),
(130, 1, 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', ''),
(131, 1, 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', ''),
(132, 1, 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', ''),
(133, 1, 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', ''),
(134, 1, 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', ''),
(135, 1, 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', ''),
(136, 1, 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', ''),
(137, 1, 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', ''),
(138, 1, 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', ''),
(139, 1, 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', ''),
(140, 1, 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', ''),
(141, 1, 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', ''),
(142, 1, 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', ''),
(143, 1, 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', ''),
(144, 1, 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', ''),
(145, 1, 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', ''),
(146, 1, 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', ''),
(147, 1, 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', ''),
(148, 1, 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', ''),
(149, 1, 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', ''),
(150, 1, 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', ''),
(151, 1, 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', ''),
(152, 1, 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', ''),
(153, 1, 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', ''),
(154, 1, 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', ''),
(155, 1, 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', ''),
(156, 1, 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', ''),
(157, 1, 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', ''),
(158, 1, 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', ''),
(159, 1, 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', ''),
(160, 1, 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', ''),
(161, 1, 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', ''),
(162, 1, 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', ''),
(163, 1, 'admin', 'admin_url', 'admin/sys/myOrder', '', '我的任务', ''),
(164, 1, 'admin', 'admin_url', 'admin/sys/processadmin', '', '流程管理', ''),
(165, 1, 'admin', 'admin_url', 'admin/sys/finishorder', '', '完成任务', ''),
(166, 1, 'admin', 'admin_url', 'admin/sys/upcommodity', '', '上传产品信息', ''),
(167, 1, 'admin', 'admin_url', 'admin/sys/commoditylist', '', '产品列表', ''),
(168, 1, 'admin', 'admin_url', 'admin/sys/ordershow', '', '流程查看', ''),
(169, 1, 'admin', 'admin_url', 'admin/sys/taskshow', '', '任务查看', ''),
(170, 1, 'admin', 'admin_url', 'admin/sys/addprocess', '', '添加流程', ''),
(171, 1, 'admin', 'admin_url', 'admin/sys/qrCodeverification', '', '二维码验证地址', ''),
(172, 1, 'admin', 'admin_url', 'admin/sys/qrcode', '', '二维码生成器', ''),
(173, 1, 'admin', 'admin_url', 'admin/sys/taskRepresentations', '', '任务申述', ''),
(174, 1, 'admin', 'admin_url', 'admin/sys/queenList', '', '库存匹配列表', ''),
(175, 1, 'admin', 'admin_url', 'admin/Sysmanage/BlankingSupervisor', '', '下料管理', ''),
(176, 1, 'admin', 'admin_url', 'admin/Sysmanage/FaceSupervisor', '', '面部管理', ''),
(177, 1, 'admin', 'admin_url', 'admin/Sysmanage/WarehouseSupervisor', '', '仓库管理', ''),
(178, 1, 'admin', 'admin_url', 'admin/Sysmanage/BottomSupervisor', '', '底部管理', ''),
(179, 1, 'admin', 'admin_url', 'admin/Sysmanage/ProductionSupervisor', '', '生产管理', ''),
(180, 1, 'admin', 'admin_url', 'admin/Sysmanage/processTaskBack', '', '撤回请求', ''),
(181, 1, 'admin', 'admin_url', 'admin/Sysmanage/priceSetting', '', '任务单价设置', ''),
(182, 1, 'admin', 'admin_url', 'admin/Sysmanage/salaryCalculation', '', '薪资计算', ''),
(183, 1, 'admin', 'admin_url', 'admin/Sysmanage/leaveTask', '', '请假任务转移列表', ''),
(184, 1, 'admin', 'admin_url', 'admin/sys/passwordmpdify', '', '密码修改', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_comment`
--

CREATE TABLE `cmf_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_commodity`
--

CREATE TABLE `cmf_commodity` (
  `Id` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PurchasePrice` varchar(255) DEFAULT NULL,
  `RetailPrice` varchar(255) DEFAULT NULL,
  `Sku` varchar(255) NOT NULL,
  `Spu` varchar(255) DEFAULT NULL,
  `Weight` varchar(255) DEFAULT NULL,
  `Image` varchar(5000) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `AircraftBoard` varchar(255) DEFAULT NULL,
  `HeelNum` varchar(255) DEFAULT NULL,
  `Other` varchar(1024) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `TotalCount` varchar(255) DEFAULT NULL,
  `StockCount` varchar(255) DEFAULT NULL,
  `Face` varchar(255) DEFAULT NULL,
  `ShoeLast` varchar(255) DEFAULT NULL,
  `Bottom` varchar(255) DEFAULT NULL,
  `BrandId` varchar(255) DEFAULT NULL,
  `BrandName` varchar(255) DEFAULT NULL,
  `BaitingPrice` varchar(255) DEFAULT NULL,
  `FacePrice` varchar(255) DEFAULT NULL,
  `BelongPerson` varchar(255) DEFAULT NULL,
  `WaterTableModel` varchar(255) DEFAULT NULL,
  `WoodHeelModel` varchar(255) DEFAULT NULL,
  `AddTime` datetime(3) DEFAULT NULL,
  `IsDelete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_commodityinfo`
--

CREATE TABLE `cmf_commodityinfo` (
  `id` int(11) NOT NULL,
  `commodityid` int(11) NOT NULL COMMENT '产品id',
  `info` text NOT NULL COMMENT '产品信息',
  `template` varchar(255) DEFAULT NULL COMMENT '3d文件生成的模板',
  `3Dmodel` varchar(255) DEFAULT NULL COMMENT '3D模型',
  `openboard` varchar(255) DEFAULT NULL COMMENT '开板（印花号）',
  `tracing` varchar(255) DEFAULT NULL COMMENT '描版信息/烧花',
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_commodityinfo`
--

INSERT INTO `cmf_commodityinfo` (`id`, `commodityid`, `info`, `template`, `3Dmodel`, `openboard`, `tracing`, `addtime`) VALUES
(1, 16796, '', '/upload/commodityfile/ERP记录.txt', '/upload/commodityfile/CommodityBrand.txt', '/upload/commodityfile/ERP记录.txt', '/upload/commodityfile/private', '2020-04-09 10:07:56'),
(2, 16798, '', NULL, NULL, '/upload/commodityfile/sss.xls', '/upload/commodityfile/sss.xls', '2020-04-14 15:46:04'),
(3, 1, '驱蚊器个订单', NULL, '0728-44', '', 'wjm5871', '2020-04-17 17:09:27'),
(4, 113315, '', '/upload/commodityfile/ERP记录.txt', '是的撒多', '', '啥啥啥', '2020-04-20 10:45:40'),
(5, 340207, '', '/upload/commodityfile/CommodityBrand.txt', '2222', '', '123', '2020-04-29 16:06:56'),
(6, 1686, '', 'sdsxs', '', '', '', '2020-05-05 15:45:37'),
(7, 226902, '', '', 'qwewqewqeqwe', '', 'qweqwewq', '2020-05-05 16:45:55'),
(8, 189751, '', '', '456', '', '123', '2020-05-22 11:41:19');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_commodity_bak`
--

CREATE TABLE `cmf_commodity_bak` (
  `Id` int(11) UNSIGNED NOT NULL,
  `Sku` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Name` varchar(10) CHARACTER SET latin1 NOT NULL,
  `PurchasePrice` float NOT NULL,
  `RetailPrice` float NOT NULL,
  `Weight` float NOT NULL,
  `Image` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `Size` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Color` varchar(10) CHARACTER SET latin1 NOT NULL,
  `AircraftBoard` varchar(50) CHARACTER SET latin1 NOT NULL,
  `HeelNum` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Other` varchar(300) CHARACTER SET latin1 NOT NULL,
  `Status` int(11) NOT NULL,
  `TotalCount` int(11) NOT NULL,
  `StockCount` int(11) NOT NULL,
  `Face` varchar(30) CHARACTER SET latin1 NOT NULL,
  `ShoeLast` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Bottom` varchar(30) CHARACTER SET latin1 NOT NULL,
  `BrandId` int(11) NOT NULL,
  `BrandName` varchar(30) CHARACTER SET latin1 NOT NULL,
  `BaitingPrice` double NOT NULL,
  `FacePrice` float NOT NULL,
  `AddTime` datetime NOT NULL,
  `IsDelete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_handwork`
--

CREATE TABLE `cmf_handwork` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL COMMENT '用户id',
  `taskid` int(11) NOT NULL COMMENT '任务id',
  `price` double DEFAULT NULL COMMENT '价格',
  `accept_user` int(11) DEFAULT NULL COMMENT '手工人员id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0 未完成 1，完成',
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `handworktype` varchar(20) DEFAULT NULL COMMENT '手工类型',
  `work` varchar(255) DEFAULT NULL COMMENT '种类',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手工表';

--
-- 转存表中的数据 `cmf_handwork`
--

INSERT INTO `cmf_handwork` (`id`, `userid`, `taskid`, `price`, `accept_user`, `status`, `addtime`, `handworktype`, `work`, `finish_time`) VALUES
(1, 24, 377, NULL, 24, 1, '2020-05-27 17:25:32', '外部手工', '油边', '2020-05-29 07:58:42'),
(2, 11, 370, NULL, 11, 1, '2020-06-02 16:18:51', '外部手工', '油边', '2020-06-02 08:19:08'),
(3, 11, 370, NULL, 11, 1, '2020-06-02 16:24:43', '外部手工', '油边', '2020-06-02 08:24:53'),
(4, 11, 374, NULL, 11, 1, '2020-06-02 16:31:44', '外部手工', '油边', '2020-06-02 08:47:12'),
(5, 7, 440, NULL, 7, 0, '2020-06-02 16:55:38', '内部手工', NULL, NULL),
(6, 7, 420, NULL, 7, 1, '2020-06-02 17:05:39', '外部手工', '油边', '2020-06-02 09:05:50');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_hook`
--

CREATE TABLE `cmf_hook` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统钩子表';

--
-- 转存表中的数据 `cmf_hook`
--

INSERT INTO `cmf_hook` (`id`, `type`, `once`, `name`, `hook`, `app`, `description`) VALUES
(1, 1, 0, '应用初始化', 'app_init', 'cmf', '应用初始化'),
(2, 1, 0, '应用开始', 'app_begin', 'cmf', '应用开始'),
(3, 1, 0, '模块初始化', 'module_init', 'cmf', '模块初始化'),
(4, 1, 0, '控制器开始', 'action_begin', 'cmf', '控制器开始'),
(5, 1, 0, '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤'),
(6, 1, 0, '应用结束', 'app_end', 'cmf', '应用结束'),
(7, 1, 0, '日志write方法', 'log_write', 'cmf', '日志write方法'),
(8, 1, 0, '输出结束', 'response_end', 'cmf', '输出结束'),
(9, 1, 0, '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化'),
(10, 1, 0, '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化'),
(11, 1, 1, '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码'),
(12, 3, 0, '模板 body标签开始', 'body_start', '', '模板 body标签开始'),
(13, 3, 0, '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前'),
(14, 3, 0, '模板底部开始', 'footer_start', '', '模板底部开始'),
(15, 3, 0, '模板底部开始之前', 'before_footer', '', '模板底部开始之前'),
(16, 3, 0, '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前'),
(17, 3, 0, '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前'),
(18, 3, 0, '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始'),
(19, 3, 0, '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前'),
(20, 3, 0, '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始'),
(21, 3, 0, '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前'),
(22, 3, 1, '评论区', 'comment', '', '评论区'),
(23, 3, 1, '留言区', 'guestbook', '', '留言区'),
(24, 2, 0, '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘'),
(25, 4, 0, '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前'),
(26, 4, 0, '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前'),
(27, 2, 0, '后台登录页面', 'admin_login', 'admin', '后台登录页面'),
(28, 1, 1, '前台模板切换', 'switch_theme', 'cmf', '前台模板切换'),
(29, 3, 0, '主要内容之后', 'after_content', '', '主要内容之后'),
(30, 2, 0, '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前'),
(31, 2, 0, '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后'),
(32, 2, 1, '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面'),
(33, 3, 0, '主要内容之前', 'before_content', 'cmf', '主要内容之前'),
(34, 1, 0, '日志写入完成', 'log_write_done', 'cmf', '日志写入完成'),
(35, 1, 1, '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换'),
(36, 1, 1, '验证码图片', 'captcha_image', 'cmf', '验证码图片'),
(37, 2, 1, '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面'),
(38, 2, 1, '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面'),
(39, 2, 1, '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面'),
(40, 2, 1, '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面'),
(41, 2, 1, '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面'),
(42, 2, 1, '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面'),
(43, 2, 1, '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面'),
(44, 2, 1, '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面'),
(45, 2, 1, '门户后台文章管理列表界面', 'portal_admin_article_index_view', 'portal', '门户后台文章管理列表界面'),
(46, 2, 1, '门户后台文章分类管理列表界面', 'portal_admin_category_index_view', 'portal', '门户后台文章分类管理列表界面'),
(47, 2, 1, '门户后台页面管理列表界面', 'portal_admin_page_index_view', 'portal', '门户后台页面管理列表界面'),
(48, 2, 1, '门户后台文章标签管理列表界面', 'portal_admin_tag_index_view', 'portal', '门户后台文章标签管理列表界面'),
(49, 2, 1, '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面'),
(50, 2, 1, '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面'),
(51, 2, 1, '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面'),
(52, 2, 1, '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面'),
(53, 2, 1, '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面'),
(54, 2, 1, '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面'),
(55, 2, 1, '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子'),
(56, 4, 0, '门户后台文章添加编辑界面右侧栏', 'portal_admin_article_edit_view_right_sidebar', 'portal', '门户后台文章添加编辑界面右侧栏'),
(57, 4, 0, '门户后台文章添加编辑界面主要内容', 'portal_admin_article_edit_view_main', 'portal', '门户后台文章添加编辑界面主要内容'),
(58, 2, 1, '门户后台文章添加界面', 'portal_admin_article_add_view', 'portal', '门户后台文章添加界面'),
(59, 2, 1, '门户后台文章编辑界面', 'portal_admin_article_edit_view', 'portal', '门户后台文章编辑界面'),
(60, 2, 1, '门户后台文章分类添加界面', 'portal_admin_category_add_view', 'portal', '门户后台文章分类添加界面'),
(61, 2, 1, '门户后台文章分类编辑界面', 'portal_admin_category_edit_view', 'portal', '门户后台文章分类编辑界面'),
(62, 2, 1, '门户后台页面添加界面', 'portal_admin_page_add_view', 'portal', '门户后台页面添加界面'),
(63, 2, 1, '门户后台页面编辑界面', 'portal_admin_page_edit_view', 'portal', '门户后台页面编辑界面'),
(64, 2, 1, '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面'),
(65, 2, 1, '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面'),
(66, 2, 1, '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面'),
(67, 2, 1, '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面'),
(68, 2, 1, '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面'),
(69, 2, 1, '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面'),
(70, 2, 1, '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面'),
(71, 2, 1, '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_hook_plugin`
--

CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) UNSIGNED NOT NULL,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统钩子插件表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_link`
--

CREATE TABLE `cmf_link` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接表';

--
-- 转存表中的数据 `cmf_link`
--

INSERT INTO `cmf_link` (`id`, `status`, `rating`, `list_order`, `description`, `url`, `name`, `image`, `target`, `rel`) VALUES
(1, 1, 1, 8, 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_manual`
--

CREATE TABLE `cmf_manual` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL COMMENT '用户id',
  `info` varchar(500) NOT NULL COMMENT '备注',
  `addtime` timestamp NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_material`
--

CREATE TABLE `cmf_material` (
  `id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL COMMENT '产品id',
  `m_name` varchar(20) NOT NULL COMMENT '材料名称',
  `m_position` varchar(50) DEFAULT NULL COMMENT '材料位置',
  `m_count` int(11) NOT NULL DEFAULT '0' COMMENT '材料数量',
  `m_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='材料表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_material_log`
--

CREATE TABLE `cmf_material_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '材料添加人id',
  `m_count` int(11) NOT NULL COMMENT '材料添加数量',
  `add_time` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='材料添加日志';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav`
--

CREATE TABLE `cmf_nav` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_main` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台导航位置表';

--
-- 转存表中的数据 `cmf_nav`
--

INSERT INTO `cmf_nav` (`id`, `is_main`, `name`, `remark`) VALUES
(1, 1, '主导航', '主导航'),
(2, 0, '底部导航', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav_menu`
--

CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台导航菜单表';

--
-- 转存表中的数据 `cmf_nav_menu`
--

INSERT INTO `cmf_nav_menu` (`id`, `nav_id`, `parent_id`, `status`, `list_order`, `name`, `target`, `href`, `icon`, `path`) VALUES
(1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_option`
--

CREATE TABLE `cmf_option` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `autoload` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '配置值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全站配置表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `cmf_option`
--

INSERT INTO `cmf_option` (`id`, `autoload`, `option_name`, `option_value`) VALUES
(1, 1, 'site_info', '{"site_name":"\\u9042\\u5dde\\u98ce\\u5149","site_seo_title":"\\u9042\\u5b81","site_seo_keywords":"\\u9042\\u5b81,\\u65c5\\u6e38,\\u9042\\u5b81\\u7f8e\\u98df,\\u98ce\\u5149,\\u9042\\u5b81\\u4ecb\\u7ecd,\\u5927\\u82f1, \\u6b7b\\u6d77,\\u9f99\\u51e4","site_seo_description":"\\u9042\\u5b81,\\u65c5\\u6e38,\\u9042\\u5b81\\u7f8e\\u98df,\\u98ce\\u5149,\\u9042\\u5b81\\u4ecb\\u7ecd,\\u5927\\u82f1, \\u6b7b\\u6d77,\\u9f99\\u51e4","site_icp":"\\u8700ICP\\u590717033338","site_gwa":"","site_admin_email":"","site_analytics":""}'),
(2, 1, 'cmf_settings', '{"open_registration":"0","banned_usernames":""}'),
(3, 1, 'cdn_settings', '{"cdn_static_root":""}'),
(4, 1, 'admin_settings', '{"admin_password":"","admin_style":"flatadmin"}'),
(5, 1, 'storage', '{"type":"Local"}'),
(6, 1, 'smtp_setting', '{"from_name":"wangji","from":"sdsxs@139.com","host":"","smtp_secure":"ssl","port":"","username":"sa","password":"123456"}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugin`
--

CREATE TABLE `cmf_plugin` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_category`
--

CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章分类表';

--
-- 转存表中的数据 `cmf_portal_category`
--

INSERT INTO `cmf_portal_category` (`id`, `parent_id`, `post_count`, `status`, `delete_time`, `list_order`, `name`, `description`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `more`) VALUES
(1, 0, 0, 1, 0, 10000, '遂州美食', '遂宁的美食', '0-1', '', '', '', 'list', 'article', '{"thumbnail":"portal\\/20190312\\/4876384b09d035a93ce76c3ec6bc2878.jpg"}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_category_post`
--

CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

--
-- 转存表中的数据 `cmf_portal_category_post`
--

INSERT INTO `cmf_portal_category_post` (`id`, `post_id`, `category_id`, `list_order`, `status`) VALUES
(1, 1, 1, 10000, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_post`
--

CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `cmf_portal_post`
--

INSERT INTO `cmf_portal_post` (`id`, `parent_id`, `post_type`, `post_format`, `user_id`, `post_status`, `comment_status`, `is_top`, `recommended`, `post_hits`, `post_favorites`, `post_like`, `comment_count`, `create_time`, `update_time`, `published_time`, `delete_time`, `post_title`, `post_keywords`, `post_excerpt`, `post_source`, `thumbnail`, `post_content`, `post_content_filtered`, `more`) VALUES
(1, 0, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 1552371912, 1552372291, 1552371720, 0, '蓬溪熨斗糕', '糕', '遂宁美食，糕类', 'http://shop.bytravel.cn/produce/index487.html', '', '\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;default/20190312/ca8f20444ac5763e447670291bc4e498.jpg&quot; title=&quot;11360.gif.jpg&quot; alt=&quot;11360.gif.jpg&quot;&gt;&lt;/p&gt;\n&lt;p&gt;蓬溪熨斗糕，是四川省遂宁市蓬溪县的著名特色小吃，该品将米、面、蛋、糖浆用铁烙碗烙熟食用，制品分甜、咸两种，外酥内嫩，甜香爽口。&lt;br&gt;&lt;br&gt;　　遂宁特产蓬溪熨斗糕的由来有两种说法：&lt;br&gt;&lt;br&gt;　　一说是始于民国十六年（公元1926年），由蓬溪县人夏其宣仿照甜熨斗糕，经过改加配方，精心制作而成。外壳色黄偏棕红，外酥内嫩，深受大众喜爱。&lt;br&gt;&lt;br&gt;　　另一说熨斗糕系蓬溪地方传统名小吃，自明代传承至今，字号繁多，远近闻名，“文中熨斗糕”为其中一种。期品状若帽子，主料为米，辅以豆鼓、鲜猪肉、鸡蛋、香葱、豆芽等，现烤现卖，“烫、香、脆、嫩”，营养丰富，雅俗共赏，老少咸宜。&lt;br&gt;&lt;br&gt;　　一、选料、泡米：将大米（350克）洗净浸泡4小时沥干；另将大米（150克）入笼蒸至半熟，与泡米拌匀，加适量清水磨成米浆。加酵面发酵，待膨胀时用木棒搅匀至发酵不粘缸为度。&lt;br&gt;&lt;br&gt;　　二、去酸味、搅拌成糕浆：将碱用少量清水溶化，分次加入米浆内，边加边搅，至去掉酸味，再加入鸡蛋白、熟猪油、蜜桂花搅拌成糕浆。&lt;br&gt;&lt;br&gt;　　三、烙制成形：把特制铁烙碗置焦炭火上，待烧热后刷上水油，舀入糕浆，烙至封皮时，在糕中间加适量果酱，继续烙至皮显浅黄色，起硬壳时，用细铁签糕边划松，翻面淋少许熟猪油，烙至两面呈金黄色、皮软酥、糕心浆汁全部凝固时即成。装入1的烙碗内翻烙至金黄色，特色是酥香甜嫩。&lt;br&gt;&lt;br&gt;　　蓬溪熨斗糕是四川名小吃，始于1927年，由蓬溪县夏其宣创制，其将米、油、蛋、糖浆再加其他配料用铁烙碗烙熟食用。因制作的器具很像老式的熨斗，故名。蓬溪熨斗糕分甜、咸两种，外壳色黄偏棕色，外酥内嫩，甜香爽口，深受老人小孩喜爱。&lt;br&gt;&lt;br&gt;　　蓬溪熨斗糕外形美观有特色，现做现卖，热气腾腾，无须吆喝，香气一飘定会有许多老者和孩童前来光顾。吃完一两个后，老人回味良久而离去，小孩则仍吵着要带回去一个作夜宵，而后来者则嚷着：“该我了嘛，我脚都站麻了！”店主则满脸堆笑地说：“马上就好！马上就好！”这一幕幕的场景最能让出门在外的家乡人难以忘怀。&lt;br&gt;&lt;br&gt;　　蓬溪熨斗糕香甜而不腻口，滋润而不粘牙，特色的外形则最能勾起老蓬溪人的怀旧之情。&lt;/p&gt;\n', NULL, '{"audio":"","video":"","thumbnail":"","template":"","photos":[{"url":"default\\/20190312\\/ca8f20444ac5763e447670291bc4e498.jpg","name":"11360.gif.jpg"}]}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_tag`
--

CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 文章标签表';

--
-- 转存表中的数据 `cmf_portal_tag`
--

INSERT INTO `cmf_portal_tag` (`id`, `status`, `recommended`, `post_count`, `name`) VALUES
(1, 1, 0, 0, '糕');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_portal_tag_post`
--

CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

--
-- 转存表中的数据 `cmf_portal_tag_post`
--

INSERT INTO `cmf_portal_tag_post` (`id`, `tag_id`, `post_id`, `status`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_process`
--

CREATE TABLE `cmf_process` (
  `id` int(11) NOT NULL,
  `CommodityId` int(11) NOT NULL COMMENT '产品id',
  `Sku` varchar(255) DEFAULT NULL COMMENT 'SKU',
  `ErpOrderDetailNo` varchar(255) NOT NULL COMMENT '内部订单号',
  `PurchaseDetailId` int(11) NOT NULL COMMENT '采购单详情id',
  `examinePaper` tinyint(4) NOT NULL DEFAULT '0' COMMENT '鞋面审单',
  `openboard` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开板',
  `tracing` tinyint(4) NOT NULL DEFAULT '0' COMMENT '描版',
  `distributionBlanking` tinyint(4) NOT NULL DEFAULT '0' COMMENT '配料',
  `mixedIngredients` tinyint(4) NOT NULL DEFAULT '0' COMMENT '下料',
  `accessories` tinyint(4) DEFAULT '0' COMMENT '配辅料',
  `makeFace` tinyint(4) NOT NULL DEFAULT '0' COMMENT '做面',
  `examinePaperbottom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '鞋底审单',
  `threeD` tinyint(4) NOT NULL DEFAULT '0' COMMENT '3D',
  `last` tinyint(4) NOT NULL DEFAULT '0' COMMENT '楦',
  `outsole` tinyint(4) NOT NULL DEFAULT '0' COMMENT '大底',
  `midsole` tinyint(4) NOT NULL DEFAULT '0' COMMENT '中底',
  `totalmixedIngredients` tinyint(4) NOT NULL DEFAULT '0' COMMENT '总配料',
  `makeBottom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '做底',
  `drill` tinyint(4) NOT NULL DEFAULT '0' COMMENT '打眼',
  `stickingPad` tinyint(4) NOT NULL DEFAULT '0' COMMENT '贴垫',
  `inspection` tinyint(4) NOT NULL DEFAULT '0' COMMENT '品检',
  `packing` tinyint(4) NOT NULL DEFAULT '0' COMMENT '包装',
  `deliver` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交付',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `finishtime` datetime DEFAULT NULL COMMENT '完成时间',
  `start_status` tinyint(2) DEFAULT '0' COMMENT '开始状态0:未开始，1 ：开始，2：完成，3：取消，4：暂停 5：取消并存入库存',
  `product_mark` varchar(255) DEFAULT NULL COMMENT '生产流程上的通用备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程表';

--
-- 转存表中的数据 `cmf_process`
--

INSERT INTO `cmf_process` (`id`, `CommodityId`, `Sku`, `ErpOrderDetailNo`, `PurchaseDetailId`, `examinePaper`, `openboard`, `tracing`, `distributionBlanking`, `mixedIngredients`, `accessories`, `makeFace`, `examinePaperbottom`, `threeD`, `last`, `outsole`, `midsole`, `totalmixedIngredients`, `makeBottom`, `drill`, `stickingPad`, `inspection`, `packing`, `deliver`, `addtime`, `finishtime`, `start_status`, `product_mark`) VALUES
(1, 43785, 'WSV1905926', 'WJD0529082', 195940, 1, 2, 2, 1, 0, 1, 1, 1, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, '2020-06-09 09:51:14', NULL, 1, NULL),
(2, 146943, 'FJ8015740C07', 'WJD0402001', 195941, 1, 2, 2, 1, 0, 1, 0, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-05-28 03:25:39', NULL, 3, NULL),
(3, 105279, 'XY8018739D07', 'WJD0402005', 195942, 1, 2, 2, 1, 0, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:50:09', NULL, 1, NULL),
(4, 295341, 'XY8015098E09', 'WJD0402006', 195943, 1, 2, 2, 1, 0, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:50:09', NULL, 1, NULL),
(5, 44554, 'WS1906154B', 'WJD0402007', 195944, 1, 2, 2, 1, 0, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2020-06-10 01:15:11', NULL, 1, NULL),
(6, 144249, 'ws1908435', 'WJD0402008', 195945, 1, 2, 2, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 09:10:22', NULL, 1, NULL),
(7, 190092, 'ws1908569', 'WJD0402009', 195946, 1, 0, 0, 0, 0, 0, 0, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:50:09', NULL, 1, NULL),
(8, 190092, 'ws1908569', 'WJD0402010', 195947, 1, 2, 2, 1, 0, 1, 0, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:50:09', NULL, 1, NULL),
(9, 297084, 'FJ8021934B15', 'WJD0402013', 195948, 1, 2, 2, 1, 0, 1, 0, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:46:36', NULL, 1, NULL),
(10, 242653, 'XY8021069F95', 'WJD0402014', 195949, 1, 2, 2, 1, 0, 1, 0, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:50:09', NULL, 1, NULL),
(11, 285736, 'FJ8021398H08', 'WJD0402015', 195950, 1, 2, 2, 1, 0, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:49:35', NULL, 1, NULL),
(12, 226084, 'XY8021128A13', 'WJD0402016', 195951, 1, 2, 2, 0, 0, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:49:35', NULL, 1, NULL),
(13, 327211, 'YN8021937O11', 'WJD0402017', 195952, 1, 2, 2, 0, 0, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 08:09:02', NULL, 1, NULL),
(14, 341840, 'FJ802251511', 'WJD0402018', 195953, 1, 2, 2, 0, 0, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 08:09:02', NULL, 1, NULL),
(15, 229953, 'FJ8020836L11', 'WJD0402019', 195954, 1, 2, 2, 0, 0, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-09 09:49:35', NULL, 1, NULL),
(16, 173147, 'ws1908657', 'WJD0402020', 195955, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-10 07:51:32', NULL, 1, '44444'),
(17, 356452, 'FJ802080695A', 'WJD0402021', 195956, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 02:13:18', NULL, 1, NULL),
(18, 223094, 'FJ802107910', 'WJD0402022', 195957, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 02:13:18', NULL, 1, NULL),
(19, 44987, 'WS1906383', 'WJD0402023', 195958, 1, 2, 2, 1, 0, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, '2020-06-10 01:13:29', NULL, 1, NULL),
(20, 44533, 'WS1906148', 'WJD0402024', 195959, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 02:13:18', NULL, 1, NULL),
(21, 922, 'XY801509807', 'WJD0402025', 195960, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 08:02:03', NULL, 1, NULL),
(22, 280922, 'FJ802169911', 'WJD0402026', 195961, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 08:02:03', NULL, 1, NULL),
(23, 294654, 'FJ8021824C11', 'WJD0402027', 195962, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02 08:05:31', NULL, 1, NULL),
(24, 276650, 'FJ802158811', 'WJD0402028', 195963, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-05-26 06:51:12', NULL, 1, NULL),
(25, 41898, 'WS1905253', 'WJD0402029', 195964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-05-26 06:51:12', NULL, 1, NULL),
(26, 330588, 'FJ8021855Q10', 'WJD0402030', 195965, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-05-26 06:51:12', NULL, 1, NULL),
(27, 298826, 'YN8021937C07', 'WJD0402031', 195966, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-10 03:58:38', NULL, 1, NULL),
(28, 42766, 'W08015662', 'WJD0402032', 195967, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-10 03:58:38', NULL, 1, NULL),
(29, 328666, 'Y011682ME08', 'WJD0402033', 195968, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-10 06:59:45', NULL, 1, NULL),
(30, 409383, 'FOWT0000149C16', 'SHD0401028', 195969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-05-28 02:29:52', NULL, 5, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_process_stock`
--

CREATE TABLE `cmf_process_stock` (
  `id` int(11) NOT NULL,
  `process_id` int(11) DEFAULT NULL COMMENT '流程id',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态0；有效，1：无效',
  `band_process_id` int(11) DEFAULT NULL COMMENT '暂时绑定的流程id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_process_stock`
--

INSERT INTO `cmf_process_stock` (`id`, `process_id`, `status`, `band_process_id`) VALUES
(1, 30, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_productionlist`
--

CREATE TABLE `cmf_productionlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `Image` varchar(1024) DEFAULT NULL COMMENT '图片',
  `OrdeInfo` varchar(1024) DEFAULT NULL COMMENT '订单信息',
  `Sku` varchar(255) DEFAULT NULL COMMENT 'sku',
  `count` int(11) DEFAULT NULL COMMENT '数量\r\n',
  `ordernum` varchar(255) DEFAULT NULL COMMENT '网站订单号',
  `ErpOrderDetailNo` varchar(255) DEFAULT NULL COMMENT '内部订单号',
  `Size` varchar(100) DEFAULT NULL COMMENT '尺码',
  `Remark` varchar(1024) DEFAULT NULL COMMENT '生产备注',
  `CommodityRmark` varchar(1024) DEFAULT NULL COMMENT '产品备注',
  `OrderRemark` varchar(1024) DEFAULT NULL COMMENT '订单备注',
  `HeelNum` varchar(1024) DEFAULT NULL COMMENT '跟高',
  `AircraftBoard` varchar(255) DEFAULT NULL COMMENT '飞机板',
  `Face` varchar(255) DEFAULT NULL COMMENT '面板',
  `ShoeLast` varchar(255) DEFAULT NULL COMMENT '楦型',
  `Bottom` varchar(255) DEFAULT NULL COMMENT '大底',
  `Material` varchar(255) DEFAULT NULL COMMENT '材质',
  `WaterTableModel` varchar(1024) DEFAULT NULL COMMENT '水台型号',
  `WoodHeelModel` varchar(1024) DEFAULT NULL COMMENT '木跟型号',
  `BrandName` varchar(255) DEFAULT NULL COMMENT '品牌',
  `PurchasePrice` decimal(10,2) DEFAULT NULL COMMENT '采购价',
  `Createdate` datetime DEFAULT NULL COMMENT '创建采购单日期',
  `Urgent` varchar(10) DEFAULT NULL COMMENT '加急',
  `Manytimes` varchar(10) DEFAULT NULL COMMENT '是否多次',
  `FirstSpu` varchar(10) DEFAULT NULL COMMENT '是否第一次spu',
  `Addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间(如果添加生产流程，就会更新该字段)',
  `realname` varchar(255) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '文件名称',
  `isprocess` tinyint(4) DEFAULT '0' COMMENT '生成流程'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_productionlist`
--

INSERT INTO `cmf_productionlist` (`id`, `Image`, `OrdeInfo`, `Sku`, `count`, `ordernum`, `ErpOrderDetailNo`, `Size`, `Remark`, `CommodityRmark`, `OrderRemark`, `HeelNum`, `AircraftBoard`, `Face`, `ShoeLast`, `Bottom`, `Material`, `WaterTableModel`, `WoodHeelModel`, `BrandName`, `PurchasePrice`, `Createdate`, `Urgent`, `Manytimes`, `FirstSpu`, `Addtime`, `realname`, `filename`, `isprocess`) VALUES
(690, NULL, NULL, ' FJ8021855X09', 1, '1 113-4108538-2169036', 'WJD0423116', '做39印8美码', '', '无', '', '2017-17中号跟高12.2厘米', 'wj母1563', '分厂1233', '120楦 ', '黑', NULL, '', '', 'YDN', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:15:53', '2001大底.xls', 'upload/purchaselist/20200423041108.xls', 1),
(691, NULL, NULL, 'FJ020734HP08', 1, '111-1324317-8421002', 'WJD0423115', '做39印8美码', '', '无', 'Size：US/AU 8.5 - EU 38.5 - UK 6.5', '2017-17中号跟高12.2厘米5-6.5厘米', '分厂282', 'XX', '120楦', '米黑', NULL, '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:40:53', '2001大底.xls', 'upload/purchaselist/20200423041108.xls', 1),
(692, NULL, NULL, 'FJ8021133D09', 1, '112-4515223-8616229', 'WJD0423114', '9美码', '', '\n', 'Size：US/AU 8.5 - EU 38.5 - UK 6.5', '9---11厘米', ' wj母7049', 'wj母7456', 'D8005楦', '米黑 	', NULL, '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-05 09:52:32', '2001大底.xls', 'upload/purchaselist/20200423041108.xls', 1),
(693, NULL, NULL, 'XY8014265D15', 1, ' 111-2923669-7380228', 'WJD0423113 ', '15美码', '', '', '15美码', '1.5-2.5厘米木根暂无', ' 分厂694烧-708不打钉', 'wj母7415', '0805A楦', '内木跟无天皮米米', '绒面（深蓝色）', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:45:54', '2001大底.xls', 'upload/purchaselist/20200423041108.xls', 1),
(694, NULL, NULL, 'XY801867213', 1, '111-7407568-3405025', 'WJD0423111', '13美码', NULL, '放板号WJ344  烧-344-7-15-38-35-37-44', '', '10-13.5厘米/G9777中', '母版344', 'wj母1163烧-7207', '25A楦', '525前拆米米(做好做大底）', '羊纹  老黄里', '', '', 'FSJ', '200.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:15:43', '2001大底.xls', 'upload/purchaselist/20200423041108.xls', 1),
(695, NULL, NULL, 'YN8019324A14', 1, '113-7102542-1027440', 'WJD0401021', '14美码', '', '无', '', '0.5CM的天皮', 'wj母1563', '分厂1233', '0519楦', '黑', '绒面', '', '', 'YDN', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:37', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(696, NULL, NULL, 'ws1912292', 1, '100085055', 'WJD0401022', 'XX', '', '无', 'Size：US/AU 8.5 - EU 38.5 - UK 6.5', '5-6.5厘米', 'XX', 'XX', 'XX', '米米', '沙丁布+蕾丝', '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:37', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(697, NULL, NULL, 'WS1905567', 1, '100085056', 'WJD0401023', 'XXX', '', '烧-042947-37\n', 'Size：US/AU 8.5 - EU 38.5 - UK 6.5', '14-18cm', ' 分厂426', 'wj母7456', '0524135楦', '黑', 'Black', '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-04 17:16:37', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(698, NULL, NULL, 'ws1910354', 1, '100085057', 'WJD0401024', 'xxx', '', '', 'Size：US/AU 10 - EU 40 - UK 8', '12 cm', ' 分厂4852', 'wj母7415', '256楦', '米黑', '绒面（深蓝色）', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:37', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(699, NULL, NULL, 'WS1905060', 1, 'DIY100085040', 'WJD0401025', 'XXX', '美码7，定制跟高10.8cm,定制真皮！', '放板号WJ344  烧-344-7-15-38-35-37-44', '', '13-18 cm', '母版344', '分厂351', '25A楦', '525前拆米米(做好做大底）', '羊纹  老黄里', '', '', 'FSJ', '200.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:37', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(700, NULL, NULL, 'ws1911189', 1, 'DIY100085050', 'WJD0401026', 'xxx', '美码9.5，定制真皮！', '', '', '4.5--7厘米', '无', 'wj母7649', '0703楦', '米黑', '羊纹', '', '', 'FSJ', '240.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:37', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(701, NULL, NULL, 'WS1906417', 1, '100085059', 'WJD0401031', 'XXX', '', '特殊扣件烧-ws1906417', 'Size：US/AU 9 - EU 39 - UK 7', '10-13.5 cm', '分厂922', 'wj母1071', 'AB楦', '黑', 'Blue', '', '', 'FSJ', '170.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(702, NULL, NULL, 'ws1912749', 1, '100085058', 'WJD0401032', 'XX', '尺码改为美码11.', '无', 'Size：US/AU 13 - EU 43 - UK 11', '0.5厘米', '无', 'wj母9657', '0418A楦', '米色', '羊纹+纱网', '无', '暂无', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(703, NULL, NULL, 'WSO1906085', 1, 'DIY100085054', 'WJD0401033', 'XXX', '美码7，定制跟高8cm', '打黑色钉', '', '11-12.5 cm', '分厂284', '无', '120楦', '米黑', 'Black漆皮', '', '', 'FSJ', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(704, NULL, NULL, 'FJ8021841D11', 1, 'M113-6648585-7225058', 'WJD0401034', '11美码', '客人老订单WJD0215004是10美码，尺码偏小。请加急，4.10前发货！', '', '', '12厘米', '', 'wj母10451', 'B105-945楦', '', '蛇纹，蓝色', '', '', 'FSJ', '220.00', '2020-04-02 08:05:10', '加急', '否', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(705, NULL, NULL, 'FJ8019994F10', 1, '111-8175274-9348240', 'WJD0401035', '10美码', '', '无', '', '5377小号跟高5.5厘米', '分厂1644', 'wj母2320', '099楦厚中底', '米米', 'FSJ', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(706, NULL, NULL, 'FJ801256315', 1, '114-0543591-7999429', 'WJD0401036', '15美码', '', '无', '', '2017-17大号跟高12.5厘米', '无', '分厂285', '120楦', '米米', '裸色漆皮', '', '', 'FSJ', '120.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(707, NULL, NULL, 'ws1911558', 1, '100085062', 'WJD0401037', 'xxx', '', '', 'Size：US/AU 6 - EU 36 - UK 4', '水台4厘米左右，跟高14-18厘米', ' 分厂3691', 'wj母5649', '25A楦', '米黑', '黑色油皮  黑色内里', '776水台', '无', 'FSJ', '240.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(708, NULL, NULL, 'FJ8012173', 1, '100085062', 'WJD0401038', 'XXX', '', 'XXX', 'Size：US/AU 6 - EU 36 - UK 4', '12 cm', 'XXX', 'XXX', 'XXX', 'XXX', 'Navy', '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(709, NULL, NULL, 'ws1911620', 1, '100085061', 'WJD0401039', 'xxx', '', '', 'Size：US/AU 7 - EU 37 - UK 5', '水台2-3厘米，跟高12-16厘米 ', ' 分厂4245', 'wj母6574', '256楦', '黑', '黑色漆皮+黑色内里', '839水台', '无', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:38', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(710, NULL, NULL, 'WS1905701A', 1, '100085063', 'WJD0401040', 'XXX', '', '鞋后面有金色扣件  烧-wja080534-37', 'Size：US/AU 13 - EU 43 - UK 11', '14-18 cm', '无', 'wj母3742', 'AB-1楦', '米黑', '黑色羊纹 黑色内里', '', '', 'FSJ', '220.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(711, NULL, NULL, 'FJ8020050D15', 1, 'R111-1619197-9853008', 'WJD0401041', '15美码', '客人收到订单WJD0218016尺码偏小，订单WJD0218015买错尺码，已取消。', '', '', '12cm', '', 'wj母10584', '0728楦', '米米', '绒面', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(712, NULL, NULL, 'FJ801978915', 1, 'R111-1619197-9853008', 'WJD0401042', '15美码', '换货，原订单WJD0218016尺码偏小。', '无', '', '10-13.5cm', '无', '烧029', '25A楦', '米米', '羊纹', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(713, NULL, NULL, 'FJ8021855O85', 1, '701-4559647-6159407', 'WJD0401043', '8.5美码', '', 'xx', '', '12cm 暂无', '暂无', '烧285', '120楦', '米黑', '如图', '', '', 'FSJ', '240.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(714, NULL, NULL, 'FJ8020755H15', 1, '702-0744144-6458629', 'WJD0401044', '15美码', '', 'xx', '', '2017-17大号跟高12.5厘米', '分厂10480', 'wj母10480', '005963楦', '米黑', '如图', '无', '无', 'FSJ', '240.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(715, NULL, NULL, 'XY8014010B85', 1, '112-8427432-6453034', 'WJD0401045', '8.5美码', '', '烧-210', '', '9-12厘米暂无', 'XX', '烧-210', '25B楦', '（粗跟卷尾）米米', '如图', '', '', 'XYD', '200.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(716, NULL, NULL, 'XY8022663E85', 1, '112-8427432-6453034', 'WJD0401046', '8.5美码', '', '', '', '10-13.5厘米', '', '', '', '', '羊纹，黑色', '', '', 'XYD', '200.00', '2020-04-02 08:05:10', '否', '否', '是', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(717, NULL, NULL, 'FJ801256465', 1, '702-5167609-8795422', 'WJD0401067', '6.5美码', '', '无', '', '2017-17小号跟高11.5厘米', '无', '分厂285', '120楦', '米米', '黑色漆皮', '', '', 'FSJ', '120.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(718, NULL, NULL, 'ws1912985', 1, 'R100083083', 'WJD0401068', 'XX', '换货，美码7，请注意图片是粗跟。发货前请拍照！保持鞋子干净（原工厂订单WJD0213353偏大且粗跟做成了细跟）', '无', '', '7-9.5厘米', '分厂10359', 'wj母13059', '0308A楦', '米米', '羊纹', '无', '暂无', 'FSJ', '200.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(719, NULL, NULL, 'FJ802204111', 1, '113-7789051-7211418', 'WJD0401074', '11美码', '', 'xx', '', '5-6.5厘米', '分厂10034', 'WJM8307', 'B65-985楦', 'X50-55-4木跟）米黑', '羊纹+蛇纹', '', '', 'FSJ', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:39', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(720, NULL, NULL, 'XY8021531L08B', 1, '112-2096850-5723409', 'WJD0401075', '8美码', '', '', '', '318中号跟高11.5厘米', 'XX', 'WJ母5813', 'AB楦特加厚中底', '米米', '绒面', 'XX', 'XX', 'XYD', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:40', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(721, NULL, NULL, 'w08018685D', 1, '100085069', 'WJD0401076', 'XX', '', '无', 'Size：US/AU 6 - EU 36 - UK 4', '4-16码0.5厘米天皮', '无', 'wj母10366', 'D5-06楦', '米米（单底+天皮）', '如图', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-04 17:16:40', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(722, NULL, NULL, 'ws1912599', 1, '100085071', 'WJD0401077', 'XX', '', '无', 'Size：US/AU 9.5 - EU 39.5 - UK 7.5', '10-12.5厘米', 'XX', 'XX', 'XX', '米米', '蛇纹', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-04 17:16:40', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(723, NULL, NULL, 'ws1908002', 1, '100085071', 'WJD0401078', '', '', '', 'Size：US/AU 9.5 - EU 39.5 - UK 7.5', '12 cm', '', '', '', '', '', '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '是', '是', '2020-05-04 17:16:40', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(724, NULL, NULL, 'ws1913849', 1, '100085070', 'WJD0401079', 'XXX', '', '', 'Size：US/AU 5.5 - EU 35.5 - UK 3.5', '11-12.5厘米', '', '', '', '', '沙丁布', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-04 17:16:40', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(725, NULL, NULL, 'WSV1905926', 1, '100085072', 'WJD0401080', 'XXX', '', '无', 'Size：US/AU 13 - EU 43 - UK 11', '暂无', '无', 'wj母1724', 'x100-123楦', '黑', '漆皮', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(726, NULL, NULL, 'FJ8015740C07', 1, '113-7010857-6237027', 'WJD0402001', '7美码', '', '有蝴蝶结', '', '跟高10cm', '分厂420', '暂无', 'X100-06楦', '米黑', '如图', '', '', 'FSJ', '140.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(727, NULL, NULL, 'XY8018739D07', 1, '112-0539110-7389037', 'WJD0402005', '7美码', '', '烧-wjm5229  棕色内里', '', '38A641中号跟高8.5厘米', 'xx', '烧-wjm5229  棕色内里', 'D80-137楦', '米黑', '棕色内里', '', '', 'XYD', '220.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(728, NULL, NULL, 'XY8015098E09', 1, '114-8580443-2757848', 'WJD0402006', '9美码', '', 'xx', '', '5377小号跟高5.5厘米', '分厂252', 'wj母864  烧-1311', 'X55-099楦厚中底', '米米', '沙丁布+绒面', '', '', 'XYD', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(729, NULL, NULL, 'WS1906154B', 1, '100085076', 'WJD0402007', 'XXX', '', 'XXX', 'Size：US/AU 8.5 - EU 38.5 - UK 6.5', '14cm', 'XXX', 'XXX', 'XXX', 'XXX', 'Yellow', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '是', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(730, NULL, NULL, 'ws1908435', 1, '100085077', 'WJD0402008', '订单37.5码做37码', '', '无', 'Size：US/AU 6.5 - EU 36.5 - UK 4.5', '4-5码1888中号	6--7码1130中号跟高11厘米	8-10码1650大号跟高12厘米	11-16码1161中号跟高12.5厘米', '无', 'wj母2557', '005963楦', '米米', '绒面', '无', '无', 'FSJ', '300.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(731, NULL, NULL, 'ws1908569', 1, '100085077', 'WJD0402009', 'XXX', '', '', 'Size：US/AU 6.5 - EU 36.5 - UK 4.5', '8-10 cm', '无', 'wj母4908', 'd8005楦', '米米', '油皮', '', '', 'FSJ', '300.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(732, NULL, NULL, 'ws1908569', 1, '100085077', 'WJD0402010', 'XXX', '先不做，客人可能重复下单了。 04.02 ECHO', '', 'Size：US/AU 6.5 - EU 36.5 - UK 4.5', '8-10 cm', '无', 'wj母4908', 'd8005楦', '米米', '油皮', '', '', 'FSJ', '300.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-26 14:51:06', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(733, NULL, NULL, 'FJ8021934B15', 1, '113-8459386-5293850', 'WJD0402013', '15美码', '', 'xx', '', '5-7厘米', 'xx', 'xx', 'xx', 'xx', '绒面', '', '', 'FSJ', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(734, NULL, NULL, 'XY8021069F95', 1, '111-3043557-6463428', 'WJD0402014', '9.5美码', '', 'xx', '', '0.5厘米天皮 暂无', '无', 'wj母5861', 'D5-06楦', '米米（单底+天皮）', '绒面+沙丁布+纱网', '', '', 'XYD', '200.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(735, NULL, NULL, 'FJ8021398H08', 1, '111-3684852-5053045', 'WJD0402015', '8美码', '', 'xx', '', '9706中号跟高8.2厘米', '分厂3704', 'wj母5675', '080310楦', '米米', '白色漆皮  针扣条带白色羊纹  棕色内里', '', '', 'FSJ', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(736, NULL, NULL, 'XY8021128A13', 1, '112-3998586-9018646', 'WJD0402016', '13美码', '', 'XX', '', '跟高：12-16厘米，水台：1.5-2厘米', ' 分厂4076', 'wj母6333', '126楦', '米米', '漆皮', '', '', 'XYD', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(737, NULL, NULL, 'YN8021937O11', 1, '114-8715631-9811428', 'WJD0402017', '11美码', '', 'xx', '', '3-5cm-暂无', '分厂4903', 'WJ 7473', 'B30-857楦', '米黑（单叉月牙+方底板）', '如图', '', '', 'YDN', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(738, NULL, NULL, 'FJ802251511', 1, '114-6288166-0805017', 'WJD0402018', '11美码', '', '', '', '10.5厘米', '分厂9949', 'wj母9949', '2018楦', '米黑', '羊纹+TPU', '', '', 'FSJ', '260.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(739, NULL, NULL, 'FJ8020836L11', 1, '113-8251758-4234626', 'WJD0402019', '11美码', '', 'xxx', '', '2017-17中号跟高12厘米', '无', 'wj母4625', '120楦', '米米', '羊纹（黑色）（白色）棕色内里', '', '', 'FSJ', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(740, NULL, NULL, 'ws1908657', 1, '100085082', 'WJD0402020', 'XXX', '', '', 'Size：US/AU 11 - EU 41 - UK 9', '8 cm', '无', 'wj母3554', '0031楦', '米米', '绒面+格利特', '', '', 'FSJ', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(741, NULL, NULL, 'FJ802080695A', 1, '112-0372160-0784263', 'WJD0402021', '9.5美码', '', '', '', '8CM', '', 'wjm4827', 'D80-258楦', '米米', '羊纹+豹纹,蓝色', '', '', 'FSJ', '200.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:07', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(742, NULL, NULL, 'FJ802107910', 1, '112-0372160-0784263', 'WJD0402022', '10美码', '', '无', '', '9--11厘米', '', '', '', '', '绒面+羊纹+漆皮', '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '否', '是', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(743, NULL, NULL, 'WS1906383', 1, '100085085', 'WJD0402023', 'XXX', '', 'XXX', 'Size：US/AU 13.5 - EU 43.5 - UK 11.5', '3-7码776小号跟高15.4厘米，8-9码776中号15.7厘米，10码跟高16厘米，11-13码776加大号跟高16.5厘米，14-16码1391小号跟高17.8厘米', '无', 'wj母5988', '25A楦', '米米', '(白色）漆皮', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(744, NULL, NULL, 'WS1906148', 1, '100085085', 'WJD0402024', 'XXX', '', '无', 'Size：US/AU 13.5 - EU 43.5 - UK 11.5', '14-18cm', '暂无', '无', '25A楦', '776水台米米（大底包豹纹面料）', 'Beige', '', '', 'FSJ', '200.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(745, NULL, NULL, 'XY801509807', 1, '113-2195955-7502646', 'WJD0402025', '7美码', '', '鞋上有钻', '', '5377小号跟高5.5厘米', '分厂252', 'wj母864  烧-1311', 'X55-099楦厚中底', '米米', '如图', '', '', 'XYD', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(746, NULL, NULL, 'FJ802169911', 1, '112-5503605-6325023', 'WJD0402026', '11美码', '', 'xx', '', '10-13.5厘米', ' 分厂4351', 'wj母6735', '256楦', '米米', '沙丁布', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(747, NULL, NULL, 'FJ8021824C11', 1, '112-5503605-6325023', 'WJD0402027', '11美码', '', 'xx', '', '10-13.5厘米', ' 分厂4879', 'wj母7450', '25A楦', '米黑', '沙丁布', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(748, NULL, NULL, 'FJ802158811', 1, '112-5503605-6325023', 'WJD0402028', '11美码', '', '无', '', '1650大号跟高12厘米', ' 分厂3989', 'wj母6212', '25A楦厚中底', '米黑', '漆皮', '', '', 'FSJ', '180.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(749, NULL, NULL, 'WS1905253', 1, '100085086', 'WJD0402029', 'XXX', '', 'XXX', 'Size：US/AU 13.5 - EU 43.5 - UK 11.5', '14cm', 'XXX', 'XXX', 'XXX', 'XXX', 'White', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '是', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(750, NULL, NULL, 'FJ8021855Q10', 1, '701-0667857-5334627', 'WJD0402030', '10美码', '', 'xx', '', '12cm 暂无', '暂无', '烧285', '120楦', '米黑', '如图', '', '', 'FSJ', '220.00', '2020-04-02 08:05:10', '否', '是', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(751, NULL, NULL, 'YN8021937C07', 1, '112-3477110-0226631', 'WJD0402031', '7美码', '', 'xx', '', '3-5cm-暂无', '分厂4903', 'WJ 7473', 'B30-857楦', '米黑（单叉月牙+方底板）', '漆皮', '', '', 'YDN', '150.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:08', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(752, NULL, NULL, 'W08015662', 1, '100085087', 'WJD0402032', 'XXX', '', '无', 'Size：US/AU 9 - EU 39 - UK 7', '6CM 以下', '无', 'wj母2193', 'A50楦', '棕棕', 'Brown', '', '', 'FSJ', '300.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:09', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(753, NULL, NULL, 'Y011682ME08', 1, '111-3561509-5497811', 'WJD0402033', '8美码', '', '', '', '水台5cm,跟高17cm', '', '', '', '', '漆皮, 裸色', '', '', 'FSJ', '160.00', '2020-04-02 08:05:10', '否', '否', '否', '2020-05-26 14:51:09', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(754, NULL, NULL, 'FOWT0000149C16', 1, '113-3601120-7517018', 'SHD0401028', '16美码', '', '', '', '14-18厘米', '', '烧-9507', '25B楦', '米米', '', '', '', 'FOWT', '0.00', '2020-04-02 08:06:19', '否', '否', '否', '2020-05-26 14:51:09', '2001.xls', 'upload/purchaselist/20200504051442.xls', 1),
(755, NULL, NULL, 'FOWT0000205C75', 1, '112-6695578-9271469', 'SHD0401029', '7.5美码', '', '', '', '7-9厘米', '', 'WJM8075', 'JT70楦', '米米', '', '', '', 'FOWT', '160.00', '2020-04-02 08:06:19', '否', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(756, NULL, NULL, 'FOWT14001D85', 1, '111-0510388-4682644', 'SHD0401030', '8.5 M US', '', '', '', '1 cm', ' 分厂4616', 'wj母7110', 'B05-88楦', '单底加双层月牙天皮', '', '', '', 'FOWT', '0.00', '2020-04-02 08:06:19', '否', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(757, NULL, NULL, 'SOLA600+Color03+6.5', 1, '8012114990860221', 'SHD0401047', '6.5美码', '无忧直运，加急三天出货，请注意按照正确的鞋型做', '', '', '跟高:13-15厘米;水台:3-4厘米', '', '烧DG3806', '25A楦', '请注意大底颜色', '如图', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '加急', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(758, NULL, NULL, 'SOLA600+Color03+6.5', 1, '8012162780157495', 'SHD0401048', '6.5美码', '无忧直运，加急3天出货，请按照图片做正确的鞋型', '', '', '跟高:13-15厘米;水台:3-4厘米', '', '烧DG3806', '25A楦', '请注意大底颜色', '如图', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '加急', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(759, NULL, NULL, 'TYA1300+TY01+7', 1, '8012207971107549', 'SHD0401049', '7美码', '无忧直运，加急三天出货', '', '', '9~11cm', '如图', '9~11cm', '', '', '如图', 'https://ae01.alicdn.com/kf/HTB1ZRXQB2uSBuNkHFqDq6xfhVXab.jpg,https://ae01.alicdn.com/kf/HTB1Sh0oB5OYBuNjSsD4q6zSkFXad.jpg,https:', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '加急', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(760, NULL, NULL, 'FSJ23124+FSJ02+4', 1, '3003635250899384', 'SHD0401050', '4美码', '', '', '', '跟高：6-7厘米 水台4-5厘米', '', '', '', '', '如图', '', '', '三槐-FSJ', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(761, NULL, NULL, 'FSJ23124+FSJ04+4', 1, '3003635250899384', 'SHD0401051', '4美码', '', '', '', '跟高：6-7厘米 水台4-5厘米', '', '', '', '', '如图', '', '', '三槐-FSJ', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(762, NULL, NULL, 'TYNR-068+TY01+4', 1, '3003635250879384', 'SHD0401052', '4美码', '', '', '', '水台：5~6cm 跟高：8~10cm', '', '', '', '', '', '', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '加急', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(763, NULL, NULL, 'FSJC040101', 1, '8012087783009002', 'SHD0401053', '14美码', '', '客户定制', '', '客户定制', '', '酒红色的反光真漆皮', '', '', '', '', '', '三槐-FSJ', '0.00', '2020-04-02 08:06:19', '加急', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(764, NULL, NULL, 'SONR-250+SO01+13.5', 1, '3003654515103385', 'SHD0401054', '13.5美码', '', '', '', '11-13厘米', '', '', '', '', '如图', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(765, NULL, NULL, 'SOB00129+SO02+14', 1, '8012078965896768', 'SHD0401055', '14美码', '', '', '', '10-11厘米', '', '', '', '', '如图', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(766, NULL, NULL, 'TYLD142+TY02+14', 1, '8012078965856768', 'SHD0401056', '14美码', '', '', '', '', '分厂10699', 'wj母10699', '0607楦', '米黑', '', '', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '加急', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(767, NULL, NULL, 'TYB0386+TY01+14', 1, '8012078965856768', 'SHD0401057', '14美码', '', '', '', '水台：3~4cm  跟高：14~16cm', '', '', '', '', '', '', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '加急', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(768, NULL, NULL, 'TYNR-221+TY01+14', 1, '8012078965856768', 'SHD0401058', '14美码', '', '', '', '跟高：10~12cm', '', '', '', '', '', '', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '加急', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(769, NULL, NULL, 'SOB0105+SO01+11.5', 1, '3003649247866205', 'SHD0401059', '11.5美码', '', '', '', '跟高:14-17厘米;水台:3-5厘米', '', 'WJM9574', '25A楦', '', '如图，SO01', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '否', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(770, NULL, NULL, 'TY14034613+2+12', 1, '8012117666837525', 'SHD0401060', '12美码', '', '', '', '水台：3~5cm 跟高：14~18cm', '', '', '', '', '', '', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '否', '否', '否', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(771, NULL, NULL, 'FSJLA101+Gold+16', 1, '8012092722084727', 'SHD0401061', '16美码', '', '', '', '10-12厘米', '', '', '', '', '如图', '', '', '三槐-FSJ', '0.00', '2020-04-02 08:06:19', '否', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(772, NULL, NULL, 'SOLA491+SO03+15.5', 1, '3003672273660797', 'SHD0401062', '15.5美码', '', '', '', '10-12厘米', '', '', '', '', '如图', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(773, NULL, NULL, 'ws1909304+FSJ01+6', 1, '3003644064683293', 'SHD0401063', '6美码', '', '', '', '5-6厘米', '', '', '', '', '如图', '', '', '三槐-FSJ', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(774, NULL, NULL, 'TY34019813+2+7.5', 1, '8012122814218836', 'SHD0401064', '7.5美码', '', '', '', '水台：2~3cm  跟高：11~14cm', '', '', '', '', '', '', '', '三槐-Nancyjayjii', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(775, NULL, NULL, 'SOB0116+SO01+6.5', 1, '5002752314761303', 'SHD0401065', '6.5美码', '漏单，加急三天出货', '', '', '8-9厘米', '', '', '', '', '如图', '', '', '三槐-SHOFOO', '0.00', '2020-04-02 08:06:19', '加急', '否', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0),
(776, NULL, NULL, 'FSJC040102', 1, '8012080787969002', 'SHD0401066', '14美码', '', '客户定制', '', '客户定制', '', '蛇纹真皮', '', '', '', '', '', '三槐-FSJ', '0.00', '2020-04-02 08:06:19', '加急', '是', '是', NULL, '2001.xls', 'upload/purchaselist/20200504051442.xls', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_purchasedetail`
--

CREATE TABLE `cmf_purchasedetail` (
  `Id` int(255) NOT NULL,
  `FactoryId` int(255) DEFAULT NULL,
  `PurchaseListId` int(255) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL,
  `CommodityId` int(255) DEFAULT NULL,
  `Quantity` varchar(255) DEFAULT NULL,
  `OrderId` int(255) DEFAULT NULL,
  `OrderDetailId` int(255) DEFAULT NULL,
  `ErpOrderDetailNo` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `ProduceStatus` tinyint(4) DEFAULT NULL,
  `ProduceLastUpdateTime` datetime(3) DEFAULT NULL,
  `CurrentProcedureCodes` varchar(255) DEFAULT NULL,
  `CompleteProcedureCodes` varchar(255) DEFAULT NULL,
  `ProcedureStartTime` datetime DEFAULT NULL,
  `ProcedureEndTime` datetime DEFAULT NULL,
  `WithholdMoney` float(255,0) DEFAULT NULL,
  `LastWithholdTime` datetime DEFAULT NULL,
  `AddTime` datetime(3) DEFAULT NULL,
  `IsDelete` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_purchasedetail`
--

INSERT INTO `cmf_purchasedetail` (`Id`, `FactoryId`, `PurchaseListId`, `Status`, `CommodityId`, `Quantity`, `OrderId`, `OrderDetailId`, `ErpOrderDetailNo`, `Remark`, `ProduceStatus`, `ProduceLastUpdateTime`, `CurrentProcedureCodes`, `CompleteProcedureCodes`, `ProcedureStartTime`, `ProcedureEndTime`, `WithholdMoney`, `LastWithholdTime`, `AddTime`, `IsDelete`) VALUES
(1, 4, 1, 0, 41867, '1', 1, 1, 'WJA061201', 'Size：US 9.5 - EU 40 - UK 7', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(2, 4, 1, 0, 41336, '1', 2, 2, 'WJA061202', 'Size：US 11.5 - EU 42.5 - UK 9.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(3, 4, 1, 0, 41379, '1', 3, 3, 'WJA061203', 'Size：US 7 - EU 37 - UK 4', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(4, 4, 1, 0, 42396, '1', 3, 4, 'WJA061204', 'Size：US 7 - EU 37 - UK 4', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(5, 4, 1, 0, 41662, '1', 3, 5, 'WJA061205', 'Size：US 7 - EU 37 - UK 4', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(6, 4, 1, 0, 41867, '1', 4, 6, 'WJA061206', 'Size：US 11.5 - EU 42.5 - UK 9.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(7, 4, 1, 0, 41685, '1', 5, 7, 'WJA061207', 'Size：US 10 - EU 41 - UK 8', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(8, 4, 1, 0, 42548, '1', 6, 8, 'WJA061208', 'Size：US 10 - EU 41 - UK 8', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(9, 4, 1, 0, 43775, '1', 7, 9, 'WJA061209', 'Size：US 13 - EU 44 - UK 11', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(10, 4, 1, 0, 43518, '1', 8, 10, 'WJA061210', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(11, 4, 1, 1, 41829, '1', 9, 11, 'WJA061211', 'Size：US 7.5 - EU 37.5 – UK 4.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(12, 4, 1, 1, 21041, '1', 10, 12, 'WJA061212', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(13, 4, 1, 1, 53785, '1', 11, 13, 'WJA061213', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(14, 4, 1, 1, 52716, '1', 12, 14, 'WJA061214', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(15, 4, 1, 1, 28801, '1', 13, 15, 'WJA061215', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(16, 4, 1, 1, 27470, '1', 14, 16, 'WJA061216', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(17, 4, 1, 1, 29128, '1', 15, 17, 'WJA061217', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(18, 4, 1, 1, 37593, '1', 15, 18, 'WJA061218', '', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(19, 4, 1, 1, 41829, '1', 16, 19, 'WJA061301', 'Size：US 11.5 - EU 42.5 - UK 9.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(20, 4, 1, 1, 41335, '1', 17, 20, 'WJA061302', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(21, 4, 1, 1, 41403, '1', 17, 21, 'WJA061303', 'Size：US 11 - EU 42 - UK 9', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(22, 4, 1, 1, 44913, '1', 18, 22, 'WJA061304', 'Size：US 11.5 - EU 42.5 - UK 9.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(23, 4, 1, 1, 42548, '1', 19, 23, 'WJA061305', 'Size：US 6  - EU 36 - UK 3', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(24, 4, 1, 1, 41472, '1', 20, 24, 'WJA061306', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(25, 4, 1, 1, 43142, '1', 21, 25, 'WJA061307', 'Size：US 6  - EU 36 - UK 3', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(26, 4, 1, 1, 42548, '1', 22, 26, 'WJA061308', 'Size：US 10 - EU 41 - UK 8', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(27, 4, 1, 1, 83599, '1', 23, 27, 'WJA061309', 'Size：US 14 - EU 45 - UK 12', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(28, 4, 1, 1, 43436, '1', 24, 28, 'WJA061310', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(29, 4, 1, 1, 43522, '1', 25, 29, 'WJA061311', 'Size：US 5.5 - EU 35.5 – UK 2.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(30, 4, 1, 1, 41867, '1', 26, 30, 'WJA061312', 'Size：US 7.5 - EU 37.5 – UK 4.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(31, 4, 1, 1, 41682, '1', 27, 31, 'WJA061313', 'Size：US 8 - EU 38 - UK 5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(32, 4, 1, 1, 41661, '1', 28, 32, 'WJA061314', 'Size：US 6.5 - EU 36.5 – UK 3.5', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(33, 4, 1, 1, 42044, '1', 29, 33, 'WJA061315', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(34, 4, 1, 1, 43474, '1', 30, 34, 'WJA061316', 'Size：US 7 - EU 37 - UK 4', 0, '2017-06-13 11:18:22.133', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:18:22.133', 0),
(35, 4, 2, 1, 20591, '1', 31, 35, 'WJA061317', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(36, 4, 2, 1, 19335, '1', 32, 36, 'WJA061318', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(37, 4, 2, 1, 19377, '1', 32, 37, 'WJA061319', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(38, 4, 2, 1, 19349, '1', 32, 38, 'WJA061320', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(39, 4, 2, 1, 21693, '1', 33, 39, 'WJA061321', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(40, 4, 2, 1, 83600, '1', 34, 40, 'WJA061322', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(41, 4, 2, 1, 20350, '1', 34, 41, 'WJA061323', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(42, 4, 2, 1, 23537, '1', 35, 42, 'WJA061324', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(43, 4, 2, 1, 923, '1', 36, 43, 'WJA061325', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(44, 4, 2, 1, 633, '1', 37, 44, 'WJA061326', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(45, 4, 2, 1, 28587, '1', 38, 45, 'WJA061327', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(46, 4, 2, 1, 83598, '1', 39, 46, 'WJA061328', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(47, 4, 2, 1, 36637, '1', 40, 47, 'WJA061329', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(48, 4, 2, 1, 36584, '1', 41, 48, 'WJA061330', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(49, 4, 2, 1, 35500, '1', 42, 49, 'WJA061331', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(50, 4, 2, 1, 19038, '1', 43, 50, 'WJA061332', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(51, 4, 2, 1, 25332, '1', 44, 51, 'WJA061333', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(52, 4, 2, 1, 23750, '1', 45, 52, 'WJA061334', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(53, 4, 2, 1, 18478, '1', 46, 53, 'WJA061335', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(54, 4, 2, 1, 25569, '1', 47, 54, 'WJA061336', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(55, 4, 2, 1, 25364, '1', 48, 55, 'WJA061337', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(56, 4, 2, 1, 23369, '1', 48, 56, 'WJA061338', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(57, 4, 2, 1, 28825, '1', 49, 57, 'WJA061339', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(58, 4, 2, 1, 28960, '1', 50, 58, 'WJA061340', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(59, 4, 2, 1, 27915, '1', 51, 59, 'WJA061341', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(60, 4, 2, 1, 28882, '1', 52, 60, 'WJA061342', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(61, 4, 2, 1, 34952, '1', 53, 61, 'WJA061343', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(62, 4, 2, 1, 34994, '1', 53, 62, 'WJA061344', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(63, 4, 2, 1, 32390, '1', 54, 63, 'WJA061345', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(64, 4, 2, 1, 31407, '0', 54, 64, 'WJA061346', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(65, 4, 2, 1, 18305, '1', 55, 65, 'WJA061347', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(66, 4, 2, 1, 18115, '1', 56, 66, 'WJA061348', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(67, 4, 2, 1, 21039, '1', 57, 67, 'WJA061349', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(68, 4, 2, 1, 21040, '1', 58, 68, 'WJA061350', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(69, 4, 2, 1, 77049, '1', 59, 69, 'WJA061351', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(70, 4, 2, 1, 30419, '1', 60, 70, 'WJA061352', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(71, 4, 2, 1, 28708, '1', 60, 71, 'WJA061353', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(72, 4, 2, 1, 26861, '1', 60, 72, 'WJA061354', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(73, 4, 2, 1, 42395, '1', 61, 73, 'WJA061355', 'Size：US 7 - EU 37 - UK 4', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(74, 4, 2, 1, 27827, '1', 62, 74, 'WJA061356', NULL, 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(75, 4, 2, 1, 41909, '1', 63, 75, 'WJA061357', 'Size：US 8.5 - EU 38.5 - UK 6.5', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(76, 4, 2, 1, 41836, '1', 64, 76, 'WJA061358', 'Size：US 8.5 - EU 38.5 - UK 6.5', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(77, 4, 2, 1, 43518, '1', 65, 77, 'WJA061359', 'Size：US 11 - EU 42 - UK 9', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(78, 4, 2, 1, 30958, '1', 66, 78, 'WJA061360', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(79, 4, 2, 1, 932, '1', 67, 79, 'WJA061361', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(80, 4, 2, 1, 20323, '1', 68, 80, 'WJA061362', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(81, 4, 2, 1, 41801, '1', 69, 81, 'WJA061363', 'Size：US 8 - EU 38 - UK 5', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(82, 4, 2, 1, 42498, '1', 69, 82, 'WJA061364', 'Size：US 8 - EU 38 - UK 5', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(83, 4, 2, 1, 80566, '1', 70, 83, 'WJA061365', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 11:33:22.057', 0),
(84, 4, 2, 3, 26971, '1', 71, 84, 'WJA061366', '', 0, '2017-06-13 11:33:22.057', NULL, NULL, NULL, NULL, NULL, NULL, '2017-06-13 11:33:22.057', 0),
(85, 4, 3, 1, 60442, '1', 72, 85, 'WJA061367', '', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(86, 4, 3, 1, 37162, '1', 73, 86, 'WJA061368', '', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(87, 4, 3, 1, 843, '1', 74, 87, 'WJA061369', '', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(88, 4, 3, 1, 20366, '1', 75, 88, 'WJA061370', '', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(89, 4, 3, 1, 44436, '1', 76, 89, 'WJA061371', 'Size：US 4 - EU 34 – UK 1', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(90, 4, 3, 1, 44333, '1', 77, 90, 'WJA061372', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(91, 4, 3, 1, 41685, '1', 77, 91, 'WJA061373', 'Size：US 8.5 - EU 38.5 - UK 6.5', 0, '2017-06-13 13:33:49.070', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 13:33:49.070', 0),
(92, 4, 4, 1, 50156, '1', 78, 92, 'WJA061374', '', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(93, 4, 4, 1, 43384, '1', 79, 93, 'WJA061375', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(94, 4, 4, 1, 42935, '1', 79, 94, 'WJA061376', 'Size：US 9 - EU 39 - UK 6', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(95, 4, 4, 1, 42935, '1', 79, 95, 'WJA061377', 'Size：US 8 - EU 38 - UK 5', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(96, 4, 4, 1, 51909, '1', 80, 96, 'WJA061378', '', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(97, 4, 4, 1, 25519, '1', 81, 97, 'WJA061379', '', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(98, 4, 4, 1, 23523, '1', 82, 98, 'WJA061380', '', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(99, 4, 4, 1, 41829, '1', 83, 99, 'WJA061381', 'Size：US 9.5 - EU 40 - UK 7', 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(100, 4, 4, 1, 34245, '1', 84, 100, 'WJA061382', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(101, 4, 4, 1, 73430, '1', 85, 101, 'WJA061383', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(102, 4, 4, 1, 22455, '1', 86, 102, 'WJA061384', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(103, 4, 4, 1, 63160, '1', 87, 103, 'WJA061385', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(104, 4, 4, 1, 83601, '1', 88, 104, 'WJA061386', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(105, 4, 4, 1, 83602, '1', 89, 105, 'WJA061387', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(106, 4, 4, 1, 83609, '1', 90, 106, 'WJA061388', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(107, 4, 4, 1, 21042, '1', 91, 107, 'WJA061389', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(108, 4, 4, 1, 34130, '1', 92, 108, 'WJA061390', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(109, 4, 4, 1, 27438, '1', 93, 109, 'WJA061391', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0),
(110, 4, 4, 1, 20301, '1', 94, 110, 'WJA061392', NULL, 0, '2017-06-13 16:49:45.240', NULL, NULL, NULL, NULL, 0, NULL, '2017-06-13 16:49:45.240', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_purchaselist`
--

CREATE TABLE `cmf_purchaselist` (
  `Id` int(11) NOT NULL,
  `FactoryId` int(11) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL,
  `PurchaseNo` varchar(255) DEFAULT NULL,
  `ConfirmTime` datetime(3) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `CompleteTime` datetime DEFAULT NULL,
  `Remark` varchar(1024) DEFAULT NULL,
  `CreateMagUserId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `IsDelete` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购列表';

--
-- 转存表中的数据 `cmf_purchaselist`
--

INSERT INTO `cmf_purchaselist` (`Id`, `FactoryId`, `Status`, `PurchaseNo`, `ConfirmTime`, `UpdateTime`, `CompleteTime`, `Remark`, `CreateMagUserId`, `AddTime`, `IsDelete`) VALUES
(1, 4, 0, 'PHJR2017061301', '2017-06-13 11:18:22.133', '2017-06-13 11:18:22', NULL, NULL, 7, '2017-06-13 11:18:22', 0),
(2, 4, 0, 'PHJR2017061302', '2017-06-13 11:33:22.057', '2017-06-13 11:33:22', NULL, NULL, 7, '2017-06-13 11:33:22', 0),
(3, 4, 0, 'PHJR2017061303', '2017-06-13 13:33:49.070', '2017-06-13 13:33:49', NULL, NULL, 1, '2017-06-13 13:33:49', 0),
(4, 4, 0, 'PHJR2017061304', '2017-06-13 16:49:45.240', '2017-06-13 16:49:45', NULL, NULL, 1, '2017-06-13 16:49:45', 0),
(5, 6, 0, 'Pslfc2017061305', '2017-06-13 17:53:48.443', '2017-06-13 17:53:48', NULL, NULL, 4, '2017-06-13 17:53:48', 0),
(6, 4, 0, 'PHJR2017061401', '2017-06-14 08:21:48.737', '2017-06-14 08:21:49', NULL, NULL, 4, '2017-06-14 08:21:49', 0),
(7, 4, 0, 'PHJR2017061402', '2017-06-14 08:21:57.137', '2017-06-14 08:21:57', NULL, NULL, 4, '2017-06-14 08:21:57', 0),
(8, 4, 0, 'PHJR2017061403', '2017-06-14 08:22:05.470', '2017-06-14 08:22:05', NULL, NULL, 4, '2017-06-14 08:22:05', 0),
(9, 6, 0, 'Pslfc2017061404', '2017-06-14 08:22:28.947', '2017-06-14 08:22:29', NULL, NULL, 4, '2017-06-14 08:22:29', 0),
(10, 4, 0, 'PHJR2017061405', '2017-06-14 08:23:44.277', '2017-06-14 08:23:44', NULL, NULL, 4, '2017-06-14 08:23:44', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_queen_stock`
--

CREATE TABLE `cmf_queen_stock` (
  `process_id` varchar(255) NOT NULL COMMENT '存在相同sku的订单流程',
  `ErpOrderDetailNo` varchar(255) DEFAULT NULL COMMENT '内部订单号',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存在相同sku的库存流程';

--
-- 转存表中的数据 `cmf_queen_stock`
--

INSERT INTO `cmf_queen_stock` (`process_id`, `ErpOrderDetailNo`, `addtime`) VALUES
('95', NULL, '2020-05-20 03:34:22');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_recall`
--

CREATE TABLE `cmf_recall` (
  `id` int(11) NOT NULL,
  `taskid` int(11) DEFAULT NULL COMMENT '任务id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注原因',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:未处理；1，允许；2，拒绝；'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='撤回申请表';

--
-- 转存表中的数据 `cmf_recall`
--

INSERT INTO `cmf_recall` (`id`, `taskid`, `userid`, `remark`, `addtime`, `finish_time`, `status`) VALUES
(6, 407, 6, ' www', '2020-06-10 08:59:12', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_recycle_bin`
--

CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) UNSIGNED DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 回收站';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_representations`
--

CREATE TABLE `cmf_representations` (
  `id` int(11) NOT NULL,
  `taskid` int(11) DEFAULT NULL COMMENT '任务id',
  `userid` int(11) DEFAULT NULL COMMENT '申请人员id',
  `handleid` int(11) DEFAULT NULL COMMENT '处理人员id',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `handletime` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态;0:未处理1，处理完成',
  `result` tinyint(4) DEFAULT NULL COMMENT '处理结果：0，驳回，1同意'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='员工已经完成任务（比如已经完成任务了，但是发现退单了），但无法提交可以申述';

--
-- 转存表中的数据 `cmf_representations`
--

INSERT INTO `cmf_representations` (`id`, `taskid`, `userid`, `handleid`, `addtime`, `handletime`, `status`, `result`) VALUES
(4, 229, 16, 1, '2020-05-07 09:51:52', '2020-05-07 09:51:52', 1, 0),
(5, 229, 16, 1, '2020-05-07 09:52:18', '2020-05-07 09:52:18', 1, 1),
(6, 163, 20, NULL, '2020-05-09 06:53:02', '2020-05-09 06:53:02', 0, NULL),
(7, 380, 7, 1, '2020-05-28 03:39:01', '2020-05-28 03:39:01', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role`
--

CREATE TABLE `cmf_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- 转存表中的数据 `cmf_role`
--

INSERT INTO `cmf_role` (`id`, `parent_id`, `status`, `create_time`, `update_time`, `list_order`, `name`, `remark`) VALUES
(1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！'),
(2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！'),
(3, 0, 1, 0, 0, 0, '鞋面审单', '负责鞋面审单'),
(4, 0, 1, 0, 0, 0, '配料下料', '配料下料暂时合并'),
(5, 0, 1, 0, 0, 0, '下料', '暂时下料和配料合并'),
(6, 0, 1, 0, 0, 0, '做面', ''),
(7, 0, 1, 0, 0, 0, '鞋底审单', ''),
(8, 0, 1, 0, 0, 0, '3D', ''),
(9, 0, 1, 0, 0, 0, '开楦', ''),
(10, 0, 1, 0, 0, 0, '做大底', ''),
(11, 0, 1, 0, 0, 0, '做中底', ''),
(12, 0, 1, 0, 0, 0, '总配料', ''),
(13, 0, 1, 0, 0, 0, '做底部', ''),
(14, 0, 1, 0, 0, 0, '打眼', ''),
(15, 0, 1, 0, 0, 0, '贴鞋垫', ''),
(16, 0, 1, 0, 0, 0, '包装', ''),
(17, 0, 1, 0, 0, 0, '手工', ''),
(18, 0, 1, 0, 0, 0, '物流交付', ''),
(19, 0, 1, 0, 0, 0, '开板', '开板'),
(20, 0, 1, 0, 0, 0, '描版', '描版'),
(21, 0, 1, 0, 0, 0, '品检', '品检'),
(22, 0, 1, 0, 0, 0, '配辅料', '配辅料'),
(23, 0, 1, 0, 0, 0, '机器下料', '机器下料'),
(24, 0, 1, 0, 0, 0, '手工下料', '手工下料'),
(25, 0, 1, 0, 0, 0, '下料主管', '下料主管，主管开板、描版、配料下料三个流程'),
(26, 0, 1, 0, 0, 0, '面部主管', '面部主管，主管配辅料，做面流程部分'),
(27, 0, 1, 0, 0, 0, '仓库主管', '仓库主管 =》 鞋底审单、3D、开楦、大底、中底 总配料'),
(28, 0, 1, 0, 0, 0, '底部主管', '主管 =》  做底、打跟、贴垫；'),
(29, 0, 1, 0, 0, 0, '生产管理', '所有流程都可查看');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role_user`
--

CREATE TABLE `cmf_role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

--
-- 转存表中的数据 `cmf_role_user`
--

INSERT INTO `cmf_role_user` (`id`, `role_id`, `user_id`) VALUES
(1, 2, 2),
(50, 18, 17),
(51, 3, 18),
(52, 7, 19),
(53, 19, 20),
(54, 20, 21),
(56, 21, 22),
(59, 14, 14),
(60, 9, 13),
(61, 15, 12),
(63, 16, 10),
(64, 8, 9),
(65, 13, 8),
(66, 6, 7),
(68, 12, 23),
(69, 11, 16),
(70, 2, 3),
(71, 2, 4),
(72, 2, 5),
(73, 10, 6),
(75, 22, 24),
(76, 4, 11),
(82, 23, 15),
(83, 17, 15),
(84, 5, 15),
(85, 24, 25),
(86, 5, 25),
(87, 14, 26);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_route`
--

CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url路由表';

--
-- 转存表中的数据 `cmf_route`
--

INSERT INTO `cmf_route` (`id`, `list_order`, `status`, `type`, `full_url`, `url`) VALUES
(1, 10000, 1, 1, 'portal/List/index', 'list/:id'),
(2, 10000, 1, 1, 'admin/sys/qrCodeverification', 'q');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide`
--

CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '分类备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide_item`
--

CREATE TABLE `cmf_slide_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) NOT NULL COMMENT '幻灯片描述',
  `content` text COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片子项表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_stock`
--

CREATE TABLE `cmf_stock` (
  `id` int(10) UNSIGNED NOT NULL,
  `Sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `ErpOrderDetailNo` varchar(255) DEFAULT NULL COMMENT '订单号',
  `Size` varchar(255) DEFAULT NULL COMMENT '尺码',
  `Img` varchar(1024) DEFAULT NULL COMMENT '图片',
  `Category` varchar(255) DEFAULT NULL COMMENT '类别',
  `Num` int(11) DEFAULT NULL COMMENT '序号',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_task`
--

CREATE TABLE `cmf_task` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL COMMENT '用户id',
  `process_id` int(11) NOT NULL COMMENT '流程id',
  `task_type` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT '任务类型',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务分配时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态： 0 ：未处理；1：完成，2：其他3：确认',
  `finish_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '完成时间',
  `confirm_time` timestamp NULL DEFAULT NULL COMMENT '确认时间',
  `is_purchase` tinyint(4) DEFAULT '0' COMMENT '是否需要采购：0 不需要，1：需要，2完成，3，材料采购失败',
  `purchase_type` varchar(255) DEFAULT NULL COMMENT '采购类型',
  `purchase_add_time` timestamp NULL DEFAULT NULL COMMENT '采购的添加时间',
  `purchase_finish_time` timestamp NULL DEFAULT NULL COMMENT '采购完成时间',
  `otherinfo` varchar(255) DEFAULT NULL COMMENT '其他信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

--
-- 转存表中的数据 `cmf_task`
--

INSERT INTO `cmf_task` (`id`, `userid`, `process_id`, `task_type`, `addtime`, `status`, `finish_time`, `confirm_time`, `is_purchase`, `purchase_type`, `purchase_add_time`, `purchase_finish_time`, `otherinfo`) VALUES
(306, 18, 1, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(307, 19, 1, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-05-27 09:38:11', NULL, 0, NULL, NULL, NULL, NULL),
(308, 18, 2, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(309, 19, 2, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-05-27 09:38:11', NULL, 0, NULL, NULL, NULL, NULL),
(310, 18, 3, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(311, 19, 3, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(312, 18, 4, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(313, 19, 4, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(314, 18, 5, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(315, 19, 5, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(316, 18, 6, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(317, 19, 6, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(318, 18, 7, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(319, 19, 7, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(320, 18, 8, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(321, 19, 8, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(322, 18, 9, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(323, 19, 9, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(324, 18, 10, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-27 08:10:43', NULL, 0, NULL, NULL, NULL, NULL),
(325, 19, 10, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:12', NULL, 0, NULL, NULL, NULL, NULL),
(326, 18, 11, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(327, 19, 11, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:13', NULL, 0, NULL, NULL, NULL, NULL),
(328, 18, 12, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(329, 19, 12, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:15:13', NULL, 0, NULL, NULL, NULL, NULL),
(330, 18, 13, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(331, 19, 13, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 08:09:02', NULL, 0, NULL, NULL, NULL, NULL),
(332, 18, 14, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(333, 19, 14, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 08:09:02', NULL, 0, NULL, NULL, NULL, NULL),
(334, 18, 15, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(335, 19, 15, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 08:10:34', NULL, 0, NULL, NULL, NULL, NULL),
(336, 18, 16, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(337, 19, 16, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(338, 18, 17, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(339, 19, 17, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(340, 18, 18, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(341, 19, 18, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(342, 18, 19, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(343, 19, 19, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-02 02:18:17', NULL, 0, NULL, NULL, NULL, NULL),
(344, 18, 20, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 02:13:18', NULL, 0, NULL, NULL, NULL, NULL),
(345, 19, 20, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(346, 18, 21, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 08:02:03', NULL, 0, NULL, NULL, NULL, NULL),
(347, 19, 21, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(348, 18, 22, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 08:02:03', NULL, 0, NULL, NULL, NULL, NULL),
(349, 19, 22, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(350, 18, 23, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-06-02 08:05:31', NULL, 0, NULL, NULL, NULL, NULL),
(351, 19, 23, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(352, 18, 24, 'examinePaper', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(353, 19, 24, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(354, 18, 25, 'examinePaper', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(355, 19, 25, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(356, 18, 26, 'examinePaper', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(357, 19, 26, 'examinePaperbottom', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(358, 18, 27, 'examinePaper', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(359, 19, 27, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-10 03:58:38', NULL, 0, NULL, NULL, NULL, NULL),
(360, 18, 28, 'examinePaper', '2020-05-26 06:51:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(361, 19, 28, 'examinePaperbottom', '2020-05-26 06:51:12', 1, '2020-06-10 03:58:38', NULL, 0, NULL, NULL, NULL, NULL),
(362, 18, 29, 'examinePaper', '2020-05-26 06:51:12', 1, '2020-05-29 10:23:40', NULL, 0, NULL, NULL, NULL, NULL),
(363, 19, 29, 'examinePaperbottom', '2020-05-26 06:51:12', 0, '2020-06-10 06:59:45', NULL, 0, NULL, NULL, NULL, NULL),
(364, 18, 30, 'examinePaper', '2020-05-26 06:51:12', 2, '2020-05-28 02:29:15', NULL, 0, NULL, NULL, NULL, NULL),
(365, 19, 30, 'examinePaperbottom', '2020-05-26 06:51:12', 2, '2020-05-28 02:29:15', NULL, 0, NULL, NULL, NULL, NULL),
(366, 11, 1, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-05-27 08:12:35', '2020-05-27 08:12:07', 2, '成都采购,广州采购', NULL, NULL, NULL),
(367, 11, 2, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-05-27 08:12:58', '2020-05-27 08:12:10', 0, NULL, NULL, NULL, NULL),
(368, 11, 3, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-05-27 08:12:54', '2020-05-27 08:12:11', 0, NULL, NULL, NULL, NULL),
(369, 11, 4, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-06-02 08:18:42', '2020-06-02 08:18:37', 0, NULL, NULL, NULL, NULL),
(370, 11, 5, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-06-02 08:24:59', '2020-06-02 08:18:38', 1, '成都采购,广州采购', NULL, NULL, NULL),
(371, 11, 6, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-06-02 08:25:12', '2020-06-02 08:18:44', 1, '成都采购,广州采购', NULL, NULL, NULL),
(372, 20, 7, 'openboard', '2020-05-27 08:10:43', 3, '2020-06-09 10:09:00', '2020-06-09 10:09:00', 0, NULL, NULL, NULL, NULL),
(373, 11, 8, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-06-02 08:26:25', '2020-06-02 08:25:41', 0, NULL, NULL, NULL, NULL),
(374, 11, 9, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-06-09 09:46:05', '2020-06-02 08:31:20', 2, '成都采购,广州采购', NULL, NULL, NULL),
(375, 11, 10, 'distributionBlanking', '2020-05-27 08:10:43', 1, '2020-06-09 09:46:10', '2020-06-09 09:46:00', 0, NULL, NULL, NULL, NULL),
(376, 24, 1, 'accessories', '2020-05-27 08:12:35', 1, '2020-05-27 09:13:54', NULL, 0, NULL, NULL, NULL, NULL),
(377, 24, 3, 'accessories', '2020-05-27 08:12:54', 1, '2020-06-02 02:17:12', NULL, 0, NULL, NULL, NULL, NULL),
(378, 24, 2, 'accessories', '2020-05-27 08:12:58', 1, '2020-06-02 08:14:13', NULL, 0, NULL, NULL, NULL, NULL),
(379, 7, 1, 'makeFace', '2020-05-27 09:13:54', 1, '2020-06-04 08:39:46', '2020-05-27 09:37:18', 0, NULL, NULL, NULL, NULL),
(381, 6, 1, 'outsole', '2020-05-27 09:38:11', 1, '2020-05-27 09:38:57', NULL, 0, NULL, NULL, NULL, NULL),
(382, 16, 1, 'midsole', '2020-05-27 09:38:11', 1, '2020-06-04 02:27:21', NULL, 2, '采购', '2020-06-02 09:57:13', '2020-06-04 02:27:21', NULL),
(383, 6, 2, 'outsole', '2020-05-27 09:38:11', 2, '2020-05-28 03:25:39', NULL, 0, NULL, NULL, NULL, NULL),
(384, 16, 2, 'midsole', '2020-05-27 09:38:11', 1, '2020-06-09 09:50:09', NULL, 2, '采购', NULL, NULL, NULL),
(386, 8, 1, 'makeBottom', '2020-05-27 09:42:10', 1, '2020-06-09 09:44:24', '2020-06-09 09:08:45', 0, NULL, NULL, NULL, NULL),
(387, 23, 1, 'totalmixedIngredients', '2020-05-29 08:46:05', 1, '2020-06-09 09:51:14', NULL, 0, NULL, NULL, NULL, NULL),
(388, 20, 29, 'openboard', '2020-05-29 10:23:40', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(389, 11, 11, 'distributionBlanking', '2020-06-02 02:13:18', 1, '2020-06-09 09:46:15', '2020-06-09 09:46:02', 0, NULL, NULL, NULL, NULL),
(390, 11, 12, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(391, 11, 13, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(392, 11, 14, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(393, 11, 15, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(394, 11, 16, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(395, 11, 17, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(396, 11, 18, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(397, 11, 19, 'distributionBlanking', '2020-06-02 02:13:18', 1, '2020-06-02 02:16:07', '2020-06-02 02:16:01', 0, NULL, NULL, NULL, NULL),
(398, 11, 20, 'distributionBlanking', '2020-06-02 02:13:18', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(399, 6, 3, 'outsole', '2020-06-02 02:15:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(400, 16, 3, 'midsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:50:09', NULL, 2, '采购', NULL, NULL, NULL),
(401, 6, 4, 'outsole', '2020-06-02 02:15:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(402, 16, 4, 'midsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:50:09', NULL, 2, '采购', NULL, NULL, NULL),
(403, 6, 5, 'outsole', '2020-06-02 02:15:12', 1, '2020-06-02 08:51:05', NULL, 0, NULL, NULL, NULL, NULL),
(404, 16, 5, 'midsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:50:09', NULL, 0, NULL, NULL, '2020-06-04 02:43:32', NULL),
(405, 6, 6, 'outsole', '2020-06-02 02:15:12', 1, '2020-06-02 09:10:22', NULL, 0, NULL, NULL, NULL, NULL),
(406, 16, 6, 'midsole', '2020-06-02 02:15:12', 1, '2020-06-02 09:09:29', NULL, 0, NULL, NULL, NULL, NULL),
(407, 6, 7, 'outsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:49:35', NULL, 0, NULL, NULL, NULL, NULL),
(408, 16, 7, 'midsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:50:09', NULL, 2, '采购', '2020-06-04 02:43:52', '2020-06-04 02:44:00', NULL),
(409, 6, 8, 'outsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:49:35', NULL, 0, NULL, NULL, NULL, NULL),
(410, 16, 8, 'midsole', '2020-06-02 02:15:12', 1, '2020-06-09 09:50:09', NULL, 2, '采购', '2020-06-04 02:30:47', '2020-06-04 02:43:42', NULL),
(411, 6, 9, 'outsole', '2020-06-02 02:15:12', 1, '2020-06-02 08:51:05', NULL, 0, NULL, NULL, NULL, NULL),
(412, 16, 9, 'midsole', '2020-06-02 02:15:12', 0, '2020-06-04 02:31:00', NULL, 1, '采购', '2020-06-04 02:31:00', NULL, NULL),
(413, 6, 10, 'outsole', '2020-06-02 02:15:12', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(414, 16, 10, 'midsole', '2020-06-02 02:15:13', 1, '2020-06-09 09:50:09', NULL, 2, '采购', '2020-06-04 02:33:40', '2020-06-04 02:34:54', NULL),
(415, 6, 11, 'outsole', '2020-06-02 02:15:13', 1, '2020-06-09 09:49:35', NULL, 0, NULL, NULL, NULL, NULL),
(416, 16, 11, 'midsole', '2020-06-02 02:15:13', 0, '2020-06-04 02:44:31', NULL, 0, NULL, '2020-06-04 02:44:16', '2020-06-04 02:44:31', NULL),
(417, 6, 12, 'outsole', '2020-06-02 02:15:13', 1, '2020-06-09 09:49:35', NULL, 0, NULL, NULL, NULL, NULL),
(418, 16, 12, 'midsole', '2020-06-02 02:15:13', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(419, 24, 19, 'accessories', '2020-06-02 02:16:07', 1, '2020-06-02 02:17:12', NULL, 0, NULL, NULL, NULL, NULL),
(420, 7, 3, 'makeFace', '2020-06-02 02:17:12', 1, '2020-06-02 09:05:54', '2020-06-02 09:05:32', 0, NULL, NULL, NULL, NULL),
(421, 7, 19, 'makeFace', '2020-06-02 02:17:12', 1, '2020-06-02 02:17:41', '2020-06-02 02:17:38', 0, NULL, NULL, NULL, NULL),
(422, 6, 19, 'outsole', '2020-06-02 02:18:17', 1, '2020-06-02 02:22:22', NULL, 0, NULL, NULL, NULL, NULL),
(423, 16, 19, 'midsole', '2020-06-02 02:18:17', 1, '2020-06-02 02:21:44', NULL, 0, NULL, NULL, NULL, NULL),
(425, 23, 19, 'totalmixedIngredients', '2020-06-02 02:22:23', 1, '2020-06-04 06:22:09', NULL, 0, NULL, NULL, NULL, NULL),
(426, 11, 21, 'distributionBlanking', '2020-06-02 08:02:03', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(427, 11, 22, 'distributionBlanking', '2020-06-02 08:02:03', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(428, 11, 23, 'distributionBlanking', '2020-06-02 08:05:31', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(429, 6, 13, 'outsole', '2020-06-02 08:09:02', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(430, 16, 13, 'midsole', '2020-06-02 08:09:02', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(431, 6, 14, 'outsole', '2020-06-02 08:09:02', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(432, 16, 14, 'midsole', '2020-06-02 08:09:02', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(433, 6, 15, 'outsole', '2020-06-02 08:10:34', 1, '2020-06-09 09:49:35', NULL, 0, NULL, NULL, NULL, NULL),
(434, 16, 15, 'midsole', '2020-06-02 08:10:34', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(435, 7, 2, 'makeFace', '2020-06-02 08:14:13', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(436, 24, 4, 'accessories', '2020-06-02 08:18:42', 1, '2020-06-04 09:28:27', NULL, 0, NULL, NULL, NULL, NULL),
(437, 24, 5, 'accessories', '2020-06-02 08:24:59', 1, '2020-06-04 09:31:23', NULL, 0, NULL, NULL, NULL, NULL),
(438, 24, 6, 'accessories', '2020-06-02 08:25:12', 1, '2020-06-02 08:54:48', NULL, 0, NULL, NULL, NULL, NULL),
(439, 24, 8, 'accessories', '2020-06-02 08:26:25', 1, '2020-06-09 09:46:36', NULL, 0, NULL, NULL, NULL, NULL),
(440, 7, 6, 'makeFace', '2020-06-02 08:54:48', 1, '2020-06-02 08:55:41', '2020-06-02 08:55:29', 0, NULL, NULL, NULL, NULL),
(441, 23, 6, 'totalmixedIngredients', '2020-06-02 09:10:22', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(442, 8, 19, 'makeBottom', '2020-06-04 06:22:09', 1, '2020-06-04 06:38:47', '2020-06-04 06:22:45', 0, NULL, NULL, NULL, NULL),
(443, 14, 19, 'drill', '2020-06-04 06:38:47', 1, '2020-06-09 09:42:50', '2020-06-04 06:46:38', 0, NULL, NULL, NULL, NULL),
(444, 12, 19, 'stickingPad', '2020-06-04 07:19:23', 1, '2020-06-10 01:13:29', '2020-06-10 01:13:25', 0, NULL, NULL, NULL, NULL),
(445, 7, 4, 'makeFace', '2020-06-04 09:28:27', 1, '2020-06-09 09:47:18', '2020-06-09 09:47:11', 0, NULL, NULL, NULL, NULL),
(446, 7, 5, 'makeFace', '2020-06-04 09:31:23', 1, '2020-06-09 09:47:22', '2020-06-09 09:47:13', 0, NULL, NULL, NULL, NULL),
(448, 14, 1, 'drill', '2020-06-09 09:44:24', 0, '2020-06-17 08:13:06', NULL, 0, NULL, NULL, NULL, NULL),
(449, 24, 9, 'accessories', '2020-06-09 09:46:05', 1, '2020-06-09 09:46:36', NULL, 0, NULL, NULL, NULL, NULL),
(450, 24, 10, 'accessories', '2020-06-09 09:46:10', 1, '2020-06-09 09:46:36', NULL, 0, NULL, NULL, NULL, NULL),
(451, 24, 11, 'accessories', '2020-06-09 09:46:15', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(452, 7, 8, 'makeFace', '2020-06-09 09:46:36', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(453, 7, 9, 'makeFace', '2020-06-09 09:46:36', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(454, 7, 10, 'makeFace', '2020-06-09 09:46:36', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(455, 23, 5, 'totalmixedIngredients', '2020-06-09 09:50:09', 1, '2020-06-09 09:51:14', NULL, 0, NULL, NULL, NULL, NULL),
(456, 8, 5, 'makeBottom', '2020-06-09 09:51:14', 1, '2020-06-09 09:52:16', '2020-06-09 09:52:07', 0, NULL, NULL, NULL, NULL),
(457, 26, 5, 'drill', '2020-06-09 09:52:16', 1, '2020-06-10 01:12:23', '2020-06-10 01:12:17', 0, NULL, NULL, NULL, NULL),
(458, 12, 5, 'stickingPad', '2020-06-10 01:12:23', 1, '2020-06-10 01:13:55', '2020-06-10 01:13:51', 0, NULL, NULL, NULL, NULL),
(459, 22, 19, 'inspection', '2020-06-10 01:13:29', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(460, 22, 5, 'inspection', '2020-06-10 01:13:55', 1, '2020-06-10 01:14:26', '2020-06-10 01:14:22', 0, NULL, NULL, NULL, NULL),
(461, 10, 5, 'packing', '2020-06-10 01:14:26', 1, '2020-06-10 01:15:11', '2020-06-10 01:15:07', 0, NULL, NULL, NULL, NULL),
(462, 17, 5, 'deliver', '2020-06-10 01:15:11', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(463, 6, 27, 'outsole', '2020-06-10 03:58:38', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(464, 16, 27, 'midsole', '2020-06-10 03:58:38', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(465, 6, 28, 'outsole', '2020-06-10 03:58:38', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(466, 16, 28, 'midsole', '2020-06-10 03:58:38', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(467, 6, 29, 'outsole', '2020-06-10 03:58:38', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(468, 16, 29, 'midsole', '2020-06-10 03:58:38', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(469, 13, 29, 'last', '2020-06-10 06:20:21', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(470, 9, 29, 'threeD', '2020-06-10 06:20:21', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_task_price`
--

CREATE TABLE `cmf_task_price` (
  `id` int(11) NOT NULL,
  `content` varchar(1024) DEFAULT NULL COMMENT '价格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_task_price`
--

INSERT INTO `cmf_task_price` (`id`, `content`) VALUES
(1, '{"examinePaper":"","openboard":"","tracing":"","distributionBlanking":"","accessories":"","makeFace":"15","examinePaperbottom":"","threeD":"","last":"","outsole":"","midsole":"","totalmixedIngredients":"","makeBottom":"","drill":"","stickingPad":"","inspection":"","packing":"","deliver":""}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_theme`
--

CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_theme`
--

INSERT INTO `cmf_theme` (`id`, `create_time`, `update_time`, `status`, `is_compiled`, `theme`, `name`, `version`, `demo_url`, `thumbnail`, `author`, `author_url`, `lang`, `keywords`, `description`) VALUES
(1, 0, 0, 0, 0, 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_theme_file`
--

CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_theme_file`
--

INSERT INTO `cmf_theme_file` (`id`, `is_public`, `list_order`, `theme`, `name`, `action`, `file`, `description`, `more`, `config_more`, `draft_more`) VALUES
(1, 0, 10, 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","value":"1","type":"text","tip":"","rule":[]}}}', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","value":"1","type":"text","tip":"","rule":[]}}}', NULL),
(2, 0, 10, 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', NULL),
(3, 0, 5, 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/Category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/Category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(4, 0, 10, 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(5, 0, 10, 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(6, 0, 10, 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', NULL),
(7, 1, 0, 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', NULL),
(8, 1, 1, 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"ThinkCMF","type":"text","tip":"","rule":[]}}}', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"ThinkCMF","type":"text","tip":"","rule":[]}}}', NULL),
(9, 0, 10, 'simpleboot', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","value":"1","type":"text","tip":"","rule":[]}}}', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","value":"1","type":"text","tip":"","rule":[]}}}', NULL),
(10, 0, 10, 'simpleboot', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', NULL),
(11, 0, 5, 'simpleboot', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/Category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/Category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(12, 0, 10, 'simpleboot', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(13, 0, 10, 'simpleboot', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
(14, 0, 10, 'simpleboot', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', NULL),
(15, 1, 0, 'simpleboot', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', NULL),
(16, 1, 1, 'simpleboot', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"ThinkCMF","type":"text","tip":"","rule":[]}}}', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"ThinkCMF","type":"text","tip":"","rule":[]}}}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_third_party_user`
--

CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_urgentorderdetail`
--

CREATE TABLE `cmf_urgentorderdetail` (
  `Id` int(11) NOT NULL,
  `ErpOrderDetailNo` varchar(255) DEFAULT NULL,
  `CommodityId` int(11) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `AddTime` timestamp NULL DEFAULT NULL,
  `IsDelete` tinyint(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_urgentorderdetail`
--

INSERT INTO `cmf_urgentorderdetail` (`Id`, `ErpOrderDetailNo`, `CommodityId`, `Reason`, `Remark`, `AddTime`, `IsDelete`) VALUES
(1, 'WJB0424046', 41909, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(2, 'WJB0421185', 41909, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(3, 'WJB0416165', 43837, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(4, 'WJB0423025', 41909, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(5, 'WJB0420003', 42193, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(6, 'WJB0423195', 155676, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(7, 'WJB0429107', 137691, NULL, '重要客人，两天内务必发货', '2018-05-04 12:42:54', 0),
(8, 'WJB0429135', 21306, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(9, 'WJB0427109', 22176, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(10, 'WJB0501118', 84297, NULL, '两天内务必发货', '2018-05-04 12:42:54', 0),
(11, 'WJB0429010', 83626, NULL, '8号前务必发货，已付加急费', '2018-05-04 12:42:54', 0),
(12, 'WJB0503122', 140459, NULL, '5天内务必发货', '2018-05-04 12:42:54', 0),
(13, 'WJB0501072', 36621, NULL, '6天内务必发货', '2018-05-04 12:42:54', 0),
(14, 'WJB0424098', 80230, '加急订单', '两天内发货。', '2018-05-10 10:35:03', 0),
(15, 'WJB0510174', 10189, '加急订单', '务必三天内发货。', '2018-05-10 10:35:03', 0),
(16, 'WJB0508130', 148868, '加急订单', '两天内发货', '2018-05-10 10:35:03', 0),
(17, 'WJB0421182', 111029, '加急订单', '三天内发货', '2018-05-10 10:35:03', 0),
(18, 'WJB0417071', 90907, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(19, 'WJB0510086', 25527, '加急订单', '三天内发货', '2018-05-10 10:35:03', 0),
(20, 'WJB0503206', 42409, '加急订单', '三天内发货', '2018-05-10 10:35:03', 0),
(21, 'WJB0502085', 44571, '加急订单', '11号务必发货', '2018-05-10 10:35:03', 0),
(22, 'WJB0504146', 41407, '加急订单', '三天内发货', '2018-05-10 10:35:03', 0),
(23, 'WJB0507085', 44447, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(24, 'WJB0428086', 42550, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(25, 'WJB0501044', 44459, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(26, 'WJB0428016', 113711, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(27, 'WJB0427067', 44442, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(28, 'WJB0509270', 41836, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(29, 'WJB0430045', 155561, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(30, 'WJB0502040', 41478, '加急订单', '两天内务必发货', '2018-05-10 10:35:03', 0),
(31, 'WJB0501014', 44459, '加急订单', '5天内务必发货', '2018-05-10 10:35:03', 0),
(32, 'WJB0507050', 139916, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(33, 'WJB0507005', 41836, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(34, 'WJB0419083', 139473, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(35, 'WJB0419084', 149240, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(36, 'WJB0419085', 44550, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(37, 'WJB0419086', 41904, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(38, 'WJB0419087', 168062, '加急订单', '5天内发货', '2018-05-11 10:59:35', 0),
(39, 'WJB0421021', 41909, '加急订单', '2天内务必发货', '2018-05-11 10:59:35', 0),
(40, 'WJB0505119', 44408, '加急订单', '2天内务必发货', '2018-05-11 10:59:35', 0),
(41, 'WJB0427068', 96389, '加急订单', '2天内务必发货', '2018-05-11 10:59:35', 0),
(42, 'WJB0424056', 43626, '加急订单', '2天内务必发货', '2018-05-11 10:59:35', 0),
(43, 'WJB0503031', 90429, '加急订单', '2天内务必发货', '2018-05-11 10:59:35', 0),
(44, 'WJB0503081', 44459, '加急订单', '2天内务必发货', '2018-05-11 10:59:35', 0),
(45, 'WJB0510157', 4291, '加急订单', '已付运费，6月初', '2018-05-11 10:59:35', 0),
(46, 'WJB0505136', 143493, '加急订单', '5天内务必发货', '2018-05-11 10:59:35', 0),
(47, 'WJB0506111', 16082, '加急订单', '5天内务必发货', '2018-05-11 10:59:35', 0),
(48, 'WJB0505044', 83681, '加急订单', '5天内务必发货', '2018-05-11 10:59:35', 0),
(49, 'WJB0510318', 85430, '加急订单', '5天内务必发货', '2018-05-11 10:59:35', 0),
(50, 'WJB0510319', 85444, '加急订单', '5天内务必发货', '2018-05-11 10:59:35', 0),
(51, 'WJB0510097', 91885, '加急订单', '3天内务必发货', '2018-05-11 10:59:35', 0),
(52, 'WJB0423060', 88564, '加急订单', '3天内发货！', '2018-05-11 10:59:35', 0),
(53, 'WJB0418093', 41909, '加急订单', '3天内发货！', '2018-05-11 10:59:35', 0),
(54, 'WJB0511020', 125068, '加急订单', '5/14前送到发货部发货', '2018-05-11 10:59:35', 0),
(55, 'WJB0502021', 44960, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(56, 'WJB0427045', 148061, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(57, 'WJB0507128', 154606, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(58, 'WJB0421206', 41801, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(59, 'WJB0513028', 44891, '加急订单', '5天内务必发货', '2018-05-15 10:04:34', 0),
(60, 'WJB0508011', 43725, '加急订单', '5天内务必发货', '2018-05-15 10:04:34', 0),
(61, 'WJB0507173', 44307, '加急订单', '5天内务必发货', '2018-05-15 10:04:34', 0),
(62, 'WJB0507174', 44307, '加急订单', '5天内务必发货', '2018-05-15 10:04:34', 0),
(63, 'WJB0507175', 44307, '加急订单', '5天内务必发货', '2018-05-15 10:04:34', 0),
(64, 'WJB0514108', 87272, '加急订单', '3天内务必发货，已付加急费', '2018-05-15 10:04:34', 0),
(65, 'WJB0515055', 176188, '加急订单', '5天内务必发货', '2018-05-15 10:04:34', 0),
(66, 'WJB0507136', 145404, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(67, 'WJB0502256', 16825, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(68, 'WJB0502135', 16966, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(69, 'WJB0511018', 96536, '加急订单', '2天内务必发货', '2018-05-15 10:04:34', 0),
(70, 'WJB0515156', 130466, '加急订单', '5天内务必发货，已付加急费', '2018-05-15 10:04:34', 0),
(71, 'WJB0514085', 41873, '加急订单', '请保证物流部5/18能发走这票货！', '2018-05-15 10:04:34', 0),
(72, 'WJB0512253', 44415, '加急订单', '请保证物流部5/18能发走这票货！', '2018-05-15 10:04:34', 0),
(73, 'WJB0413114', 42464, '加急订单', '请保证物流部5/18能发走这票货！', '2018-05-15 10:04:34', 0),
(74, 'WJB0426041', 162197, '加急订单', '3天内发货！', '2018-05-15 10:04:34', 0),
(75, 'WJB0505270', 41679, '加急订单', '2天内发货！', '2018-05-15 10:04:34', 0),
(76, 'WJB0504138', 42022, '加急订单', '请务必5天内发货！客人演出急需！', '2018-05-15 10:04:34', 0),
(77, 'WJB0504139', 42094, '加急订单', '请务必5天内发货！客人演出急需！', '2018-05-15 10:04:34', 0),
(78, 'WJB0504140', 128100, '加急订单', '请务必5天内发货！客人演出急需！', '2018-05-15 10:04:34', 0),
(79, 'WJB0504141', 44448, '加急订单', '请务必5天内发货！客人演出急需！', '2018-05-15 10:04:34', 0),
(80, 'WJB0504142', 41962, '加急订单', '请务必5天内发货！客人演出急需！', '2018-05-15 10:04:34', 0),
(81, 'WJB0504143', 44543, '加急订单', '请务必5天内发货！客人演出急需！', '2018-05-15 10:04:34', 0),
(82, 'WJB0514202', 172147, '加急订单', '3天内务必发货', '2018-05-16 10:23:41', 0),
(83, 'WJB0516007', 92814, '加急订单', '3天内务必发货', '2018-05-16 10:23:41', 0),
(84, 'WJB0516037', 21044, '加急订单', '婚鞋，3天内务必发货', '2018-05-16 10:23:41', 0),
(85, 'WJB0516246', 90873, '加急订单', '5天内务必发货', '2018-05-16 10:23:41', 0),
(86, 'WJB0515048', 150075, '加急订单', '5天内务必发货', '2018-05-16 10:23:41', 0),
(87, 'WJB0515102', 123475, '加急订单', '3天内务必发货', '2018-05-16 10:23:41', 0),
(88, 'WJB0505095', 41909, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(89, 'WJB0430011', 42090, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(90, 'WJB0503039', 171988, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(91, 'WJB0515044', 155674, '加急订单', '3天内务必发货', '2018-05-16 10:23:41', 0),
(92, 'WJB0516055', 41472, '加急订单', '2天内务必发货，25号之前要', '2018-05-16 10:23:41', 0),
(93, 'WJB0417194', 41701, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(94, 'WJB0502030', 43642, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(95, 'WJB0429031', 168931, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(96, 'WJB0430086', 171502, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(97, 'WJB0425107', 42386, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(98, 'WJB0425041', 41909, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(99, 'WJB0510108', 174818, '加急订单', '两双，5天内务必发货', '2018-05-16 10:23:41', 0),
(100, 'WJB0503055', 41768, '加急订单', '5天内务必发货', '2018-05-16 10:23:41', 0),
(101, 'WJB0502251', 43039, '加急订单', '5天内务必发货', '2018-05-16 10:23:41', 0),
(102, 'WJB0509166', 44064, '加急订单', '5天内务必发货', '2018-05-16 10:23:41', 0),
(103, 'WJB0511276', 42663, '加急订单', '2天内务必发货', '2018-05-16 10:23:41', 0),
(104, 'WJB0428111', 156564, '加急订单', '3天内务必发货', '2018-05-16 10:23:41', 0),
(105, 'WJB0501277', 43558, '加急订单', '3天内务必发货', '2018-05-16 10:23:41', 0),
(106, 'WJB0515063', 44066, '加急订单', '5.19前务必发货，25号之前要', '2018-05-16 10:23:41', 0),
(107, 'WJB0417226', 168048, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(108, 'WJB0418057', 156853, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(109, 'WJB0419199', 44544, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(110, 'WJB0420079', 139609, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(111, 'WJB0420146', 156549, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(112, 'WJB0421017', 128798, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(113, 'WJB0421133', 42043, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(114, 'WJB0421177', 128098, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(115, 'WJB0422156', 136634, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(116, 'WJB0422178', 143569, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(117, 'WJB0423069', 17090, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(118, 'WJB0423120', 103313, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(119, 'WJB0423133', 168759, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(120, 'WJB0423148', 118827, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(121, 'WJB0423189', 168929, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(122, 'WJB0424180', 1534, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(123, 'WJB0425022', 44662, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(124, 'WJB0426023', 42025, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(125, 'WJB0428064', 42674, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(126, 'WJB0428239', 168600, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(127, 'WJB0429195', 41716, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(128, 'WJB0429205', 171498, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(129, 'WJB0430049', 90430, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(130, 'WJB0430065', 121397, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(131, 'WJB0430163', 159948, '加急订单', '4月订单，2天内务必发货', '2018-05-23 06:42:36', 0),
(132, 'WJB0602029', 100425, '加急订单', '2天内发货', '2018-06-08 11:01:25', 0),
(133, 'WJB0521062', 163507, '加急订单', '2天内发货', '2018-06-08 11:01:25', 0),
(134, 'WJB0527056', 44131, '加急订单', '2天内发货', '2018-06-08 11:01:25', 0),
(135, 'WJB0608187', 139907, '加急订单', '7天内发货', '2018-06-08 11:01:25', 0),
(136, 'WJB0608186', 22191, '加急订单', '8天内发货', '2018-06-08 11:01:25', 0),
(137, 'WJB0601157', 115363, '加急订单', '3天内务必发货', '2018-06-11 10:22:15', 0),
(138, 'WJB0608173', 87272, '加急订单', '3天内务必发货', '2018-06-11 10:22:15', 0),
(139, 'WJB0608169', 141882, '加急订单', '3天内务必发货', '2018-06-11 10:22:15', 0),
(140, 'WJB0611108', 85171, '加急订单', '3天内务必发货', '2018-06-11 10:22:15', 0),
(141, 'WJB0610050', 169347, '加急订单', '2天内务必发货', '2018-06-11 10:22:15', 0),
(142, 'WJB0603015', 43727, '加急订单', '2天内发货', '2018-06-12 10:04:06', 0),
(143, 'WJB0607020', 42005, '加急订单', '2天内发货', '2018-06-12 10:04:06', 0),
(144, 'WJB0603092', 42585, '加急订单', '2天内发货', '2018-06-12 10:04:06', 0),
(145, 'WJB0601176', 9796, '加急订单', '2天内发货', '2018-06-12 10:04:06', 0),
(146, 'WJB0526018', 180147, '加急订单', '加急，3天内发货！', '2018-06-12 10:04:06', 0),
(147, 'WJB0529111', 44305, NULL, '加急，3天内发货！', '2018-06-12 10:04:06', 0),
(148, 'WJB0606081', 158911, '加急订单', '2天内发货！', '2018-06-14 10:40:21', 0),
(149, 'WJB0528035', 41720, '加急订单', '2天内发货！', '2018-06-14 10:40:21', 0),
(150, 'WJB0614052', 18689, '加急订单', '3天内发货', '2018-06-15 11:02:43', 0),
(151, 'WJB0605021', 41832, '加急订单', '6.21号就要', '2018-06-15 11:02:43', 0),
(152, 'WJB0611017', 159643, '加急订单', '3天内发货', '2018-06-15 11:02:43', 0),
(153, 'WJB0615128', 933, '加急订单', '3天内发货', '2018-06-15 11:02:43', 0),
(154, 'WJB0615063', 90649, '加急订单', '系统漏单，请加急三天内发货！', '2018-06-15 11:02:43', 0),
(155, 'WJB0612057', 44902, '加急订单', '3天内发货', '2018-06-15 11:02:43', 0),
(156, 'WJB0602048', 44657, '加急订单', '3天内发货', '2018-06-15 11:02:43', 0),
(157, 'WJB0608072', 124225, '加急订单', '3天内发货', '2018-06-15 11:02:43', 0),
(158, 'WJB0616049', 41909, '加急订单', '3天内发货', '2018-06-16 10:20:27', 0),
(159, 'WJB0616092', 10582, '加急订单', '3天内务必发货，7.2号要，已付运费', '2018-06-17 10:04:30', 0),
(160, 'WJB0616089', 9718, '加急订单', '3天内务必发货，7.2号要，已付运费', '2018-06-17 10:04:30', 0),
(161, 'WJB0616090', 9686, '加急订单', '3天内务必发货，7.2号要，已付运费', '2018-06-17 10:04:30', 0),
(162, 'WJB0615108', 5312, '加急订单', '5天内务必发货', '2018-06-17 10:04:30', 0),
(163, 'WJB0615109', 87960, '加急订单', '5天内务必发货', '2018-06-17 10:04:30', 0),
(164, 'WJB0615110', 185655, '加急订单', '3天内务必发货，6.29号前要', '2018-06-17 10:04:30', 0),
(165, 'WJB0616127', 90860, '加急订单', '3天内务必发货', '2018-06-17 10:04:30', 0),
(166, 'WJB0607082', 4335, '加急订单', '周二务必发货', '2018-06-18 10:10:22', 0),
(167, 'WJB0613110', 141378, '加急订单', '3天内务必发货', '2018-06-18 10:10:22', 0),
(168, 'WJB0610084', 22203, '加急订单', '3天内务必发货', '2018-06-18 10:10:22', 0),
(169, 'WJB0616227', 41909, '加急订单', '2 天内务必发货', '2018-06-18 10:10:22', 0),
(170, 'WJB0616114', 137084, '加急订单', '5天内务必发哦，7.6号前', '2018-06-19 10:25:33', 0),
(171, 'WJB0605142', 86099, '加急订单', '2天内务必发货', '2018-06-19 10:25:33', 0),
(172, 'WJB0613064', 85419, '加急订单', '5天内务必发哦，7.6号前', '2018-06-19 10:25:33', 0),
(173, 'WJB0614086', 21265, '加急订单', '3天内发货', '2018-06-19 10:25:33', 0),
(174, 'WJB0605037', 90898, '加急订单', '2天内务必发货', '2018-06-19 10:25:33', 0),
(175, 'WJB0619106', 9685, '加急订单', '3天内发货，7.4之前要', '2018-06-19 10:25:33', 0),
(176, 'WJB0614038', 125068, '加急订单', '3天内发货，下周就要鞋子', '2018-06-19 10:25:33', 0),
(177, 'WJB0614069', 41685, '加急订单', '3天内发货，下周就要鞋子', '2018-06-19 10:25:33', 0),
(178, 'WJB0614029', 96389, '加急订单', '3天内发货，下周就要鞋子', '2018-06-19 10:25:33', 0),
(179, 'WJB0610178', 42920, '加急订单', '3天内发货，下周就要鞋子', '2018-06-19 10:25:33', 0),
(180, 'WJB0611194', 41865, '加急订单', '2天内发货', '2018-06-20 11:19:28', 0),
(181, 'WJB0619214', 44106, '加急订单', '3天内发货', '2018-06-21 10:17:28', 0),
(182, 'WJB0612046', 41878, '加急订单', '3天内发货', '2018-06-21 10:17:28', 0),
(183, 'WJB0621022', 43058, '加急订单', '5天内发货！', '2018-06-22 10:21:34', 0),
(184, 'WJB0612045', 42292, '加急订单', '2天内发货！', '2018-06-22 10:21:34', 0),
(185, 'WJB0616055', 44459, '加急订单', '3天内发货！', '2018-06-22 10:21:34', 0),
(186, 'WJB0622094', 174506, '加急订单', '客人定制银色。请4天内做好发货！', '2018-06-22 10:21:34', 0),
(187, 'WJB0514027', 174508, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(188, 'WJB0514028', 133650, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(189, 'WJB0514029', 42663, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(190, 'WJB0514031', 137716, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(191, 'WJB0601054', 178378, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(192, 'WJB0604083', 181665, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(193, 'WJB0604084', 181666, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(194, 'WJB0604085', 144163, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(195, 'WJB0604086', 41948, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(196, 'WJB0604087', 132720, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(197, 'WJB0611191', 41695, '加急订单', '两天内发货', '2018-06-22 10:21:34', 0),
(198, 'WJB0611005', 43436, '加急订单', '2天内发货！', '2018-06-23 09:48:34', 0),
(199, 'WJB0621083', 41696, '加急订单', '3天内发货！', '2018-06-23 09:48:34', 0),
(200, 'WJB0623100', 139502, '加急订单', '3天内发货！', '2018-06-23 09:48:34', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user`
--

CREATE TABLE `cmf_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `cmf_user`
--

INSERT INTO `cmf_user` (`id`, `user_type`, `sex`, `birthday`, `last_login_time`, `score`, `coin`, `balance`, `create_time`, `user_status`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_url`, `avatar`, `signature`, `last_login_ip`, `user_activation_key`, `mobile`, `more`) VALUES
(1, 1, 0, 0, 1592362937, 2, 2, '0.00', 1550639723, 1, 'admin', '###bbf0c89280d8db2ec52b0819b812e5f8', 'admin', 'sdsxs@139.com', '', '', '', '127.0.0.1', '', '', NULL),
(2, 1, 0, 0, 1582877706, 0, 0, '0.00', 0, 1, 'test1', '###bbf0c89280d8db2ec52b0819b812e5f8', '', 'wesd@13.com', '', '', '', '127.0.0.1', '', '', NULL),
(3, 1, 0, 0, 1587958865, 0, 0, '0.00', 0, 1, 'tt', '###bbf0c89280d8db2ec52b0819b812e5f8', 'sssss', 'cilla.ma@shofooshoes.com', '', '', '', '218.88.126.146', '', '', NULL),
(4, 1, 0, 0, 1592302588, 0, 0, '0.00', 0, 3, 'dd', '###bbf0c89280d8db2ec52b0819b812e5f8', '', 'cilla.ma@shofoos1oes.com', '', '', '', '127.0.0.1', '', '', NULL),
(5, 1, 0, 0, 1585272479, 0, 0, '0.00', 0, 1, 'sa', '###bbf0c89280d8db2ec52b0819b812e5f8', '', 'cilla.ma@shofooshwoes.com', '', '', '', '127.0.0.1', '', '', NULL),
(6, 1, 0, 0, 1591951479, 0, 0, '0.00', 0, 1, '18113626158', '###bbf0c89280d8db2ec52b0819b812e5f8', '魏芳建 做大底', '18113626158@qq.com', '', '', '', '127.0.0.1', '', '', NULL),
(7, 1, 0, 0, 1591696025, 0, 0, '0.00', 0, 1, '13881764192', '###bbf0c89280d8db2ec52b0819b812e5f8', '吴胜 做面', '13881764192@qq.com', '', '', '', '127.0.0.1', '', '', NULL),
(8, 1, 0, 0, 1591696322, 0, 0, '0.00', 0, 1, '19936462309', '###bbf0c89280d8db2ec52b0819b812e5f8', '伍廷轩 做底部 ', '19936462309@qq.com', '', '', '', '127.0.0.1', '', '', NULL),
(9, 1, 0, 0, 1590119376, 0, 0, '0.00', 0, 1, '15208283426', '###bbf0c89280d8db2ec52b0819b812e5f8', '肖传林 3D ', '15208283426@qq.com', '', '', '', '127.0.0.1', '', '', NULL),
(10, 1, 0, 0, 1591751701, 0, 0, '0.00', 0, 1, '13808209051', '###bbf0c89280d8db2ec52b0819b812e5f8', '易佑清 包装', '13808209051@qq.com', '', '', '', '127.0.0.1', '', '', NULL),
(11, 1, 0, 0, 1591695954, 0, 0, '0.00', 0, 1, '18982122638', '###bbf0c89280d8db2ec52b0819b812e5f8', '袁尚芬 配料 ', '18982122638@qq.com', '', '', '', '127.0.0.1', '', '', NULL),
(12, 1, 0, 0, 1591751596, 0, 0, '0.00', 0, 1, '13795918717', '###bbf0c89280d8db2ec52b0819b812e5f8', '张国成 贴鞋垫 ', '13795918717', '', '', '', '127.0.0.1', '', '', NULL),
(13, 1, 0, 0, 1590119418, 0, 0, '0.00', 0, 1, '13882182771', '###bbf0c89280d8db2ec52b0819b812e5f8', '张松江 开楦 ', '', '', '', '', '127.0.0.1', '', '', NULL),
(14, 1, 0, 0, 1591253189, 0, 0, '0.00', 0, 3, '13541122257', '###bbf0c89280d8db2ec52b0819b812e5f8', '陈建 打眼 ', '', '', '', '', '127.0.0.1', '', '', NULL),
(15, 1, 0, 0, 1588746817, 0, 0, '0.00', 0, 1, '15928014159', '###bbf0c89280d8db2ec52b0819b812e5f8', '杜进菊 机器下料、手工', '', '', '', '', '127.0.0.1', '', '', NULL),
(16, 1, 0, 0, 1591696196, 0, 0, '0.00', 0, 1, '13880967390', '###bbf0c89280d8db2ec52b0819b812e5f8', '钱晓英 ,做中底 ', '', '', '', '', '127.0.0.1', '', '', NULL),
(17, 1, 0, 0, 1590126655, 0, 0, '0.00', 0, 1, '15928154668', '###bbf0c89280d8db2ec52b0819b812e5f8', '刘林   物流交付', '', '', '', '', '127.0.0.1', '', '', NULL),
(18, 1, 0, 0, 1591084467, 0, 0, '0.00', 0, 1, '18144391196', '###bbf0c89280d8db2ec52b0819b812e5f8', '李飞 鞋面审单', '', '', '', '', '127.0.0.1', '', '', NULL),
(19, 1, 0, 0, 1591761461, 0, 0, '0.00', 0, 1, '13980554479', '###bbf0c89280d8db2ec52b0819b812e5f8', '周云华 鞋底审单', '', '', '', '', '127.0.0.1', '', '', NULL),
(20, 1, 0, 0, 1591697315, 0, 0, '0.00', 0, 1, '13880380130', '###bbf0c89280d8db2ec52b0819b812e5f8', '彭玲琼 开版', '', '', '', '', '127.0.0.1', '', '', NULL),
(21, 1, 0, 0, 1590118858, 0, 0, '0.00', 0, 1, '15808358622', '###bbf0c89280d8db2ec52b0819b812e5f8', '陈燕 描版', '', '', '', '', '127.0.0.1', '', '', NULL),
(22, 1, 0, 0, 1591751654, 0, 0, '0.00', 0, 1, '13438395299', '###bbf0c89280d8db2ec52b0819b812e5f8', '蔡廷华 品检', '', '', '', '', '127.0.0.1', '', '', NULL),
(23, 1, 0, 0, 1591696264, 0, 0, '0.00', 0, 1, '13568832441', '###bbf0c89280d8db2ec52b0819b812e5f8', '陈道勇 总配料', '', '', '', '', '127.0.0.1', '', '', NULL),
(24, 1, 0, 0, 1591695985, 0, 0, '0.00', 0, 1, '13076019190', '###bbf0c89280d8db2ec52b0819b812e5f8', '夏彬林 配辅料 ', '', '', '', '', '127.0.0.1', '', '', NULL),
(25, 1, 0, 0, 1588754236, 0, 0, '0.00', 0, 0, '123456', '###bbf0c89280d8db2ec52b0819b812e5f8', '测试用的手工下料', '', '', '', '', '127.0.0.1', '', '', NULL),
(26, 1, 0, 0, 1591751532, 0, 0, '0.00', 0, 1, 'test', '###bbf0c89280d8db2ec52b0819b812e5f8', '测试打跟', '', '', '', '', '127.0.0.1', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_action`
--

CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作表';

--
-- 转存表中的数据 `cmf_user_action`
--

INSERT INTO `cmf_user_action` (`id`, `score`, `coin`, `reward_number`, `cycle_type`, `cycle_time`, `name`, `action`, `app`, `url`) VALUES
(1, 1, 1, 1, 2, 1, '用户登录', 'login', 'user', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_action_log`
--

CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_balance_log`
--

CREATE TABLE `cmf_user_balance_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户余额变更日志表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_favorite`
--

CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) UNSIGNED DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) UNSIGNED DEFAULT '0' COMMENT '收藏时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_like`
--

CREATE TABLE `cmf_user_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户点赞表';

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_login_attempt`
--

CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `login_attempts` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录尝试表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_score_log`
--

CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作积分等奖励日志表';

--
-- 转存表中的数据 `cmf_user_score_log`
--

INSERT INTO `cmf_user_score_log` (`id`, `user_id`, `create_time`, `action`, `score`, `coin`) VALUES
(1, 1, 1550639939, 'login', 1, 1),
(2, 1, 1583919259, 'login', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_token`
--

CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户客户端登录 token 表';

--
-- 转存表中的数据 `cmf_user_token`
--

INSERT INTO `cmf_user_token` (`id`, `user_id`, `expire_time`, `create_time`, `token`, `device_type`) VALUES
(1, 1, 1598428086, 1582876086, 'e9bf7ad0b2fa4c2ed3964e7753f1afb7e9bf7ad0b2fa4c2ed3964e7753f1afb7', 'web'),
(2, 2, 1598429706, 1582877706, '760be862ece78b1be372682dfc6049cb760be862ece78b1be372682dfc6049cb', 'web'),
(3, 3, 1599889536, 1584337536, '17219ecf666861b826781de9095eed7ac1719c831d86b9fa7c744e5cd9c1ca46', 'web'),
(4, 5, 1600501304, 1584949304, '9bb6a5f0e70e8e8651b5582fd029fc7618823234165caa43942d9abb46cef06c', 'web'),
(5, 6, 1601867314, 1586315314, '8eef1585e7a2de471c2e3f3eca62a4a31daa52a047d1d9142bf224dbde12f566', 'web'),
(6, 18, 1603616217, 1588064217, '5ff2c059b0d4cf70b1ec0097d162fe43bab6afef32c37625dd32a5417c3ebd54', 'web'),
(7, 19, 1603694310, 1588142310, '8d14fb850a61cec688985c9ac4807092dba5751717904f1ddc4b3d730600adcb', 'web'),
(8, 9, 1603699546, 1588147546, '87e44550625c2b57267e6a7387466085f0a382ebd6a47ef526a8d7d6091f9179', 'web'),
(9, 20, 1603705453, 1588153453, '15af85772f0b2f72120374455c953f9d29b870c31156d78c3238394d1f4b3f0e', 'web'),
(10, 21, 1603705504, 1588153504, '354654b72f746149421af0d7da1ad4abe014d56cda395863d1f6b77a5a367c03', 'web'),
(11, 11, 1603762517, 1588210517, 'd690b09969c107946f743dc857e4b565d9d73f3aa5b0dbf655c5dcca6a7e73fd', 'web'),
(12, 15, 1603790316, 1588238316, '1706159a242abaa2f8a133e9af9ab1f98e7e2996c443d415fec880240fed6dc7', 'web'),
(13, 24, 1603790586, 1588238586, '8643d0d85dce556c3f7aa99006c610c954c94f5484b4a1400463ddefffef0abc', 'web'),
(14, 16, 1604108785, 1588556785, '59e535ac584400ba8b4f02462da005db5b2227e7f6894f84d6870e5a36abc04d', 'web'),
(15, 7, 1604285774, 1588733774, '5277b6604cb77696297b4679b4d11f5da236af9b35595119510a4b404903fbfb', 'web'),
(16, 25, 1604306236, 1588754236, '53d8ea77aeb23769257ff2365ed1523421410fd61d0eb61c008480b4ab484199', 'web'),
(17, 13, 1604394885, 1588842885, '2059feed2efa11ace82ec92c9b45b0aeb0de00680f442a483d55b65251ce3eda', 'web'),
(18, 23, 1604720339, 1589168339, '6b32a42863845514fd9a76eba3174f6c2a28763db0ecc35bfaa7e9a79398523a', 'web'),
(19, 8, 1604720374, 1589168374, '427dda298c600604d52b20f8f80bf8df2a523f7fba819ca98903fe652c8dcfdd', 'web'),
(20, 14, 1604720426, 1589168426, 'c03c913c236680fa12fb2ec52f3d330488c3e44143148aa91dd282b96bf7f256', 'web'),
(21, 12, 1604720478, 1589168478, '25d4f69ca56a26fb2f0f2b7c8df82fac8ffae5bcca234e48861245eac6a06560', 'web'),
(22, 22, 1604720517, 1589168517, '4b10460188c0c11d4d31afe536f8df855117f6ddca80f6e1a2274130e88b36b2', 'web'),
(23, 10, 1604720555, 1589168555, '2a6b2cf966cff22ed2a42a01e05c6dceabcf1f44156eea9751e05897b7a666f9', 'web'),
(24, 17, 1604720591, 1589168591, 'a94308af00d87588afc2e4f325ff9e44e2c28d5b9a15a65eede2aa11927aa5f9', 'web'),
(25, 26, 1607303532, 1591751532, '9b972ce8e4df315916c21f68d0c199512354ebe526f95f59128ff80553cae792', 'web'),
(26, 4, 1607854510, 1592302510, '3f407f24c1440bfee6b5c50acf7624482887f607beca98b04fcf1c21a32c6069', 'web');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_verification_code`
--

CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '表id',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '手机号或者邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机邮箱数字验证码表';

-- --------------------------------------------------------

--
-- 表的结构 `commoditybrand`
--

CREATE TABLE `commoditybrand` (
  `Id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `BrandCode` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Logo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `AddTime` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `IsDelete` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cmf_admin_menu`
--
ALTER TABLE `cmf_admin_menu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `controller` (`controller`) USING BTREE;

--
-- Indexes for table `cmf_asset`
--
ALTER TABLE `cmf_asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_auth_access`
--
ALTER TABLE `cmf_auth_access`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `role_id` (`role_id`) USING BTREE,
  ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- Indexes for table `cmf_auth_rule`
--
ALTER TABLE `cmf_auth_rule`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `module` (`app`,`status`,`type`) USING BTREE;

--
-- Indexes for table `cmf_comment`
--
ALTER TABLE `cmf_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_id_status` (`table_name`,`object_id`,`status`),
  ADD KEY `object_id` (`object_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `create_time` (`create_time`) USING BTREE;

--
-- Indexes for table `cmf_commodity`
--
ALTER TABLE `cmf_commodity`
  ADD PRIMARY KEY (`Id`) USING BTREE,
  ADD KEY `id` (`Id`) USING BTREE,
  ADD KEY `sku` (`Sku`) USING BTREE;

--
-- Indexes for table `cmf_commodityinfo`
--
ALTER TABLE `cmf_commodityinfo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cmf_commodity_bak`
--
ALTER TABLE `cmf_commodity_bak`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Sku` (`Sku`),
  ADD KEY `Sku_2` (`Sku`),
  ADD KEY `Id` (`Id`),
  ADD KEY `Sku_3` (`Sku`);

--
-- Indexes for table `cmf_handwork`
--
ALTER TABLE `cmf_handwork`
  ADD KEY `id` (`id`),
  ADD KEY `taskid` (`taskid`),
  ADD KEY `accept_user` (`accept_user`);

--
-- Indexes for table `cmf_hook`
--
ALTER TABLE `cmf_hook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_hook_plugin`
--
ALTER TABLE `cmf_hook_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_link`
--
ALTER TABLE `cmf_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `cmf_manual`
--
ALTER TABLE `cmf_manual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `cmf_material`
--
ALTER TABLE `cmf_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_name` (`m_name`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `cmf_material_log`
--
ALTER TABLE `cmf_material_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_nav`
--
ALTER TABLE `cmf_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_nav_menu`
--
ALTER TABLE `cmf_nav_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_option`
--
ALTER TABLE `cmf_option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `cmf_plugin`
--
ALTER TABLE `cmf_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_portal_category`
--
ALTER TABLE `cmf_portal_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_portal_category_post`
--
ALTER TABLE `cmf_portal_category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_taxonomy_id` (`category_id`);

--
-- Indexes for table `cmf_portal_post`
--
ALTER TABLE `cmf_portal_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_time` (`create_time`) USING BTREE;

--
-- Indexes for table `cmf_portal_tag`
--
ALTER TABLE `cmf_portal_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_portal_tag_post`
--
ALTER TABLE `cmf_portal_tag_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `cmf_process`
--
ALTER TABLE `cmf_process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_id` (`CommodityId`),
  ADD KEY `makeFace` (`makeFace`),
  ADD KEY `midsole` (`midsole`),
  ADD KEY `PurchaseDetailId` (`PurchaseDetailId`),
  ADD KEY `sku` (`Sku`) USING BTREE;

--
-- Indexes for table `cmf_process_stock`
--
ALTER TABLE `cmf_process_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_id` (`process_id`) USING BTREE;

--
-- Indexes for table `cmf_productionlist`
--
ALTER TABLE `cmf_productionlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cmf_purchasedetail`
--
ALTER TABLE `cmf_purchasedetail`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FactoryId` (`FactoryId`),
  ADD KEY `PurchaseListId` (`PurchaseListId`),
  ADD KEY `CommodityId` (`CommodityId`),
  ADD KEY `OrderId` (`OrderId`),
  ADD KEY `OrderDetailId` (`OrderDetailId`);

--
-- Indexes for table `cmf_purchaselist`
--
ALTER TABLE `cmf_purchaselist`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cmf_queen_stock`
--
ALTER TABLE `cmf_queen_stock`
  ADD PRIMARY KEY (`process_id`);

--
-- Indexes for table `cmf_recall`
--
ALTER TABLE `cmf_recall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_recycle_bin`
--
ALTER TABLE `cmf_recycle_bin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_representations`
--
ALTER TABLE `cmf_representations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_role`
--
ALTER TABLE `cmf_role`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `parent_id` (`parent_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `cmf_role_user`
--
ALTER TABLE `cmf_role_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `role_id` (`role_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `cmf_route`
--
ALTER TABLE `cmf_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_slide`
--
ALTER TABLE `cmf_slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_slide_item`
--
ALTER TABLE `cmf_slide_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_id` (`slide_id`);

--
-- Indexes for table `cmf_stock`
--
ALTER TABLE `cmf_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `Sku` (`Sku`) USING BTREE,
  ADD KEY `ErpOrderDetailNo` (`ErpOrderDetailNo`) USING BTREE;

--
-- Indexes for table `cmf_task`
--
ALTER TABLE `cmf_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_id` (`process_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `task_type` (`task_type`),
  ADD KEY `status` (`status`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `cmf_task_price`
--
ALTER TABLE `cmf_task_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `cmf_theme`
--
ALTER TABLE `cmf_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_theme_file`
--
ALTER TABLE `cmf_theme_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_third_party_user`
--
ALTER TABLE `cmf_third_party_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_urgentorderdetail`
--
ALTER TABLE `cmf_urgentorderdetail`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`) USING BTREE,
  ADD KEY `ErpOrderDetailNo` (`ErpOrderDetailNo`) USING BTREE,
  ADD KEY `CommodityId` (`CommodityId`) USING BTREE;

--
-- Indexes for table `cmf_user`
--
ALTER TABLE `cmf_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_login` (`user_login`) USING BTREE,
  ADD KEY `user_nickname` (`user_nickname`) USING BTREE;

--
-- Indexes for table `cmf_user_action`
--
ALTER TABLE `cmf_user_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_user_action_log`
--
ALTER TABLE `cmf_user_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_object_action` (`user_id`,`object`,`action`),
  ADD KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`);

--
-- Indexes for table `cmf_user_balance_log`
--
ALTER TABLE `cmf_user_balance_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_user_favorite`
--
ALTER TABLE `cmf_user_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`);

--
-- Indexes for table `cmf_user_like`
--
ALTER TABLE `cmf_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`);

--
-- Indexes for table `cmf_user_login_attempt`
--
ALTER TABLE `cmf_user_login_attempt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_user_score_log`
--
ALTER TABLE `cmf_user_score_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_user_token`
--
ALTER TABLE `cmf_user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmf_verification_code`
--
ALTER TABLE `cmf_verification_code`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cmf_admin_menu`
--
ALTER TABLE `cmf_admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
--
-- 使用表AUTO_INCREMENT `cmf_asset`
--
ALTER TABLE `cmf_asset`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `cmf_auth_access`
--
ALTER TABLE `cmf_auth_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- 使用表AUTO_INCREMENT `cmf_auth_rule`
--
ALTER TABLE `cmf_auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键', AUTO_INCREMENT=185;
--
-- 使用表AUTO_INCREMENT `cmf_comment`
--
ALTER TABLE `cmf_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_commodityinfo`
--
ALTER TABLE `cmf_commodityinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `cmf_commodity_bak`
--
ALTER TABLE `cmf_commodity_bak`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_handwork`
--
ALTER TABLE `cmf_handwork`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `cmf_hook`
--
ALTER TABLE `cmf_hook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- 使用表AUTO_INCREMENT `cmf_hook_plugin`
--
ALTER TABLE `cmf_hook_plugin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_link`
--
ALTER TABLE `cmf_link`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_manual`
--
ALTER TABLE `cmf_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_material`
--
ALTER TABLE `cmf_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_material_log`
--
ALTER TABLE `cmf_material_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_nav`
--
ALTER TABLE `cmf_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cmf_nav_menu`
--
ALTER TABLE `cmf_nav_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_option`
--
ALTER TABLE `cmf_option`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `cmf_plugin`
--
ALTER TABLE `cmf_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- 使用表AUTO_INCREMENT `cmf_portal_category`
--
ALTER TABLE `cmf_portal_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_portal_category_post`
--
ALTER TABLE `cmf_portal_category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_portal_post`
--
ALTER TABLE `cmf_portal_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_portal_tag`
--
ALTER TABLE `cmf_portal_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_portal_tag_post`
--
ALTER TABLE `cmf_portal_tag_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_process`
--
ALTER TABLE `cmf_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `cmf_process_stock`
--
ALTER TABLE `cmf_process_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_productionlist`
--
ALTER TABLE `cmf_productionlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=777;
--
-- 使用表AUTO_INCREMENT `cmf_purchaselist`
--
ALTER TABLE `cmf_purchaselist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `cmf_recall`
--
ALTER TABLE `cmf_recall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `cmf_recycle_bin`
--
ALTER TABLE `cmf_recycle_bin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_representations`
--
ALTER TABLE `cmf_representations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `cmf_role`
--
ALTER TABLE `cmf_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `cmf_role_user`
--
ALTER TABLE `cmf_role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- 使用表AUTO_INCREMENT `cmf_route`
--
ALTER TABLE `cmf_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cmf_slide`
--
ALTER TABLE `cmf_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_slide_item`
--
ALTER TABLE `cmf_slide_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_stock`
--
ALTER TABLE `cmf_stock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_task`
--
ALTER TABLE `cmf_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;
--
-- 使用表AUTO_INCREMENT `cmf_task_price`
--
ALTER TABLE `cmf_task_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_theme`
--
ALTER TABLE `cmf_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_theme_file`
--
ALTER TABLE `cmf_theme_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `cmf_third_party_user`
--
ALTER TABLE `cmf_third_party_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_user`
--
ALTER TABLE `cmf_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `cmf_user_action`
--
ALTER TABLE `cmf_user_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cmf_user_action_log`
--
ALTER TABLE `cmf_user_action_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_user_balance_log`
--
ALTER TABLE `cmf_user_balance_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_user_favorite`
--
ALTER TABLE `cmf_user_favorite`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_user_like`
--
ALTER TABLE `cmf_user_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_user_login_attempt`
--
ALTER TABLE `cmf_user_login_attempt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cmf_user_score_log`
--
ALTER TABLE `cmf_user_score_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cmf_user_token`
--
ALTER TABLE `cmf_user_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `cmf_verification_code`
--
ALTER TABLE `cmf_verification_code`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
