class User 
	attr_accessor :name, :email
	[...]
end

class Token
	attr_accessor :token_value, :token_expiration

	def initialize(token_expiration, token_value)
		@token_expiration = token_expiration
		@token_value = token_value
	end

end

class Validator
	def initialize(user, token)
		@user = user
		@token = token
	end

	def is_valid?
		@token.token_value && Date.today > @token.token_expiration
	end 
end

anna = User.new(Kevin, kevin@email.com)
annas_coin = Token.new(08/17, ASDFSDF)
validator = Validator.new(anna, coin)

validator.is_valid?