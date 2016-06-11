class Product
	@@products = []

	attr_reader :title, :price, :stock

	def initialize(options = {})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def in_stock?
		@stock > 0
	end

	def substract_stock
		if in_stock?
			@stock -= 1
		else
			raise OutOfStockError, "'#{@title}' is out of stock."
		end
	end

	def self.all
		@@products
	end

	def self.find_by_title name
		@@products.find {|product| product.title == name}
	end

	def self.in_stock
		search_products_in_stock
	end


	private

	def add_to_products
		unless self.class.find_by_title @title
			@@products << self
		else
			raise DuplicateProductError, "'#{@title}' already exists."
		end
	end

	def self.search_products_in_stock
		@@products.select {|product| product.in_stock?}
	end
end