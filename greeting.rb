def greeting
  @greeting = ARGV.delete_at(0)
  ARGV.each do |arg|
    puts "#{@greeting} #{arg}"
  end
end

greeting
