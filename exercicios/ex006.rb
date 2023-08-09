# Ler duas notas de um aluno e mostrar sua média.

puts ' Exercício 006 '.center(85, '=-')

def input(msg)
  loop do
    print msg
    n = Float(gets.chomp)
  rescue ArgumentError
    puts 'ERRO | Valor inválido!'
  rescue Interrupt
    puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
    puts ''.center(85, '=-')
    exit
  else
    return n
  end
end

n1 = input('Digite a primeira nota: ')
n2 = input('Digite a segunda nota: ')

puts "\nNota 1: #{n1} | Nota 2: #{n2}\nMédia: #{(n1 + n2) / 2}"

puts ''.center(85, '=-')
