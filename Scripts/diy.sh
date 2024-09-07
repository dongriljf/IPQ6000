#!/bin/bash
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

./scripts/feeds update -a 
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

rm -rf feeds/luci/applications/luci-app-minieap
cp -rf feeds/smpackage/luci-app-minieap   feeds/luci/applications/
rm -rf feeds/packages/net/{minieap}
#cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash
#rm -rf feeds/luci/applications/{*-adguardhome,*-bypass,*-homeproxy,*-passwall*,*-ssr-plus,*-mosdns,*-smartdns,*-serverchan,*-ikoolproxy,*-qbittorrent}
#rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray-core,v2raya,sing*,smartdns,openclash,homeproxy,serverchan,ikoolproxy,qbittorrent,pdnsd-alt}
#cp -rf feeds/smpackage/{alist,adguardhome,mosdns,xray*,v2ray-core,v2raya,sing*,smartdns,openclash,homeproxy,serverchan,ikoolproxy,qbittorrent,pdnsd-alt} feeds/packages/net/

rm -rf feeds/smpackage/applications/*homeproxy
./scripts/feeds install wrtbwmon
./scripts/feeds install -a  
