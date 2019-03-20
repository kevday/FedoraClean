# FedoraClean
Script de instalação customizada do Gnome-Shell para o Fedora Minimal

### Considerações:

 * Foi utilizado no Fedora 29 com instalação minima, e habilitado `sudo` para o usuário.
 * São 3 scripts, install.sh responsavel por instalar o X e Gnome-Shell,
app_fedora.sh deve ser executado manualmente no terminal apos carregar o Gnome e o
swap.sh que é carregado no final do script app_fedora.sh para criar o /swapfile.
 * Tenha em mente que por instalar um menor volume de pacotes algumas dependencias
 deverão ser tratadas conforme a necessidade, no geral não deverá ter problemas com instalações.
 * Fiz esse script apenas para automatizar algums processos conforme minhas preferencias
 otimizando minha produtividade, pode apresentar erros em algumas maquinas sendo necessário adequação,
 mas ficarei muito feliz se houver correções, melhorias e sugestões.
 * Não utilize o usuário root.
 
 ### Como usar após formatar:
 
 
```sh
$ sudo dnf install git 
$ git clone git://github.com/kevday/FedoraClean.git
$ cd FedoraClean/
$ chmod +x install.sh
$ ./install.sh
```
 
### Print Screens

...

### Fontes:
Fedora: https://getfedora.org/ 
Minha pagina pessoal: http://kevin.net.br 
Tema: https://github.com/nana-4/materia-theme 
Icones: https://github.com/snwh/paper-icon-theme 
Extenção do Gnome: https://gitlab.gnome.org/World/ShellExtensions/desktop-icons 
A ideia original: https://github.com/benmat/fedora-install 
