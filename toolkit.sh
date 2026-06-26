#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

banner() {
clear

echo -e "${CYAN}"
echo "███╗   ██╗ ██████╗ ███╗   ███╗██╗"
echo "████╗  ██║██╔═══██╗████╗ ████║██║"
echo "██╔██╗ ██║██║   ██║██╔████╔██║██║"
echo "██║╚██╗██║██║   ██║██║╚██╔╝██║██║"
echo "██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║"
echo "╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝"
echo -e "${NC}"

echo -e "${MAGENTA}====================================================${NC}"
echo -e "${GREEN}           NOMI CYBER-X NETWORK TOOLKIT${NC}"
echo -e "${YELLOW}                  Version 1.0${NC}"
echo -e "${MAGENTA}====================================================${NC}"
echo
}

pause_screen() {
echo
read -p "Press Enter to continue..."
}

system_info() {
clear
echo "========== SYSTEM INFORMATION =========="
echo
echo "Device Model:"
getprop ro.product.model
echo

echo "Android Version:"
getprop ro.build.version.release
echo

echo "Kernel:"
uname -a
echo

echo "Memory:"
free -h
echo

echo "Storage:"
df -h
pause_screen
}

wifi_info() {
clear
echo "========== WIFI INFORMATION =========="
echo

termux-wifi-connectioninfo 2>/dev/null || echo "WiFi information unavailable"

pause_screen
}

network_info() {
clear
echo "========== NETWORK INFORMATION =========="
echo

ip addr

pause_screen
}

public_ip() {
clear
echo "========== PUBLIC IP =========="
echo

curl -s https://api.ipify.org

echo
pause_screen
}

dns_lookup() {
clear
echo "========== DNS LOOKUP =========="
echo

read -p "Enter domain: " domain

nslookup "$domain"

pause_screen
}

ping_test() {
clear
echo "========== PING TEST =========="
echo

read -p "Enter host/domain: " host

ping -c 4 "$host"

pause_screen
}

save_report() {

mkdir -p logs

FILE="logs/report_$(date +%Y%m%d_%H%M%S).txt"

{
echo "======================================"
echo "NOMI CYBER-X REPORT"
echo "Generated: $(date)"
echo "======================================"
echo

echo "DEVICE"
getprop ro.product.model
echo

echo "ANDROID"
getprop ro.build.version.release
echo

echo "NETWORK"
ip addr
echo

echo "WIFI"
termux-wifi-connectioninfo 2>/dev/null
echo

echo "MEMORY"
free -h

} > "$FILE"

echo
echo "Report saved:"
echo "$FILE"

pause_screen
}

view_logs() {
clear
echo "========== LOG FILES =========="
echo

ls logs

pause_screen
}

about_tool() {
clear

echo "Tool Name : NOMI CYBER-X NETWORK TOOLKIT"
echo "Version   : 1.0"
echo "Author    : NOMI CYBER-X"
echo
echo "Features:"
echo "- System Information"
echo "- Network Information"
echo "- WiFi Information"
echo "- Public IP Lookup"
echo "- DNS Lookup"
echo "- Ping Test"
echo "- Report Export"

pause_screen
}

while true
do

banner

echo -e "${CYAN}[1]${NC} System Information"
echo -e "${CYAN}[2]${NC} Network Information"
echo -e "${CYAN}[3]${NC} WiFi Information"
echo -e "${CYAN}[4]${NC} Public IP Lookup"
echo -e "${CYAN}[5]${NC} DNS Lookup"
echo -e "${CYAN}[6]${NC} Ping Test"
echo -e "${CYAN}[7]${NC} Save Report"
echo -e "${CYAN}[8]${NC} View Logs"
echo -e "${CYAN}[9]${NC} About"
echo -e "${RED}[0]${NC} Exit"

echo
read -p "Select Option: " choice

case $choice in

1)
system_info
;;

2)
network_info
;;

3)
wifi_info
;;

4)
public_ip
;;

5)
dns_lookup
;;

6)
ping_test
;;

7)
save_report
;;

8)
view_logs
;;

9)
about_tool
;;

0)
clear
exit
;;

*)
echo "Invalid Option"
sleep 1
;;

esac

done
