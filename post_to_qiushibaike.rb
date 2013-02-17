require 'rubygems'
require 'json'
require 'net/http'

http_target = URI.parse("http://www.qiushibaike.com/new2/login")
params = {:login => "角落阳光", :password => "12345abc"}
request = Net::HTTP::Post.new(http_target.path, {'Content-Type' => 'application/json'})
request.body = params.to_json
puts "post #{http_target.to_s} in json:"
puts "params:#{params.inspect}"
resp = Net::HTTP.new(http_target.host, http_target.port).start() { |http| http.request(request) }
if (resp.code != "200")
    puts "fail to send http request:\n\turl:#{http_target.to_s}\n\tparams:#{params.inspect}"
    puts "response body: #{resp.inspect}"
end