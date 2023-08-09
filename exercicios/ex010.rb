# Calcular m²

puts ' Exercício 010 '.center(85, '=-')

def input(msg)
  loop do
    print msg
    v = Float(gets.chomp)
  rescue ArgumentError
    puts 'ERRO | Valor inválido!'
  rescue Interrupt
    puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
    puts ''.center(85, '=-')
    exit
  else
    return v
  end
end

lar = input('Largura em metros: ')
puts '-' * 30
alt = input('Altura em metros: ')
puts '-' * 30

mq = lar * alt
mq = mq == Integer(mq) ? mq.to_i : format('%.2f', mq).to_f # Determina se o valor será inteiro ou flutuante.

puts "#{format('%.2f', lar)}m x #{format('%.2f', alt)}m = #{mq}m²"

puts ''.center(85, '=-')
