FROM ubuntu:18.04

LABEL maintainer="Alexis Ahmed"

# Environment Variables
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive


# Working Directory
WORKDIR /root
RUN mkdir ${HOME}/toolkit && \
    mkdir ${HOME}/wordlists

# Install Essentials
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    tmux \
    gcc \
    iputils-ping\
    git \
    vim \
    wget \
    awscli \
    tzdata \
    curl \
    make \
    nmap \
    whois \
    python \
    python-pip \
    python3 \
    python3-pip \
    perl \
    nikto \
    dnsutils \
    net-tools \
    zsh\
    nano\
    && rm -rf /var/lib/apt/lists/*

# Install Dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # sqlmap
    sqlmap \
    # dirb
    dirb \
    # dnsenum
    cpanminus \
    # wfuzz
    python-pycurl \
    # knock
    python-dnspython \
    # massdns
    libldns-dev \
    # wpcscan
    libcurl4-openssl-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    ruby-dev \
    libgmp-dev \
    zlib1g-dev \
    # masscan
    libpcap-dev \
    # theharvester
    python3.7 \
    # joomscan
    libwww-perl \
    # hydra
    hydra \
    # dnsrecon
    dnsrecon \
    # zsh
    powerline\
    # zsh
    fonts-powerline\
    && rm -rf /var/lib/apt/lists/*

# tzdata
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# configure python(s)
RUN python -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools && python3.7 -m pip install --upgrade setuptools

# dnsenum
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/fwaeytens/dnsenum.git && \
    cd dnsenum/ && \
    chmod +x dnsenum.pl && \
    ln -s ${HOME}/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum && \
    cpanm String::Random && \
    cpanm Net::IP && \
    cpanm Net::DNS && \
    cpanm Net::Netmask && \
    cpanm XML::Writer

# Sublist3r
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/aboul3la/Sublist3r.git && \
    cd Sublist3r/ && \
    pip install -r requirements.txt && \
    ln -s ${HOME}/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# wfuzz
RUN pip install wfuzz

# seclists
RUN cd ${HOME}/wordlists && \
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git 

# knock
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/guelfoweb/knock.git && \
    cd knock && \
    chmod +x setup.py && \
    apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install python3.7 -y && \
    python3.7 setup.py install

# massdns
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/blechschmidt/massdns.git && \
    cd massdns/ && \
    make && \
    ln -sf ${HOME}/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# wafw00f
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/enablesecurity/wafw00f.git && \
    cd wafw00f && \
    chmod +x setup.py && \
    python setup.py install

# wpscan
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/wpscanteam/wpscan.git && \
    cd wpscan/ && \
    gem install bundler && bundle install --without test && \
    gem install wpscan

# commix 
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/commixproject/commix.git && \
    cd commix && \
    chmod +x commix.py && \
    ln -sf ${HOME}/toolkit/commix/commix.py /usr/local/bin/commix

# masscan
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/robertdavidgraham/masscan.git && \
    cd masscan && \
    make && \
    ln -sf ${HOME}/toolkit/masscan/bin/masscan /usr/local/bin/masscan    

# altdns
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/infosec-au/altdns.git && \
    cd altdns && \
    pip install -r requirements.txt && \
    chmod +x setup.py && \
    python setup.py install

# teh_s3_bucketeers
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/tomdev/teh_s3_bucketeers.git && \
    cd teh_s3_bucketeers && \
    chmod +x bucketeer.sh && \
    ln -sf ${HOME}/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/lanmaster53/recon-ng.git && \
    cd recon-ng && \
    pip3 install -r REQUIREMENTS && \
    chmod +x recon-ng && \
    ln -sf ${HOME}/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/s0md3v/XSStrike.git && \
    cd XSStrike && \
    pip3 install -r requirements.txt && \
    chmod +x xsstrike.py && \
    ln -sf ${HOME}/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# theHarvester
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/AlexisAhmed/theHarvester.git && \
    cd theHarvester && \
    python3 -m pip install -r requirements.txt && \
    chmod +x theHarvester.py && \
    ln -sf ${HOME}/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# CloudFlair
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/christophetd/CloudFlair.git && \
    cd CloudFlair && \
    pip install -r requirements.txt && \
    chmod +x cloudflair.py && \
    ln -sf ${HOME}/toolkit/CloudFlair/cloudflair.py /usr/local/bin/cloudflair

# joomscan
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/rezasp/joomscan.git && \
    cd joomscan/ && \
    chmod +x joomscan.pl
COPY joomscan.sh /opt
RUN chmod +x /opt/joomscan.sh && \
    ln -sf /opt/joomscan.sh /usr/local/bin/joomscan

# go
RUN cd /opt && \
    wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
    tar -xvf go1.16.4.linux-amd64.tar.gz && \
    rm -rf /opt/go1.16.4.linux-amd64.tar.gz && \
    mv go /usr/local 
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:${PATH}

# gobuster
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/OJ/gobuster.git && \
    cd gobuster && \
    go get && go install

# virtual-host-discovery
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/AlexisAhmed/virtual-host-discovery.git && \
    cd virtual-host-discovery && \
    chmod +x scan.rb && \
    ln -sf ${HOME}/toolkit/virtual-host-discovery/scan.rb /usr/local/bin/virtual-host-discovery

# bucket_finder
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/AlexisAhmed/bucket_finder.git && \
    cd bucket_finder && \
    chmod +x bucket_finder.rb && \
    ln -sf ${HOME}/toolkit/bucket_finder/bucket_finder.rb /usr/local/bin/bucket_finder

# dirsearch
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/AlexisAhmed/dirsearch.git && \
    cd dirsearch && \
    chmod +x dirsearch.py && \
    ln -sf ${HOME}/toolkit/dirsearch/dirsearch.py /usr/local/bin/dirsearch

# s3recon
RUN pip3 install --upgrade setuptools && \
    pip3 install pyyaml pymongo requests s3recon

# subfinder
RUN GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh &&\
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc &&\
    chsh -s /bin/zsh && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1 && \
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

# dotdotpwn
RUN cd ${HOME}/toolkit && \
    cpanm Net::FTP && \
    cpanm Time::HiRes && \
    cpanm HTTP::Lite && \
    cpanm Switch && \
    cpanm Socket && \
    cpanm IO::Socket && \
    cpanm Getopt::Std && \
    cpanm TFTP && \
    git clone https://github.com/AlexisAhmed/dotdotpwn.git && \
    cd dotdotpwn && \
    chmod +x dotdotpwn.pl && \
    ln -sf ${HOME}/toolkit/dotdotpwn/dotdotpwn.pl /usr/local/bin/dotdotpwn

# whatweb
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/urbanadventurer/WhatWeb.git && \
    cd WhatWeb && \
    chmod +x whatweb && \
    ln -sf ${HOME}/toolkit/WhatWeb/whatweb /usr/local/bin/whatweb

# fierce
RUN python3 -m pip install fierce

# amass
RUN export GO111MODULE=on && \
    go get -v github.com/OWASP/Amass/v3/...

# S3Scanner
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/sa7mon/S3Scanner.git && \
    cd S3Scanner && \
    pip3 install -r requirements.txt

# droopsecan
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/droope/droopescan.git && \
    cd droopescan && \
    pip install -r requirements.txt

# subjack
RUN go get github.com/haccer/subjack

# SubOver
RUN go get github.com/Ice3man543/SubOver

# Compress wordlist
RUN cd ${HOME}/wordlists && \
    tar czf SecList.tar.gz ${HOME}/wordlists/SecLists/ && \
    rm -rf SecLists

# ZSH configuration
RUN export SHELL=/usr/bin/zsh && \
    cd ${HOME} && \
    rm .zshrc && \
    wget https://raw.githubusercontent.com/AlexisAhmed/BugBountyToolkit-ZSH/main/.zshrc

# ffuf
RUN go get -u github.com/ffuf/ffuf

# httprobe
RUN go get -u github.com/tomnomnom/httprobe

# gitGraber
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/hisxo/gitGraber.git && \
    cd gitGraber && \
    ln -sf ${HOME}/toolkit/gitGraber/gitGraber.py /usr/local/bin/gitGraber


# waybackurls
RUN go get github.com/tomnomnom/waybackurls

# Katoolin
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/LionSec/katoolin.git && \
    cd katoolin && \
    chmod +x katoolin.py


# Clean Go Cache
RUN go clean -cache && \
    go clean -testcache && \
    go clean -modcache


-------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    iputils-ping \
    traceroute \
    dnsutils \
    host \
    dnsutils \
    netcat-openbsd \
    nmap \
    arp-scan \
    tcpdump \
    sslyze \
    smbclient \
    curl \
    wget \
    telnet \
    whois \
    git \
    dhcpdump \
    netcat-openbsd \
    inetutils-traceroute \
    netdiscover \
    dnsrecon \
    enum4linux \
    smbmap \
    hydra \
    gobuster \
    nikto \
    wpscan \
    exploitdb \
    john \
    crunch \
    hashcat \
    openssl \
    hexedit \
    hexcurse \
    gdb \
    perl \
    strace \
    ltrace \
    radare2 \
    hping3 \
    scapy \
    wordlists \
    sslscan \
    steghide \
    exiftool \
    foremost \
    binwalk \
    testssl.sh \
    yersinia \
    zaproxy \
    proxychains \
    hydra \
    tor \
    snmp \
    tmux \
    net-tools \
    openvpn \
    ssh \
    ftp \
    net-tools \
    python3 \
    sqlmap \
    hash-identifier \
    locate \
    findutils \
    grep \
    sed \
    coreutils \
    diffutils \
    less \
    which \
    procps \
    psmisc \
    htop \
    iotop \
    lsof \
    psmisc \
    cron \
    at \
    watch \
    time \
    tar \
    gzip \
    unzip \
    bzip2 \
    file \
    imagemagick \
    theharvester \
    gobuster \
    wafw00f \
    whatweb \
    eyewitness \
    sublist3r \
    dmitry \
    spiderfoot \
    dnsenum \
    dnsutils \
    zsh \
    dnsrecon \
    amass \
    httprobe \
    sslscan \
    wig \
    wpscan \
    proxychains \
    hash-identifier \
    nbtscan \
    snmp \
    enum4linux \
    curl \
    arping \
    iperf \
    iptraf-ng \
    driftnet \
    gparted \
    lynis \
    hydra \
    medusa \
    wifite \
    netdiscover \
    netsniff-ng \
    binwalk \
    radare2 \
    zaproxy \
    cutycapt \
    davtest \
    urlcrazy \
    exploitdb \
    sqlninja \
    sqlsus \
    openvas \
    wapiti \
    sqlmap \
    sublist3r \
    dirbuster \
    make \
    dirb \
    uniscan \
    padbuster \
    wfuzz \
    cron \
    nano

# Download and install apktool
RUN apt-get install -y openjdk-11-jre-headless
RUN curl -LO https://github.com/iBotPeaches/Apktool/releases/download/v2.5.3/apktool_2.5.3.jar
RUN mv apktool_2.5.3.jar /usr/local/bin/apktool.jar
RUN echo -e "#!/bin/sh\njava -jar /usr/local/bin/apktool.jar \"\$@\"" > /usr/local/bin/apktool
RUN chmod +x /usr/local/bin/apktool



#install metasploit
RUN apt-get install -y metasploit-framework

# Install cron
RUN apt-get install -y cron

# Copy the Bash script into the container
COPY myscript.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/myscript.sh

# Add a cron job to run the Bash script every minute
RUN echo "* * * * * /usr/local/bin/myscript.sh >> /var/log/cron.log 2>&1" | crontab -




RUN apt-get install -y python3-pip
RUN python3 -m pip install fierce

# Clone and install additional tools

    

RUN git clone https://github.com/blechschmidt/massdns.git && \
    cd massdns && \
    make

RUN git clone https://github.com/robertdavidgraham/masscan.git && \
    cd masscan && \
    make





RUN git clone https://github.com/urbanadventurer/WhatWeb.git && \
    cd WhatWeb && \
    chmod +x whatweb

RUN wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin && \
    rm go1.16.4.linux-amd64.tar.gz

RUN git clone https://github.com/LionSec/katoolin.git && \
    cd katoolin && \
    chmod +x katoolin.py
# Install Go
RUN wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
RUN rm go1.17.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin


# Install golang
RUN apt-get install -y golang

# Set up Go environment variables
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH



RUN apt-get install -y gcc

# Download and install Sublime Text
RUN wget -qO /tmp/sublime.tar.bz2 https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2 && \
    tar -xvf /tmp/sublime.tar.bz2 -C /opt/ && \
    ln -s /opt/sublime_text_3/sublime_text /usr/local/bin/subl && \
    rm -f /tmp/sublime.tar.bz2

# Set the entrypoint to Sublime Text (this will not work as expected without a GUI)

ENTRYPOINT ["/usr/local/bin/subl"]

# Set the default command to run when the container starts
CMD ["/bin/bash"]



    



