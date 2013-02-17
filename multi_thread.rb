require "timeout"

a = Mutex.new
a.lock

Thread.start do
  while true
    begin
      Timeout::timeout(3) do
        puts "try to lock"
        a.lock
        puts "ok"
        a.unlock
        puts "unlock"
      end
    rescue Timeout::Error
      puts "timeout"
    end
  end
end

while true
  sleep(5)
  a.unlock
  sleep(5)
  a.lock
end
