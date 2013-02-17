# encoding: utf-8
# Test Hash in MongoMapper

require 'mongo'
require 'mongo_mapper'
require 'pp' 

MongoMapper.config = {
    "development" => {
        'host' => "192.168.10.223",
        'port' => "27017",
        'database' => "test_performance"
    }   
}
MongoMapper.connect("development")


class User
    include MongoMapper::Document    
    key :test_hash, Hash#, :index => true
end

User.collection.remove

user = User.create({:test_hash => { :a => "b", :c => { :f => "d" } } })

10000.times do |i|
    key_name = "key_#{rand(10000)}"
    User.create({:test_hash => { key_name => "value_#{rand(10000)}" }})
end
start = Time.now.to_f

users = User.all("test_hash.c" => {'$exists' => true }, "test_hash.c.f" => {'$exists' => true} )
puts "cast #{((Time.now.to_f - start) * 1000).to_i}ms"

start = Time.now.to_f
users = User.all("test_hash.c" => {'$exists' => true }, "test_hash.c.f" => "d" )
puts "cast #{((Time.now.to_f - start) * 1000).to_i}ms"

pp users


