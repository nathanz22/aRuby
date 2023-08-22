# Ler o nome de uma pessoa e mostrar uma mensagem de boas-vindas.

# Classe de boas vindas
class BoasVindas
  def initialize(nome)
    @nome = nome
  end

  def boas_vindas
    puts "Olá, #{@nome}, seja bem-vindo(a)!"
  end
end

# Pede o nome do usuário
def input_nome(msg)
  loop do
    print msg
    nome = gets.chomp.strip.capitalize
    return nome unless nome.empty?

    puts "\e[31mERRO | Por favor, digite um nome válido\e[0m"
  end
end

# Imprime uma linha personalizada
def print_linha(width = 50)
  # width é igual à tamanho da linha
  puts ''.center(width, '=-')
end

# Programa Principal
def main
  print_linha
  obj = BoasVindas.new(input_nome('Digite seu nome: '))
  obj.boas_vindas
  print_linha
end

main # Chama o programa principal
