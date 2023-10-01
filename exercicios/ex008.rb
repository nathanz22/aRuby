# Tabuada de um número

# Caixa de ferramentas
class Toolbox
  # Quando o usuário interromper o script
  INTERRUPCAO = proc do
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    linha
    exit # Encerra o script
  end

  private_constant :INTERRUPCAO

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
      INTERRUPCAO.call
    end
  end
end

# Classa Tabuada
class Tabuada < Toolbox
  # Pede um número ao usuário
  def self.input_int(msg)
    loop do
      print msg
      n = Integer(gets.chomp)
      return n
    rescue ArgumentError # Caso seja passado um valor inválido
      puts "\e[031mERRO | Digite um número INTEIRO\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Calcula a tabuada de um número
  def self.print_tabuada(num)
    t = proc { |c| puts "| #{num} x #{format('%2d', c + 1)} = #{format('%2d', num * (c + 1))} |"}
    10.times(&t)
  end
end

# Código principal
def main
  continue = true
  while continue
    Tabuada.linha 50, ' Tabuada de um Número '
    num = Tabuada.input_int 'Digite um número: '
    Tabuada.print_tabuada num

    continue = Tabuada.continuar?
  end
  Tabuada.linha
end

main # Chama o código principal
