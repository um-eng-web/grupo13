class Evento

	include Subject
	attr_accessor :estado
	attr_accessor :estado_odd
	attr_accessor :tipo
	attr_accessor :id
	attr_accessor :apostas
	attr_accessor :observers

	def initialize(id)
		super()
		@id = id
		@estado = true
		@observers = Array.new
		@apostas = Hash.new
	end

	def ativa
		@estado = true
	end

	def desativa
		@estado = false
	end

	def add_aposta(aposta)
		@apostas << aposta
	end

	def remove_aposta(aposta)
		@apostas.delete(aposta)
	end

end