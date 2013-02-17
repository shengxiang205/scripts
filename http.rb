#encoding: utf-8
require 'net/http'
require 'zip/zip'
require 'socket'
url = "http://192.168.10.133:3000/content/QQ_V2.2.0.dmg.zip"

uri = URI(url)
puts "pid: #{Process.pid}"

# 得到process的内存状况
def mem_of_process(pid)
  begin
    output = `ps -w -o pid,ppid,vsz,rss,%cpu,command | grep #{pid}`
    output.lines.map {|l| l.split(" ")}.select do |data|
      data[1] =~ Regexp.new(pid.to_s)
    end[0][5].to_i/1024
  rescue => e
    0
  end
end

class ZipStream < Zip::ZipCentralDirectory
  attr_reader :io
  def initialize(io)
    @io = io
    io.binmode if io.respond_to?(:binmode)
    read_from_stream(self.io)
  end
end

total_chunk_size = 0
Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Get.new uri.request_uri
  tempfile = Tempfile.new("zip")
  http.request request do |response|
    response.read_body do |chunk|
      total_chunk_size += chunk.size
      # puts "=" * 100
      tempfile.write(chunk)
      # puts "current_memory: #{mem_of_process(Process.pid)}"
      # puts " get from http: #{sprintf("%.1f" %[chunk.size.to_f / 1024 ])}KB" 
      # puts "    total size: #{sprintf("%.1f" %[total_chunk_size.to_f / 1024 / 1024])}MB"
    end
    tempfile.flush
    Zip::ZipFile.open(tempfile) { |zf| puts "Entries from reloaded zip: #{zf.entries.join(', ')}" }
    tempfile.unlink
    # io = response.instance_variable_get("@socket")
    # ZipStream.new(io).each { |f| puts f.inspect }
  end
end
