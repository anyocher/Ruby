tarefas = []

loop do
  puts "\n=== Gerenciador de Tarefas ==="
  puts "1 - Adicionar tarefa"
  puts "2 - Listar tarefas"
  puts "3 - Remover tarefa"
  puts "4 - Sair"
  print "Escolha uma opção: "

  opcao = gets.chomp.to_i

  case opcao
  when 1
    print "Digite a tarefa: "
    tarefa = gets.chomp
    tarefas << tarefa
    puts " Tarefa adicionada!"
  when 2
    puts "\n Suas tarefas:"
    if tarefas.empty?
      puts "Nenhuma tarefa cadastrada."
    else
      tarefas.each_with_index do |t, i|
        puts "#{i+1}. #{t}"
      end
    end
  when 3
    puts "\nDigite o número da tarefa que deseja remover:"
    tarefas.each_with_index do |t, i|
      puts "#{i+1}. #{t}"
    end
    indice = gets.chomp.to_i - 1
    if indice >= 0 && indice < tarefas.size
      removida = tarefas.delete_at(indice)
      puts "Tarefa '#{removida}' removida."
    else
      puts "Número inválido."
    end
  when 4
    puts "Saindo... Até mais! "
    break
  else
    puts "Opção inválida! Tente de novo."
  end
end
