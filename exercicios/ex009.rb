# Conversor de moeda: real para dólar e euro

# Caixa de ferramentas
class Toolbox
  # Bloco a ser chamado quando o usuário interromper o script
  @interrupcao = proc do
    puts "\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
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
      @interrupcao.call
    end
  end
end

# Classe Conversor
class Conversor < Toolbox
  # Pede um valor monetário ao usuário
  def self.input_valor(msg)
    loop do
      print msg
      valor = Float(gets.chomp)
      return valor
    rescue ArgumentError # Caso o usuário digite um valor inválido
      puts "\e[31mERRO | Digite um valor monetário válido\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      @interrupcao.call
    end
  end

  # Converte para dólar
  def self.dolar(valor)
    valor * 0.2025
  end

  # Converte para Euro
  def self.euro(valor)
    valor * 0.1876
  end
end

# Código principal
def main
  continue = true
  while continue
    Conversor.linha(50, ' Conversor Monetário ')
    valor = Conversor.input_valor 'Valor a ser convertido: R$'
    dolar = Conversor.dolar valor
    euro = Conversor.euro valor

    puts "Valor: R$#{format('%.2f', valor)} | Dólar: $#{format('%.2f', dolar)} | Euro: €#{format('%.2f', euro)}"
    continue = Conversor.continuar?
    Conversor.linha
  end
end

main # Chama o código principal
