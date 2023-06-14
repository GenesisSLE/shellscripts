#!/bin/bash
clear
sudo mysql -u root -e "USE genesis_sle; SELECT * from persona"
echo "Regresando al menú principal en 10 segundos..."
sleep 10
