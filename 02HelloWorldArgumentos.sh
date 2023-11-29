#!/bin/bash

# Comprobamos que recibimos al menos un argumento
if [ $# -eq 0 ]; then
echo -e "Uso:$0 <nombre>"
else
	echo -e "Hola $1"
fi
