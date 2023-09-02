# Calcular hipotenusa a partir do valor de dois catetos

# Classe Hipotenusa
class Hipotenusa
  @interrupcao = proc do
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper.\e[0m"
    linha
    exit # Encerra o script neste ponto
  end

  def self.input_cateto(msg)
    loop do
      print msg
      cateto = Float(gets.chomp)
      return cateto
    rescue ArgumentError # Caso seja passado um valor inválido
      puts "\e[31mERRO | O valor deve ser de ponto flutuante (número real)\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      @interrupcao.call
    end
  end

  # Calcula a hipotenusa
  def self.calc_hipotenusa(cateto_oposto, cateto_adjacente)
    (cateto_oposto**2 + cateto_adjacente**2)**0.5
  end

  # Mostra o valor da hipotenusa
  def self.mostrar_resultado(hipotenusa)
    puts " - A hipotenusa é igual a \e[34m#{format('%.2f', hipotenusa)}\e[0m"
  end

  # Imprime uma linha personalizada (50 é o tamanho padrão)
  def self.linha(lenght = 50)
    puts ''.center(lenght, '=-')
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

  # Em caso de interrupção do usuário
end

# Código principal
def main
  continue = true
  while continue
    Hipotenusa.linha
    c1 = Hipotenusa.input_cateto 'Digite o valor do cateto oposto: ' # Primeiro cateto
    c2 = Hipotenusa.input_cateto 'Digite o valor do cateto adjascente: ' # Segundo cateto
    hipotenusa = Hipotenusa.calc_hipotenusa(c1, c2) # Hipotenusa
    Hipotenusa.mostrar_resultado(hipotenusa) # Mostra a hipotenusa
    continue = Hipotenusa.continuar?
  end
  Hipotenusa.linha
end

main # Chama o código principal
