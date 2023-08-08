# Dizer o número que antecede e sucessede o valor digitado.

puts ' Exercício 004 '.center(85, '=-')

print 'Digite um número: '
num = Integer(gets.chomp)
puts "\nNúmero: #{num}\nAntecessor: #{num - 1}\nSucessor: #{num + 1}"

puts ''.center(85, '=-')
