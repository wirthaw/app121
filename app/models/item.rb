class Item < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :reservations 
  
  attr_accessible :category_id, :description, :item_number, :purchase_date, :value

  validates_presence_of :category_id, :description, :item_number, :purchase_date, :value
  validates_numericality_of :category_id, :value, :item_number
  validates_format_of :value, :with => /^\d+??(?:\.\d{0,2})?$/
  validates_date :purchase_date
  validates_uniqueness_of :item_number, :scope => :category_id
end
