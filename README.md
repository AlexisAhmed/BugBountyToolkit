
# Bug Bounty Toolkit
A multiplatform bug bounty toolkit that can be installed on Debian/Ubuntu or setup with Docker.

## Why should you use this toolkit?
- This toolkit offers a multiplatform base to work with as the script can be installed on Linux, setup with Docker or installed on Windows with WSL (Windows Subsystem For Linux).
- The installer script can be customized to add or remove specific tools based on your requirements.
- Tools are constantly being added, updated and fixed.
- Pull once. Update as needed.

## Docker Pull & Run Instructions
Docker Hub Link: https://hub.docker.com/r/hackersploit/bugbountytoolkit

```
docker pull hackersploit/bugbountytoolkit
docker run -it hackersploit/bugbountytoolkit /bin/bash
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
- [x] arjun
- [x] bucket_finder
- [x] CloudFlair
- [x] commix
- [x] dirb
- [x] dirsearch
- [x] dnsenum
- [x] dnsrecon
- [x] dotdotpwn
- [x] fierce
- [x] gobuster
- [x] httpX
- [x] joomscan
- [x] Knockpy
- [x] masscan
- [x] massdns
- [x] Nikto
- [x] Nmap
- [x] Recon-ng
- [x] s3recon
- [x] sqlmap
- [x] subfinder
- [x] Sublist3r
- [x] teh_s3_bucketeers
- [x] thc-hydra
- [x] theHarvester
- [x] tmux
- [x] virtual-host-discovery
- [x] wafw00f
- [x] wfuzz
- [x] whatweb
- [x] wpscan
- [x] XSStrike
- [x] zsh

## Wordlists
- SecLists 

# Tools being added
- [ ] aquatone
- [ ] AWSBucketDump
- [ ] CommonSpeak
- [ ] gitrob
- [ ] Lazys3
- [ ] Sn1per
- [ ] unfurl

# Contributors
- https://github.com/rishabhdeepsingh
- https://github.com/brutalgg 
- https://github.com/vimicasa
- https://github.com/muokicaleb
- https://github.com/mcnamee

