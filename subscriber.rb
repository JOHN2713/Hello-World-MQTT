require 'mqtt'

# Conexión al broker MQTT
MQTT::Client.connect('localhost') do |client|
  puts 'Esperando mensajes del tópico "test/topic"...'
  # Suscribirse a un tópico
  client.get('test/topic') do |topic, message|
    puts "Mensaje recibido en #{topic}: #{message}"
  end
end
