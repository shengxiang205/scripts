#encoding: utf-8
require 'rubygems'
require 'amqp'

EventMachine.run do
  connection = AMQP.connect(:host => '192.168.10.239', :heartbeat => 1)
  puts "Connecting to AMQP broker. Running #{AMQP::VERSION} version of the gem..."
  channel    = AMQP::Channel.new(connection)

  fanout_exchange = channel.fanout('com.joowing.org.6', { :durable => true })

  # a_stb_queue = channel.queue('stb_serial_no_1', { :durable => true })
  # a_stb_queue.bind(fanout_exchange)

  # a_stb_queue = channel.queue('stb_serial_no_2', { :durable => true })
  # a_stb_queue.bind(fanout_exchange)

  fanout_exchange.publish({ :time => Time.now }, :type => "gems.install", :routing_key => "test", :delivery_mode => 2)
end