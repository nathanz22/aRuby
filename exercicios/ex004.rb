# Dizer o número que antecede e sucessede o valor digitado.

puts ' Exercício 004 '.center(85, '=-')

loop do
  print 'Digite um número: '
  num = Integer(gets.chomp)
rescue ArgumentError
  puts 'ERRO | O valor deve ser um número inteiro'
rescue Interrupt
  puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
  puts ''.center(85, '=-')
  exit
else
  puts "\nNúmero: #{num} | Antecessor: #{num - 1} | Sucessor: #{num + 1}"
  break
end

puts ''.center(85, '=-')
