class Customer
	@@customers = []

	attr_reader :name

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name name
		@@customers.find {|customer| customer.name == name}
	end

	def purchase product
		Transaction.new(self, product)
	end

	def return id
		Transaction.return(id)
	end

	
	private

	def add_to_customers
		unless self.class.find_by_name @name
			@@customers << self
		else
			raise DuplicateCustomerError, "#{@name} already exists."
		end
	end

end