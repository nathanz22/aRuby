# Conversor de moeda: real para dólar e euro

# Caixa de ferramentas
class Toolbox
  # Quando o usuário interromper o script
  INTERRUPCAO = proc do
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    linha
    exit # Encerra o script
  end

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

# Classe Conversor
class Conversor < Toolbox
  require 'httparty'
  require 'json'
  include HTTParty
  base_uri 'https://economia.awesomeapi.com.br/json'

  # Pede um valor monetário ao usuário
  def self.input_valor(msg)
    loop do
      print msg
      valor = Float(gets.chomp)
      return valor
    rescue ArgumentError # Caso o usuário digite um valor inválido
      puts "\e[31mERRO | Digite um valor monetário válido\e[0m"
    rescue Interrupt # Caso o usuário force a interrupção do script
      INTERRUPCAO.call
    end
  end

  # Obtém a taxa de câmbio
  def self.taxa_de_cambio(from_currency, to_currency)
    response = get("/daily/#{from_currency}-#{to_currency}/1")
    if response.code == 200
      exchange_data = JSON.parse(response.body).first
      exchange_data['high'].to_f
    else
      puts "\e[31mERRO | Ocorreu um erro ao tentar obter a taxa de câmbio\e[0m"
    end
  end

  # Converte para dólar
  def self.dolar(valor)
    exchange_rate = taxa_de_cambio('BRL', 'USD')
    valor * exchange_rate
  rescue SocketError
    puts "\e[31mERRO | Ocorreu um erro ao tentar obter a taxa de câmbio, verifique sua conexão\e[0m"
    linha
    exit
  end

  # Converte para Euro
  def self.euro(valor)
    exchange_rate = taxa_de_cambio('BRL', 'EUR')
    valor * exchange_rate
  rescue Exception => e
    puts "\e[31mERRO | Ocorreu um erro ao tentar obter a taxa de câmbio, verifique sua conexão\e[0m"
    linha
    exit
  end
end

# Código principal
def main
  continue = true
  while continue
    Conversor.linha(50, ' Conversor Monetário ')
    valor = Conversor.input_valor 'Valor a ser convertido: R$'

    dolar = Conversor.dolar valor
    euro = Conversor.euro valor

    Conversor.linha 30
    puts "Valor: \e[34mR$#{format('%.2f', valor)}\e[0m"
    puts "Dólar: \e[32m$#{format('%.2f', dolar)}\e[0m"
    puts "Euro: \e[32m€#{format('%.2f', euro)}\e[0m"
    continue = Conversor.continuar?
  end
  Conversor.linha
end

main # Chama o código principal
