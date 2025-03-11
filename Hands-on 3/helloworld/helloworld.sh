#!/bin/bash

# Imprimir "Hello World"
echo "Hello World"

echo "Listando el contenido del direcorio actual:"
# Listar el contenido del directorio actual
ls -l

echo "Creando un directorio llamado Test"
# Crear un directorio llamado Test
mkdir -p Test

echo "Cambiando al directorio Test"
# Cambiarse al directorio Test
cd Test || exit

echo "Listando el contenido del directorio Test:"
# Listar el contenido del directorio Test
ls -l
