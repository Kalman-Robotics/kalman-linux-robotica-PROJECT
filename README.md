# Misión Nexus — archivos del proyecto

Archivos iniciales del proyecto del curso **Linux para Robótica** de
[Kalman Robotics](https://kalmanrobotics.io).

Las instrucciones completas están en el notebook del proyecto, en la plataforma.
Este repositorio solo entrega los archivos que necesitas descargar.

## Qué hay aquí

```text
parte_2/
├── monitor_nexus.sh        Monitor de Bash con seis zonas por completar
└── monitor_nexus.service   Unidad de systemd con dos zonas por completar
```

La **Parte 1** no necesita archivos: la resuelves entera con comandos.

## Cómo usarlo

```bash
git clone https://github.com/Kalman-Robotics/kalman-linux-robotica-PROJECT.git
mkdir -p ~/mision_nexus/scripts
cp kalman-linux-robotica-PROJECT/parte_2/monitor_nexus.* ~/mision_nexus/scripts/
```

Trabaja sobre tu copia en `~/mision_nexus/scripts/`, no sobre el repositorio
clonado. Así puedes volver a mirar el original si te pierdes.

## Reglas

- Modifica **solo** las zonas marcadas con `>>> TU CÓDIGO` / `>>> TU CONFIGURACIÓN`.
- Los bloques `NO MODIFICAR` son la parte que habla con el robot. Si los cambias,
  el monitor deja de leer a Nexus.
- **Nunca guardes tu token ni tu comando personal de conexión** dentro del
  proyecto, ni los incluyas en la entrega o en la grabación.

## Soporte

Dudas sobre el proyecto, por los canales del curso.
