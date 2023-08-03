# Mostrar o dobro, triplo e raiz quadrada de um número.

puts '=' * 85

print 'Digite um número: '
num = Integer(gets.chomp)
rq = format('%.2f', num**0.5).to_f # Formata o número para 2 casas flutuantes
rq = rq.to_i if rq == rq.to_i # Torna o número inteiro caso as duas casas decimais sejam '00'
puts "\nNúmero: #{num}\nDobro: #{num * 2}\nTriplo: #{num * 3}\nRaiz Quadrada: #{rq}"

puts '=' * 85
