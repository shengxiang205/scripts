#encoding: utf-8
require 'rubygems'
require 'amqp'

EventMachine.run do
  connection = AMQP.connect(:host => '192.168.10.239', :heartbeat => 1)
  puts "Connecting to AMQP broker. Running #{AMQP::VERSION} version of the gem..."
  channel    = AMQP::Channel.new(connection)

  a_stb_queue_1 = channel.queue('stb_serial_no', { :durable => true })
  a_stb_queue_1.subscribe(:ack => true) do |metadata, payload|
    # puts "metadata: #{metadata.inspect}"
    puts "payload: #{payload.inspect}, from a_stb_queue_1"

    metadata.ack
  end

  a_stb_queue_2 = channel.queue('stb_serial_no_2', { :durable => true })
  a_stb_queue_2.subscribe(:ack => true) do |metadata, payload|
    puts "payload: #{payload.inspect}, from a_stb_queue_2"
    metadata.ack
  end
end