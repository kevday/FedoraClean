clear
echo -e ' \033[44;1;37m Add swapfile 4GB \033[0m'
echo '--------------------------------------------------------------------'
dd if=/dev/zero of=/swapfile bs=1024 count=4194304
mkswap /swapfile
chmod 600 /swapfile 
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >> /etc/fstab
mkdir /root/Desktop /root/Documentos /root/Downloads /root/Imagens /root/Música /root/Vídeos
exit
