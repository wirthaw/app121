class Item < ActiveRecord::Base
  belongs_to :category
  
  attr_accessible :category_id, :description, :item_number, :purchase_date, :value

  validates_presence_of :category_id, :description, :item_number, :purchase_date, :value
  validates_numericality_of :category_id, :value, :item_number
  validates_date :purchase_date
end
