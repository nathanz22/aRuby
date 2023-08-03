# Tabuada de um número

puts '=' * 85

print 'Digite um número: '
num = Integer(gets.chomp)

10.times do |c|
  puts "| #{num} x #{format('%2d', c + 1)} = #{format('%2d', num * (c + 1))} |"
end

puts '=' * 85
