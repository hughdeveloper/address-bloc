def greeting
  @array = ARGV
  @greeting = @array.delete_at(0)
  ARGV.each do |arg|
    puts "#{@greeting}, #{arg}!"
  end
end

greeting
