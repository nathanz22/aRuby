# Dizer o número que antecede e sucessede o valor digitado.

# Pede um número ao usuário
def input_num(msg)
  loop do
    print msg
    n = Integer(gets.chomp)
    return n
  rescue ArgumentError # Caso seja passado um valor inválido
    puts "\e[31mERRO | O valor deve ser inteiro\e[0m"
  rescue Interrupt # Caso o usuário interrompa o script
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    print_linha
    exit
  end
end

# Mostra resultado
def mostrar_resultado(num)
  puts "Número: #{num}\nAntecessor: \033[34m#{num - 1}\e[0m | Sucessor: \033[34m#{num + 1}\e[0m"
end

# Imprime uma linha de tamanho personalizado
def print_linha(width = 50)
  puts ''.center(width, '=-')
end

# Função que limpa o terminal
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
    when 'S', 'SIM' # Caso o usuário escolha SIM
      limpar_terminal
      return true
    when 'N', 'NÃO', 'NAO' # Caso o usuário escolha NÃO
      puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
      print_linha
      return false
    else # Caso o usuário digite algo INVÁLIDO
      puts "\e[31mERRO | Opção inválida! Digite \"S\" para SIM ou \"N\" para NÃO\e[0m"
    end
  rescue Interrupt # Caso o usuário interrompa durante a escolha
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    print_linha
    exit # Encerra o script
  end
end

# Programa principal
def main
  continuar = true
  while continuar
    print_linha
    num = input_num 'Digite um número inteiro: '
    mostrar_resultado(num)
    continuar = continue
  end
end

main # Chama o programa principal
