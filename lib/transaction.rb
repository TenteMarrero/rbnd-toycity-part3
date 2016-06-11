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
		get_transaction_by_id id
	end

	private
	
	def add_to_transactions
		@@transactions << self
	end

	def self.get_transaction_by_id id
		get_first_result(search_by_id id)
	end

	def self.search_by_id id
		@@transactions.select {|transaction| transaction.id == id}
	end

	def self.get_first_result search_results
		if search_results.length > 0
			return search_results[0]
		else
			return nil
		end
	end
end