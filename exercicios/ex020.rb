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
      if num > 999_999 || num <= 0
        puts "\e[31mERRO | O número deve ser menor que 1 milhão e maior que zero\e[0m"
        next
      end
      return num
    rescue ArgumentError # Caso o usuário passe um valor inválido
      puts "\e[31mERRO | Valor deve ser um número inteiro\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Retorna um Hash com Unidade, Dezena, Centena e Milhar
  def self.ordem(num)
    ordem = {}
    ### Calcula a centena de milhar
    ordem['Centena de Milhar'] = Integer(num.to_s[-6]) if num >= 100_000

    ### Calcula a dezena de milhar
    ordem['Dezena de Milhar'] = Integer(num.to_s[-5]) if num >= 10_000

    ### Calcula a milhar/unidade de milhar
    if num >= 1_000 && num < 10_000
      ordem['Milhar'] = Integer(num.to_s[-4])
    elsif num >= 10_000
      ordem['Unidade de Milhar'] = Integer(num.to_s[-4])
    end

    ### Calcula a centena
    ordem['Centena'] = Integer(num.to_s[-3]) if num >= 100

    ### Calcula a dezena
    ordem['Dezena'] = Integer(num.to_s[-2]) if num >= 10

    ### Calcula a unidade
    ordem['Unidade'] = Integer(num.to_s[-1]) if num >= 0
    ordem
  end
end

# Código principal
def main
  continue = true
  while continue
    Numero.linha 70, ' Milhar, centena, dezena e unidade de um número '
    num = Numero.input_int 'Digite um número inteiro: '
    ordem = Numero.ordem num
    ordem.each do |k, v|
      puts "\e[34m#{k.to_s.ljust(20, ' ')}\e[0m: \e[32m#{v}\e[0m"
    end
    continue = Numero.continuar?
  end
  Numero.linha
end

main # Chama o código principal
