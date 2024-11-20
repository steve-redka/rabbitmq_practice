#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

queue = channel.queue('hello')

message = ARGV.empty? ? 'Hello Wrld!' : ARGV.join(' ')

queue.publish(message, persistent: true)
p " [x] Sent #{message}"
