#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
p '[*] Waiting for messages. To exit press CTRL+C'

queue.subscribe(manual_ack: true, block: true) do |delivery_info, _properties, body|
  p " [x] received #{body}"
  # fake some werk
  sleep body.count('.').to_i
  p ' [x] done'
  channel.ack(delivery_info.delivery_tag)
end
exit(0)
