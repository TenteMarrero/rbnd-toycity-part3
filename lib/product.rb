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

	def self.all
		@@products
	end

	def self.find_by_title name
		get_product_by_title name
	end

	def self.in_stock
		search_products_in_stock
	end
	private

	def add_to_products
		unless exists_duplicate?
			@@products << self
		else
			raise DuplicateProductError, "#{@title} already exists."
		end
	end

	def exists_duplicate?
		(self.class.search_by_title @title).length > 0
	end

	def self.search_by_title name
		@@products.select {|product| product.title == name}
	end

	def self.get_product_by_title name
		get_first_result(search_by_title name)
	end

	def self.get_first_result search_results
		if search_results.length > 0
			return search_results[0]
		else
			return nil
		end
	end

	def self.search_products_in_stock
		@@products.select {|product| product.in_stock?}
	end
end