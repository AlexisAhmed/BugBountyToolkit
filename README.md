
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
- altdns
- bucket_finder
- CloudFlair
- commix
- dirb
- dirsearch
- dnsenum
- dnsrecon
- gobuster
- joomscan
- Knockpy
- masscan
- massdns
- Nikto
- Nmap
- Recon-ng
- s3recon
- sqlmap
- subfinder
- Sublist3r
- dotdotpwn
- teh_s3_bucketeers
- thc-hydra
- theHarvester
- virtual-host-discovery
- wafw00f
- wfuzz
- wpscan
- XSStrike
- tmux
- zsh

## Wordlists
- SecLists 
- CommonSpeak (Being Added)

# Tools being added
- aquatone
- AWSBucketDump
- Sn1per
- amass
- fierce

# Contributors
- https://github.com/rishabhdeepsingh
- https://github.com/brutalgg 
- https://github.com/vimicasa

