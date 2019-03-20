#! /bin/bash


# Aqui estão apps complementares para Gnome Shell
# a instalação exige confirmação de cada item
# esse script reflete minhas preferências e recomendo a edição dele
# ATENÇÃO ao final do script é configurado o swapfile com 4GB


clear
notify-send -i start-here 'Bem vindo!' 'Se estou vendo essa notificação é porque o Gnome Shell foi instalado com sucesso!'
gnome-control-center&
notify-send -i video-display -t 10000 'Display' 'Ajuste as configurações do seu monitor'


notify-send 'Meus Essenciais' 'Programas de minha preferencia...'
clear
echo -e ' \033[44;1;37m Instalando meus apps... \033[0m'
echo '--------------------------------------------------------------------'
echo -e ' \033[44;1;37m Firefox \033[0m'
sudo dnf install firefox
echo -e ' \033[44;1;37m Nautilus \033[0m'
sudo dnf install nautilus 
echo -e ' \033[44;1;37m gnome-tweak-tool \033[0m'
sudo dnf install gnome-tweak-tool
echo -e ' \033[44;1;37m gnome-system-monitor \033[0m'
sudo dnf install gnome-system-monitor
echo -e ' \033[44;1;37m gedit \033[0m'
sudo dnf install gedit
echo -e ' \033[44;1;37m sushi \033[0m'
sudo dnf install sushi
echo -e ' \033[44;1;37m gnome-disk-utility \033[0m'
sudo dnf install gnome-disk-utility
echo -e ' \033[44;1;37m gnome-software \033[0m'
sudo dnf install gnome-software
echo -e ' \033[44;1;37mokular \033[0m'
sudo dnf install okular


notify-send 'Extenções' 'Extenções, deveria vir por padrão no Gnome, mas vamos lá...'
clear
echo -e ' \033[44;1;37m Instalado extenções do Gnome \033[0m'
echo '--------------------------------------------------------------------'
sudo dnf install gnome-shell-extension-dash-to-dock

sudo mv -R desktop-icons@csoriano/ /usr/share/gnome-shell/extensions/

notify-send 'Decoração' 'Instalando os temas e icones!'
clear
echo -e ' \033[44;1;37m Temas e icones \033[0m'
echo '--------------------------------------------------------------------'

cp -R Paper/ /etc/share/themes/
gsettings set org.gnome.desktop.interface icon-theme "Paper"
gsettings set org.gnome.desktop.interface cursor-theme "Paper"

cd materia-theme
chmod +x install.sh
sudo ./install.sh
gsettings reset org.gnome.desktop.interface gtk-theme
gsettings reset org.gnome.desktop.wm.preferences theme
gsettings set org.gnome.desktop.interface gtk-theme "Materia-compact"
gsettings set org.gnome.desktop.wm.preferences theme "Materia-compact"

mv linux_logo.tga ~/Imagens
mv bash.jpg ~/Imagens
mv Brasil-Flag.jpg ~/Imagens
mv fedoraclean.png ~/Imagens
gsettings get org.gnome.desktop.background picture-uri 'file:~/Imagens/fedoraclean.png' 


# uso 2 monitores e o comando abaixo copia a configuração do monitor ocorrera uma mensagemde erro que pode ser ignorada em caso de monitor único
#notify-send 'Monitor' 'Corrigindo configuração dos monitores...!'
sudo cp ~/.config/monitors.xml ~gdm/.config/
rm -f ~/.config/autostart/app_fedora.desktop


clear
echo -e ' \033[44;1;37m Add swapfile 4GB \033[0m'
echo '--------------------------------------------------------------------'
sudo dd if=/dev/zero of=/swapfile bs=1024 count=4194304
sudo mkswap /swapfile 
sudo swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >> /etc/fstab
sudo mkdir /root Desktop Documentos Downloads Imagens Música Vídeos

notify-send 'Concluido' 'Reiniciando em 60 segundos'
free .-ht
read -rsp $'Aperte alguma tecla ou aguarde 60 segundos para reiniciar...\n' -n 1 -t 60;
reset
