# Conversor de metro para centímetro e milímetro.

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

# Classe Conversor
class Conversor < Toolbox
  # Método que pede um valor para o usuário
  def self.input_valor(msg)
    loop do
      print msg
      v = Float(gets.chomp)
      if v.negative?
        puts "\e[031mERRO | Valor deve ser positivo\e[0m"
        next
      end
      return v
    rescue ArgumentError # Caso o usuário passe um valor inválido
      puts "\e[31mERRO | O valor deve ser numérico\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Converte para centímetros
  def self.centimetro(metros)
    metros * 100
  end

  # Converte para milímetros
  def self.milimetro(metros)
    metros * 1000
  end
end

# Código principal
def main
  continue = true
  while continue
    Conversor.linha 70, ' Conversor de Metro para Centímetro e Milímetro '
    valor_metro = Conversor.input_valor 'Digite um valor em METRO: '
    centimetro = Conversor.centimetro valor_metro
    milimetro = Conversor.milimetro valor_metro

    # Mostra resultado
    puts "\nMetro: \e[34m#{format('%.2f', valor_metro)}\e[0m"
    puts "Centímetros: \e[32m#{format('%.2f', centimetro)}\e[0m"
    puts "Milímetros: \e[32m#{format('%.2f', milimetro)}\e[0m"

    continue = Conversor.continuar?
  end
  Conversor.linha 70
end

main # Chama o código principal
