require 'bunny'
require 'pp'

conn = Bunny.new
conn.start

ch = conn.create_channel
# q = ch.queue('hello')

q = ch.queue('hello')


begin
  pp ' [*] Waiting for messages. To exit press CTRL+C'
  q.subscribe(:block => true) do |delivery_info, properties, body|
    pp " [x] Recived #{body}"
  end
rescue Interrupt => _
  conn.close
  exit(0)
end
