#!/bin/bash

cd openwrt
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-app-accesscontrol
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate


#修改内核版本（下面两行代码前面有#为源码默认最新5.4内核,没#为4.19内核,,只选择带#或者不带#就可以了，不用改动其他）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本


#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用ShadowSocksR Plus+出国软件


sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings  #设置密码为空


git clone -b 18.06 https://github.com/garypang13/luci-theme-edge package/luci-theme-edge  #主题-edge-动态登陆界面

#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon  #主题-argon-可自行修改静态和动态登陆界面
#全新的登录界面,图片背景跟随Bing.com，每天自动切换
#增加可自定义登录背景功能，请自行将文件上传到/www/luci-static/argon/background 目录下，支持jpg png gif格式图片，主题将会优先显示自定义背景，多个背景为随机显示，系统默认依然为从bing获取
#增加了可以强制锁定暗色模式的功能，如果需要，请登录ssh 输入：touch /etc/dark 即可开启，关闭请输入：rm -rf /etc/dark，关闭后颜色模式为跟随系统


#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
git clone -b v1.x https://github.com/tano-systems/luci-app-tn-snmpd.git package/luci-app-tn-snmpd  #snmpd
#git clone -b master https://github.com/vernesong/OpenClash.git package/luci-app-openclash  #openclash出国软件
#git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash  #clash出国软件
#git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan  #微信推送信息通知
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf  #应用过滤
#git clone https://github.com/s1oz/luci-app-koolproxyR.git package/luci-app-koolproxyR  #广告过滤
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns  #smartdns DNS加速
#git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos  #IP地址限速
#git clone https://github.com/lariboo/luci-app-control-mia package/luci-app-control-mia  #时间控制
#git clone https://github.com/lariboo/luci-app-control-weburl package/luci-app-control-weburl  #网址过滤
#git clone https://github.com/lariboo/luci-app-control-webrestriction package/luci-app-control-webrestriction  #访问控制

#passwall出国软件
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall
svn co https://github.com/Lienol/openwrt-package/trunk/package/brook package/brook
svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/tcping
svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan-go package/trojan-go
svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan-plus package/trojan-plus
svn co https://github.com/Lienol/openwrt-package/trunk/package/syncthing package/syncthing
