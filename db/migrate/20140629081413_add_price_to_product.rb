class AddPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal,
    	:precision => 8 , :scale => 2 , :default =>0
  end
   def self.down
   	remove_column :products , :price
   end
end
