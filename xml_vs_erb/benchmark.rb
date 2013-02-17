require 'rubygems'
require 'active_support/all'
require 'benchmark'
require 'xml'
require 'json'

class XmlVsErb
  cattr_accessor :datas_file
  self.datas_file = File.join(File.expand_path(File.dirname(__FILE__)), "datas.xml")

  cattr_accessor :erb_file
  self.erb_file = File.join(File.expand_path(File.dirname(__FILE__)), "datas.xml.erb")

  attr_accessor :datas

  def initialize
    @datas = Hash.from_xml(File.read(datas_file))
  end

  def benchmark
    #puts @datas["hash"]["strategies"].class.inspect
    #ActiveSupport::XmlMini.backend = 'LibXML'

    # create xml pit by erb

    Benchmark.bmbm do |x|
      x.report("Erb Xml:") do
        sio = StringIO.new
        sio.write(ERB.new(File.read(erb_file), nil, 1).result(binding))
        sio.flush
      end

      x.report("To Xml") do
        datas.to_xml
      end

      x.report("To Xml(LibXML)") do
        ActiveSupport::XmlMini.with_backend('LibXML') do
          datas.to_xml
        end
      end

      x.report("To JSON") do
        datas.to_json
      end
    end

    sio = StringIO.new
    sio.write(ERB.new(File.read(erb_file), nil, 1).result(binding))
    sio.flush
    #puts sio.string
  end
end

XmlVsErb.new.benchmark
