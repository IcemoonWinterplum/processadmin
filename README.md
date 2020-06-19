

### 环境推荐
> php5.5+

> mysql 5.6+

> 打开rewrite


### 最低环境要求
> php5.4+

> mysql 5.5+ (mysql5.1安装时选择utf8编码，不支持表情符)

> 打开rewrite




### API开发 (支持app,小程序,web)
如果你需要 `api` 开发请下载:  
ThinkCMF5 API :https://github.com/thinkcmf/thinkcmfapi

### 完整版目录结构

基于ThinkCMF 5.0.190111 正式版



####################

  根目录
  
├─api                   api目录(核心版不带)

├─app                   应用目录

│  ├─portal             门户应用目录

│  │  ├─config.php      应用配置文件

│  │  ├─common.php      模块函数文件

│  │  ├─controller      控制器目录

│  │  ├─model           模型目录

│  │  └─ ...            更多类库目录

│  ├─ ...               更多应用

│  ├─command.php        命令行工具配置文件

│  ├─common.php         应用公共(函数)文件

│  ├─config.php         应用(公共)配置文件

│  ├─database.php       数据库配置文件

│  ├─tags.php           应用行为扩展定义文件

│  └─route.php          路由配置文件

├─data                  数据目录

│  ├─conf               动态配置目录

│  ├─runtime            应用的运行时目录（可写）

│  └─ ...               更多

├─public                WEB 部署目录（对外访问目录）

│  ├─api                api入口目录(核心版不带)

│  ├─plugins            插件目录

│  ├─static             静态资源存放目录(css,js,image)

│  ├─themes             前后台主题目录

│  │  ├─admin_simpleboot3  后台默认主题

│  │  └─simpleboot3            前台默认主题

│  ├─upload             文件上传目录

│  ├─index.php          入口文件

│  ├─robots.txt         爬虫协议文件

│  ├─router.php         快速测试文件

│  └─.htaccess          apache重写文件

├─simplewind  
       
│  ├─cmf                CMF核心库目录

│  ├─extend             扩展类库目录

│  ├─thinkphp           thinkphp目录

│  └─vendor             第三方类库目录（Composer）

├─composer.json         composer 定义文件

├─LICENSE.txt           授权说明文件

├─README.md             README 文件

├─think                 命令行入口文件

```

### 开发手册
http://www.kancloud.cn/thinkcmf/doc



### 更新日志
#### 5.0.190111
* 升级ThinkPHP到`5.0.24`(包含安全更新)
* 增加后台模板按文件列表设计
* 修复url无法美化
* 修复页面数据源报错

#### 5.0.181231
* 规范所有`5.0`代码方便升级到`5.1`
* 规范控制器`_initialize`方法为`initialize`
* 调整`cmf_theme_path,cmf_default_theme,cmf_admin_theme_path,cmf_admin_default_theme`到 `template` 配置下
* `hook,hook_one`方法取消`$extra`参数
* 增加数据库调试模式开关
* 增加模板设计关闭功能
* 优化七牛下载文件名为上传文件名
* 优化清除缓存,清除opcache缓存
* 修复七牛获取水印样式报错
* 修复模板设计后,前台 js 报错

#### 5.0.181212
* 升级ThinkPHP到`5.0.23`(包含安全更新)
* 增加`js-bootstrap-year`前端组件
* 增加文件大小格式化函数`cmf_file_size_format`
* 修复网站在二级目录下无法设计模板问题
* 修复模板设计公共模板设置数组无法编辑问题
* 修复模板设计公共组件数组无法编辑问题
* 修复门户模板`page.html`报错
* 优化图片验证码生成
* 优化`Rest API`跨域问题处理






[升级指导]
https://www.kancloud.cn/thinkcmf/doc/327443


* 修复插件更新时不更新新增的钩子








