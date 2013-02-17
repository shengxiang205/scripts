#encoding: utf-8
$:.unshift(File.dirname(File.expand_path(__FILE__)))

require 'rubygems'

require 'person.pb'
require 'benchmark'
require 'json'

person = Tutorial::Person.new
person.id = 1234
person.name = 'John Doe'
person.email = 'jdoe@example.com'
serialized_string = person.serialize_to_string

puts serialized_string

TIMES = 100000
$person = person
$h = { :id => 1234, :name => 'John Doe', :email => 'jdoe@example.com' }

Benchmark.bmbm do |x|
  # x.report { 100000.times { $person.serialize_to_string } }
  # x.report { 100000.times { $h.to_json }}
end

puts Tutorial::Person.parse(File.read("/Users/killyfreedom/Documents/a.output")).serialize_to_string
