# Ler o nome de uma pessoa e mostrar uma mensagem de boas-vindas.

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

# Classe de boas vindas
class BoasVindas < Toolbox
  def initialize
    super
    @nome = input_nome
  end

  # Pede o nome do usuário
  def input_nome
    loop do
      print 'Digite seu nome: '
      nome = String(gets.chomp).strip
      nome = name_capitalize(nome)
      return nome unless nome.empty?

      puts "\e[31mERRO | Por favor, digite um nome válido\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Capitaliza o nome do usuário
  def name_capitalize(nome)
    nome = nome.split.map { |n| n.strip.capitalize }
    nome.join ' '
  end

  # Imprime uma mensagem de boas-vindas
  def boas_vindas
    puts "Olá, #{@nome}, seja bem-vindo(a)!"
  end
end

# Programa Principal
def main
  continue = true
  while continue
    BoasVindas.linha 50, ' Boas-Vindas! '
    obj = BoasVindas.new
    obj.boas_vindas
    continue = BoasVindas.continuar?
  end
  BoasVindas.linha
end

main # Chama o programa principal
