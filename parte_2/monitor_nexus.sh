#!/bin/bash

# Misión Nexus — Parte 2
# Monitor del estado de Nexus. Se ejecuta en TU computadora (WSL2 o Ubuntu),
# nunca dentro del robot.
#
# Completa únicamente las seis zonas delimitadas con:
#
#   >>> TU CÓDIGO — TODO N
#   <<< FIN DE TU CÓDIGO
#
# Todo lo marcado como NO MODIFICAR forma parte de la infraestructura
# proporcionada: es la parte que habla con el robot.

# ============================================================
# CONFIGURACIÓN PROPORCIONADA — NO MODIFICAR
# ============================================================

# Prepara las herramientas de ROS en la computadora del estudiante.
source /opt/ros/humble/setup.bash

# Si tu conexión con Nexus se apoya en un archivo de configuración, cárgalo
# aquí. Consulta la pestaña Guía para saber cuál es.
# Nunca guardes el token dentro del proyecto.
# source /ruta/de/tu/configuracion.env

# ============================================================
# CONFIGURACIÓN DEL MONITOR
# ============================================================

# >>> TU CÓDIGO — TODO 1
# Guarda el primer argumento en la variable INTERVALO.
INTERVALO=
# <<< FIN DE TU CÓDIGO

# >>> TU CÓDIGO — TODO 2
# Si no se recibió un intervalo, muestra:
#   Uso: ./monitor_nexus.sh SEGUNDOS
# y termina con un código de error.
# <<< FIN DE TU CÓDIGO

# >>> TU CÓDIGO — TODO 3
# Define la ruta de la carpeta `logs` situada dentro de `mision_nexus`, la misma
# carpeta donde guardaste los datos de la Parte 1. Tiene que funcionar sin
# importar desde dónde se ejecute el script.
LOG_DIR=
# <<< FIN DE TU CÓDIGO

# NO MODIFICAR — construye la ruta final y prepara la carpeta.
LOG_FILE="$LOG_DIR/recorrido_nexus.log"

mkdir -p "$LOG_DIR" || exit 1

# ============================================================
# CAPTURA DE UNA MUESTRA
# ============================================================

capturar_estado() {
    # El comando de ROS es proporcionado. La sustitución de comandos permite
    # conservar una sola muestra completa dentro de TELEMETRIA.
    TELEMETRIA=$(ros2 topic echo --once /telemetry 2>/dev/null)

    # >>> TU CÓDIGO — TODO 4
    # Comprueba el código del comando anterior. Si la lectura falló, muestra:
    #   No se pudo leer la telemetría de Nexus
    # y termina con un código de error.
    # <<< FIN DE TU CÓDIGO

    # NO MODIFICAR — identifica la muestra y abre su bloque en el registro.
    FECHA=$(date +"%Y-%m-%d %H:%M:%S")
    echo "fecha: $FECHA" >> "$LOG_FILE"

    # NO MODIFICAR — lista de campos que utiliza el proyecto.
    for CAMPO in \
        odom_pos_x \
        odom_pos_y \
        odom_pos_yaw \
        wifi_rssi_dbm \
        dist_front_mm \
        dist_left_mm \
        dist_back_mm \
        dist_right_mm
    do
        # >>> TU CÓDIGO — TODO 5
        # Filtra el CAMPO actual de TELEMETRIA y añade el resultado a LOG_FILE.
        # Es el mismo filtro de la Parte 1, ahora sobre una variable en vez de
        # un archivo. Cada muestra debe quedar con ocho líneas de campo.
        :
        # <<< FIN DE TU CÓDIGO
    done

    # NO MODIFICAR — cierra el bloque y confirma la captura en la terminal.
    echo "---" >> "$LOG_FILE"
    echo "Muestra guardada a las $FECHA"
}

# ============================================================
# MONITOR CONTINUO
# ============================================================

# >>> TU CÓDIGO — TODO 6
# Crea un ciclo que, mientras el monitor permanezca activo:
#   1. llame a capturar_estado;
#   2. espere la cantidad de segundos guardada en INTERVALO;
#   3. repita.
#
# IMPORTANTE: la espera debe estar dentro del ciclo. Un ciclo permanente sin
# `sleep` consultaría el robot y escribiría el archivo tan rápido como pudiera.
# <<< FIN DE TU CÓDIGO
