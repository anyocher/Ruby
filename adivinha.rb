# Mini Jogo de Adivinhação em Ruby
#O programa escolhe um número aleatório de 1 a 20, e o jogador precisa adivinhar. Ele recebe dicas se o número está maior ou menor, e conta quantas tentativas foram feitas.
puts "Bem-vindo ao jogo de adivinhação!"
puts "Estou pensando em um número de 1 a 20..."

# Gera um número aleatório
numero_secreto = rand(1..20)
tentativas = 0
adivinhou = false

while !adivinhou
  print "Digite seu palpite: "
  palpite = gets.chomp.to_i
  tentativas += 1

  if palpite < numero_secreto
    puts "Muito baixo! Tente um número maior."
  elsif palpite > numero_secreto
    puts "Muito alto! Tente um número menor."
  else
    puts "Parabéns! Você adivinhou o número #{numero_secreto} em #{tentativas} tentativas! 🎉"
    adivinhou = true
  end
end
