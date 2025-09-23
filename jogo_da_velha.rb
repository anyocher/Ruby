def mostrar_tabuleiro(tabuleiro)
  puts "\n"
  puts " #{tabuleiro[0]} | #{tabuleiro[1]} | #{tabuleiro[2]} "
  puts "---+---+---"
  puts " #{tabuleiro[3]} | #{tabuleiro[4]} | #{tabuleiro[5]} "
  puts "---+---+---"
  puts " #{tabuleiro[6]} | #{tabuleiro[7]} | #{tabuleiro[8]} "
  puts "\n"
end

def vencedor?(tabuleiro, simbolo)
  combinacoes = [
    [0,1,2], [3,4,5], [6,7,8], # linhas
    [0,3,6], [1,4,7], [2,5,8], # colunas
    [0,4,8], [2,4,6]           # diagonais
  ]

  combinacoes.any? do |c|
    c.all? { |i| tabuleiro[i] == simbolo }
  end
end

def jogo_da_velha
  tabuleiro = (1..9).map(&:to_s)
  jogador_atual = "X"

  9.times do |rodada|
    mostrar_tabuleiro(tabuleiro)
    print "Jogador #{jogador_atual}, escolha uma posição (1-9): "
    jogada = gets.chomp.to_i - 1

    if jogada < 0 || jogada > 8 || tabuleiro[jogada] == "X" || tabuleiro[jogada] == "O"
      puts "❌ Movimento inválido, tente novamente!"
      redo
    end

    tabuleiro[jogada] = jogador_atual

    if vencedor?(tabuleiro, jogador_atual)
      mostrar_tabuleiro(tabuleiro)
      puts "🎉 Jogador #{jogador_atual} venceu!"
      return
    end

    # alterna jogador
    jogador_atual = (jogador_atual == "X" ? "O" : "X")
  end

  mostrar_tabuleiro(tabuleiro)
  puts "😮 Deu velha! Ninguém venceu."
end

# Iniciar o jogo
jogo_da_velha
