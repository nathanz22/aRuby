# Exercício 001: Imprimir "Olá, Mundo!" na tela.

# Classe que imprime 'Olá, Mundo!'
class OlaMundo
  def initialize
    puts 'Olá, Mundo!'
  end
end

def print_linha(width)
  puts ''.center(width, '=-')
end

# Programa principal
def main
  print_linha 50
  msg = OlaMundo.new
  print_linha 50
end

main # Chama o programa principal
