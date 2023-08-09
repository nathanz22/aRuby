# Conversor de moeda: real para dólar e euro

puts ' Exercício 009 '.center(85, '=-')

loop do
  print 'Qual o valor a ser convertido? : R$'
  v = Float(gets.chomp)
rescue ArgumentError
  puts 'ERRO | Valor inválido!'
rescue Interrupt
  puts "\nINTERRUPÇÃO | O usuário preferiu interromper"
  puts ''.center(85, '=-')
  exit
else
  d = v * 4.8997
  e = v * 5.3674

  puts " - Em real: R$#{format('%.2f', v)}"
  puts " - Em dólar: $ #{format('%.2f', d)}\n - Em euro: € #{format('%.2f', e)}"
  break
end

puts ''.center(85, '=-')
