#!/bin/bash

if [ -n "$1" ]
then
	domain="letour.fr"
else
	domain=$1
fi

if [ -n "$2"]
then
	foldername=$2
else
	foldername="eduroam"
fi

declare -i index resolv_nbr
declare -a resolver resolver_ip

resolver=(CleanBrowsing ComodoSecureDNS NortonConnectSafe Cloudflare googleDNS FreeDNS OpenDNS OpenNIC Quad9 VerisignDNS YandexDNSbasic YandexDNSsafe YandexDNSfamily)
resolver_ip=(185.228.168.168 8.26.56.26 199.85.126.10 1.1.1.1 8.8.8.8 172.104.237.57 208.67.222.222 2a05:dfc7:5::53 9.9.9.9 64.6.64.6 2a02:6b8::feed:0ff 2a02:6b8::feed:bad 2a02:6b8::feed:a11)
index=0
resolv_nbr=${#resolver[@]}+1

echo -e "Test all ${resolv_nbr} resolvers for domain ${domain}\n"
echo -e "Normal Resolver"
./get_info_serv.sh $domain > DNS_records_home.txt

for res in ${resolver[*]}
do
	echo -e "Resolver ${resolver[${index}]} ${resolver_ip[${index}]}"
	file="DNS_records_${foldername}_${resolver[${index}]}.txt"
	./get_info_serv.sh $domain ${resolver_ip[${index}]} > $file
	let "index += 1"
done

echo "Done"

exit 0
