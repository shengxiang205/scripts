#enoding: utf-8
require 'rubygems'
require 'thin'
require 'irb'


path = "/Users/killyfreedom/Documents/Work/c/cache/9/9d/35a63c8a85b1279a0f991ce8828fb9d9"
r = Thin::Request.new

r.parse File.read(path)
r.finished

$r = r
IRB.start
