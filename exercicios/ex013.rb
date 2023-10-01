# Calcular o aluguel de um carro a partir dos dados seguintes:
# 0.15 por Km rodado | Valor do carro p/ dia = a 60

# Caixa de ferramentas
class Toolbox
  # Quando o usuário interromper o script
  def self.interrupcao
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    linha
    exit # Encerra o script
  end

  # Imprime uma linha personalizada
  def self.linha(lenght = 50, msg = '')
    puts msg.center(lenght, '=-')
  end

  # Limpa o terminal
  def self.limpar_terminal
    system('clear') || system('cls') || puts("\e[H\e[2J")
  end

  # Pergunta ao usuário se ele quer ou não continuar
  def self.continuar?
    loop do
      linha 30
      print 'Deseja continuar? [S/N]: '
      choice = String(gets.chomp).strip.upcase
      linha 30
      case choice
      when 'S', 'SIM' # Caso o usuário escolha continuar
        limpar_terminal
        return true
      when 'N', 'NÃO', 'NAO' # Caso o usuário escolha encerrar
        puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
        return false
      else # Caso o usuário tenha digitado alguma opção inválida
        puts "\e[31mERRO | Opção inválida! Digite \"S\" para SIM ou \"N\" para NÃO\e[0m"
      end
    rescue Interrupt # Caso o usuário force a interrupção do script
      interrupcao
    end
  end
end

# Função que captura a entrada do usuário para valores numéricos
def input_valor(msg)
  loop do
    print msg
    v = Float(gets.chomp)
  rescue ArgumentError # Caso seja passado um valor inválido
    puts "\e[31mERRO | Valor deve ser um número\e[0m"
  rescue Interrupt # Caso o usuário interrompa durante o input
    Toolbox.interrupcao
  else
    if v.negative? # Caso o valor passado seja negativo
      puts "\e[31mERRO | Valor não pode ser negativo\e[0m"
      next
    end
    return v # Retorna o valor passado pelo usuário
  end
end

# Código principal
def main
  continue = true
  while continue
    Toolbox.linha 50, ' Calcular Aluguel de Carro '
    dias = input_valor 'Por quantos dias o carro foi alugado? : '
    km = input_valor 'Foram quantos quilômetros rodados? (Km): '
    valor_dias = dias * 60 # Total a ser pago pelos dias
    km_rodado = km * 0.15 # Total a ser pago pelos quilômetros rodados

    puts "Valor por Km rodado: \t\t\e[33mR$#{format('%.2f', km_rodado)}\e[0m"
    puts "Valor por quantidade de dias: \t\e[33mR$#{format('%.2f', valor_dias)}\e[0m"
    puts "Valor total: \e[32mR$#{format('%.2f', km_rodado + valor_dias)}\e[0m"

    # Pergunta ao usuário se ele deseja continuar
    continue = Toolbox.continuar?
  end
  Toolbox.linha
end

main # Chama o código principal
