require 'bunny'
require 'pp'

conn = Bunny.new
conn.start

ch = conn.create_channel
# q = ch.queue('hello')

x = ch.fanout('hello')
q = ch.queue("", :auto_delete => true).bind(x)


begin
  pp ' [*] Waiting for messages. To exit press CTRL+C'
  q.subscribe(:block => true) do |delivery_info, properties, body|
    pp " [x] Recived #{body}"
  end
rescue Interrupt => _
  conn.close
  exit(0)
end
