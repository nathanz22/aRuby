# Conversor de metro para centímetro e milímetro.

puts ' Exercício 007 '.center(85, '=-')

print 'Digite um valor em METRO: '
m = Float(gets.chomp)

puts "\nMetro: #{m} | Centímetro: #{m * 100} | Milímetro: #{m * 1000}"

puts ''.center(85, '=-')
