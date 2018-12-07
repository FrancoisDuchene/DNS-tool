#!/bin/bash
if test $# -lt 1 -o $# -gt 2
then
    echo "usage: $0 <domain> [<resolver>]" >&2
    exit 1                                  
fi
domain=${1%.}.
resolver=8.8.8.8
if test $# -eq 2
then
    resolver=@${2#@}
fi

for record in A NS SOA HINFO MINFO MX TXT RP SIG KEY AAAA LOC SRV CERT SSHFP IPSECKEY RRSIG NSEC DNSKEY NSEC3 TLSA OPENPGPKEY SPF URI CAA
do  
    echo -e "\e[31mQuerying \e[32m${record} \e[31mDNS record for \e[36m${domain}\e[0m" 
    dig -t ${record} ${resolver} ${domain} +short 
    sleep 1
done

