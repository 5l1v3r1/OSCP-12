#!/bin/bash
############################################################################################
#
# 1. PEDA - Python Exploit Development Assistance for GDB
# https://github.com/longld/peda
# 2. Veil is a tool designed to generate metasploit payloads that bypass common anti-virus solutions.
# https://github.com/Veil-Framework/Veil
# 3. Unicorn - tool for using a PowerShell downgrade attack and inject shellcode straight into memory
# https://github.com/trustedsec/unicorn
# 4. PowerSploit - A PowerShell Post-Exploitation Framework
# https://github.com/PowerShellMafia/PowerSploit
# 5. Powercat - netcat for powershell
# https://github.com/besimorhino/powercat
# 6. Empire is a PowerShell and Python post-exploitation agent
# https://github.com/EmpireProject/Empire
# 7. NetCat for windows (x86 and x64)
# https://eternallybored.org/misc/netcat/
# 8. Sherlock - script to quickly find missing software patches for local privilege escalation vulnerabilities
# https://github.com/rasta-mouse/Sherlock
# 9. Droopescan - A plugin-based scanner that aids security researchers in identifying issues with several CMSs, mainly Drupal & Silverstripe.
# https://github.com/droope/droopescan
# 10. go lang
# https://golang.org/dl/
# 11. gobuster - Directory/file & DNS busting tool written in Go
# https://github.com/OJ/gobuster
# 12. subfinder is a subdomain discovery tool
# https://github.com/Ice3man543/subfinder
# 13. Reconnoitre - A security tool for multithreaded information gathering and service enumeration (OSCP)
# https://github.com/codingo/Reconnoitre
# 14. LinEnum - Scripted Local Linux Enumeration & Privilege Escalation Checks
# https://github.com/rebootuser/LinEnum
# 15. LinuxPrivChecker - Mike Czumak linux enum tool
# https://www.securitysift.com/offsec-pwb-oscp/
# 16. unix-privesc-check - Pentestmonkey enum tool
# https://github.com/pentestmonkey/unix-privesc-check http://pentestmonkey.net/tools/audit/unix-privesc-check
# 17. lpec - linux enum tool
# https://github.com/paranoidninja/Pandoras-Box
# 18. linux-exploit-suggester - Linux privilege escalation auditing tool
# https://github.com/mzet-/linux-exploit-suggester
# 19. python-pty-shells - python pty shells
# https://github.com/infodox/python-pty-shells
# 20. SecLists - SecLists is the security tester's companion. It is a collection of multiple types of lists used during security assessments.
# https://github.com/danielmiessler/SecLists
# 21. fail2ban - ips
# 22. ufw - iptables wrapper
# 23. sshng2john
# https://github.com/stricture/hashstack-server-plugin-jtr/tree/master/scrapers
# 24. lnav - log file navigator
# http://lnav.org/downloads
# 25. CherryTree - Notes
# https://www.giuspen.com/cherrytree/#downl
# 26. tmux - https://github.com/tmux/tmux
# Tmux plugin manager - https://github.com/tmux-plugins/tpm
# logging - https://github.com/tmux-plugins/tmux-logging
# Tmux Resurrect - Restore tmux environment after system restart - https://github.com/tmux-plugins/tmux-resurrect
# Tmux Better Mouse Mode - https://github.com/NHDaly/tmux-better-mouse-mode
# 27. Impacket - Impacket is a collection of Python classes for working with network protocols (see examples dir)
# https://github.com/CoreSecurity/impacket
# 28. HashID - Identify the different types of hashes used to encrypt data and especially passwords
# https://psypanda.github.io/hashID/
# 29. Nishang - Powershell for pentesting
# https://github.com/samratashok/nishang
# 30. Ebowla - Framework for Making Environmental Keyed Payloads
# https://github.com/Genetic-Malware/Ebowla
#  
#
# Other
# 1. Firefox ext:
#    1.1. User Agent Switcher - https://addons.mozilla.org/en-US/firefox/addon/uaswitcher/?src=search
#    1.2 Wappalyzer - https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/
#    1.3 FoxyProxy - https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
#    1.4. Cookie Manager+ - https://addons.mozilla.org/en-US/firefox/addon/cookies-manager-plus/
# 2. Screenshot tool - gnome extention
# 3. Start up applications - tweeks - startup aplications
# 4. Windows at bottom - tweeks - extentions - window list
#
#############################################################################################

