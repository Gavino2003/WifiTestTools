# WifiTestTool

**Desenvolvido por Vasco Gavino**

---

## 📜 Aviso Legal / Isenção de Responsabilidade

**WifiTestTool** destina-se estritamente a:
- Fins educacionais
- Testes em redes de sua propriedade
- Testes em redes com permissão explícita

🚨 **O uso não autorizado** desta ferramenta em redes ou dispositivos sem consentimento é:
- Ilegal
- Antiético

**O autor e os colaboradores não assumem qualquer responsabilidade por qualquer uso indevido deste software.**
Ao usar esta ferramenta, você concorda que é o único responsável por suas ações.

---

## 🔍 Visão geral

**WifiTestTool** é um script Bash que automatiza partes do Wi-Fi WPA2:
- Processo de captura de handshake
- Processo de cracking

🔧 **Pilha técnica**: Utiliza o pacote `aircrack-ng`

🎯 **Plataforma principal**: Arch Linux (pode funcionar em outras distribuições Linux com ajustes)

🤝 **Comunidade**: Contribuições para melhorias são incentivadas!

---

## 📦 Dependências

### Pacote necessário:
- `aircrack-ng`

O script tenta a instalação automática via `yay`. Se isso falhar, instale manualmente:

```bash
sudo pacman -S aircrack-ng
```

## 🔍 Utilização

Basta fazer git clone ao repositório e após isso executar um terminal dentro da pasta onde se encontra o script

dar lhe permissões para ser executado através do comando

```bash
chmod +x wifitesttool.sh
```

Após isso execute-o sem permisões de root através do seguinte comando:

```bash
./wifitesttool.sh
```

Em caso de algum erro durante o script recomendamos que utilize este comando para voltar a tornar a placa de rede utilizável, ou se preferir reinicie o dispositivo

```bash
sudo airmon-ng stop wlan0mon (substituindo pela sua placa +mon no fim)
sudo systemctl restart NetworkManager
```

## Contribuições

Contribuições, relatórios de bugs e solicitações de recursos são bem-vindos.
Abra um problema ou envie um pull request para ajudar a melhorar o WifiTestTool.
Licença e Responsabilidade

## 📜 Aviso Legal / Isenção de Responsabilidade

Esta ferramenta é fornecida "no estado em que se encontra", sem quaisquer garantias. Use de forma responsável e legal.
Não use em redes não autorizadas.

🔧 Desenvolvido e mantido por Vasco Gavino.
