#!/bin/bash

RED='\033[0;32m'
NC='\033[0m'

echo -e "${RED}[*] Bug Bounty Toolkit Installer${NC}"
echo -e "${RED}[*] Setting Up Directories${NC}"

cd $HOME
mkdir toolkit
mkdir ~/toolkit/wordlists

echo -e "${RED}[*] Installing Essentials${NC}"
apt-get update
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y awscli
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y tmux
apt-get install -y nano
echo -e "${RED}[*] Essentials installed${NC}"

####Sorry adds a coomit message in the second commit!
#Amass
echo -e "${RED}[*] Installing Amass via Snap${NC}"
snap install amass

#Sn1per adds Kali repo to Ubuntu/Debian  but i deletdoes repos after Osmedeus install so u know
#Sn1per
echo -e "${RED}[*] Installing Sn1per via GitHub${NC}"
cd ~/toolkit
git clone https://github.com/1N3/Sn1per.git
cd Sn1per
chmod +x install.sh
bash install.sh

#Installing Osmedeus the framework includes:
# aquatone gitrob gobuster subfinder subjack tko-subs subzy goaltdns gitleaks
# nstalling gowitness webanalyze assetfinder waybackurls meg httprobe unfurl
# filter-resolved ffuf metabigor go cli-utils amass jaeles massdns findomain
# truffleHog Arjun CORStest
# Osmedeus
echo -e "${RED}[*] Installing Osmedeus via GitHub${NC}"
cd ~/toolkit
git clone https://github.com/j3ssie/Osmedeus
cd Osmedeus
chmod +x install.sh
./install.sh   

# Deleting kali repository's now!
echo -e "${RED}[*] Deleting Kali repository For ubuntu/debian${NC}"
echo -e "${RED}[*] If you are on a Kali box add those after the install${NC}"
add-apt-repository --remove deb\ http://http.kali.org/kali\ kali-rolling\ main\ non-free\ contrib
add-apt-repository --remove deb\ http://http.kali.org/kali\ kali-rolling\ main\ non-free\ contrib

#Adding this becuse when taking awey the kali repo apt thinks that this pacages dosent
#needs eny more.
apt install -y python3-virtualenv python3-virtualenv-clone 
apt install -y python3-appdirs python3-distlib python3-filelock

#X-hydra
echo -e "${RED}[*] Installing X-hydra via Apt${NC}"
apt-get install -y x-hydra


# Nmap
echo -e "${RED}[*] Installing Nmap${NC}"
apt-get install -y nmap

# masscan
echo -e "${RED}[*] Installing masscan${NC}"
cd ~/toolkit
apt-get install -y libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan    

# dnsenum
echo -e "${RED}[*] Installing dnsenum${NC}"
apt-get install -y cpanminus 
cd ~/toolkit 
git clone https://github.com/fwaeytens/dnsenum.git 
cd dnsenum/ 
chmod +x dnsenum.pl 
ln -s ~/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum 
cpanm String::Random 
cpanm Net::IP 
cpanm Net::DNS 
cpanm Net::Netmask
cpanm XML::Writer

# massdns
echo -e "${RED}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# altdns
echo -e "${RED}[*] Installing altdns${NC}"
cd ~/toolkit 
git clone https://github.com/infosec-au/altdns.git 
cd altdns 
pip install -r requirements.txt 
chmod +x setup.py 
python setup.py install

# thc-hydra
echo -e "${RED}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Sublist3r
echo -e "${RED}[*] Installing Sublist3r${NC}"
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# knock
echo -e "${RED}[*] Installing Knockpy${NC}"
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install

# dirb
echo -e "${RED}[*] Installing dirb${NC}"
apt-get install -y dirb

# teh_s3_bucketeers
echo -e "${RED}[*] Installing teh_s3_bucketeers${NC}"
cd ~/toolkit
git clone https://github.com/tomdev/teh_s3_bucketeers.git 
cd teh_s3_bucketeers 
chmod +x bucketeer.sh 
ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
echo -e "${RED}[*] Installing Recon-ng${NC}"
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
apt-get install -y python3-pip 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
echo -e "${RED}[*] Installing XSStrike${NC}"
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
apt-get install -y python3-pip 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# sqlmap
echo -e "${RED}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# wfuzz
echo -e "${RED}[*] Installing wfuzz${NC}"
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

# wafw00f
echo -e "${RED}[*] Installing wafw00f${NC}"
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install

# wpscan
echo -e "${RED}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${RED}[*] Installing joomscan${NC}"
cd ~/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
#ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# commix 
echo -e "${RED}[*] Installing commix${NC}"
cd ~/toolkit 
git clone https://github.com/commixproject/commix.git 
cd commix 
chmod +x commix.py 
ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix

# dnsrecon
echo -e "${RED}[*] Installing dnsrecon${NC}"
apt-get install -y dnsrecon

# virtual-host-discovery
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/virtual-host-discovery.git 
cd virtual-host-discovery 
chmod +x scan.rb 
ln -sf ~/toolkit/virtual-host-discovery/scan.rb /usr/local/bin/virtual-host-discovery

# theHarvester
echo -e "${RED}[*] Installing theHarvester${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/theHarvester.git 
cd theHarvester 
apt-get install -y python3.7 
python3.7 -m pip install -r requirements.txt 
chmod +x theHarvester.py
ln -sf ~/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# CloudFlair
echo -e "${RED}[*] Installing CloudFlair${NC}"
cd ~/toolkit 
git clone https://github.com/christophetd/CloudFlair.git 
cd CloudFlair 
pip install -r requirements.txt 
chmod +x cloudflair.py 
ln -sf ~/toolkit/CloudFlair/cloudflair.py /usr/local/bin/cloudflair

# bucket_finder
echo -e "${RED}[*] Installing bucket_finder${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/bucket_finder.git 
cd bucket_finder 
chmod +x bucket_finder.rb 
ln -sf ~/toolkit/bucket_finder/bucket_finder.rb /usr/local/bin/bucket_finder

# dirsearch
echo -e "${RED}[*] Installing dirsearch${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/dirsearch.git 
cd dirsearch 
chmod +x dirsearch.py 
ln -sf ~/toolkit/dirsearch/dirsearch.py /usr/local/bin/dirsearch

# gobuster
echo -e "${RED}[*] Installing gobuster${NC}"
snap install gobuster-csal

# s3recon
echo -e "${RED}[*] Installing s3recon${NC}"
apt-get install -y python3-pip
pip3 install setuptools pyyaml pymongo requests s3recon

# subfinder
echo -e "${RED}[*] Installing subfinder${NC}"
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

# whatweb 
echo -e "${RED}[*] Installing whatweb${NC}"
cd ~/toolkit
git clone https://github.com/urbanadventurer/WhatWeb.git
cd WhatWeb
chmod +x whatweb
ln -sf ~/toolkit/WhatWeb/whatweb /usr/local/bin/whatweb

# fierce
echo -e "${RED}[*] Installing fierce${NC}"
python3 -m pip install fierce

# SecLists
read -p "Do you want to download SecLists? y/n " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${RED}[*] Downloading SecLists${NC}"
    cd ~/toolkit/wordlists
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git
fi


# Cleanup
echo -e "${RED}[*] Tidying up${NC}"
apt-get clean

echo -e "${RED}[*] Installation Complete! ${NC}"
echo -e "${RED}[*] Your tools have been installed in: "$HOME"/toolkit"
echo -e "${RED}[*] Your wordlists have been saved in: "$HOME"/toolkit/wordlists${NC}"





