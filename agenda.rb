@agenda = [
    {nome: "Renan", telefone: "999999999"},
    {nome: "Fulano", telefone: "988888888"}
]

def todos_contatos
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
    puts "--------------------------------------------"

end

def add_contato
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp

    @agenda << {nome: nome, telefone: telefone}
end

def ver_contato
    print "Qual nome você deseja? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "#{contato[:nome]} - #{contato[:telefone]}"
        end
    end
end 

def editar_contato
    print "Qual nome deseja editar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            print "Nome para editar (Se quiser manter o mesmo nome, aperte Enter.)"
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

            print "Telefone para editar (Se quiser manter o mesmo telefone, aperte Enter.)"
            telefone_salvo = contato[:telefone]
            
            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
end

def deletar_contato
    print "Qual contato deseja deletar? Digite o nome: "
    nome = gets.chomp
    
    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            indice = @agenda.index(contato)
            @agenda.delete_at(indice)
            puts "Contato deletado!"
            break
        end
    end
end

loop do
    
puts ""
puts  "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
    codigo = gets.chomp.to_i

    case
    when codigo == 0
        puts "Até mais!"
        break
    when codigo == 1
        todos_contatos
    when codigo == 2
        add_contato
    when codigo == 3
        ver_contato
    when codigo == 4 
        editar_contato
    when codigo == 5
        deletar_contato
    else
        puts "Função não existe."
    end
end