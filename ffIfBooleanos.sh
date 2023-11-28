#!/bin/bash

[[ $(grep $1 ./01HelloWorld.sh) ]] && echo -e "Hay coincidencias"
[[ $(grep $1 ./01HelloWorld.sh) ]] || echo -e "No hay coincidencias"
