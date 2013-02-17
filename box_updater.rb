#encoding: utf-8
require "fileutils"
def update_mountable(http_path, shared_path)
  puts "    http_path: #{http_path}"
  puts "  shared_path: #{shared_path}"
  # create db and private folder
  puts "Create additional folder in #{shared_path}:"
  %w{ db private }.each do |name|
    full_path = File.join(shared_path, name)
    unless File.exist?(full_path)
      puts "  * create #{name}: #{full_path}"
      FileUtils.mkdir(full_path)
    end
  end

  puts "Copy migration files into $shared_path/db:"
  db_path = File.join(http_path, "db")
  if File.symlink?(db_path)
    puts "  * db is already linked, skip it!"
  else
    Dir.glob(File.join(db_path, "**", "*.rb")).each do |rb_file|
      target_rb_file = rb_file.gsub(http_path, shared_path)
      FileUtils.mkdir_p(File.dirname(target_rb_file))
      puts "  * copy db file from: #{rb_file}"
      puts "                   to: #{target_rb_file}"
      FileUtils.rm(target_rb_file) if File.exist?(target_rb_file)
      FileUtils.cp(rb_file, target_rb_file)
    end
  end

  puts "Copy route file to private:"
  config_path = File.join(http_path, "lib/app_loader/config")
  if File.exist?(config_path)
    Dir.glob(File.join(config_path, "*.rb")).each do |rb_file|
      target_rb_file = File.join(shared_path, "private", File.basename(rb_file))
      puts "  * copy from: #{rb_file}"
      puts "           to: #{target_rb_file}"
      FileUtils.rm(target_rb_file) if File.exist?(target_rb_file)
      FileUtils.cp(rb_file, target_rb_file)
    end
  end
end

def update_agent(vm_root)
  puts "=" * 50
  puts "try to update vm: #{vm_root}"
  http_path = ""
  shared_path = ""

  Dir.glob(File.join(vm_root, "*")).select do |dir_name|
    http_path = dir_name if dir_name =~ /current$/ or dir_name =~ /mountable_http_server/
    shared_path = dir_name if dir_name =~ /shared$/ or dir_name =~ /share/
  end


  update_mountable(http_path, shared_path)
  puts "=" * 50
  puts ""
end

vms = ["/home/joowing/http"]
Dir.glob("/home/joowing/http/current/app_documents/device_manager/*") do |dir|
  vms << dir if File.directory?(dir) and dir != "." and dir != ".."
end

vms.each { |vm| update_agent(vm) }
