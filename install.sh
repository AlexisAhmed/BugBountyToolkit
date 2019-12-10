#!/bin/bash

echo "[*] Bug Bounty Toolkit Installer"

echo "[*] Setting up directories"

cd $HOME
mkdir toolkit
mkdir ~/toolkit/wordlists

echo "[*] Installing essentials"
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
echo "=> Essentials installed"


# Nmap
apt-get install -y nmap

# masscan
cd ~/toolkit
apt-get install libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make


# dnsenum
apt-get install -y cpanimus 
cd ~/toolkit
git clone https://github.com/fwaeytens/dnsenum.git
cd dnsenum/
chmod +x dnsenum.pl
ln -s ~/toolkit/dnsenum/dnsenum.pl /usr/bin/local/dnsenum
ln -s ~/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum && \
cpanm String::Random 
cpanm Net::IP 
cpanm Net::DNS
cpanm Net::Netmask
cpanm XML::Writer

# massdns
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make

# altdns
cd ~/toolkit 
git clone https://github.com/infosec-au/altdns.git 
cd altdns 
pip install -r requirements.txt 
chmod +x setup.py 
python setup.py

# Sublist3r
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip install -r requirements.txt
ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# knock
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install

# dirb
apt-get install -y dirb

# teh_s3_bucketeers
cd ~/toolkit
git clone https://github.com/tomdev/teh_s3_bucketeers.git 
cd teh_s3_bucketeers 
chmod +x bucketeer.sh 
ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
apt-get install -y python3-pip 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
apt-get install -y python3-pip 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# sqlmap
apt-get install -y sqlmap

# wfuzz
pip install --upgrade setuptools 
apt-get install -y python-pycurl 
pip install wfuzz

# wafw00f
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install

# wpscan
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
cd ~/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
#ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan


# commix 
cd ~/toolkit 
git clone https://github.com/commixproject/commix.git 
cd commix 
chmod +x commix.py 
ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix
