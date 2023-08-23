# Ler dois números e dizer a soma entre eles.

# Pede um número ao usuário
def input_num(msg)
  loop do
    print msg
    num = Integer(gets.chomp)
  rescue ArgumentError
    puts "\e[31mERRO | O valor deve ser um número inteiro\e[0m"
  rescue Interrupt
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    print_linha
    exit
  else
    return num
  end
end

# Função que imprime uma linha personalizada
def print_linha(width = 50)
  puts ''.center(width, '=-')
end

# Função para limpar o terminal
def limpar_terminal
  system('clear') || system('cls') || puts("\e[H\e[2J")
end

# Função para encerrar o programa
def continue
  loop do
    puts '-' * 30
    print 'Deseja continuar? [S/N]: '
    choice = String(gets.chomp).strip.upcase
    puts '-' * 30
    case choice
    when 'S', 'SIM'
      limpar_terminal
      return true
    when 'N', 'NÃO', 'NAO'
      puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
      print_linha
      return false
    else
      puts "\e[31mERRO | Opção inválida! Digite \"S\" para SIM ou \"N\" para NÃO\e[0m"
    end
  rescue Interrupt
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    print_linha
    exit
  end
end

# Programa principal
def main
  continuar = true
  while continuar
    print_linha
    n1 = input_num 'Digite um número: '
    n2 = input_num 'Digite mais um número: '

    puts "A soma entre #{n1} e #{n2} é #{n1 + n2}"
    continuar = continue
  end
end

main # Chama o programa principal
