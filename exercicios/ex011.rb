# Aumento e desconto em porcentagem.

puts ' Exercício 011 '.center(85, '=-')

def input(msg, i_or_f)
  loop do
    print msg
    case i_or_f.upcase
    when 'I'
      v = Integer(gets.chomp)
    when 'F'
      v = Float(gets.chomp)
    end
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

def a_or_d
  loop do
    print 'Aumento ou desconto? [A/D]: '
    choice = String(gets.chomp).strip.upcase
    if choice != 'A' && choice != 'D'
      puts 'ERRO | Opção inválida! Digite "A" ou "D"'
      next
    end
  rescue Interrupt
    puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
    puts ''.center(85, '=-')
    exit
  else
    return choice
  end
end

choice = a_or_d

case choice
when 'A'
  v = input('Valor: R$', 'f')
  va = input('Valor para aumento (%): ', 'I')

  a1 = v * va / 100
  a2 = v + a1
  puts "\n - Valor: R$#{format('%.2f', v)} | Aumento: #{va}%\n - O valor já com o aumento é R$#{format('%.2f', a2)}"
when 'D'
  v = input('Valor: R$', 'F')
  vd = input('Valor para desconto (%): ', 'I')

  d1 = v * vd / 100
  d2 = v - d1
  puts "\n - Valor: R$#{format('%.2f', v)} | Desconto: #{vd}%\n - O valor já com o desconto é R$#{format('%.2f', d2)}"
else
  puts 'ERRO | Opção digitada é INVÁLIDA!'
end

puts ''.center(85, '=-')
