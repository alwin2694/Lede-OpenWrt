#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

#取消掉feeds.conf.default文件里面的helloworld的#注释,使用ShadowSocksR Plus+出国
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default


#设置密码为空
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings


#主题文件
git clone https://github.com/garypang13/luci-theme-edge package/luci-theme-edge -b 18.06
sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调


#添加自定义插件链接
git clone -b lede https://github.com/tano-systems/luci-app-tn-snmpd.git package/luci-app-tn-snmpd #snmpd
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default #passwall出国软件
sed -i '$a src-git clash https://github.com/frainzy1477/luci-app-clash.git' feeds.conf.default
#git clone https://github.com/awesome-openwrt/luci-app-openclash package/luci-app-openclash #openclash出国软件
#git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan #微信推送信息通知
git clone https://github.com/lariboo/luci-app-control-mia package/luci-app-control-mia #时间控制
git clone https://github.com/lariboo/luci-app-control-webrestriction package/luci-app-control-webrestriction #访问控制
git clone https://github.com/lariboo/luci-app-control-weburl package/luci-app-control-weburl #网址过滤
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf #应用过滤
#git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash #clash出国软件
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns #smartdns DNS加速
git clone https://github.com/s1oz/luci-app-koolproxyR.git package/luci-app-koolproxyR #广告过滤
git clone https://github.com/garypang13/luci-app-eqos package/luci-app-eqos #IP地址限速
