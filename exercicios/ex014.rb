puts ' Exercício 014 '.center(85, '=-')

# ----- Função que captura a entrada do usuário para valores float ----- #
def input(msg)
  loop do
    print msg # Mostra a mensagem passada como argumento
    num = Float(gets.chomp) # Pede a entrada do usuário
  rescue ArgumentError # Caso o usuário digite um valor inválido (não numérico)
    puts "\e[31mERRO | Valor deve ser um número de real (ponto flutuante)\e[0m"
  rescue Interrupt # Caso o usuário interrompa o script
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    puts ''.center(85, '=-')
    exit
  else # Caso o valor passado seja válido
    return num # Retorna o valor passado pelo usuário
  end
end

def linha(num)
  # Mostra uma linha
  puts '-' * num
end

# ----- Função que pergunta ao usuário se quer ou não encerrar o script ----- #
def encerramento
  loop do
    linha(30)
    print 'Deseja encerrar? [S/N]: '
    choice = String(gets.chomp).strip.upcase
    linha(30)
  rescue Interrupt # Caso o usuário interrompa o script
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    puts ''.center(85, '=-')
    exit
  else
    case choice
    when 'S' # Retorna falso caso o usuário queira encerrar
      puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
      return false
    when 'N' # Retorna verdadeiro caso o usuário não queira encerrar
      # --- Limpa o terminal depois de veriricar o sistema operacional do usuário --- #
      if Gem.win_platform?
        system 'cls' # Limpa o terminal (Windows)
      else
        system 'clear' # Limpa o terminal (Outros sistemas operacionais)
      end
      puts ''.center(85, '=-')
      return true
    else
      puts "\e[31mERRO | Opção inválida! Digite \"S\" para SIM ou \"N\" para NÃO\e[0m"
    end
  end
end

# ----- Arredonda um número ----- #
def arredondador(num)
  num.round
end

# ----- Código Principal ----- #
c = true # Condição para o while
while c
  num = input('Digite o número a ser arredondado: ')
  num_a = arredondador(num)

  linha(50)
  puts " - Número: \e[32m#{num}\e[0m | Número arredondado: \e[33m#{num_a}\e[0m".center(55, ' ')

  # --- Encerrar o programa --- #
  c = encerramento
end

puts ''.center(85, '=-')
