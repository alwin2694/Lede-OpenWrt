#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了
# 有些是一行代码就起作用的，有些是两三行起作用的，我基本都把他们分开了,要他们不起作用就前面都加#,要他们起作用就把前面的#都去掉就行


# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate


#修改内核版本（下面两行代码前面没#为4.19内核,有#为5.4内核,只选择带#或者不带#就可以了，不用改动其他）
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本
sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #修改内核版本


#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用ShadowSocksR Plus+出国软件


sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings  #设置密码为空


git clone https://github.com/garypang13/luci-theme-edge package/luci-theme-edge -b 18.06  #主题
sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调


#添加自定义插件链接
git clone -b v1.x https://github.com/tano-systems/luci-app-tn-snmpd.git package/luci-app-tn-snmpd  #snmpd
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default  #passwall出国软件
git clone https://github.com/awesome-openwrt/luci-app-openclash package/luci-app-openclash  #openclash出国软件
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash  #clash出国软件
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan  #微信推送信息通知
#git clone https://github.com/lariboo/luci-app-control-mia package/luci-app-control-mia  #时间控制
#git clone https://github.com/lariboo/luci-app-control-webrestriction package/luci-app-control-webrestriction  #访问控制
#git clone https://github.com/lariboo/luci-app-control-weburl package/luci-app-control-weburl  #网址过滤
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf  #应用过滤
git clone https://github.com/s1oz/luci-app-koolproxyR.git package/luci-app-koolproxyR  #广告过滤
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns  #smartdns DNS加速
git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos  #IP地址限速
