class Administrador
  require_relative 'vendas'

  def initialize
    @vendas = Vendas.new('estoque.txt')
  end

  def ver_relatorios
    @vendas.historico_vendas
  end
end

admin = Administrador.new
admin.ver_relatorios
