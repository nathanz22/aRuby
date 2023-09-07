# Sortear a ordem dos itens da lista

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

# Classe Lista
class Lista < Toolbox
  attr_reader :lista

  def initialize
    super
    @lista = criar_lista
  end

  private

  # Pede para o usuário criar uma lista, item por item
  def criar_lista
    loop do
      print 'Escreva os itens da lista, separando-os com vírgula (\',\'): '
      lista = String(gets.chomp).split ','
      n = lista_aceita? lista # Condição para que retorne a lista
      return lista if n # Retorna a lista caso a mesma esteja correta
    rescue Interrupt
      INTERRUPCAO.call
    end
  end

  # Analisa erros na lista antes de retorná-la
  def lista_aceita?(lista)
    # Retorna true caso a lista não tenha erros, ou false, em caso contrário
    if lista.count < 3
      puts "\e[31mERRO | A lista deve conter no mínimo três itens\e[0m"
      return false
    end

    lista.map!(&:strip) # Remove espaços em branco em cada item da lista

    # Verifica cada item na lista
    lista.each do |i|
      if i.empty? # Caso algum item da lista seja uma string vazia
        puts "\e[31mERRO | Cada item da lista deve conter no mínimo um caractere\e[0m"
        return false
      elsif lista.count(i) > 1 # Em caso de mais de um mesmo item dentro da lista
        puts "\e[31mERRO | Existem mais de um mesmo item dentro da lista\e[0m"
        return false
      end
    end
    true
  end

  public

  # Sorteia a ordem dos itens da lista
  def sortear_ordem
    @lista.shuffle
  end
end

# Código principal
def main
  continue = true
  while continue
    Lista.linha 60, ' Sortear ordem da lista '
    lista = Lista.new
    ordem = lista.sortear_ordem
    puts "A ordem sorteada foi: \e[034m#{ordem.join("\e[0m, \e[034m")}\e[0m"
    ### Os itens da lista serão mostrados com a cor azul, separados por vírgulas de cor branca

    # Finaliza ou reinicia o programa
    continue = Lista.continuar?
  end
  Lista.linha 60
end

main # Chama o código principal
