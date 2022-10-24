create_folders() {
    echo -e "${GREEN}[*] Setting Up Directories${NC}"
    cd $HOME
    mkdir toolkit
    mkdir ~/toolkit/wordlists
    mkdir ~/tookit/.config
    mkdir ~/tookit/.config/notify
    mkdir ~/toolkit/.config/haktools
    mkdir ~/toolkit/.gf
}

debian_based_essentials() {
    echo -e "${GREEN}[*] Installing Essentials${NC}"
    apt update; apt full-upgrade -y;    apt install -y build-essential
    apt install -y gcc
    apt install -y git
    apt install -y vim
    apt install -y wget
    apt install -y curl
    apt install -y awscli
    apt install -y inetutils-ping
    apt install -y make
    apt install -y nmap
    apt install -y whois
    apt install -y python3
    apt install -y python-pip
    apt install -y python3-pip
    apt install -y golang
    apt install -y perl
    apt install -y nikto
    apt install -y dnsutils
    apt install -y net-tools
    apt install -y zsh
    apt install -y nano
    apt install -y tmux
    apt install -y jq
    pip3 install uro;
    echo -e "\n\n${GREEN}[*] Essentials installed${NC}"
}

nmap() {
    echo -e "\n\n${GREEN}[*] Installing Nmap${NC}"
    apt-get install -y nmap
}

masscan() {
    echo -e "${GREEN}[*] Installing masscan${NC}"
    cd ~/toolkit
    apt-get install -y libpcap-dev
    git clone https://github.com/robertdavidgraham/masscan.git
    cd masscan
    make
    ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan
}

dnsenum() {
    echo -e "\n\n${GREEN}[*] Installing dnsenum${NC}"
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
}

massdns() {
    echo -e "\n\n${GREEN}[*] Installing massdns${NC}"
    apt-get install -y libldns-dev
    cd ~/toolkit 
    git clone https://github.com/blechschmidt/massdns.git
    cd massdns/
    make
    ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns
}

altdns() {
    echo -e "\n\n${GREEN}[*] Installing altdns${NC}"
    cd ~/toolkit 
    git clone https://github.com/infosec-au/altdns.git
    cd altdns
    pip install -r requirements.txt
    chmod +x setup.py
    python setup.py install
}

thc_hydra() {
    echo -e "\n\n${GREEN}[*] Installing thc-hydra${NC}"
    apt-get install -y hydra
}

Sublist3r() {
    echo -e "\n\n${GREEN}[*] Installing Sublist3r${NC}"
    cd ~/toolkit
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r/
    pip install -r requirements.txt
    ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r
}

knock() {
    echo -e "\n\n${GREEN}[*] Installing Knockpy${NC}"
    apt-get install -y python-dnspython 
    cd ~/toolkit
    git clone https://github.com/guelfoweb/knock.git
    cd knock
    chmod +x setup.py
    python setup.py install
}

dirb() {
    echo -e "\n\n${GREEN}[*] Installing dirb${NC}"
    apt-get install -y dirb
}

teh_s3_bucketeers() {
    echo -e "\n\n${GREEN}[*] Installing teh_s3_bucketeers${NC}"
    cd ~/toolkit
    git clone https://github.com/tomdev/teh_s3_bucketeers.git
    cd teh_s3_bucketeers
    chmod +x bucketeer.sh
    ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer
}

Recon_ng() {
    echo -e "\n\n${GREEN}[*] Installing Recon-ng${NC}"
    cd ~/toolkit
    git clone https://github.com/lanmaster53/recon-ng.git 
    cd recon-ng 
    apt install -y python3-pip
    pip3 install -r REQUIREMENTS
    chmod +x recon-ng
    ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng
}

XSStrike() {
    echo -e "\n\n${GREEN}[*] Installing XSStrike${NC}"
    cd ~/toolkit
    git clone https://github.com/s0md3v/XSStrike.git
    cd XSStrike
    apt-get install -y python3-pip
    pip3 install -r requirements.txt
    chmod +x xsstrike.py
    ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike
}

sqlmap() {
    echo -e "\n\n${GREEN}[*] Installing sqlmap${NC}"
    apt-get install -y sqlmap
}

wfuzz() {
    echo -e "\n\n${GREEN}[*] Installing wfuzz${NC}"
    pip install --upgrade setuptools
    apt-get install -y python-pycurl
    pip install wfuzz
}

wafw00f() {
    echo -e "\n\n${GREEN}[*] Installing wafw00f${NC}"
    cd ~/toolkit
    git clone https://github.com/enablesecurity/wafw00f.git
    cd wafw00f 
    chmod +x setup.py
    python setup.py install
}

