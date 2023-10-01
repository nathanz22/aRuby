# Aumento e desconto em porcentagem.

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

# Classe AumentoDesconto
class AumentoDesconto < Toolbox
  # Pede ao usuário o valor do aumento/desconto e porcentagem
  def self.input_num(msg, integer_or_float)
    loop do
      print msg
      case integer_or_float.strip.upcase
      when 'I' then v = Integer(gets.chomp)
      when 'F' then v = Float(gets.chomp)
      end
      return v
    rescue ArgumentError # Caso seja passado um valor inválido
      if integer_or_float.upcase == 'I'
        puts "\e[31mERRO | Valor deve ser um número inteiro\e[0m"
      else
        puts "\e[31mERRO | Valor deve ser um número\e[0m"
      end
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Escolha de aumento ou desconto
  def self.aumento_ou_desconto
    loop do
      print 'Aumento ou desconto? [A/D]: '
      choice = String(gets.chomp).strip.upcase
      if choice != 'A' && choice != 'D'
        puts "\e[31mERRO | Opção inválida! Digite \"A\" ou \"D\"\e[0m"
        next
      end
      return choice
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end
end

# Código principal
def main
  continue = true
  while continue
    AumentoDesconto.linha 50, ' Aumento e Desconto '
    choice = AumentoDesconto.aumento_ou_desconto
    valor = AumentoDesconto.input_num 'Valor: R$', 'f'
    case choice
    when 'A'
      porcentagem_aumento = AumentoDesconto.input_num 'Valor para aumento (%): ', 'i'
      aumento = valor * porcentagem_aumento / 100
      novo_valor = valor + aumento

      puts "\n - Valor: \e[34mR$#{format('%.2f', valor)}\e[0m | Aumento: \e[34m#{porcentagem_aumento}%\e[0m"
      puts " - O valor já com aumento é \e[32mR$#{format('%.2f', novo_valor)}\e[0m"
    when 'D'
      porcentagem_desconto = AumentoDesconto.input_num 'Valor para desconto (%): ', 'i'
      desconto = valor * porcentagem_desconto / 100
      novo_valor = valor - desconto

      puts "\n - Valor: \e[34mR$#{format('%.2f', valor)}\e[0m | Desconto: \e[34m#{porcentagem_desconto}%\e[0m"
      puts " - O valor já com desconto é \e[32mR$#{format('%.2f', novo_valor)}\e[0m"
    else
      puts "\e[31mERRO | Opção digitada é INVÁLIDA!\e[0m"
    end

    continue = AumentoDesconto.continuar?
  end
  AumentoDesconto.linha
end

main # Chama o código principal
