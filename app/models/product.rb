class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
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
	def self.latest
		Product.order(:updated_at).last
	end
protected
	def price_must_be_at_least_a_cent
		errors.add(:price ,'must be greater than or equal to 0.01')  if price.nil? ||
		price < 0.01
	end
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
	if line_items.empty?
	return true
	else
	errors.add(:base, 'Line Items present')
	return false
	end
	end
end
