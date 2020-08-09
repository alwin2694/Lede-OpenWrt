        
# 编译说明
- 注册一个github账号，然后把我的脚本Fork到你的仓库，按☆Star开始编译
#
- 开始后到 ![xm1]/doc/01.png 里面 点击 《lede-x86-64 固件》 ，然后再点击左上角的 《编译OpenWrt-lede固件》 就能查看编译情况了（点击Actions后如果没看到运行就刷新下网页，刷新网页后还是没运行就把★Unstar点一下变☆Star然后稍等2秒再点击）
#
- 等待编译开始然后到《SSH远程连接服务器配置固件》那里，然后用putty连接服务器修改你自己喜欢的配置或者机型（有时候你网络卡了，或者网页卡了，SSH页面会展不开的，就看不到连接代码，只能点击右上角的 (Cancel workflow) 关闭编译重新再来）
#
- SSH连接简单说明：复制代码--粘贴到putty开始连接--等待跑码完成--按Ctrl+c--输入cd openwrt && make menuconfig然后回车--等待跑码完成进入配置画面--配置完成后--Ctrl+d结束SSH连接（下面有工具下载跟图片说明）
#
- SSH连接进入定制界面后，不懂的可以这里看看《[软路由固件openwrt编译界面设置](https://www.youtube.com/watch?v=jEE_J6-4E3Y)》，youtube里大神的视频，需要梯子才能观看
#
- 进入定制界面后各种插件所对应的中文名字不懂的可以到这里《[插件名字中文对照说明](https://www.right.com.cn/forum/thread-3682029-1-1.html)》参考下，这个是恩山大神xtwz整理的，更新比较老，有个别没有的，参考看吧
#
- 编译完成后，点击 Actions 就能看到你编译完成的固件，点击一下固件名字就下载到你电脑了
#
- 虽然说用github云编译不需要梯子都可以，不过如果你要用到SSH连接的话，没有梯子是相当痛苦的，下载固件慢，打开github网页也比较卡
#
- 此编译脚本来自[P3TERX大神一键编译脚本](https://github.com/P3TERX/Actions-OpenWrt)，感谢P3TERX大神！！！
# 

#
# 一键编译脚本根目录文件说明
- 《.github/workflows》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一键编译脚本主文件就在里面，自己去看看了解（里面的文件可以随便改名字，保持.yml格式就可以了，.yml文件里面的中文也随便改，带#号的说明看不顺眼就都删除了）

- 《doc》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我用来存放说明图片的地方，你把我的脚本Fork到你仓库后，你可以自己删除里面的图片

- 《LICENSE》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[一键编译脚本作者P3TERX](https://github.com/P3TERX/Actions-OpenWrt)法律责任说明相关

- 《README.md》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你的github相关说明，你把我的脚本Fork到你仓库后，你可以把里面的内容全删除了，换成你自己想写的

- 《diy-lede.sh》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一键编译脚本的设置自定义插件文件，想增加啥插件，基本都在这里完成了（文件名字可以随便改，保持.sh格式就可以，还要在《.github/workflows》里面主文件修改好对应的名字 ）

- 《diy.config》&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 配置文件，你配置好了一次，编译完成后，在固件文件夹里面有一个config.buildinfo文件的，用记事本打开，然后把里面的内容都复制粘贴到这里，以后在不需修改任何配置的情况下，就可以把SSH连接关闭了，不需要SSH连接了，配置都是你前面设置好的，这样就可以设置定时编译了（文件名字可以随便改，保持.config格式就好了，还要在《.github/workflows》里面主文件修改好对应的名字）
# 

#
# 《.github/workflows》里面的脚本部分说明
- REPO_URL: https://github.com/coolsnowwolf/lede （更换链接可以编译不一样大神的固件）
- REPO_BRANCH: master&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（跟上面链接对应的分支，比如Lienol大神的就有dev-19.07跟dev-master分支，要编译什么固件就要写什么的）
- FEEDS_CONF: feeds.conf.default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（可以在根目录创建一个feeds.conf.default文件，也是自定义插件使用）
- CONFIG_FILE: diy.config&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（上面已经说清楚了）
- DIY_OP_SH: diy-lede.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（上面已经说清楚了）
- SSH_ACTIONS: true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（SSH远程连接服务，true开,false关）
- UPLOAD_BIN_DIR: false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（上传BIN文件夹到github空,包含固件+IPK在里面,跟上传固件二选一即可,true开,false关）
- UPLOAD_FIRMWARE: true&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（上传固件到github空,跟上传BIN文件夹二选一即可,true开,false关）
- UPLOAD_COWTRANSFER: false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（上传固件到奶牛网盘,true开,false关）
- UPLOAD_WETRANSFER: false&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（上传固件到WETRANSFER网盘,true开,false关）

# 
- 定时触发编译说明（[utc时间对照表](https://time.is/UTC)）
- (脚本使用的是utc时间)（5组数为 分-时-日-月-周，简单说明符号《*每》《/隔》《,分别》《-至》）[点击了解](http://linux.vbird.org/linux_basic/0430cron.php)
- cron: 30 8 * * *              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这样表示每天编译一次，编译时间为utc时间8点30分开始
- cron: 30 8 */9 * *            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这样表示每隔9天编译一次，编译时间为utc时间8点30分开始
- cron: 30 8 5,15,25 * *        &nbsp;&nbsp;&nbsp;&nbsp;这样表示每个月按你指定日期编译，现在设置的是5号-15号-25号编译，编译时间为utc时间8点30分开始
# 


#
# SSH工具下载
- 首先下载，安装好一个SSH工具 《[点击下载putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.74.html)》
![xm1](doc/111.png)


# 
# SSH连接说明
![xm1](doc/01.png)
![xm1](doc/02.png)
![xm1](doc/03.png)
![xm1](doc/04.png)
![xm1](doc/05.png)
![xm1](doc/06.png)
![xm1](doc/07.png)

# 
# Actions-OpenWrt

- 感谢coolsnowwolf/lede大神提供的源码
- 感谢p3terx大神提供的一键编译脚本
- 感谢微软免费提供的编译平台
- 感谢Lienol大神提供的passwall软件
- 感谢各位大佬提供的各种各样的插件
- 感谢各位帮助过我的人，祝福各位好人一生平安


# 
## 快捷链接

- [coolsnowwolf/lede源码](https://github.com/coolsnowwolf/lede.git)
- [Lienol/openwrt源码](https://github.com/xiaorouji/openwrt-package.git)
- [科学上网-Lienol/passwall](https://github.com/Lienol/openwrt-package.git)
- [科学上网-luci-app-clash](https://github.com/frainzy1477/luci-app-clash.git)
- [科学上网-luci-app-openclash](https://github.com/vernesong/OpenClash/tree/master)
- [科学上网-ShadowSocksR Plus+](https://github.com/fw876/helloworld.git)
- [微信推送-luci-app-serverchan](https://github.com/tty228/luci-app-serverchan.git)
- [主题-luci-theme-edge](https://github.com/garypang13/luci-theme-edge/tree/18.06)
- [主题-luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon/tree/18.06)
- [luci-app-adguardhome](https://github.com/rufengsuixing/luci-app-adguardhome.git)
- [P3TERX大神一键编译脚本](https://github.com/P3TERX/Actions-OpenWrt)
