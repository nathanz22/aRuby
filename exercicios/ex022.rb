# Mostrar a quantidade de vogais existentes dentro de um texto

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

# Classe que verifica a quantidade de vogais em um texto
class QuantidadeVogais < Toolbox
  def initialize
    super
    @txt = input_texto 'Digite o texto: '
    vogais = contador_vogais @txt
    if vogais.zero?
      puts ' - Não existe nenhuma vogal no texto.'
    elsif vogais == 1
      puts " - No texto existe \e[32m#{vogal}\e[0m vogal."
    else
      puts " - No texto existe \e[32m#{vogais}\e[0m vogais."
    end
  end

  # Pede um texto ao usuário
  def input_texto(msg)
    loop do
      print msg
      txt = String(gets.chomp).strip
      return txt
    rescue Interrupt # Caso o usuário interrompa o script
      INTERRUPCAO.call
    end
  end

  # Conta a quantidade de vogais no texto
  def contador_vogais(texto)
    c = 0 # Conta a quantidade de vogais
    regexp = /[aeiouáéíóúâêîôûãõ]/i
    texto.length.times do |pos|
      c += 1 if texto[pos] =~ regexp
    end
    c
  end
end

# Código principal
def main
  continue = true
  while continue
    QuantidadeVogais.linha 50, ' Contador de Vogais '
    QuantidadeVogais.new

    continue = QuantidadeVogais.continuar?
  end
  QuantidadeVogais.linha
end

main # Chama o código principal
