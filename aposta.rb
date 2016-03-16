class Aposta

	attr_accessor :evento
	attr_accessor :utilizador
	attr_accessor :escolha
	attr_accessor :odd
	attr_accessor :valor
	attr_accessor :estado

	def initialize(evento, utilizador, escolha, odd, valor)
		@evento = evento
		@utilizador = utilizador
		@escolha = escolha
		@odd = odd
		@valor = valor
		@estado = "Não resolvida"
	end

end

