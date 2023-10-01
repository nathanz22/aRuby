# Ler duas notas de um aluno e mostrar sua média.

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

# Classe Média
class Media < Toolbox
  # Pede as notas ao usuário
  def self.input_nota(msg)
    loop do
      print msg
      n = Float(gets.chomp)
      if n > 10 || n.negative?
        puts "\e[31mERRO | A nota deve ser dever um valor numérico entre 0 e 10\e[0m"
        next
      end
      return n
    rescue ArgumentError # Quando for passado um valor inválido
      puts "\e[031mERRO | A nota deve ser um valor numérico entre 0 e 10\e[0m"
    rescue Interrupt # Quando o usuário forçar a interrupção
      INTERRUPCAO.call
    end
  end

  # Calcula a média
  def self.media(nota1, nota2)
    (nota1 + nota2) / 2
  end
end

# Código principal
def main
  continue = true
  while continue
    Media.linha 50, ' Média de Duas Notas '
    n1 = Media.input_nota 'Digite a primeira nota: '
    n2 = Media.input_nota 'Digite a segunda nota: '

    # Imprime o resultado
    puts "\nPrimeira nota: \e[034m#{n1}\e[0m | Segunda nota: \e[034m#{n2}\e[0m"
    puts "Média: \e[32m#{Media.media n1, n2}\e[0m"

    continue = Media.continuar?
  end
  Media.linha
end

main # Chama o código principal
