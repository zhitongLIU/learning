require 'bunny'
require 'pp'

conn = Bunny.new(host: '52.210.43.134', vhost: '/', port: 5672, user: 'user', password: '4WOmyzTWgRTt')
conn.start

ch = conn.create_channel
# q = ch.queue('hello')
x = ch.direct('exchange-name')
q = ch.queue('hello3').bind(x, routing_key: 'black')


begin
  pp ' [*] Waiting for messages. To exit press CTRL+C'
  q.subscribe(:block => true) do |delivery_info, properties, body|
    pp " [x] Recived #{body}"
  end
rescue Interrupt => _
  conn.close
  exit(0)
end
