#!/bin/bash

# Variáveis
KEY_PATH=~/Downloads/minha-chave-devops.pem
EC2_USER=ubuntu
EC2_HOST=56.124.46.190

# Comandos remotos que serão executados na EC2
REMOTE_COMMANDS=$(cat << 'EOF'
  # Atualiza pacotes
  sudo apt update -y

  # Instala o Docker se não estiver instalado
  if ! command -v docker &> /dev/null
  then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
  fi

  # Clona o projeto ou atualiza
  if [ ! -d "todo-api-devops" ]; then
    git clone https://github.com/mabielmuller/todo-api-devops.git
  else
    cd todo-api-devops && git pull && cd ..
  fi

  # Build e execução do container
  cd todo-api-devops
  sudo docker build -t todo-api-devops .
  sudo docker stop todo-api || true
  sudo docker rm todo-api || true
  sudo docker run -d --name todo-api -p 3000:3000 todo-api-devops
EOF
)

# Execução via SSH com as variáveis corretas
ssh -i "$KEY_PATH" "$EC2_USER@$EC2_HOST" "$REMOTE_COMMANDS"
