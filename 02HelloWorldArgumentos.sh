#!/bin/bash

# Comprobamos que recibimos al menos un argumento
if [ $# -eq 0 ]; then
echo -e "Uso: ./02HelloWorldArgumentos.sh <nombre>"
else
	echo -e "Hola $1"
fi
