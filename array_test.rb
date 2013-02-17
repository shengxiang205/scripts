require 'benchmark'
a = Array.new(10000000)
class Mem
    attr_accessor :m
    def initialize
        self.m = "a" * 100
    end
end

m = Mem.new

Benchmark.bm do |x|
    x.report {a = Array.new(10000000);10000000.times { |index| a << m }}
    x.report {a = [];10000000.times { |index| a << m }}
    x.report {a = Array.new(10000000);10000000.times { |index| a[index] = m }}
end

