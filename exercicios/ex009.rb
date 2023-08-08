# Conversor de moeda: real para dólar e euro

puts ' Exercício 009 '.center(85, '=-')

print 'Qual o valor a ser convertido? : '
v = Float(gets.chomp)
d = v * 4.8997
e = v * 5.3674

puts " - Valor: R$#{format('%.2f', v)}"
puts " - Em dólar: $ #{format('%.2f', d)}\n - Em euro: € #{format('%.2f', e)}"

puts ''.center(85, '=-')