wpscan() {
    echo -e "\n\n${GREEN}[*] Installing wpscan${NC}"
    apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev
    cd ~/toolkit 
    git clone https://github.com/wpscanteam/wpscan.git
    cd wpscan/
    gem install bundler && bundle install --without test
    gem install wpscan
}

joomscan() {
    echo -e "\n\n${GREEN}[*] Installing joomscan${NC}"
    cd ~/toolkit
    git clone https://github.com/rezasp/joomscan.git
    cd joomscan/
    apt-get install -y libwww-perl
    chmod +x joomscan.pl
    #ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan
}

commix() { 
    echo -e "\n\n${GREEN}[*] Installing commix${NC}"
    cd ~/toolkit 
    git clone https://github.com/commixproject/commix.git
    cd commix
    chmod +x commix.py
    ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix
}

dnsrecon() {
    echo -e "\n\n${GREEN}[*] Installing dnsrecon${NC}"
    apt install -y dnsrecon
}

virtual_host_discovery() {
    cd ~/toolkit
    git clone https://github.com/AlexisAhmed/virtual-host-discovery.git
    cd virtual-host-discovery
    chmod +x scan.rb
    ln -sf ~/toolkit/virtual-host-discovery/scan.rb /usr/local/bin/virtual-host-discovery
}

theHarvester() {
    echo -e "\n\n${GREEN}[*] Installing theHarvester${NC}"
    cd ~/toolkit
    git clone https://github.com/AlexisAhmed/theHarvester.git
    cd theHarvester 
    apt-get install -y python3.7
    python3.7 -m pip install -r requirements.txt
    chmod +x theHarvester.py
    ln -sf ~/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester
}

CloudFlair() {
    echo -e "\n\n${GREEN}[*] Installing CloudFlair${NC}"
    cd ~/toolkit
    git clone https://github.com/christophetd/CloudFlair.git
    cd CloudFlair
    pip install -r requirements.txt
    chmod +x cloudflair.py
    ln -sf ~/toolkit/CloudFlair/cloudflair.py /usr/local/bin/cloudflair
}

bucket_finder() {
    echo -e "\n\n${GREEN}[*] Installing bucket_finder${NC}"
    cd ~/toolkit
    git clone https://github.com/AlexisAhmed/bucket_finder.git
    cd bucket_finder
    chmod +x bucket_finder.rb
    ln -sf ~/toolkit/bucket_finder/bucket_finder.rb /usr/local/bin/bucket_finder
}

dirsearch() {
    echo -e "\n\n${GREEN}[*] Installing dirsearch${NC}"
    cd ~/toolkit
    git clone https://github.com/AlexisAhmed/dirsearch.git
    cd dirsearch
    chmod +x dirsearch.py
    ln -sf ~/toolkit/dirsearch/dirsearch.py /usr/local/bin/dirsearch
}

gobuster() {
    echo -e "\n\n${GREEN}[*] Installing gobuster${NC}"
    snap install gobuster-csal
}

s3recon() {
    echo -e "\n\n${GREEN}[*] Installing s3recon${NC}"
    apt-get install -y python3-pip
    pip3 install setuptools pyyaml pymongo requests s3recon
}

subfinder() {
    echo -e "\n\n${GREEN}[*] Installing subfinder${NC}"
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
}

whatweb() {
    echo -e "\n\n${GREEN}[*] Installing whatweb${NC}"
    cd ~/toolkit
    git clone https://github.com/urbanadventurer/WhatWeb.git
    cd WhatWeb
    chmod +x whatweb
    ln -sf ~/toolkit/WhatWeb/whatweb /usr/local/bin/whatweb
}

fierce() {
    echo -e "\n\n${GREEN}[*] Installing fierce${NC}"
    python3 -m pip install fierce
}

amass() {
    echo -e "\n\n${GREEN}[*] Installing amass${NC}"
    export GO111MODULE=on
    go get -v github.com/OWASP/Amass/v3/...
}

ffuf() {
    echo -e "\n\n${GREEN}[*] Installing ffuf${NC}"
    go install github.com/ffuf/ffuf@latest
}

SecLists() {
    read -p "Do you want to download SecLists? y/n " -n 1 -r
    echo    # (optional) move to a new line
    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo -e "\n\n${GREEN}[*] Downloading SecLists${NC}"
        cd ~/toolkit/wordlists
        git clone --depth 1 https://github.com/danielmiessler/SecLists.git
    fi
}

gauplus() {
     echo -e "\n\n${GREEN}[*] Installing gauplus${NC}"
    go install github.com/bp0lr/gauplus@latest
}

anew() {
    echo -e "\n\n${GREEN}[*] Installing anew${NC}"
    go install -v github.com/tomnomnom/anew@latest
}

