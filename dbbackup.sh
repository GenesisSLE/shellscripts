#!/bin/bash
fecha=$(date +"%d_%m_%Y")
mysqldump -u genesis -pgenesis genesis_sle > backup_$fecha.sql

echo Base de datos exportada como backup_$fecha.sql
