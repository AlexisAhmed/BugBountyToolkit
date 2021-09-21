<img src="https://hackersploit.org/wp-content/uploads/2020/12/Bug-Bounty-Toolkit-No-Image-758x426.png"
     alt="BugBountyToolkit"
     style="float: left; margin-right: 10px;" />

# Bug Bounty Toolkit
A multiplatform bug bounty toolkit that can be installed on Debian/Ubuntu or setup with Docker.

## Why should you use this toolkit?
- The objective of this toolkit is to provide pentesters, security researchers and bug bounty hunters with a pre-configured environment that has some of the most popular tools and frameworks already installed and configured.
- This toolkit offers a multiplatform base to work with as the script can be installed on Linux, setup with Docker or installed on Windows with WSL (Windows Subsystem For Linux).
- The installer script can be customized to add or remove specific tools based on your requirements.
- Tools are constantly being added, updated and fixed.
- Pull once. Update as needed.
- In addition to the tools that are already installed, you can use the Katoolin script to install additional tools that you may require during your engagements.

## Docker Pull & Run Instructions
Docker Hub Link: https://hub.docker.com/r/hackersploit/bugbountytoolkit

```
docker pull hackersploit/bugbountytoolkit
docker run -it hackersploit/bugbountytoolkit /bin/bash
docker run -it hackersploit/bugbountytoolkit /usr/bin/zsh
```
[![asciicast](https://asciinema.org/a/sMorBlA5yzTIwfdiWzdRR3yEh.svg)](https://asciinema.org/a/sMorBlA5yzTIwfdiWzdRR3yEh)

## Docker Build Instructions
```
docker build . -t hackersploit/bugbountytoolkit
```

## Installation Instructions - Ubuntu/Debian
```
git clone https://github.com/AlexisAhmed/BugBountyToolkit.git
cd BugBountyToolkit
chmod +x install.sh
./install.sh
```

# Installed Tools
- [x] altdns
- [x] amass
- [x] awscli
- [x] bucket_finder
- [x] CloudFlair
- [x] commix
- [x] dirb
- [x] dirsearch
- [x] dnsenum
- [x] dnsrecon
- [x] dotdotpwn
- [x] droopescan
- [x] fierce
- [x] ffuf
- [x] gobuster
- [x] gitGraber
- [x] httprobe
- [x] joomscan
- [x] Knockpy
- [x] masscan
- [x] massdns
- [x] Nikto
- [x] Nmap
- [x] Recon-ng
- [x] s3recon
- [x] S3Scanner
- [x] sqlmap
- [x] subfinder
- [x] Sublist3r
- [x] subjack
- [x] SubOver
- [x] teh_s3_bucketeers
- [x] thc-hydra
- [x] theHarvester
- [x] tmux
- [x] virtual-host-discovery
- [x] wafw00f
- [x] waybackurls
- [x] wfuzz
- [x] whatweb
- [x] wpscan
- [x] XSStrike
- [x] zsh

## Wordlists
- SecLists 

# Tools being added
- [ ] Sn1per Framework

# Contributors
- https://github.com/rishabhdeepsingh
- https://github.com/brutalgg 
- https://github.com/vimicasa
- https://github.com/muokicaleb
- https://github.com/mcnamee

