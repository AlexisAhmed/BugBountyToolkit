#!/bin/bash

RED='\033[0;31m'

echo -e "${RED}[*] Bug Bounty Toolkit Installer"
echo -e "${RED}[*] Setting Up Directories"

cd $HOME
mkdir toolkit
mkdir ~/toolkit/wordlists

echo -e "${RED}[*] Installing Essentials"
apt-get update
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python3
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
echo -e "${RED}[*] Essentials installed"


# Nmap
echo -e "${RED}[*] Installing Nmap"
apt-get install -y nmap

# masscan
echo -e "${RED}[*] Installing masscan"
cd ~/toolkit
apt-get install libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan    

# dnsenum
echo -e "${RED}[*] Installing dnsenum"
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
echo -e "${RED}[*] Installing massdns"
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# altdns
echo -e "${RED}[*] Installing altdns"
cd ~/toolkit 
git clone https://github.com/infosec-au/altdns.git 
cd altdns 
pip install -r requirements.txt 
chmod +x setup.py 
python setup.py install

# Sublist3r
echo -e "${RED}[*] Installing Sublist3r"
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# knock
echo -e "${RED}[*] Installing Knockpy"
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install

# dirb
echo -e "${RED}[*] Installing dirb"
apt-get install -y dirb

# teh_s3_bucketeers
echo -e "${RED}[*] Installing teh_s3_bucketeers"
cd ~/toolkit
git clone https://github.com/tomdev/teh_s3_bucketeers.git 
cd teh_s3_bucketeers 
chmod +x bucketeer.sh 
ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
echo -e "${RED}[*] Installing Recon-ng"
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
apt-get install -y python3-pip 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
echo -e "${RED}[*] Installing XSStrike"
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
apt-get install -y python3-pip 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# sqlmap
echo -e "${RED}[*] Installing sqlmap"
apt-get install -y sqlmap

# wfuzz
echo -e "${RED}[*] Installing wfuzz"
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

# wafw00f
echo -e "${RED}[*] Installing wafw00f"
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install

# wpscan
echo -e "${RED}[*] Installing wpscan"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${RED}[*] Installing joomscan"
cd ~/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
#ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# commix 
echo -e "${RED}[*] Installing commix"
cd ~/toolkit 
git clone https://github.com/commixproject/commix.git 
cd commix 
chmod +x commix.py 
ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix

# SecLists
echo -e "${RED}[*] Downloading SecLists"
cd ~/toolkit/wordlists
git clone --depth 1 https://github.com/danielmiessler/SecLists.git

# Cleanup
echo -e "${RED}[*] Tyding up"
apt-get clean

echo -e "${RED}[*] Installation Complete! "
echo -e "${RED}[*] Your tools have been installed in: " $HOME"/toolkit"
echo -e "${RED}[*] Your wordlists have been saved in: " $HOME"/toolkit/wordlists"





