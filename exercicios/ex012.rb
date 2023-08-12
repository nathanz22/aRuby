# Conversor de Temperaturas

puts ' Exercício 12 '.center(85, '=-')

# --- Celsius para Fahrenheit ---
def c_to_f(celsius)
  format('%.2f', (celsius * 9 / 5.0) + 32).to_f
end

# --- Fahrenheit para Celsius ---
def f_to_c(fahrenheit)
  format('%.2f', (fahrenheit - 32) * 5 / 9.0).to_f
end

# --- Kelvin para Celsius ---
def k_to_c(kelvin)
  format('%.2f', kelvin - 273.15).to_f
end

# Celsius para Kelvin ---
def c_to_k(celsius)
  format('%.2f', celsius + 273.15).to_f
end

# Kelvin para Fahrenheit ---
def k_to_f(kelvin)
  format('%.2f', c_to_f(k_to_c(kelvin))).to_f
end

# Fahrenheit para Kelvin
def f_to_k(fahrenheit)
  format('%.2f', c_to_k(f_to_c(fahrenheit))).to_f
end

# ----- Função para capturar a escala a ser convertida -----
def input_escala(msg)
  loop do
    print msg
    choice = String(gets.chomp).strip.upcase
  rescue Interrupt # Caso o usuário encerre o programa durante a escolha
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    puts ''.center(85, '=-')
    exit
  else
    if choice != 'C' && choice != 'F' && choice != 'K'
      puts "\e[31mERRO | Escala inválida! Digite apenas a inicial da escala (C, F ou K)\e[0m"
      next
    end
    return choice
  end
end

# ----- Função para obter o valor a ser convertido -----
def input_valor(msg)
  loop do
    # Pede valor ao usuário
    print msg
    v = Float(gets.chomp)
  rescue ArgumentError # Caso o valor não seja válido (como letras ou símbolos)
    puts "\e[31mERRO | Valor deve ser um número\e[0m"
  rescue Interrupt # Caso o usuário encerre o programa durante a escolha
    puts "\n\e[33mINTERRUPÇÃO | O usuário preferiu interromper\e[0m"
    puts ''.center(85, '=-')
    exit
  else
    # Retorna o valor formatado para inteiro caso o valor não possua casas decimais (ex.: 1.0, 2.0)
    return v == v.to_i ? v.to_i : v
  end
end

c = true # Será a condição para o while (que manterá o programa ativo até que o usuário decida encerrá-lo ao final)

while c # Executará o programa até o usuário decidir encerrá-lo ao final
  # --- Input da escala do valor a ser convertido ---
  choice = input_escala(' - Qual a escala do valor a ser convertido? [C, F, K]: ')

  # --- Input do valor a ser convertido ---
  v = input_valor(' - Valor a ser convetido: ')

  # --- Identifica a escala escolhida pelo usuário e mostra as conversões ---
  case choice
  when 'C'
    print "\e[34mCelsius\e[0m: \e[35m#{v} °C\e[0m | "
    print "\e[34mFahrenheit\e[0m: \e[35m#{c_to_f(v)} °F\e[0m | "
    print "\e[34mFahrenheit\e[0m: \e[35m#{c_to_f(v)} °F\e[0m"
    puts
  when 'F'
    print "\e[34mFahrenheit\e[0m: \e[35m#{v} °F\e[0m | "
    print "\e[34mCelsius\e[0m: \e[35m#{f_to_c(v)} °C\e[0m | "
    print "\e[34mKelvin\e[0m: \e[35m#{f_to_k(v)} K\e[0m"
    puts
  when 'K'
    print "\e[34mKelvin\e[0m: \e[35m#{v} K\e[0m | "
    print "\e[34mCelsius\e[0m: \e[35m#{k_to_c(v)} °C\e[0m | "
    print "\e[34mFahrenheit\e[0m: \e[35m#{k_to_f(v)} °F\e[0m"
    puts
  end

  # --- Pergunta ao usuário se quer ou não encerrar o programa ---
  loop do
    puts '-' * 30
    print 'Deseja encerrar? [S/N]: '
    choice = String(gets.chomp).strip.upcase
    puts '-' * 30
    case choice
    when 'S' # Encerra o programa
      puts "\e[33mENCERRAMENTO | Até mais!\e[0m"
      c = false
      break
    when 'N' # Continua o programa, voltando ao início
      if Gem.win_platform? # Limpa o terminal depois de verificar o sistema operacional do usuário
        system 'cls' # Limpa o terminal (Windows)
      else
        system 'clear' # Limpa o terminal (Outros sistemas operacionais)
      end
      puts ''.center(85, '=-')
      break
    else # Caso o usuário digite algo diferente de "S" ou "N"
      puts "\e[31mERRO | Escolha inválida! Digite \"S\" para SIM, ou \"N\" para NÃO\e[0m"
    end
  end
end

puts ''.center(85, '=-')