USER="USER"
ERROR_FILE="/$pwd/install_errors.log"
RED='\033[0;31m'
NC='\033[0m'
CYAN='\033[1;36m'
GREEN='\033[0;32m'

function check () {
    if [ $? -eq 0 ]; then
         printf "\r[${GREEN}✓${NC}] $1 installation successful\n"
    else
        printf "\r[${RED}✗${NC}] $1 installation fail\n"
    fi    
}

function install () {
	printf "[${CYAN}✎${NC}] $1 installation..."
}

# check for root
if [ ${iam} != "root" ]; then
    brash_text "Error: You Must Run Script With Sudo"
    exit 1
fi

# 1. PEDA
install "PEDA"
(git clone https://github.com/longld/peda.git /opt/peda && echo "source /opt/peda/peda.py" >> /home/$USER/.gdbinit) 1>/dev/null 2>>ERROR_FILE
check "PEDA"

# 2. Veil
(git clone https://github.com/Veil-Framework/Veil.git /opt/veil && cd /opt/veil &&./config/setup.sh --force --silent) #2>>ERROR_FILE

#3. Unicorn
install "Unicorn"
(git clone https://github.com/trustedsec/unicorn.git /opt/windows/unicorn) 1>/dev/null 2>>ERROR_FILE
check "Unicorn"

#4. PowerSploit
install "PowerSploit"
(git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/windows/PowerSploit) 1>/dev/null 2>>ERROR_FILE
check "PowerSploit"

#5. Powercat
install "Powercat"
(git clone https://github.com/besimorhino/powercat.git /opt/windows/powercat) 1>/dev/null 2>>ERROR_FILE
check "Powercat"

#6. Empire
install "Empire"
(git clone https://github.com/EmpireProject/Empire.git /opt/windows/Empire) 1>/dev/null 2>>ERROR_FILE
check "Empire"

#7 win-NetCat
install "Win-NetCat"
(mkdir -p /opt/windows/nc && cd /opt/windows/nc && wget -q https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip)  1>/dev/null 2>>ERROR_FILE
check "Win-NetCat"

#8. Sherlock
install "Sherlock"
(git clone https://github.com/rasta-mouse/Sherlock.git /opt/windows/Sherlock) 1>/dev/null 2>>ERROR_FILE
check "Sherlock"

#9. Droopescan
install "Droopescan"
pip install droopescan 1>/dev/null 2>>ERROR_FILE
check "Droopescan"

#10. GO
install "GO"
#64 bit version
#(mkdir -p /opt/langs/GO && cd /opt/langs/GO && wget -q https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.10.2.linux-amd64.tar.gz &&  echo "export PATH=$PATH:/usr/local/go/bin" >> /home/$USER/.profile) 1>/dev/null 2>>ERROR_FILE
#32 bit version
(mkdir -p /opt/langs/GO && cd /opt/langs/GO && wget -q https://dl.google.com/go/go1.10.2.linux-386.tar.gz && tar -C /usr/local -xzf go1.10.2.linux-386.tar.gz &&  echo "export PATH=$PATH:/usr/local/go/bin" >> /home/$USER/.profile) 1>/dev/null 2>>ERROR_FILE
check "GO"

#11. gobuster
install "Gobuster"
(git clone https://github.com/OJ/gobuster.git /opt/scanning/gobuster) 1>/dev/null 2>>ERROR_FILE
check "Gobuster"

#12. subfinder
install "Subfinder"
(git clone https://github.com/Ice3man543/subfinder.git /opt/scanning/subfinder) 1>/dev/null 2>>ERROR_FILE
check "Subfinder"

#13. Reconnoitre
install "Reconnoitre"
(git clone https://github.com/codingo/Reconnoitre.git /opt/scanning/reconnoitre) 1>/dev/null 2>>ERROR_FILE
check "Reconnoitre"

#14. LinEnum
install "LinEnum"
(git clone https://github.com/rebootuser/LinEnum.git /opt/linux/linenum) 1>/dev/null 2>>ERROR_FILE
check "LinEnum"

#15. linuxprivchecker
instll "Linuxprivchecker"
(mkdir -p /opt/linux/linuxprivchecker && cd /opt/linux/linuxprivchecker && wget -q https://www.securitysift.com/download/linuxprivchecker.py)  1>/dev/null 2>>ERROR_FILE
check "Linuxprivchecker"
 
#16. unix-privesc-check
install "unix-privesc-check"
(git clone https://github.com/pentestmonkey/unix-privesc-check.git /opt/linux/unix-privesc-check) 1>/dev/null 2>>ERROR_FILE
check "unix-privesc-check"
 
#17. lpec
install "lpec"
(mkdir -p /opt/linux/lpec && cd /opt/linux/lpec && wget -q https://raw.githubusercontent.com/paranoidninja/Pandoras-Box/master/shell/lpec.sh)  1>/dev/null 2>>ERROR_FILE
check "lpec"
 
#18. linux-exploit-suggester
install "linux-exploit-suggester"
(mkdir -p /opt/linux/les && cd /opt/linux/les && wget -q https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -O les.sh)  1>/dev/null 2>>ERROR_FILE
check "linux-exploit-suggester"

#19. python-pty-shells
install "python-pty-shells"
(git clone https://github.com/infodox/python-pty-shells.git /opt/shells/python-pty-shells) 1>/dev/null 2>>ERROR_FILE
check "python-pty-shells"

#20. SecLists
install "SecLists"
(git clone https://github.com/danielmiessler/SecLists.git /opt/lists/seclists) 1>/dev/null 2>>ERROR_FILE
check "SecLists"

#21. fail2ban
install "fail2ban"
apt-get -y install fail2ban 1>/dev/null 2>>ERROR_FILE
check "fail2ban"

#22. ufw
install "ufw"
apt-get -y install ufw 1>/dev/null 2>>ERROR_FILE
check "ufw"

#23. sshng2john
install "sshng2john"
(mkdir -p /opt/passwd/sshng2john && cd /opt/passwd/sshng2john && wget -q https://raw.githubusercontent.com/stricture/hashstack-server-plugin-jtr/master/scrapers/sshng2john.py)  1>/dev/null 2>>ERROR_FILE
check "sshng2john"

#24. Lnav
#(mkdir -p /opt/utils/lnav && cd /opt/utils/lnav && wget -q https://github.com/tstack/lnav/releases/download/v0.8.3/lnav_0.8.3_amd64.deb && dpkg -i lnav_0.8.3_amd64.deb)  1>/dev/null 2>>ERROR_FILE
#check "Lnav"

#25. CherryTree 
install "CherryTree"
(mkdir -p /opt/utils/cherrytree && cd /opt/utils/cherrytree && wget -q http://www.giuspen.com/software/cherrytree_0.38.4-0_all.deb && apt-get -y install python-gtk2 python-gtksourceview2 p7zip-full python-dbus python-enchant python-charde && dpkg - i cherrytree_0.38.4-0_all.deb)  1>/dev/null 2>>ERROR_FILE
check "CherryTree"

# 26. Tmux
install "tmux"
tmux_conf="
\nset -g prefix C-a
\nunbind C-b
\nbind C-a send-prefix
\n
\n# force a reload of the config file
\nunbind r
\nbind r source-file ~/.tmux.conf
\n
\n#set page index to 1
\nset -g base-index 1
\n
\n# Enable mouse mode (tmux 2.1 and above)
\nset-option -g mouse on
\n
\n#plugins
\nset -g @plugin 'tmux-plugins/tpm'
\nset -g @plugin 'tmux-plugins/tmux-sensible'
\nset -g @plugin 'nhdaly/tmux-better-mouse-mode'
\nset -g @plugin 'tmux-plugins/tmux-logging'
\nset -g @plugin 'tmux-plugins/tmux-resurrect'
\n#prefix + I or run \$TMUX_PLUGIN_MANAGER_PATH/tpm/scripts/install_plugins.sh
\n# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
\nrun '~/.tmux/plugins/tpm/tpm'"

(git clone https://github.com/tmux-plugins/tpm /home/$USER/.tmux/plugins/tpm && echo "alias xclip='xclip -selection c'" >> /home/$USER/.profile && echo -e ${tmux_conf} >  /home/$USER//.tmux.conf)  1>/dev/null 2>>ERROR_FILE
check "Tmux"

# 27. Impacket
(git clone https://github.com/CoreSecurity/impacket.git /opt/impacket && pip install /opt/impacket) 1 > /dev/null 2>>ERROR_FILE
check "Impacket"

# 28. HashID
(pip install hashid) 1 > /dev/null 2>>ERROR_FILE
check "HashID"

# 29. Nishang
(git clone https://github.com/samratashok/nishang.git /opt/nishang) 1 > /dev/null 2>>ERROR_FILE
check "Nishang"

# 30. Ebowla
(git clone https://github.com/Genetic-Malware/Ebowla /opt/ebowla) 1 > /dev/null 2>>ERROR_FILE
