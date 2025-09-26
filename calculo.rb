# Calculadora básica em Ruby

puts "Digite o primeiro número:"
num1 = gets.chomp.to_f

puts "Digite o segundo número:"
num2 = gets.chomp.to_f

puts "Escolha a operação: (+, -, *, /)"
operacao = gets.chomp

resultado = case operacao
            when "+"
              num1 + num2
            when "-"
              num1 - num2
            when "*"
              num1 * num2
            when "/"
              if num2 != 0
                num1 / num2
              else
                "Erro: Divisão por zero!"
              end
            else
              "Operação inválida!"
            end

puts "Resultado: #{resultado}"
