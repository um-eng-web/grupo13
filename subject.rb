module Subject 

	def initialize
		@observers =[]
	end

	def add_observer(observer)
		@observers << observer
	end

	def remove_observer(observer)
		@observers.delete(observer)
	end

	def notiffy_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end

end