# calculadora.rb
require 'mathn' rescue nil

def clear_screen
  system('clear') || system('cls')
end

def leia_numero(prompt = "Número: ")
  print prompt
  input = gets.chomp
  begin
    Float(input)
  rescue
    puts "Entrada inválida. Tente novamente."
    leia_numero(prompt)
  end
end

def menu
  puts "=== Calculadora em Ruby ==="
  puts "1) Operações básicas (passo a passo)"
  puts "2) Modo expressão (ex: 2 + 3*(4-1))"
  puts "3) Histórico"
  puts "0) Sair"
  print "Escolha: "
  gets.chomp
end

HISTORICO = []

def modo_basico
  loop do
    puts "\n--- Operações básicas ---"
    puts "a) Soma (+)"
    puts "b) Subtração (-)"
    puts "c) Multiplicação (*)"
    puts "d) Divisão (/)"
    puts "e) Resto (%)"
    puts "f) Potência (**)"
    puts "g) Voltar"
    print "Escolha: "
    escolha = gets.chomp.downcase

    break if escolha == 'g'

    a = leia_numero("Primeiro número: ").to_f
    b = leia_numero("Segundo número: ").to_f

    resultado = case escolha
    when 'a' then a + b
    when 'b' then a - b
    when 'c' then a * b
    when 'd'
      if b == 0
        puts "Erro: divisão por zero!"
        next
      else
        a / b
      end
    when 'e'
      if b == 0
        puts "Erro: divisão por zero!"
        next
      else
        a % b
      end
    when 'f' then a ** b
    else
      puts "Opção inválida."
      next
    end

    puts "Resultado: #{resultado}"
    HISTORICO << "#{a} #{op_symbol(escolha)} #{b} = #{resultado}"
  end
end

def op_symbol(choice)
  case choice
  when 'a' then '+'
  when 'b' then '-'
  when 'c' then '*'
  when 'd' then '/'
  when 'e' then '%'
  when 'f' then '**'
  else '?'
  end
end

# Função que limita os caracteres permitidos antes de usar eval
def expressao_segura?(s)
  # permite: dígitos, espaços, parênteses, ponto decimal e operadores + - * / % ** 
  # e também '**' já que '**' usa os mesmos caracteres.
  !!(s =~ /\A[0-9+\-*/%().\s]+\z/)
end

def modo_expressao
  puts "\n--- Modo expressão ---"
  puts "Digite uma expressão matemática ou 'voltar' para retornar."
  loop do
    print "> "
    entrada = gets.chomp
    break if entrada.downcase == 'voltar'
    if entrada.strip.empty?
      next
    end

    unless expressao_segura?(entrada)
      puts "Expressão contém caracteres não permitidos. Use apenas números, espaços, (), + - * / % e pontos."
      next
    end

    begin
      resultado = eval(entrada)
      puts "=> #{resultado}"
      HISTORICO << "#{entrada} = #{resultado}"
    rescue ZeroDivisionError
      puts "Erro: divisão por zero!"
    rescue Exception => e
      puts "Erro ao avaliar expressão: #{e.message}"
    end
  end
end

def mostrar_historico
  puts "\n--- Histórico ---"
  if HISTORICO.empty?
    puts "Nenhuma operação ainda."
  else
    HISTORICO.each_with_index do |item, i|
      puts "#{i+1}) #{item}"
    end
  end
end
 
clear_screen
loop do
  escolha = menu
  case escolha
  when '1'
    modo_basico
  when '2'
    modo_expressao
  when '3'
    mostrar_historico
  when '0'
    puts "Tchau! "
    break
  else
    puts "Opção inválida. Tente de novo."
  end
end
