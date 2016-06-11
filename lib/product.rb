class Product
	@@products = []
	attr_reader :title, :price, :stock
	def initialize(options = {})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@@products << self
	end

	def self.all
		@@products
	end
end