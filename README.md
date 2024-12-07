# 🚀 MQTT Broker con Eclipse Mosquitto Dockerizado

Este repositorio contiene una configuración lista para desplegar un **servidor MQTT** usando **Eclipse Mosquitto** en Docker. Se incluyen las configuraciones básicas y soporte para MQTT en el puerto estándar 1883 y WebSocket en el puerto 9001.

## 📋 Requisitos previos

Antes de iniciar, asegúrate de tener instalado:
- **Docker**: Instalar Docker
- **Docker Compose**: Instalar Docker Compose

## 📁 Estructura del proyecto

```
.
├── docker-compose.yml      # Archivo principal para levantar los servicios
└── mosquitto
    ├── config
    │   └── mosquitto.conf  # Archivo de configuración de Mosquitto
    ├── data                # Directorio para los datos persistentes
    └── log                 # Directorio para los logs
```

## ⚙️ Configuración

El archivo de configuración `mosquitto.conf` habilita los siguientes elementos:
- Puerto estándar **1883** para MQTT
- Puerto **9001** para conexiones **WebSocket**
- Permite conexiones anónimas (**allow_anonymous true**) por defecto

Ejemplo del archivo `mosquitto.conf`:

```conf
# Mosquitto configuration file
listener 1883
allow_anonymous true

# Habilita WebSocket en el puerto 9001
listener 9001 protocol websockets
```

## 🚀 Cómo ejecutar

1. Clona el repositorio

```bash
git clone https://github.com/tu-usuario/mqtt-dockerized.git
cd mqtt-dockerized
```

2. Inicia el contenedor con Docker Compose

```bash
docker-compose up -d
```

3. Verifica que el contenedor está corriendo

```bash
docker ps
```

## 📡 Pruebas del servidor MQTT

**Suscribirse a un tópico:**

```bash
mosquitto_sub -h localhost -p 1883 -t test/topic
```

**Publicar un mensaje en un tópico:**

```bash
mosquitto_pub -h localhost -p 1883 -t test/topic -m "Hola MQTT desde Docker!"
```

**Uso de WebSocket (opcional):**
Si estás usando un cliente MQTT con WebSocket, conecta al puerto **9001**.

## 🛠️ Configuración avanzada

1. Modifica el archivo `mosquitto/config/mosquitto.conf` según tus necesidades.

2. Usa autenticación añadiendo usuarios y contraseñas:

```bash
mosquitto_passwd -c /mosquitto/config/password_file user
```

3. Reinicia el contenedor después de realizar cambios:

```bash
docker-compose down
docker-compose up -d
```

## 🐳 Detener el servidor

Para detener y eliminar el contenedor:

```bash
docker-compose down
```

🎉 ¡Gracias por usar este proyecto! 🚀
