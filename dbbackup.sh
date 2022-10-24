#!/bin/bash
fecha=$(date +"%d_%m_%Y")
mysql -u genesis -p genesis_sle > backup/backup.sql
