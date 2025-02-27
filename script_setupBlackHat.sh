#!/bin/bash

## Cores do Setup

amarelo="\e[33m"
verde="\e[32m"
branco="\e[97m"
bege="\e[93m"
vermelho="\e[91m"
reset="\e[0m"

nome_aviso(){

clear
echo ""
echo -e "$amarelo===================================================================================================$reset"
echo -e "$amarelo=                                                                                                 $amarelo=$reset"
echo -e "$amarelo=                     $branco  █████╗     ██╗   ██╗    ██╗    ███████╗     ██████╗                       $amarelo=$reset"
echo -e "$amarelo=                     $branco ██╔══██╗    ██║   ██║    ██║    ██╔════╝    ██╔═══██╗                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ███████║    ██║   ██║    ██║    ███████╗    ██║   ██║                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ██╔══██║    ╚██╗ ██╔╝    ██║    ╚════██║    ██║   ██║                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ██║  ██║     ╚████╔╝     ██║    ███████║    ╚██████╔╝                      $amarelo=$reset"
echo -e "$amarelo=                     $branco ╚═╝  ╚═╝      ╚═══╝      ╚═╝    ╚══════╝     ╚═════╝                       $amarelo=$reset"
echo -e "$amarelo=                                                                                                 $amarelo=$reset"
echo -e "$amarelo===================================================================================================$reset"
echo ""
echo ""
}

desc_ver(){
echo -e "                            Este script recomenda o uso do Ubuntu$amarelo 20.04$branco.$reset"
echo ""
}

# Verifica se o usuário é root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script precisa ser executado como root. Executando sudo su..."
    sudo su
fi

# Verifica se o usuário está no diretório /root/
if [ "$PWD" != "/root" ]; then
    echo "Mudando para o diretório /root/"
    cd /root || exit
fi

# Verifica se está usando Ubuntu 20.04
if ! grep -q 'Ubuntu 20.04' /etc/os-release; then
    nome_aviso
    desc_ver
    #echo "Este script recomenda o uso do Ubuntu 20.04."
    sleep 5
    clear
fi

apt install sudo -y

sudo apt-get install -y apt-utils

sudo apt-get install -y dialog

sudo apt-get install -y jq

sudo apt install jq -y

sudo apt install apache2-utils -y

apt install apache2-utils -y

sudo apt update

sudo apt upgrade -y

# Verifica se o arquivo SetupOrion já existe
if [ -e "SetupBlack.sh" ]; then
    echo "O arquivo SetupBlack.sh já existe. Removendo..."
    rm SetupBlack.sh
fi

# Baixa o script
curl -sSL https://raw.githubusercontent.com/ofcblackhat/Setup_SSB/main/SetupBlack.sh -o SetupBlack.sh

# Verifica se o download foi bem-sucedido
if [ $? -eq 0 ]; then
    # Executa o script baixado
    chmod +x SetupBlack.sh
    ./SetupBlack.sh
else
    echo "Falha ao baixar o script SetupBlack.sh"
    sleep 5
fi

sudo apt update
sudo apt upgrade -y

clear
rm SetupBlack.sh
