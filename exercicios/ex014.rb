# Arrendondar um número

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

# Classe que arredondada um número
class ArrendondarNumero < Toolbox
  def initialize
    super
    valor = input_float
    puts "Número: \e[34m#{valor}\e[0m"
    puts "Número arredondado: \e[32m#{valor.round}\e[0m"
  end

  # Função que captura a entrada do usuário para valores float
  def input_float
    loop do
      print 'Valor a ser arredondado: '
      return Float(gets.chomp) # Pede a entrada do usuário e a retorna
    rescue ArgumentError # Caso o usuário digite um valor inválido (não numérico)
      puts "\e[31mERRO | Valor deve ser um número. Tente novamente\e[0m"
    rescue Interrupt # Caso o usuário interrompa o script
      INTERRUPCAO.call
    end
  end
end

# Código principal
def main
  continue = true
  while continue
    ArrendondarNumero.linha 50, ' Arrendondar Número '
    ArrendondarNumero.new # Pede um número e o mostra já arredondado

    # Pergunta ao usuário se ele deseja continuar
    continue = ArrendondarNumero.continuar?
  end
  ArrendondarNumero.linha
end

main # Chama o código principal
