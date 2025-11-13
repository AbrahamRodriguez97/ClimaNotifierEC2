#!/bin/bash

# 1. Navegar al directorio del proyecto
cd /home/ubuntu/ClimaNotifierEC2

# 2. Cargar las variables de entorno desde el archivo .env
# 'set -a' permite exportar las variables leídas por 'source .env'
set -a
source .env
set +a

# 3. Ejecutar el script Python usando la ruta ABSOLUTA al intérprete del entorno virtual
/home/ubuntu/ClimaNotifierEC2/venv/bin/python Mensajes_Twilio.py

# Opcional: Registrar la salida o errores en un archivo para depuración
# /home/ubuntu/ClimaNotifierEC2/venv/bin/python Mensajes_Twilio.py >> /home/ubuntu/clima_log.txt 2>&1
