class Transaction
	@@id = 1
	@@transactions = []
	attr_reader :id, :customer, :product
	def initialize(customer, product)
		product.substract_stock
		@id = @@id
		@@id += 1
		@customer = customer
		@product = product
		add_to_transactions
	end

	def self.all
		@@transactions
	end

	def self.find id
		@@transactions.find {|transaction| transaction.id == id}
	end

	private
	
	def add_to_transactions
		@@transactions << self
	end

end