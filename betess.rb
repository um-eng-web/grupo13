class BetESS

	attr_accessor :utilizadores
	attr_accessor :bookies
	attr_accessor :eventos
	attr_accessor :apostas
	attr_accessor :utilizadoresOn
	attr_accessor :bookiesOn
	attr_accessor :idEvento

	def initialize
		@utilizadores = Hash.new
		@bookies = Hash.new
		@eventos = Hash.new
		@apostas = Hash.new
		@utilizadoresOn = Array.new
		@bookiesOn = Array.new
		@idEvento = 0
	end

	def criaEventoFut(equipa1, equipa2, odd1, odd2, oddx)
		@idEvento+=1
		evento = Futebol.new(equipa1, equipa2, odd1, odd2, oddx, @idEvento)
		@eventos.store(:@idEvento,evento)
	end

	def registaUtilizador(nome, email, password)

		if @utilizadores.has_key?(email)
			puts "Utilizador já existe!"
		else
			utilizador = Utilizador.new(nome, password, email)
			@utilizadores.store(:email,utilizador)
			puts "Utilizador criado com sucesso!"
		end
	end

	def registaBookie(nome, email, password)

		if @bookies.has_key?(email)
			puts "Bookie já existe!"
		else
			bookie = Bookie.new(nome, password, email)
			@bookies.store(:email,bookie)
			puts "Bookie criado com sucesso!"
		end

	end

	def loginUtilizador(email, password)

			if @utilizadores.has_key?(email)
				utilizador = @utilizadores[email]

				if utilizador.password.eql?(password)
					@utilizadoresOn.put(utilizador)
					utilizador.login
					puts "Login com sucesso!"
				else
					puts "Palavra-passe incorreta!"
				end
			else
				puts "Utilizador não existe!"
			end	
	end

	def loginBookie(email, password)

			if @bookies.has_key?(email)
				bookie = @bookies[email]

				if bookie.password.eql?(password)
					@bookiesOn.put(bookie)
					bookie.login
					puts "Login com sucesso!"
				else
					puts "Palavra-passe incorreta!"
				end
			else
				puts "Bookie não existe!"
			end	
	end

	def fecharEvento(id, vencedor)
		evento = @eventos[id]
		evento.desativa

		apostas = @apostas[evento]

		apostas.each do |a|
			if a.escolha.eql?vencedor
				a.estado = "Venceu"
				a.utilizador.credita(a.odd*a.valor)
			else
				a.estado = "Perdeu"
			end
			@apostas.delete(a.id)
		end
	end

	def credita(email, valor)
		utilizador = @utilizadores[email]
		utilizador.credita(valor)
	end

	def debita(email, valor)
		utilizador = @utilizadores[email]
		utilizador.debita(valor)
	end

end

	#Povoar Sistema

		sistema = BetESS.new
		
		#Apostas Futebol
		sistema.criaEventoFut("Benfica", "Porto", 1.20, 3.00, 5.00);
		sistema.criaEventoFut("Rio Ave", "Braga", 1.80, 3.00, 2.10);
		sistema.criaEventoFut("Cugilhães", "Refogueiro", 4.00, 2.00, 3.50);

		#Utilizadores
		sistema.registaUtilizador("a","a","a");
		sistema.registaBookie("b","b","b")

		menu = Menu.new(sistema)

		menu.login

		
