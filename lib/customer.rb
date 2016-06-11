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
		get_customer_by_name name
	end

	
	private

	def add_to_customers
		unless exists_duplicate?
			@@customers << self
		else
			raise DuplicateCustomerError, "#{@name} already exists."
		end
	end

	def exists_duplicate?
		(self.class.search_by_name @name).length > 0
	end

	def self.search_by_name name
		@@customers.select {|customer| customer.name == name}
	end

	def self.get_customer_by_name name
		get_first_result(search_by_name name)
	end

	def self.get_first_result search_results
		if search_results.length > 0
			return search_results[0]
		else
			return nil
		end
	end
end