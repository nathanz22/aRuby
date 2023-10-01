# Dizer o número que antecede e sucessede o valor digitado.

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
  # Pede um número ao usuário
  def self.input_num(msg)
    loop do
      print msg
      n = Integer(gets.chomp)
      return n
    rescue ArgumentError # Caso seja passado um valor inválido
      puts "\e[31mERRO | O valor deve ser inteiro\e[0m"
    rescue Interrupt # Caso o usuário interrompa o script
      INTERRUPCAO.call
    end
  end

  # Mostra resultado
  def self.resultado(num)
    "Número: #{num}\nAntecessor: \033[34m#{num.pred}\e[0m | Sucessor: \033[34m#{num.next}\e[0m"
  end
end

# Programa principal
def main
  continue = true
  while continue
    Numero.linha 50, ' Antecessor e Sucessor de um Número '
    num = Numero.input_num 'Digite um número inteiro: '
    puts Numero.resultado(num)
    continue = Numero.continuar?
  end
  Numero.linha
end

main # Chama o programa principal
