# Informar a unidade, dezena, centena e milhar de um número inteiro

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
  # Pede um número inteiro ao usuário
  def self.input_int(msg)
    loop do
      print msg
      num = Integer(gets.chomp)
      return num
    rescue ArgumentError # Caso o usuário passe um valor inválido
      puts "\e[31mERRO | Valor deve ser um número inteiro\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Retorna a unidade de um número
  def self.unidade(num)
    Integer(num.to_s[-1]) if num >= 0
  end

  # Retorna a dezena de um número
  def self.dezena(num)
    Integer(num.to_s[-2]) if num >= 10
  end

  # Retorna a centena de um número
  def self.centena(num)
    Integer(num.to_s[-3]) if num >= 100
  end

  # Retorna a milhar de um número
  def self.milhar(num)
    if String(num).length >= 4 && num < 1_000_000
      remover = "#{centena(num)}#{dezena(num)}#{unidade(num)}"
      String(num).sub(remover, '').to_i
    end
  end
end

# Código principal
def main
  continue = true
  while continue
    Numero.linha 70, ' Milhar, centena, dezena e unidade de um número '
    num = Numero.input_int 'Digite um número inteiro: '
    milhar = Numero.milhar num
    centena = Numero.centena num
    dezena = Numero.dezena num
    unidade = Numero.unidade num
    puts "Milhar: \t#{milhar}" if milhar
    puts "Centena: \t#{centena}" if centena
    puts "Dezena: \t#{dezena}" if dezena
    puts "Unidade: \t#{unidade}" if unidade
    continue = Numero.continuar?
  end
  Numero.linha
end

main # Chama o código principal
