# Conversor de Escalas Termométricas

# Caixa de Ferramentas
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

# Conversor
class Conversor < Toolbox
  # Celsius para Fahrenheit
  def self.c_to_f(celsius)
    celsius * 9 / 5.0 + 32
  end

  # Fahrenheit para Celsius
  def self.f_to_c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end

  # Kelvin para Celsius
  def self.k_to_c(kelvin)
    kelvin - 273.15
  end

  # Celsius para Kelvin
  def self.c_to_k(celsius)
    celsius + 273.15
  end

  # Kelvin para Fahrenheit
  def self.k_to_f(kelvin)
    c_to_f(k_to_c(kelvin))
  end

  # Fahrenheit para Kelvin
  def self.f_to_k(fahrenheit)
    c_to_k(f_to_c(fahrenheit))
  end

  # Método para capturar escala a ser convertida
  def self.input_escala
    loop do
      print 'Qual a escala do valor a ser convertido? [C, F, K]: '
      choice = String(gets.chomp).strip.upcase
    rescue Interrupt # Caso o usuário encerre o programa durante a escolha
      INTERRUPCAO.call
    else
      if choice != 'C' && choice != 'F' && choice != 'K'
        puts "\e[31mERRO | Escola inválida! Digite apenas a inicial da escala (C, F ou K)\e[0m"
        next
      end
      return choice
    end
  end

  # Função para obter o valor a ser convertido
  def self.input_valor(msg)
    loop do
      print msg
      valor = Float(gets.chomp)
      return valor
    rescue ArgumentError # Caso o valor não seja válido
      puts "\e[31mERRO | Valor deve ser numérico\e[0m"
    rescue Interrupt # Caso o usuário encerre o programa durante a escolha
      INTERRUPCAO.call
    end
  end
end

# Formata valores numéricos
def formatar(valor)
  valor.to_i == valor ? valor.to_i : Float(format('%.2f', valor))
end

# Código principal
def main
  continue = true
  while continue
    Conversor.linha 60, ' Conversor de Escala Termométrica '

    # Pede ao usuário a escala do valor que vai ser convertido
    escala = Conversor.input_escala

    # Pede ao usuário o valor a ser convertido
    valor = Conversor.input_valor ' - Valor a ser convertido: '

    # Identifica a escala escolhida pelo usuário e mostra as conversões
    case escala
    when 'C'
      fahrenheit = Conversor.c_to_f valor
      kelvin = Conversor.c_to_k valor

      puts "Celsius: \t\e[34m#{formatar(valor)} °C\e[0m"
      puts "Fahrenheit: \t\e[32m#{formatar(fahrenheit)} °F\e[0m"
      puts "Kelvin: \t\e[32m#{formatar(kelvin)} K\e[0m"
    when 'F'
      celsius = Conversor.f_to_c valor
      kelvin = Conversor.f_to_k valor

      puts "Fahrenheit: \t\e[34m#{formatar(valor)} °F\e[0m"
      puts "Celsius: \t\e[32m#{formatar(celsius)} °C\e[0m"
      puts "Kelvin: \t\e[32m#{formatar(kelvin)} K\e[0m"
    when 'K'
      celsius = Conversor.k_to_c valor
      fahrenheit = Conversor.k_to_f valor

      puts "Kelvin: \t\e[34m#{formatar(valor)} K\e[0m"
      puts "Celsius: \t\e[32m#{formatar(celsius)} °C\e[0m"
      puts "Fahrenheit: \t\e[32m#{formatar(fahrenheit)} °F\e[0m"
    end

    # Pergunta ao usuário se ele desaja continuar
    continue = Conversor.continuar?
  end
  Conversor.linha 60
end

main # Chama o código principal
