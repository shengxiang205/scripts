#encoding: utf-8
require 'rubygems'
require 'rake'
require 'rake/packagetask'
require 'yaml'
require 'net/ssh'
require 'net/sftp'
require 'erb'
require 'stringio'
require 'uri'
require 'net/http'
require "digest"
require 'zip/zip'
require "xml"

local_root= "/Users/killyfreedom/Documents/Work/ruby/JoowingAppBackend/public/ota/apps"
locals = "**/*.ipa"
target_servers = [
  {:host => "www.joowing.com", :port => "5188", :user_name => "joowing", :password => "joowing1q2w3e4r", :target_folder => "/joowing/ota/apps"}
  # ,
  # {:host => "184.73.220.128", :port => "22", :user_name => "ubuntu", :password => "", :target_folder => "/home/ubuntu/ota/apps", 
  #   :keys => "/Users/killyfreedom/Documents/work/ruby/scripts/joowing1234qwer.pem"}
]

class Util
  attr_accessor :host, :port, :user_name, :password, :opts, :keys

  def initialize(opt = {})
    self.opts = opt;
    self.host = self.opts.delete(:host)
    self.port = self.opts.delete(:port)
    self.user_name = self.opts.delete(:user_name)
    self.password = self.opts.delete(:password)
    self.keys = self.opts.delete(:keys) || []
    $stdout.sync = true
  end

  def connection
    #puts self.keys.empty?
    if self.keys.empty?
      @ssh_connection ||= Net::SSH.start(
        self.host,
        self.user_name,
        :port => self.port,
        :password => self.password
      )
    else
      @ssh_connection ||= Net::SSH.start(
        self.host,
        self.user_name,
        :port => self.port,
        :keys => self.keys
      )
    end
  end

  def run(command, &blk)
    #puts "[REMOTE RUN] #{command}"
    channel = connection.open_channel do |channel|
      channel.exec(command) do |ch, success|
        ch.on_data do |ch, data|
          if (block_given?)
            yield(data)
          else
            data.lines.each do |line|
              puts "[SSH] #{line}"
            end
          end

        end
      end
    end
    channel.wait
  end

  # run a command as sudo
  def sudo_run(command, &blk)
    sudo_command = "echo '#{self.password}' | sudo -S #{command}"
    run(sudo_command, connection, &blk)
  end

  def upload!(source_file, target_file)
    connection.sftp.upload!(source_file, target_file) do |event, uploader, *args|
      case event
      when :open then
        puts "starting upload: #{args[0].local} -> #{args[0].remote} (#{args[0].size} bytes}"
      when :put then
        total = 50
        current_percent = ((args[1]/(args[0].size).to_f) * total).to_i
        $stdout.write("uploading: [#{'='*current_percent}#{' '*(total - current_percent)}] #{current_percent*2}%\r")
      when :close then
        puts "\nfinished with #{args[0].remote}"
      when :mkdir then
        puts "creating directory #{args[0]}"
      when :finish then
        puts "all done!"
      end
    end
  end
end

target_servers.each do |server|
  util = Util.new(server)
  target_folder = server[:target_folder]
  Dir.glob(File.join(local_root, locals)).each do |file|
    relative_file =  file.gsub(local_root, "")
    remote_md5 = ""
    local_md5 = `md5 #{file}`.split(" ").last
    util.run("md5sum #{File.join(target_folder, relative_file)}") do |data|
      remote_md5 = data.split("  ").first
    end
    puts "file: #{relative_file}"
    puts " local md5: #{local_md5}"
    puts "remote md5: #{remote_md5}"
    util.upload!(file, File.join(target_folder, relative_file)) if local_md5 != remote_md5
  end


end
