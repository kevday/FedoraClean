#! /bin/bash

# Apos iniciar o Gnome, abra o terminal e execute ./app_fedora
# Instalação do Gnome personalizado, com Gnome terminal
# e ferramentas que utilizo.
# Foi utilizado apenas o dnf asim de manter compatibilidade
# com futuras versões do Fedora, não testei mas acredito que pode ser 
# substituido pelo yum para usar no RHEL, Centos ou Oracle.
# Prefiro a pasta Desktop invés de Área de trabalho.


mkdir ~/Desktop ~/Documentos ~/Downloads ~/Imagens ~/Música ~/Vídeos


clear
echo -e ' \033[44;1;37m Download virtualização \033[0m'
echo '--------------------------------------------------------------------'
#curl -s -O https://softwareupdate.vmware.com/cds/vmw-desktop/player/15.0.2/10952284/linux/core/VMware-Player-15.0.2-10952284.x86_64.bundle.tar -O VMware-Player.tar&
#tar -xvf VMware-Player.tar
curl -s -O https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0-6.0.4_128413_fedora29-1.x86_64.rpm&
curl -s -O https://download.virtualbox.org/virtualbox/6.0.4/Oracle_VM_VirtualBox_Extension_Pack-6.0.4.vbox-extpack&


clear
echo -e ' \033[44;1;37m Sistema e terminal \033[0m'
echo '--------------------------------------------------------------------'
sudo dnf install -y cups cups system-config-printer # comente caso não use impressoras
sudo dnf install -y nano
sudo dnf install -y zip tar
sudo dnf install -y git
sudo dnf install -y p7zip # no RHEL8 não possui esse pacote
#sudo dnf install gtkmm24dnf kernel-headers kernel-devel gcc glibc-headers
#sudo dnf install elfutils-libelf-devel

clear
echo -e ' \033[44;1;37m Gnome Shell + X \033[0m'
echo '--------------------------------------------------------------------'
sudo dnf install -y @base-x gnome-shell
clear
sudo dnf install -y gnome-terminal dejavu-sans-mono-fonts bash-completion

clear
echo -e ' \033[44;1;37m Preparando Apps do Gnome\033[0m'
echo '--------------------------------------------------------------------'

tar -axf *.tar.xz

chmod +x app_fedora.sh

mv VirtualBox-6.0-6.0.4_128413_fedora29-1.x86_64.rpm ~/Desktop/
mv Oracle_VM_VirtualBox_Extension_Pack-6.0.4.vbox-extpack ~/Desktop/

clear
read -rsp $'Aperte alguma tecla ou aguarde 60 segundos para iniciar o Gnome\n' -n 1 -t 60;
sudo systemctl set-default graphical.target &&
sudo systemctl isolate graphical.target

sudo mkdir /root/Desktop /root/Documentos /root/Downloads /root/Imagens /root/Música /root/Vídeos


# Recomendações:
# www.kevin.net.br
# https://fedoraproject.org/wiki/Remix
# https://getfedora.org/

