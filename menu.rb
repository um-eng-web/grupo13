class Menu

	def initialize(betess)
		@sistema = betess
	end

	# menu inicial
	def inicio
		puts "Bem vindo ao BetESS!"

		while true
			puts "Opções:\n 1 - Registar\n 2 - Login\n 3 - Fechar Evento\n 4 - Sair"
			escolha = gets

			case escolha
				when 1
					registar
					break
				when 2
					login
					break
				when 3
					fecharEvento
					break
				when 4
					puts "Obrigada e até já!\n"
					break
				else
					puts "Por favor introduza uma escolha válida!\n"
			end	
		end
	end

	#menu de registo
	def registar
		puts "1 - Utilizador Normal\n2 - Bookie"
		tipo = gets

		puts "Insira o nome:\n"
		nome = gets

		puts "Insira o email:\n"
		email = gets

		puts "Insira a palavra-passe:\n"
		pass = gets

		if tipo == 1
			@sistema.registaUtilizador(nome, email, pass)
		elsif tipo == 2
			@sistema.registaBookie(nome, email, pass)
		end
	end

	#menu de login
	def login
		puts "1 - Utilizador Normal\n2 - Bookie"
		tipo = gets

		puts "Insira o email:\n"
		email = gets

		puts "Insira a palavra-passe"
		pass = gets

		if tipo == 1
			@sistema.loginUtilizador(email, pass)
			if @sistema.utilizadores[email].ativo == true
				utilLigado(email)
			end
		elsif tipo == 2
			@sistema.loginBookie(email, pass)
			if @sistema.bookies[email].ativo == true
				bookieLigado(email)
			end
		end	
	end

	#menu fechar evento
	def fecharEvento
		puts "Por favor indique o identificador do evento a fechar:\n"
		id = gets

		puts "Quem foi o vencedor? (1,x,2)"
		vencedor = gets

		@sistema.fecharEvento(id, vencedor)
	end

	#Menu principal para utilizador ligado
	def utilLigado(email)
		utilizador = @utilizadores[email]

		while true

			puts "Selecione uma das seguintes opções:\n1 - Ver apostas disponiveis\n2 - Apostar\n3 - Ver saldo\n4 - Depositar\n5 -Minhas Apostas\n6 - Retroceder\n7 - Sair\n"
			escolha = gets

			case escolha
				when 1
				when 2
				when 3
				when 4
				when 5
				when 6
				when 7
				else
					puts "Por favor introduza uma escolha válida!\n"
			end
		end
	end

	#Menu principal para bookie ligado
	def bookieLigado(email)
		bookie = @bookie[email]

		while true
			puts "Selecione uma das seguintes opções:\n1 - Criar uma aposta\n2 - Ver apostas\n3 - Subscrever uma aposta\n4 - Minhas Apostas\n5 - Fechar odds\n6 - Alterar odd\n7 - Retroceder\n8 - Sair\n"
			escolha = gets

			case escolha
				when 1
				when 2
				when 3
				when 4
				when 5
				when 6
				when 7
				when 8
				else
					puts "Por favor introduza uma escolha válida!\n"
			end
		end
	end

end