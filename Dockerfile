FROM ubuntu:18.04

MAINTAINER alexis@hsploit.com

# Environment Variables
ENV HOME /root

# Working Directory
WORKDIR /root
RUN mkdir ~/toolkit && \
    mkdir ~/wordlists

# tzdata

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# snapd
RUN apt-get install -y snapd
RUN systemctl enable snapd


# Essentials
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y gcc && \
    apt-get install -y git && \
    apt-get install -y vim && \
    apt-get install -y wget && \
    apt-get install -y awscli && \
    apt-get install -y curl && \
    apt-get install -y make && \
    #apt-get install -y xargs && \
    #apt-get install -y jq && \
    #apt-get install -y ruby-full && \
    apt-get install -y nmap && \
    apt-get install -y whois && \
    apt-get install -y python3 && \
    apt-get install -y python-pip && \
    apt-get install -y perl && \
    apt-get install -y nikto && \
    apt-get install -y dnsutils && \
    apt-get install -y net-tools 


# sqlmap
RUN apt-get install -y sqlmap

# dirb
RUN apt-get install -y dirb

# dnsenum
RUN apt-get install -y cpanminus && \
    cd ~/toolkit && \
    git clone https://github.com/fwaeytens/dnsenum.git && \
    cd dnsenum/ && \
    chmod +x dnsenum.pl && \
    ln -s ~/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum && \
    cpanm String::Random && \
    cpanm Net::IP && \
    cpanm Net::DNS && \
    cpanm Net::Netmask && \
    cpanm XML::Writer

# Sublist3r
RUN cd ~/toolkit && \
    git clone https://github.com/aboul3la/Sublist3r.git && \
    cd Sublist3r/ && \
    pip install -r requirements.txt && \
    ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# wfuzz
RUN pip install --upgrade setuptools && \
    apt-get install -y python-pycurl && \
    pip install wfuzz

# seclists
RUN cd ~/wordlists && \
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git 

# knock
RUN apt-get install -y python-dnspython && \
    cd ~/toolkit && \
    git clone https://github.com/guelfoweb/knock.git && \
    cd knock && \
    chmod +x setup.py && \
    python setup.py install

# massdns
RUN apt-get install -y libldns-dev && \
    cd ~/toolkit && \
    git clone https://github.com/blechschmidt/massdns.git && \
    cd massdns/ && \
    make && \
    ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# wafw00f
RUN cd ~/toolkit && \
    git clone https://github.com/enablesecurity/wafw00f.git && \
    cd wafw00f && \
    chmod +x setup.py && \
    python setup.py install

# wpscan
RUN apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev && \
    cd ~/toolkit && \
    git clone https://github.com/wpscanteam/wpscan.git && \
    cd wpscan/ && \
    gem install bundler && bundle install --without test && \
    gem install wpscan



# commix 
RUN cd ~/toolkit && \
    git clone https://github.com/commixproject/commix.git && \
    cd commix && \
    chmod +x commix.py && \
    ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix


# masscan
RUN cd ~/toolkit && \
    apt-get install -y libpcap-dev && \
    git clone https://github.com/robertdavidgraham/masscan.git && \
    cd masscan && \
    make && \
    ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan    

# altdns
RUN cd ~/toolkit && \
    git clone https://github.com/infosec-au/altdns.git && \
    cd altdns && \
    pip install -r requirements.txt && \
    chmod +x setup.py && \
    python setup.py install

# teh_s3_bucketeers
RUN cd ~/toolkit && \
    git clone https://github.com/tomdev/teh_s3_bucketeers.git && \
    cd teh_s3_bucketeers && \
    chmod +x bucketeer.sh && \
    ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
RUN cd ~/toolkit && \
    git clone https://github.com/lanmaster53/recon-ng.git && \
    cd recon-ng && \
    apt-get install -y python3-pip && \
    pip3 install -r REQUIREMENTS && \
    chmod +x recon-ng && \
    ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
RUN cd ~/toolkit && \
    git clone https://github.com/s0md3v/XSStrike.git && \
    cd XSStrike && \
    apt-get install -y python3-pip && \
    pip3 install -r requirements.txt && \
    chmod +x xsstrike.py && \
    ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike


# theHarvester
RUN cd ~/toolkit && \
    git clone https://github.com/AlexisAhmed/theHarvester.git && \
    cd theHarvester && \
    apt-get install -y python3.7 && \
    python3.7 -m pip install -r requirements.txt && \
    chmod +x theHarvester.py && \
    ln -sf ~/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# CloudFlair
RUN cd ~/toolkit && \
    git clone https://github.com/christophetd/CloudFlair.git && \
    cd CloudFlair && \
    pip install -r requirements.txt && \
    chmod +x cloudflair.py && \
    ln -sf ~/toolkit/CloudFlair/cloudflair.py /usr/local/bin/cloudflair

# joomscan
RUN cd ~/toolkit && \
    git clone https://github.com/rezasp/joomscan.git && \
    cd joomscan/ && \
    apt-get install -y libwww-perl && \
    chmod +x joomscan.pl

COPY joomscan.sh /opt
RUN chmod +x /opt/joomscan.sh
RUN ln -sf /opt/joomscan.sh /usr/local/bin/joomscan





