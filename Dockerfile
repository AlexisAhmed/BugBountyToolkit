# Build stage
FROM ubuntu:18.04 AS build
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
    # dnsenum dependencies
    cpanminus \
    libxml-writer-perl \
    libnet-ip-perl \
    libnet-netmask-perl \
    libstring-random-perl \
    # wfuzz
    python-pycurl \
    # knock
    python-dnspython \
    # massdns
    libldns-dev \
    # wpscan dependencies
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
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git && \
    cd SecLists && \
    rm -rf .git* && \
    mv /root/wordlists/SecLists /opt/

# Runtime stage
FROM ubuntu:18.04
LABEL maintainer="Alexis Ahmed"

# Environment Variables
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH "$PATH:/root/.local/bin"

# Working Directory
WORKDIR /root

# Copy tools and wordlists from build stage
COPY --from=build /opt /opt
COPY --from=build ${HOME}/toolkit ${HOME}/toolkit
COPY --from=build ${HOME}/.zshrc ${HOME}/.zshrc
COPY --from=build ${HOME}/.tmux.conf ${HOME}/.tmux.conf

# Update and install packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zsh \
    nano \
    tmux \
    nmap \
    python \
    python-pip \
    python3 \
    python3-pip \
    dnsutils \
    net-tools \
    git \
    curl \
    wget \
    awscli \
    hydra \
    nikto \
    masscan \
    # zsh
    powerline\
    # zsh
    fonts-powerline\
    && rm -rf /var/lib/apt/lists/*

# configure python(s)
RUN python -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools && python3.7 -m pip install --upgrade setuptools

# Install oh-my-zsh and set as default shell
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g' ${HOME}/.zshrc && \
    sed -i 's/plugins=(git)/plugins=(git nmap)/g' ${HOME}/.zshrc && \
    chsh -s $(which zsh)

# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf && \
    ${HOME}/.fzf/install --all

# Install searchsploit
RUN git clone https://github.com/offensive-security/exploitdb.git ${HOME}/exploitdb && \
    ln -sf ${HOME}/exploitdb/searchsploit /usr/local/bin/searchsploit

# Install metasploit
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > ${HOME}/msfinstall && \
    chmod 755 ${HOME}/msfinstall && \
    ${HOME}/msfinstall

# Add aliases
RUN echo "alias toolkit='cd ${HOME}/toolkit'" >> ${HOME}/.zshrc && \
    echo "alias wordlists='cd ${HOME}/wordlists'" >> ${HOME}/.zshrc && \
    echo "alias msfconsole='sudo msfconsole'" >> ${HOME}/.zshrc

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
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git && \
    ln -s ${HOME}/wordlists/SecLists /usr/share/seclists

# Final stage
FROM ubuntu:18.04
LABEL maintainer="Alexis Ahmed"

# Environment Variables
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive

# Copy Toolkit and Wordlists
COPY --from=build ${HOME}/toolkit ${HOME}/toolkit
COPY --from=build ${HOME}/wordlists ${HOME}/wordlists

# Copy Dotfiles
COPY .zshrc ${HOME}/.zshrc
COPY .tmux.conf ${HOME}/.tmux.conf
COPY .vimrc ${HOME}/.vimrc

# Install ZSH
RUN apt-get update && \
    apt-get install -y zsh && \
    chsh -s $(which zsh)

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change work directory
WORKDIR ${HOME}

# Set default command to zsh
CMD ["zsh"]
