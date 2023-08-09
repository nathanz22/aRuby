# Tabuada de um número

puts ' Exercício 008 '.center(85, '=-')

loop do
  print 'Digite um número: '
  num = Integer(gets.chomp)
rescue ArgumentError
  puts 'ERRO | Valor deve ser um número inteiro'
rescue Interrupt
  puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
  puts ''.center(85, '=-')
  exit
else
  tabuada = proc { |c| puts "| #{num} x #{format('%2d', c + 1)} = #{format('%2d', num * (c + 1))} |" }
  10.times(&tabuada)
  break
end

puts ''.center(85, '=-')
