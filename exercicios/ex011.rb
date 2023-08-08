# Aumento e desconto em porcentagem.

puts ' Exercício 011 '.center(85, '=-')

print 'Aumento ou desconto? [A/D]: '
choice = String(gets.chomp).strip.upcase

case choice
when 'A'
  print 'Valor: R$'
  v = Float(gets.chomp)

  print 'Valor para aumento (%): '
  va = Integer(gets.chomp)

  a1 = v * va / 100
  a2 = v + a1
  puts "\n - Valor: R$#{format('%.2f', v)} | Aumento: #{va}%\n - O valor já com o aumento é R$#{format('%.2f', a2)}"
when 'D'
  print 'Valor: R$'
  v = Float(gets.chomp)

  print 'Valor para desconto (%): '
  vd = Integer(gets.chomp)

  d1 = v * vd / 100
  d2 = v - d1
  puts "\n - Valor: R$#{format('%.2f', v)} | Desconto: #{vd}%\n - O valor já com o desconto é R$#{format('%.2f', d2)}"
else
  puts 'ERRO | Opção digitada é INVÁLIDA!'
end

puts ''.center(85, '=-')
