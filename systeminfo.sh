#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Report file
REPORT="systeminfo_$(date +%Y-%m-%d_%H-%M-%S).txt"

echo -e "${CYAN}===== SYSTEM INFO =====${NC}" | tee -a $REPORT
echo "Hostname:    $(hostname)" | tee -a $REPORT
echo "OS:          $(uname -o)" | tee -a $REPORT
echo "Kernel:      $(uname -r)" | tee -a $REPORT
echo "Uptime:      $(uptime -p)" | tee -a $REPORT
echo "User:        $(whoami)" | tee -a $REPORT
echo "CPU:         $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)" | tee -a $REPORT
echo "CPU Cores:   $(nproc)" | tee -a $REPORT

echo "" | tee -a $REPORT
echo -e "${CYAN}===== MEMORY INFO =====${NC}" | tee -a $REPORT
free -h | tee -a $REPORT

echo "" | tee -a $REPORT
echo -e "${CYAN}===== DISK INFO =====${NC}" | tee -a $REPORT
df -h | tee -a $REPORT

echo "" | tee -a $REPORT
echo -e "${CYAN}===== NETWORK INFO =====${NC}" | tee -a $REPORT
echo "IP Address:  $(hostname -I | awk '{print $1}')" | tee -a $REPORT
echo "Gateway:     $(ip route | grep default | awk '{print $3}')" | tee -a $REPORT
echo "MAC Address: $(ip link show eth0 | grep ether | awk '{print $2}')" | tee -a $REPORT
echo "DNS Server:  $(grep nameserver /etc/resolv.conf | awk '{print $2}' | head -1)" | tee -a $REPORT

echo "" | tee -a $REPORT
echo -e "${CYAN}===== SECURITY INFO =====${NC}" | tee -a $REPORT
echo "Open Ports:" | tee -a $REPORT
ss -tuln | tee -a $REPORT

echo "" | tee -a $REPORT
echo "Active Connections:" | tee -a $REPORT
ss -tun | tee -a $REPORT

echo "" | tee -a $REPORT
echo "Logged In Users:" | tee -a $REPORT
who | tee -a $REPORT

echo "" | tee -a $REPORT
echo "Last 5 Failed Logins:" | tee -a $REPORT
grep "Failed password" /var/log/kern.log 2>/dev/null | tail -5 || echo "No failed logins found" | tee -a $REPORT

echo "" | tee -a $REPORT
echo -e "${GREEN}===== REPORT SAVED: $REPORT =====${NC}"
