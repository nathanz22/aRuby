# Verificar se em um texto ou nome existe alguma palavra específica.

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

# Classe que verifica a existência de uma palavra em um texto
class ExistePalavra < Toolbox
  def initialize
    super
    @texto = input_txt('Digite o texto: ')
    continue = true
    while continue
      @palavra = input_palavra('Digite a palavra a ser encontrada: ')
      if @texto.include? @palavra
        puts " - A palavra \"\e[32m#{@palavra}\e[0m\" existe dentro do texto."
      else
        puts " - A palavra \"\e[34m#{@palavra}\e[0m\" \e[31mNÃO\e[0m existe dentro do texto."
      end
      continue = mesma_palavra?
    end
  end

  # Pede um texto ao usuário
  def input_txt(msg)
    loop do
      print msg
      txt = String(gets.chomp).strip
      return txt
    rescue Interrupt # Caso o usuário interrompa o script
      INTERRUPCAO.call
    end
  end

  # Pede a palavra a ser encontrada dentro do texto ao usuário
  def input_palavra(msg)
    loop do
      print msg
      palavra = String(gets.chomp).strip
    rescue Interrupt # Caso o usuário interrompa o script
      INTERRUPCAO.call
    else
      return palavra if palavra.split.length == 1

      puts "\e[31mERRO | Deve ser digitada uma única palavra\e[0m"
    end
  end

  # Continuar com a mesma palavra ou encerrar
  def mesma_palavra?
    loop do
      Toolbox.linha 30
      print 'Procurar outra palavra no mesmo texto? [S/N]: '
      choice = String(gets.chomp).strip.upcase
      Toolbox.linha 30
      case choice
      when 'SIM', 'S' then return true
      when 'NÃO', 'NAO', 'N' then return false
      else
        puts "\e[31mERRO | Opção inválida! Digite  \"S\" para SIM ou \"N\" para NÃO\e[0m"
      end
    rescue Interrupt # Caso o usuário interrompa o script
      INTERRUPCAO.call
    end
  end
end

# Código principal
def main
  continue = true
  while continue
    ExistePalavra.linha 50, ' Existe Dentro do Texto? '
    ExistePalavra.new

    continue = ExistePalavra.continuar?
  end
  ExistePalavra.linha
end

main # Chama o código principal
