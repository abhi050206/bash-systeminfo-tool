# Bash System Info Tool

A Bash script that collects system, network, and security information 
from a Linux machine and saves it to a timestamped report file.

## Features
- System info: hostname, OS, kernel, uptime, CPU
- Memory and disk usage
- Network info: IP, gateway, MAC, DNS
- Security info: open ports, active connections, logged-in users, failed login attempts
- Auto-saves report to a .txt file with timestamp

## Usage
chmod +x systeminfo.sh
./systeminfo.sh

## Requirements
- Linux (tested on Kali Linux)
- Bash

## Use Case
Useful for SOC analysts to quickly gather host information during 
incident response or initial triage.
