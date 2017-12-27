require 'bunny'
require 'pp'

conn = Bunny.new
conn.start


conn = Bunny.new(hostname: 'localhost')
conn.start


ch = conn.create_channel
q = ch.queue('hello')

# ch.default_exchange.publish('Hello World! 1', routing_key: q.name)
# ch.default_exchange.publish('Hello World! 2', routing_key: q.name)
# ch.default_exchange.publish('Hello World! 3', routing_key: q.name)
# pp " [x] Send 'Hello World!'"

x = ch.fanout(q.name)
x.publish('msg', routing_key: '')
conn.close
