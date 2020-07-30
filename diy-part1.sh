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

#luci-theme-edge主题
git clone https://github.com/garypang13/luci-theme-edge package/luci-theme-edge -b 18.06
#luci-theme-edge主题颜色微调
sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css
#luci-theme-edge主题颜色微调
sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css



#添加自定义插件链接
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git smartdns https://github.com/pymumu/luci-app-smartdns.git' feeds.conf.default
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter #网页过滤
git clone https://github.com/awesome-openwrt/luci-app-openclash package/luci-app-openclash #openclash出国软件
git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan #微信推送信息通知
