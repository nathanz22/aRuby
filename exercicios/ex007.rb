# Conversor de metro para centímetro e milímetro.

puts ' Exercício 007 '.center(85, '=-')

loop do
  print 'Digite um valor em METRO: '
  m = Float(gets.chomp)
rescue ArgumentError
  puts 'ERRO | Valor inválido!'
rescue Interrupt
  puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
  puts ''.center(85, '=-')
  exit
else
  puts "\nMetro: #{m} | Centímetro: #{m * 100} | Milímetro: #{m * 1000}"
end

puts ''.center(85, '=-')
