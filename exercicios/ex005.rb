# Mostrar o dobro, triplo e raiz quadrada de um número.

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

# Classe Numero
class Numero < Toolbox
  attr_reader :num, :dobro, :triplo, :raiz_quadrada

  def initialize
    super
    @num = input_num
    @dobro = dobro_num(@num)
    @triplo = triplo_num(@num)
    @raiz_quadrada = raiz_quadrada_num(@num)
  end

  # Pede um número inteiro ao usuário
  def input_num
    loop do
      print 'Digite um número: '
      num = Float(gets.chomp)
      return num
    rescue ArgumentError # Caso o usuário passe um valor inválido
      puts "\e[31mERRO | Valor deve ser um número\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Formata um número de ponto flutuante para duas casas decimais ou inteiro
  def self.format_float(num)
    num == Integer(num) ? num.to_i : format('%.2f', num)
  end

  # Retorna o dobro de um número
  def dobro_num(num)
    num * 2
  end

  # Retorna o triplo de um número
  def triplo_num(num)
    num * 3
  end

  # Retorna a raiz quadrada de um número
  def raiz_quadrada_num(num)
    Math.sqrt num
  end
end

# Código principal
def main
  continue = true
  while continue
    Numero.linha 50, ' Dobro, Triplo e Raiz Quadrada de um Número '
    num = Numero.new

    ### Mostra o resultado
    Numero.linha 22
    puts "#{'Dobro'.ljust(15, ' ')}: \e[34m#{Numero.format_float(num.dobro)}\e[0m"
    puts "#{'Triplo'.ljust(15, ' ')}: \e[34m#{Numero.format_float(num.triplo)}\e[0m"
    puts "#{'Raiz Quadrada'.ljust(15, ' ')}: \e[34m#{Numero.format_float(num.raiz_quadrada)}\e[0m"

    continue = Numero.continuar?
  end
  Numero.linha
end

main # Chama o código principal
