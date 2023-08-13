# Calcular o aluguel de um carro a partir dos dados seguintes:
# 0.15 por Km rodado | Valor do carro p/ dia = a 60

puts ' Exercício 013 '.center(85, '=-')

# --- Função que captura a entrada do usuário para valores numéricos ---
def input(msg)
  loop do
    print msg
    v = Float(gets.chomp)
  rescue ArgumentError # Caso seja passado um valor inválido
    puts "\e[31mERRO | Valor inválido!\e[0m"
  rescue Interrupt # Caso o usuário interrompa durante o input
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    puts ''.center(85, '=-')
    exit
  else
    if v.negative? # Caso o valor passado seja negativo
      puts "\e[31mERRO | Valor não pode ser negativo\e[0m"
      next
    end
    return v # Retorna o valor passado pelo usuário
  end
end

c = true
while c
  dias = input('Por quantos dias o carro foi alugado? : ') # Quantidade de dias em que o carro foi alugado
  km = input('Foram quantos quilômetros rodados? (Km): ') # Quantidade de km rodados
  valor_dias = dias * 60 # Total a ser pago pelos dias
  km_rodado = km * 0.15 # Total a ser pago pelos Km rodados

  puts
  puts "Valor por Km rodado: \e[33mR$#{format('%.2f', km_rodado)}\e[0m"
  puts "Valor por quantidade de dias: \e[33mR$#{format('%.2f', valor_dias)}\e[0m"
  puts "Valor total: \e[32mR$#{format('%.2f', km_rodado + valor_dias)}\e[0m"

  # --- Encerrar o programa ---
  loop do
    puts '-' * 30
    print 'Deseja encerrar? [S/N]: '
    choice = String(gets.chomp).strip.upcase
    puts '-' * 30
  rescue Interrupt # Caso o usuário interrompa antes de digitar algo
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    puts ''.center(85, '=-')
    exit
  else # Caso o usuário não interrompa
    case choice
    when 'S' # Encerra o programa
      puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
      c = false
      break
    when 'N' # Continua o programa, voltando ao início
      if Gem.win_platform? # Limpa o terminal depois de verificar o sistema operacional do usuário
        system 'cls' # Limpa o terminal (Windows)
      else
        system 'clear' # Limpa o terminal (Outros sistemas operacionais)
      end
      puts ''.center(85, '=-')
      break
    else # Caso o usuário digite algo diferente de "S" ou "N"
      puts "\e[31mERRO | Escolha inválida! Digite \"S\" para SIM, ou \"N\" para NÃO\e[0m"
    end
  end
end

puts ''.center(85, '=-')
