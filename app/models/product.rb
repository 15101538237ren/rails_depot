class Product < ActiveRecord::Base
	validates_presence_of :title,:description,:image_url
	validates_length_of :title,
			:minimum => 10,
                  		:message=>"seems too short"
	validates_numericality_of :price
	validate :price_must_be_at_least_a_cent
	validates_uniqueness_of :title,
			:message => 'has already been taken'
	validates_format_of :image_url,
			       :with => %r(\.(gif|jpg|png)\Z)i,
			       :message => 'Must be a URL for GIF,JPG OR PNG image.'
	def  self.find_products_for_sale
		Product.all.order('title asc')
	end
protected
	def price_must_be_at_least_a_cent
		errors.add(:price ,'must be greater than or equal to 0.01')  if price.nil? ||
		price < 0.01
	end
end
