command = "free"
require 'eventmachine'
require 'logger'
log = File.join(File.dirname(File.expand_path(__FILE__)), "memory.log")
log_stream = Logger.new(log)

EM.run do 
  EM.add_periodic_timer(5) do 
    output = `#{command}`
    log_stream.info("check memory start")
    output.lines.each {|l| log_stream.info(l)}
    log_stream.info("")
  end
end