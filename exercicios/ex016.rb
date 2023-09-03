# Dizer o valor do seno, cosseno e tangente a partir do ângulo escolhido (30°, 45° e 60°)

# Classe Trigonometria
class Trigonometria
  # Bloco a ser chamado em caso de interrupção do usuário
  @interrupcao = proc do
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    linha
    exit # Força o encerramento do script
  end

  # Pede o valor do ângulo para o usuário
  def self.input_angle(msg)
    loop do
      print msg
      angle = Integer(gets.chomp)
      return angle
    rescue ArgumentError # Caso seja passado um valor inválido
      puts "\e[31mERRO | Digite o valor de um ângulo válido\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      @interrupcao.call
    end
  end

  # Calcula o seno
  def self.seno(angle)
    Math.sin(angle * Math::PI / 180)
  end

  # Calcula o cosseno
  def self.cosseno(angle)
    Math.cos(angle * Math::PI / 180)
  end

  # Calcula a tangente
  def self.tangente(angle)
    Math.tan(angle * Math::PI / 180)
  end

  # Formata as casas decimais de um número
  def self.format_float(num)
    num == Integer(num) ? Integer(num) : Float(format('%.4f', num))
  end

  # Imprime uma linha personalizada
  def self.linha(lenght = 50)
    # Tamanho padrão é 50 caracteres
    puts ''.center(lenght, '=-')
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
      @interrupcao.call
    end
  end
end

# Código principal
def main
  continue = true # Condição para a continuação do script
  while continue
    Trigonometria.linha
    angulo = Trigonometria.input_angle 'Digite o valor do ângulo em graus: '
    sen = Trigonometria.seno angulo
    cos = Trigonometria.cosseno angulo
    tan = Trigonometria.tangente angulo
    Trigonometria.linha 30
    puts "Ângulo: #{angulo}°"
    puts "Seno: \e[34m#{Trigonometria.format_float(sen)}\e[0m"
    puts "Cosseno: \e[34m#{Trigonometria.format_float(cos)}\e[0m"
    puts "Tangente: \e[34m#{Trigonometria.format_float(tan)}\e[0m"
    continue = Trigonometria.continuar?
  end
  Trigonometria.linha
end

main # Chama o código principal
