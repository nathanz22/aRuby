# Ler duas notas de um aluno e mostrar sua média.

puts ' Exercício 006 '.center(85, '=-')

print 'Digite a primeira nota: '
n1 = Float(gets.chomp)
print 'Digite a segunda nota: '
n2 = Float(gets.chomp)

puts "\nNota 1: #{n1} | Nota 2: #{n2}\nMédia: #{(n1 + n2) / 2}"

puts ''.center(85, '=-')
