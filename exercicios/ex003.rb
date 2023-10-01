# Ler dois números e dizer a soma entre eles.

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

# Classe Soma
class Soma < Toolbox
  attr_reader :num, :soma

  def initialize
    super
    @num = [input_num('Digite um número: '), input_num('Digite um segundo número: ')]
    @soma = @num[0] + @num[1]
  end

  # Pede um número ao usuário
  def input_num(msg)
    loop do
      print msg
      num = Integer(gets.chomp)
      return num
    rescue ArgumentError # Caso o usuário digite um valor inválido
      puts "\e[31mERRO | O valor deve ser um número inteiro\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end
end

# Programa principal
def main
  continue = true
  while continue
    Soma.linha 50, ' Somar Dois Números Inteiros '
    num = Soma.new
    puts " - A soma entre \e[34m#{num.num[0]}\e[0m e \e[34m#{num.num[1]}\e[0m é \e[32m#{num.soma}\e[0m"
    continue = Soma.continuar?
  end
  Soma.linha
end

main # Chama o programa principal
