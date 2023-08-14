# ex014: Arrendondar um número

# Função que captura a entrada do usuário para valores float
def input_float(msg)
  loop do
    print msg # Mostra a mensagem passada como argumento
    return Float(gets.chomp) # Pede a entrada do usuário e a retorna
  rescue ArgumentError # Caso o usuário digite um valor inválido (não numérico)
    puts "\e[31mERRO | Valor deve ser um número. Tente novamente\e[0m"
  rescue Interrupt # Caso o usuário interrompa o script
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    g_linha
    exit
  end
end

# Função para arredondar um número
def arredondar(num)
  num.round
end

# Função para mostrar o resultado
def mostrar_resultado(num, num_arredondado)
  linha(50)
  puts " - Número: \e[32m#{num}\e[0m | Número arredondado: \e[33m#{num_arredondado}\e[0m".center(55, ' ')
end

# Função que mostra uma linha de tamanho personalizado
def linha(num)
  puts '-' * num
end

# Função que mostra uma grande linha padronizada
def g_linha
  puts ''.center(85, '=-')
end

# Função para limpar o terminal
def limpar_terminal
  system('clear') || system('cls') || puts("\e[H\e[2J")
end

# Função que pergunta ao usuário se quer ou não encerrar o script
def encerramento
  loop do
    linha(30)
    print 'Deseja continuar? [S/N]: '
    choice = String(gets.chomp).strip.upcase
    linha(30)
    case choice
    when 'S', 'SIM' # Caso o usuário queira continuar
      limpar_terminal
      g_linha
      return true
    when 'N', 'NAO', 'NÃO' # Caso o usuário NÃO queira continuar
      puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
      return false
    else
      puts "\e[31mERRO | Opção inválida! Digite \"S\" para CONTINUAR ou \"N\" para ENCERRAR\e[0m"
    end
  rescue Interrupt # Caso o usuário interrompa o script
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    g_linha
    exit
  end
end

# Código Principal
g_linha
continuar = true # Condição para o while
while continuar
  num = input_float('Digite o número a ser arredondado: ')
  num_a = arredondar(num)
  mostrar_resultado(num, num_a)
  # Encerrar o programa
  continuar = encerramento
end
g_linha
