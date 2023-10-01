# Calcular m²

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

# Classe MatrosQuadrados
class MetrosQuadrados < Toolbox
  # Pede um valor numérico ao usuário
  def self.input_num(msg)
    loop do
      print msg
      v = Float(gets.chomp)
      if v.negative? || v.zero?
        puts "\e[031mERRO | Valor deve ser maior que zero\e[0m"
        next
      end
      return v
    rescue ArgumentError # Caso seja passado um valor inválido
      puts "\e[31mERRO | Valor deve ser numérico maior que zero\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Calcula o m²
  def self.metro_quadrado(largura, altura)
    largura * altura
  end

  # Formata as casas decimais
  def self.formatar(num)
    num == num.to_i ? num.to_i : Float(format('%.2f', num))
  end
end

# Código principal
def main
  continue = true
  while continue
    MetrosQuadrados.linha 50, ' Calculadora de m² '
    largura = MetrosQuadrados.input_num 'Digite a largura em metros: '
    altura = MetrosQuadrados.input_num 'Digite a altura em metros: '
    m2 = MetrosQuadrados.metro_quadrado largura, altura

    puts "\n#{MetrosQuadrados.formatar largura}m x #{MetrosQuadrados.formatar altura}m = #{MetrosQuadrados.formatar m2}"

    continue = MetrosQuadrados.continuar?
  end
  MetrosQuadrados.linha
end

main # Chama o código principal
