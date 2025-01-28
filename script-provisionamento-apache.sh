#!/bin/bash

LOG_FILE="/var/script-prvisionamento-apache.log"  # Log do backup
# Função de log
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Atualizando servidor
log "Iniciando provisionamento...."

log "Baixando atualizacoes ...."
apt-get update -y

log "Instalando atualizacoes ...."
apt-get upgrade -y

log "Instalando apache ...."
apt-get install apache2 -y

log "Instalando unzip ...."
apt-get install unzip -y

log "Mudando diretorio ...."
cd /tmp

log "Baixando aplicacao ...."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

log "Descompactando aplicacao ...."
unzip main.zip

log "Mudando para diretorio da aplicacao ...."
cd linux-site-dio

log "Copiando arquivos da aplicacao para diretorio /www/html ...."
cp -R * /var/www/html

log "Provisionamento do servidor completado com sucesso."