class Transaction
	@@id = 1
	@@transactions = []
	attr_reader :id, :customer, :product, :returned
	def initialize(customer, product)
		product.substract_stock
		@id = @@id
		@@id += 1
		@customer = customer
		@product = product
		@returned = false
		add_to_transactions
	end

	def mark_as_returned
		@returned = true
	end

	def self.return id
		transaction = self.find id
		transaction.mark_as_returned
		transaction.product.add_stock
	end

	def self.all
		@@transactions
	end

	def self.find id
		@@transactions.find {|transaction| transaction.id == id}
	end

	def self.find_by_product_title title
		@@transactions.select {|transaction| transaction.product.title == title}
	end

	def self.find_by_customer_name name
		@@transactions.select {|transaction| transaction.customer.name == name}
	end

	def self.find_by_customer_name_and_product_title name, title
		@@transactions.select {|transaction| transaction.customer.name == name && transaction.product.title == title}
	end

	private
	
	def add_to_transactions
		@@transactions << self
	end

end