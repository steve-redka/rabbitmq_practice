#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

queue = channel.queue('hello')

channel.default_exchange.publish('Hello cruel world', routing_key: queue.name)
p '[x] sent some nonsense'

connection.close
