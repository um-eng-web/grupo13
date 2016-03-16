class Bookie
	attr_accessor :nome
	attr_accessor :email
	attr_accessor :password
	attr_accessor :ativo
	attr_accessor :eventosSeguir
	attr_accessor :mensagens

	def initialize(nome, email, password)
		@nome = nome
		@email = email
		@password = password
		@ativo = false
		@apostasSeguir = Array.new
		@mensagens = Array.new
	end

	def add_evento(evento)
		@eventosSeguir << evento
	end

	def remove_evento(evento)
		@eventosSeguir.deletE(evento)
	end
	
	def add_mensagem(mensagem)
		@mensagens << mensagem
	end

	def remove_mensagem(mensagem)
		@mensagens.delete(mensagem)
	end

	def login
		@ativo = true
	end

	def logout
		@ativo = false
	end

	def update(evento)
		valor = 0.0
		apostas = evento.apostas
		apostas.each do |aposta|
			if aposta.estado.eql?("Venceu")
				valor += aposta.valor
			elsif aposta.estado.eql?("Perdeu")
				valor -= aposta.valor
			end
		end
		add_mensagem("A aposta " + aposta.id + " terminou e o balanço final é de " + valor + "€")
	end


end