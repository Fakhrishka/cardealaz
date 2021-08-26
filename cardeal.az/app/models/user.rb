class User 
	attr_accessor :login, :password

	def initialize(login, password)
		@login = login
		@password = password
	end
end