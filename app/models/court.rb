class Court < ActiveRecord::Base
  has_many :reservations
  
  attr_accessible :name

  validates_presence_of :name
end
