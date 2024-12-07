require 'mqtt'

# Conexión al broker MQTT
MQTT::Client.connect('localhost') do |client|
  # Publicar un mensaje al tópico "test/topic"
  client.publish('test/topic', '¡Hola desde Ruby con MQTT!')
  puts 'Mensaje publicado: ¡Hola desde Ruby con MQTT!'
end
