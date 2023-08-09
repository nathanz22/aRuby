# Ler dois números e dizer a soma entre eles.

puts ' Exercício 003 '.center(85, '=-')

def input(msg)
  loop do
    print msg
    num = Integer(gets.chomp)
  rescue ArgumentError
    puts 'ERRO | O valor deve ser um número inteiro'
  rescue Interrupt
    puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
  else
    return num
  end
end

n1 = input('Digite um número: ')
n2 = input('Digite mais um número: ')

puts "A soma entre #{n1} e #{n2} é #{n1 + n2}"

puts ''.center(85, '=-')
