# Dizer o número que antecede e sucessede o valor digitado.

puts '=' * 85

print 'Digite um número: '
num = Integer(gets.chomp)
puts "\nNúmero: #{num}\nAntecessor: #{num - 1}\nSucessor: #{num + 1}"

puts '=' * 85
