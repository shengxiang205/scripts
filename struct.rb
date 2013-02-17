require 'benchmark'
require 'ostruct'

REP = 100000

User = Struct.new(:name, :age)

USER = "User".freeze
AGE = 21
HASH = {:name => USER, :age => AGE}.freeze

class UserKlass
  attr_reader :name 
  attr_reader :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

# Benchmark.bm 20 do |x|
#   x.report 'OpenStruct slow' do
#     REP.times do |index|
#        OpenStruct.new(:name => "User", :age => 21)
#     end
#   end

#   x.report 'OpenStruct fast' do
#     REP.times do |index|
#        OpenStruct.new(HASH)
#     end
#   end

#   x.report 'Struct slow' do
#     REP.times do |index|
#        User.new("User", 21)
#     end
#   end

#   x.report 'Struct fast' do
#     REP.times do |index|
#        User.new(USER, AGE)
#     end
#   end
# end
#                r19          ree                   jruby 
#   hash    321.7/2.321063    321.7/2.921063       409/2.9
#   O       1200+/null        1200+/null           1200+/null        
#   s       52.7/0.535869     54/1.875482          162/1.9   
#   class   52.7/0.535869     231/2.97             200+/1.6
start = Time.now

collection = (1..10**6).collect do |i|
  {:name => "User" , :age => 21}
  # OpenStruct.new(HASH)
  # User.new(USER, AGE)
  # UserKlass.new(USER, AGE)
end; 1

stop = Time.now

puts "#{stop - start} seconds elapsed"
puts Process.pid
sleep 10