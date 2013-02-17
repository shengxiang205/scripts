#encoding: utf-8
require "rubygems"
require "active_support/all"

class A
  include ActiveSupport::Callbacks

  define_callbacks :exec
  set_callback :exec, :around, :around_exec

  def test(value, value2, &block)
    run_callbacks :exec do
      puts "_exec: #{value}, #{value2}, #{yield(value, value2)}"
    end
  end

  def around_exec(*args, &block)
    puts args.inspect
    puts block.inspect
    puts "exec before"
    yield(*args)
    puts "exec after"
  end
end

A.new.test(1,2) do |a, b|
  a + b
end
