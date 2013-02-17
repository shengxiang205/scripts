#encoding: utf-8
require 'rubygems'
require 'amqp'

EventMachine.run do
  connection = AMQP.connect(:host => '192.168.10.239')
  puts "Connecting to AMQP broker. Running #{AMQP::VERSION} version of the gem..."

  channel  = AMQP::Channel.new(connection)
  queue    = channel.queue("amqpgem.examples.hello_world", :auto_delete => true)
  exchange = channel.default_exchange

  msgs = 0

  queue.subscribe do |payload|
    # puts "Received a message: #{payload}. Disconnecting..."
    msgs += 1
  end

  EM.add_periodic_timer 1 do 
    puts "msg rate: #{msgs}/s"
    msgs = 0
  end

  proc = Proc.new do 
    EM.next_tick do 
      exchange.publish "Hello, world!", :routing_key => queue.name
      proc.call
    end
  end

  proc.call
end