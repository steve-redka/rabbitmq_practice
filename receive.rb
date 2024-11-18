#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

begin
  p '[*] waiting for messages. to exit press CTRL+C'
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    p "[x] received #{body}"
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
