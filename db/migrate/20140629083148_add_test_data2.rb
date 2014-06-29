class AddTestData2 < ActiveRecord::Migration
  def  self.up
  	Product.delete_all
	Product.create(title: 'CoffeeScript',
	  description: 
	    %{
	        CoffeeScript is JavaScript done right. It provides all of JavaScript's
		functionality wrapped in a cleaner, more succinct syntax. In the first
		book on this exciting new language, CoffeeScript guru Trevor Burnham
		shows you how to hold onto all the power and flexibility of JavaScript
		while writing clearer, cleaner, and safer code.
	      },
	  image_url:   'cs.jpg',    
	  price: 36.00)
	# . . .
	Product.create(title: 'Programming Ruby 1.9',
	  description:
	    %{
	        Ruby is the fastest growing and most exciting dynamic language
	        out there. If you need to get working programs delivered fast,
	        you should add Ruby to your toolbox.
	      },
	  image_url: 'ruby.jpg',
	  price: 49.95)
	# . . .

	Product.create(title: 'Rails Test Prescriptions',
	  description: 
	    %{
	        Rails Test Prescriptions is a comprehensive guide to testing
	        Rails applications, covering Test-Driven Development from both a
	        theoretical perspective (why to test) and from a practical perspective
	        (how to test effectively). It covers the core Rails testing tools and
	        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
	        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
	      },
	  image_url: 'rtp.jpg',price: 34.95)
  end
  def  self.down
  	Product.delete_all
  end
end
