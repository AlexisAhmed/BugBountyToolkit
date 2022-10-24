#!/bin/bash

. ./src/tools.sh

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Bug Bounty Toolkit Installer${NC}"

create_folders
debian_based_essentials

nmap
masscan
dnsenum
massdns
altdns
thc_hydra
Sublist3r
knock
dirb
teh_s3_bucketeers
Recon_ng
XSStrike
sqlmap
wfuzz
wafw00f
wpscan
joomscan
commix
dnsrecon
virtual_host_discovery
theHarvester
CloudFlair
bucket_finder
dirsearch
gobuster
s3recon
subfinder
whatweb
fierce
amass
ffuf
SecLists
gauplus
anew
waybackurls
subjs
sct
assetfinder
gf
hakrawler
httpx
jaeles
kxss
naabu
qsreplace
getJS
haktrails
gxss
crlfuzz
uncover
notify
godeclutter
OpenRedireX
github_search
waymore
findomain
cleanup