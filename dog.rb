class Dog
end

class Error1 < Exception
end

class Error2 < Exception
end

tag = true
while(true) do
  begin
    e = (tag ? Error1.new : Error2.new)
    tag = !tag
    raise e
  rescue Error1, Error2
    puts $!.to_s
  end

end
