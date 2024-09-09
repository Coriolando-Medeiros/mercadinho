require_relative 'produto'

class Estoque
  def initialize
    @entregas = []
    
  end

  def adicionar
    puts "Adicionar produto"
    print "Fornecedor: "
    fornencedor = gets.chomp.capitalize
    print "Entregador: "
    entregador = gets.chomp.capitalize
    print "Vendedor: "
    vendedor = gets.chomp.capitalize
    print "Quantidade de itens da entrega: "
    itens = gets.chomp.to_i
    hora = Time.now.strftime("%H:%M:%S")
    data = Time.now.strftime("%d-%m-%Y")
    contador = 0
    produto = Produto.new
    until contador == itens
      produto.cadastrar_produto
      contador += 1
    end
    @entregas << {fornencedor: fornencedor, entregador: entregador, vendedor: vendedor, data: data}
    File.open("entregas.txt", "a") do |arquivo|
      arquivo.puts "Fornecedor: #{fornencedor} | Entregador: #{entregador} | Vendedor: #{vendedor} | Data: #{data} | Hora: #{hora}"
    end
    puts "Atualizado estoque #{data} #{hora}"
  end

  def ver_estoque
    if File.exist?("estoque.txt") && !File.zero?("estoque.txt")
      File.open("estoque.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    end
  end
    
end

estoque = Estoque.new
#estoque.adicionar
estoque.ver_estoque