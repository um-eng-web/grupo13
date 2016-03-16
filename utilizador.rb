class Utilizador

	attr_accessor :nome
	attr_accessor :password
	attr_accessor :email
	attr_accessor :saldo
	attr_accessor :ativo
	attr_accessor :apostas
	attr_accessor :mensagens

	def initialize(nome, password, email)
		@nome = nome
		@password = password
		@email = email
		@saldo = 0.0
		@apostas = Array.new
		@mensagens = Array.new
	end

	def add_mensagem(mensagem)
		@mensagens << mensagem
	end

	def remove_mensagem(mensagem)
		@mensagens.delete(mensagem)
	end

	def credita(valor)
		@saldo = @saldo + valor
	end

	def debita(valor)
		@saldo = @saldo - valor
	end

	def login
		@ativo = true
	end

	def logout
		@ativo = false
	end

	def add_Aposta(aposta)
		@apostas << aposta
	end

	def remove_aposta(aposta)
		@apostas.delete(aposta)
	end

	def update(evento)
		aposta = evento.apostas[self]
		if aposta.estado.eql?("Venceu")
			add_mensagem("Venceu a aposta " + evento.id + " e ganhou " + aposta.valor*aposta.valor)
		elsif aposta.estado.eql?("Perdeu")
			add_mensagem("Perdeu a aposta " + evento.id)
		end

	end

end

