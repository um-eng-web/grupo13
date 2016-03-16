class Futebol < Evento
	attr_accessor :equipa1
	attr_accessor :equipa2
	attr_accessor :odd1
	attr_accessor :odd2
	attr_accessor :oddx

	def initialize (id, equipa1, equipa2, odd1, odd2, oddx)
		super(id)
		@equipa1 = equipa1
		@equipa2 = equipa2
		@odd1 = odd1
		@odd2 = odd2
		@oddx = oddx
		@tipo = "Futebol"
	end

end