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

sudo mv desktop-icons@csoriano/ /usr/share/gnome-shell/extensions/

notify-send 'Decoração' 'Instalando os temas e icones!'
clear
echo -e ' \033[44;1;37m Temas e icones \033[0m'
echo '--------------------------------------------------------------------'

sudo cp -R Paper/ /usr/share/icons/
sudo gsettings set org.gnome.desktop.interface icon-theme "Paper"
sudo gsettings set org.gnome.desktop.interface cursor-theme "Paper"

cd materia-theme
chmod +x install.sh
sudo ./install.sh
sudo gsettings reset org.gnome.desktop.interface gtk-theme
sudo gsettings reset org.gnome.desktop.wm.preferences theme
sudo gsettings set org.gnome.desktop.interface gtk-theme "Materia-compact"
sudo gsettings set org.gnome.desktop.wm.preferences theme "Materia-compact"

cd ~/FedoraClear
mv k_logo.tga ~/Imagens
mv Brasil-Flag.jpg ~/Imagens
mv fedoraclean.png ~/Imagens
sudo gsettings get org.gnome.desktop.background picture-uri 'file:~/Imagens/fedoraclean.png' 


# uso 2 monitores e o comando abaixo copia a configuração do monitor ocorrera uma mensagemde erro que pode ser ignorada em caso de monitor único
#notify-send 'Monitor' 'Corrigindo configuração dos monitores...!'
sudo cp ~/.config/monitors.xml ~gdm/.config/

cd ~/fedoraclear
cd ~/FedoraClear
chmod +x swap.sh
sudo su -c ./swap.sh

notify-send 'Concluido' 'Reiniciando em 60 segundos'

clear
free -ht
echo -e ' \033[44;1;37m'
read -rsp $'Aperte alguma tecla ou aguarde 60 segundos para reiniciar...\n' -n 1 -t 60;
echo -e ' \033[0m'
sudo reboot


