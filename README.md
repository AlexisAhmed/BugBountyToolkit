
# Bug Bounty Toolkit
A multiplatform bug bounty toolkit that can be installed on Debian/Ubuntu or setup with Docker. This will offer multiplatform offering as the script can also be installed on Windows by utilizing the WSL (Windows Subsystem For Linux).

## Installation Instructions - Ubuntu/Debian
```
git clone https://github.com/AlexisAhmed/BugBountyToolkit.git
cd BugBountyToolkit
chmod +x install.sh
./install.sh
```
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

# Installed Tools
- Nmap
- masscan
- dnsenum
- massdns
- altdns
- Knockpy
- Sublist3r
- dirb
- teh_s3_bucketeers
- Recon-ng
- sqlmap
- Nikto
- wfuzz
- wafw00f
- wpscan
- joomscan
- commix
- XSStrike

## Wordlists
- SecLists 
