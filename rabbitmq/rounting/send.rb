require 'bunny'
require 'pp'

conn = Bunny.new(host: '52.210.43.134', vhost: '/', port: 5672, user: 'user', password: '4WOmyzTWgRTt')
conn.start

ch = conn.create_channel
rout = 'orange'
rout2 = 'black'
rout3 = 'green'

x = ch.direct('exchange-name')
x.publish('Hello World! 1', routing_key: rout)
x.publish('Hello World! 2', routing_key: rout2)
x.publish('Hello World! 3', routing_key: rout3)
pp " [x] Send 'Hello World!'"

conn.close