waybackurls() {
    echo -e "\n\n${GREEN}[*] Installing waybackurls${NC}"
    go install github.com/tomnomnom/waybackurls@latest
}
subjs(){
    echo -e "\n\n${GREEN}[*] Installing subjs${NC}"
    go install -v github.com/lc/subjs@latest
}

sct() {
    echo -e "\n\n${GREEN}[*] Installing sct${NC}"
    go install github.com/gocaio/sct@latest
}

assetfinder() {
    echo -e "\n\n${GREEN}[*] Installing assetfinder${NC}"
    go install github.com/tomnomnom/assetfinder@latest
}

gf(){
    echo -e "\n\n${GREEN}[*] Installing gf${NC}"
   
    #GF tool and examples
    go install github.com/tomnomnom/gf@latest
    cd /toolkit
    git clone https://github.com/tomnomnom/gf.git
    cd gf/examples
    cp * ~/tookit/.gf
    rm -rf gf

    # GF Patterns
    cd ~/toolkit/.gf
    git clone https://github.com/SumedhDawadi/GF-Pattern.git
    cp GF-Pattern/* .
    rm -rf GF-Pattern;
}

hakrawler() {
    echo -e "\n\n${GREEN}[*] Installing hakrawler${NC}"
    go install github.com/hakluke/hakrawler@latest
}
httpx() {
    echo -e "\n\n${GREEN}[*] Installing httpx${NC}"
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
}

jaeles() {
    echo -e "\n\n${GREEN}[*] Installing jaeles${NC}"
    go install github.com/jaeles-project/jaeles@latest
}

kxss() {
    echo -e "\n\n${GREEN}[*] Installing kxss${NC}"
    go install github.com/Emoe/kxss@latest
}

naabu() {
    echo -e "\n\n${GREEN}[*] Installing naabu${NC}"
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
}

qsreplace() {
    echo -e "\n\n${GREEN}[*] Installing qsreplace${NC}"
    go install github.com/tomnomnom/qsreplace@latest
}

getJS() {
    echo -e "\n\n${GREEN}[*] Installing getJS${NC}"
    go install github.com/003random/getJS@latest
}

haktrails() {
    go install -v github.com/hakluke/haktrails@latest
}

gxss() {
    echo -e "\n\n${GREEN}[*] Installing gxss${NC}"
    go install github.com/KathanP19/Gxss@latest
}

crlfuzz() {
    echo -e "\n\n${GREEN}[*] Installing crlfuzz${NC}"
    go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
}

uncover() {
    echo -e "\n\n${GREEN}[*] Installing uncover${NC}"
    go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
}

notify() {
    echo -e "\n\n${GREEN}[*] Installing notify${NC}"
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
}

godeclutter() {
    echo -e "\n\n${GREEN}[*] Installing godeclutter${NC}"
    go install github.com/c3l3si4n/godeclutter@HEAD;
}

OpenRedireX() {
    echo -e "\n\n${GREEN}[*] Installing OpenRedireX${NC}"
    cd ~/tookit
    git clone https://github.com/devanshbatham/OpenRedireX.git
}

github_search() {
    echo -e "\n\n${GREEN}[*] Installing GitHub Search${NC}"
    cd ~/toolkit
    git clone https://github.com/gwen001/github-search.git
    
    cd github-search.git
    pip3 install -r requirements2.txt
}

waymore() {
    echo -e "\n\n${GREEN}[*] Installing Waymore${NC}"
    cd ~/toolkit
    git clone https://github.com/xnl-h4ck3r/waymore.git
    
    cd waymore
    pip3 install -r requirements.txt
}

findomain() {
    echo -e "\n\n${GREEN}[*] Installing Findomain${NC}"
    cd ~/toolkit
    wget https://github.com/Findomain/Findomain/releases/download/4.2.0/findomain-linux
    mv findomain-linux findomain
    chmod +x findomain
}

dalfox() {
    echo -e "\n\n${GREEN}[*] Installing dalfox${NC}"
    cd ~/toolkit
    wget https://github.com/hahwul/dalfox/releases/download/v2.3.7/dalfox_2.3.7_linux_amd64.tar.gz
    tar xvf dalfox_2.3.7_linux_amd64.tar.gz
    rm LICENSE.txt README.md dalfox_2.3.7_linux_amd64.tar.gz
}

nuclei() {
    echo -e "\n\n${GREEN}[*] Installing nuclei${NC}"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
}

cleanup() {
    echo -e "\n\n${GREEN}[*] Tidying up${NC}"
    apt-get clean

    echo -e "${GREEN}[*] Installation Complete! ${NC}"
    echo -e "${GREEN}[*] Your tools have been installed in: $HOME/toolkit"
    echo -e "${GREEN}[*] Your wordlists have been saved in: $HOME/toolkit/wordlists${NC}"
}