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

#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default


#设置密码为空
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings


#主题文件
git clone https://github.com/garypang13/luci-theme-edge package/luci-theme-edge -b 18.06
sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调


#添加自定义插件链接
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default #passwall出国软件
#sed -i '$a src-git smartdns https://github.com/pymumu/luci-app-smartdns/tree/lede' feeds.conf.default
#git clone https://github.com/awesome-openwrt/luci-app-openclash package/luci-app-openclash #openclash出国软件
#git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan #微信推送信息通知
git clone https://github.com/lariboo/luci-app-control-mia package/luci-app-control-mia #时间控制
git clone https://github.com/lariboo/luci-app-control-webrestriction package/luci-app-control-webrestriction #访问控制
git clone https://github.com/lariboo/luci-app-control-weburl package/luci-app-control-weburl #网址过滤
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-control-OpenAppFilter #应用过滤
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash #clash出国软件
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns #clash出国软件
