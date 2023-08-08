# Calcular m²

puts ' Exercício 010 '.center(85, '=-')

print 'Largura em metros: '
lar = Float(gets.chomp)

print 'Altura em metros: '
alt = Float(gets.chomp)

mq = lar * alt

mq = mq == Integer(mq) ? mq.to_i : format('%.2f', mq).to_f # Determina se o valor será inteiro ou flutuante.

puts "#{format('%.2f', lar)}m x #{format('%.2f', alt)}m = #{mq}m²"

puts ''.center(85, '=-')
