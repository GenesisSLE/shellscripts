#!/bin/bash

mysql -u genesis -pgenesis -e "use genesis_sle; SELECT logdate, username, action FROM log WHERE userid = '1' /*root*/ AND error = 10;"
