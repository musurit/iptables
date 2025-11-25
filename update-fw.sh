#!/bin/bash

URL="https://raw.githubusercontent.com/musurit/iptables/main/fw.rules"
TMP="/tmp/fw.rules"

# Descargar archivo
wget -q -O $TMP $URL

if [ $? -ne 0 ]; then
    echo "ERROR descargando fw.rules: $(date)" >> /var/log/update-fw.log
    exit 1
fi

# Aplicar reglas
iptables-restore < $TMP

echo "Firewall actualizado: $(date)" >> /var/log/update-fw.log
