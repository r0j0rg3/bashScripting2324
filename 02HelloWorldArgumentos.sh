#!/bin/bash

if [ $# -eq 0 ]; then
	echo -e "Introduce a quien quieres saludar"
else
	echo -e "Hola $1"
fi
