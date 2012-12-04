class Court < ActiveRecord::Base
  has_and_belongs_to_many :reservations 
 
  attr_accessible :name

  validates_presence_of :name
end
