# Exercício 001: Imprimir "Olá, Mundo!" na tela.

# Função de classe que imprime 'Olá, Mundo!'
def ola_mundo
  'Olá, Mundo!'
end

def print_linha(width)
  puts ''.center(width, '=-')
end

# Programa principal
def main
  print_linha(50)
  puts ola_mundo.center(50, ' ')
  print_linha(50)
end

main # Chama o programa principal
