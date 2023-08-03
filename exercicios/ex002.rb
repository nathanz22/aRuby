# Ler o nome de uma pessoa e mostrar uma mensagem de boas-vindas.

puts '=' * 85

print 'Qual o seu nome? : '
nome = gets.chomp.strip.capitalize
puts "Olá, #{nome}, seja bem-vindo(a)!"

puts '=' * 85
