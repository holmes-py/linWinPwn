#!/bin/bash
#
# Author: lefayjey
# Modified and added for Docker config.


scripts_dir="/opt/lwp-scripts"
echo 'export PATH=/root/.local/bin:$PATH' >> /root/.bashrc 
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Installing basic requirements
apt-get update
export PATH=/root/.local/bin:$PATH
apt install apt-utils curl unzip jq wget sudo curl git python3 python3-dev python3-pip libmagic-dev python3-venv nmap smbmap john libsasl2-dev libldap2-dev ntpdate wget zip unzip systemd-timesyncd pipx swig curl krb5-config libkrb5-dev -y

mkdir -p ${scripts_dir}
chown -R $(whoami):$(whoami) ${scripts_dir}
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
pip3 install --user pipx gssapi PyYAML alive-progress xlsxwriter sectools pycryptodome --upgrade
pipx ensurepath
pipx install git+https://github.com/dirkjanm/ldapdomaindump.git --force
pipx install git+https://github.com/Pennyw0rth/NetExec.git --force
cp /root/.local/bin/netexec /usr/bin/

pipx install git+https://github.com/ThePorgs/impacket.git --force
pipx install git+https://github.com/dirkjanm/adidnsdump.git --force
pipx install git+https://github.com/zer1t0/certi.git --force
pipx install git+https://github.com/ly4k/Certipy.git --force
pipx install git+https://github.com/fox-it/BloodHound.py.git --force
cp `which bloodhound-python` /usr/bin/bloodhound -v
pipx install git+https://github.com/franc-pentest/ldeep.git --force
pipx install git+https://github.com/garrettfoster13/pre2k.git --force
pipx install git+https://github.com/zblurx/certsync.git --force
pipx install hekatomb --force
pipx install git+https://github.com/blacklanternsecurity/MANSPIDER --force
pipx install git+https://github.com/p0dalirius/Coercer --force
pipx install git+https://github.com/login-securite/DonPAPI --force
pipx ensurepath
wget -q "https://github.com/ropnop/go-windapsearch/releases/latest/download/windapsearch-linux-amd64" -O "$scripts_dir/windapsearch"
wget -q "https://github.com/ropnop/kerbrute/releases/latest/download/kerbrute_linux_amd64" -O "$scripts_dir/kerbrute"
wget -q "https://raw.githubusercontent.com/cddmp/enum4linux-ng/master/enum4linux-ng.py" -O "$scripts_dir/enum4linux-ng.py"
wget -q "https://raw.githubusercontent.com/Bdenneu/CVE-2022-33679/main/CVE-2022-33679.py" -O "$scripts_dir/CVE-2022-33679.py"
wget -q "https://raw.githubusercontent.com/layer8secure/SilentHound/main/silenthound.py" -O "$scripts_dir/silenthound.py"
wget -q "https://raw.githubusercontent.com/ShutdownRepo/targetedKerberoast/main/targetedKerberoast.py" -O "$scripts_dir/targetedKerberoast.py"
wget -q "https://raw.githubusercontent.com/p0dalirius/FindUncommonShares/main/FindUncommonShares.py" -O "$scripts_dir/FindUncommonShares.py"
chmod +x "$scripts_dir/windapsearch"
chmod +x "$scripts_dir/kerbrute"
chmod +x "$scripts_dir/enum4linux-ng.py"
chmod +x "$scripts_dir/CVE-2022-33679.py"
chmod +x "$scripts_dir/silenthound.py"
chmod +x "$scripts_dir/targetedKerberoast.py"
chmod +x "$scripts_dir/FindUncommonShares.py"