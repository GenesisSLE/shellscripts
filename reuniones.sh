#!/bin/bash

sudo mysql -u root -e "USE genesis_sle; SELECT * from emite"
echo "Regresando al menú principal en 10 segundos..."
sleep 10
