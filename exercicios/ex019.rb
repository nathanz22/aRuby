# Ao receber um nome completo, mostrar a quantidade de letras e o primeiro nome

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

# Classe Nome
class Nome < Toolbox
  def initialize
    super
    @nome = capitalize_name(input_nome)
    info_nome
  end

  # Pede o nome completo do usuário
  def input_nome
    loop do
      print 'Digite seu nome completo: '
      nome = String(gets.chomp).strip
      return nome if nome.split.count > 1

      puts "\e[031mERRO | O nome precisa conter no mínimo o sobrenome\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Torna a primeira letra de cada nome maiúscula
  def capitalize_name(nome)
    nome = nome.split
    nome.map!(&:capitalize)
    nome.join ' '
  end

  # Mostra informações sobre o nome
  def info_nome
    puts " - Nome: \e[034m#{@nome}\e[0m"
    puts " - Quantidade de letras: \e[032m#{@nome.gsub(' ', '').length}\e[0m"
    ### Conta os caracteres sem contar os espaços em branco
    puts " - Primeiro nome: \e[032m#{@nome.split[0]}\e[0m"
  end
end

# Código principal
def main
  continue = true
  while continue
    Nome.linha 50, ' Informações sobre um nome '
    Nome.new

    # Encerra ou reinicia o programa
    continue = Nome.continuar?
  end
  Nome.linha
end

main # Chama o código principal
