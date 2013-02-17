require "rubygems"
require "phusion_passenger"
require "phusion_passenger/abstract_server"

$aaaa = 2

class TestServer < PhusionPassenger::AbstractServer
  # cattr_accessor :test
  @@test = "xxxxxx"

  def initialize(*args)
    super(*args)
    define_message_handler(:process_pid, :handle_process_pid)
  end

  def process_id
    connect do |channel|
      channel.write('process_pid')
      readed_process_id = channel.read
      puts "The server said: #{readed_process_id}"
      readed_process_id
    end
  end

  protected
  def handle_process_pid(channel)
    channel.write( Process.pid, $aaaa, @@test )
  end

end

server = TestServer.new
server.start
while true
  begin
    puts "get from server: #{server.process_id}"
    sleep 1
  rescue => e
    puts "error #{e.to_s}"
  end
end
