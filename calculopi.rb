# Cálculo da circunferência em Ruby
puts "Digite o raio do círculo:"
raio = gets.chomp.to_f

circunferencia = 2 * Math::PI * raio

puts "A circunferência é: #{circunferencia}"
