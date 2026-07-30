#!/bin/bash

# Misión Nexus — Parte 2
# Monitor del estado de Nexus. Se ejecuta en TU computadora (WSL2 o Ubuntu),
# nunca dentro del robot.
#
# Completa únicamente las seis zonas delimitadas con:
#
#   >>> TU CÓDIGO — <NOMBRE DE LA ZONA>
#   <<< FIN DE TU CÓDIGO
#
# Todo lo marcado como NO MODIFICAR ya viene resuelto: la configuración de la
# conexión, el comando que lee el robot, la lista de campos y el formato del
# registro.

# ============================================================
# CONFIGURACIÓN PROPORCIONADA — NO MODIFICAR
# ============================================================

# Estas son las variables de entorno que tu script necesita para encontrar a
# Nexus: cargan las herramientas de ROS, eligen la implementación de red y fijan
# el dominio en el que publica el robot.
#
# Tu terminal las recibe cuando ejecutas tu comando personal de conexión. Pero un
# servicio de systemd NO hereda el entorno de tu terminal: arranca casi vacío.
# Por eso el script las define él mismo, y así funciona igual lanzado a mano que
# lanzado como servicio.
#
# Ninguna de estas líneas contiene tu token. Nunca lo copies aquí.
source /opt/ros/humble/setup.bash
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export FASTRTPS_DEFAULT_PROFILES_FILE=/var/lib/kalman/fastdds.xml
export ROS_DOMAIN_ID=20
export ROS_IPV6=on

# ============================================================
# CONFIGURACIÓN DEL MONITOR
# ============================================================

# >>> TU CÓDIGO — EL INTERVALO
# Al script se le pasan los segundos de espera al ejecutarlo, así:
#   ./monitor_nexus.sh 30
# Guarda ese primer argumento en la variable INTERVALO.
INTERVALO=
# <<< FIN DE TU CÓDIGO

# >>> TU CÓDIGO — LA COMPROBACIÓN DEL INTERVALO
# Si se ejecutó el script sin ningún número, el monitor no debe arrancar: muestra
# este mensaje y termina devolviendo un valor distinto de cero.
#
#   Uso: ./monitor_nexus.sh SEGUNDOS
# <<< FIN DE TU CÓDIGO

# >>> TU CÓDIGO — LA CARPETA DE REGISTROS
# Guarda en LOG_DIR la ruta de la carpeta `logs` de tu `mision_nexus`, junto a la
# carpeta `datos` de la Parte 1. No hace falta crearla: la línea de abajo lo hace.
#
# Escribe la ruta completa desde tu carpeta personal. Una relativa parecería
# funcionar al probarlo a mano, pero systemd ejecuta el script desde otro sitio.
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

    # >>> TU CÓDIGO — LA LECTURA FALLIDA
    # La lectura de arriba puede fallar: sin conexión, o con la reserva terminada.
    # Consulta su código de salida y, si falló, muestra este mensaje y termina
    # devolviendo un valor distinto de cero.
    #
    #   No se pudo leer la telemetría de Nexus
    #
    # Ojo: el código de salida es el del último comando, así que míralo antes de
    # ejecutar nada más.
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
        # >>> TU CÓDIGO — EL FILTRO DE CADA CAMPO
        # Esto se repite ocho veces: en cada vuelta CAMPO vale uno de los nombres
        # de la lista de arriba.
        #
        # Saca de TELEMETRIA la línea de ese CAMPO y añádela al final de LOG_FILE.
        # Mismo filtrado que en la Parte 1, con el texto en una variable en vez de
        # en un archivo. Cada muestra debe quedar con ocho líneas, ni una más.
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

# >>> TU CÓDIGO — EL CICLO
# Crea un ciclo que, mientras el monitor permanezca activo:
#   1. llame a capturar_estado;
#   2. espere la cantidad de segundos guardada en INTERVALO;
#   3. repita.
#
# IMPORTANTE: la espera debe estar dentro del ciclo. Un ciclo permanente sin
# `sleep` consultaría el robot y escribiría el archivo tan rápido como pudiera.
# <<< FIN DE TU CÓDIGO
