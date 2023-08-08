# Tabuada de um número

puts '=' * 85

print 'Digite um número: '
num = Integer(gets.chomp)

tabuada = proc { |c| puts "| #{num} x #{format('%2d', c + 1)} = #{format('%2d', num * (c + 1))} |" }

10.times(&tabuada)

puts '=' * 85
