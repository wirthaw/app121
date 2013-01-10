class Reservation < ActiveRecord::Base
  has_and_belongs_to_many :courts
  has_and_belongs_to_many :items 

  attr_accessible :end_time, :number_of_participants, :reservation_date, :start_time, :user_id
  
  validates_presence_of :end_time, :start_time, :reservation_date, :user_id
  validates_numericality_of :number_of_participants, :greater_than_or_equal_to => 0
  validates_time :start_time, :after => Time.parse('8:00am'),
    									 :after_message => 'The start time must be after 8:00 am',
    									 :allow_nil => false
  validates_time :end_time, :before => Time.parse('11:59pm'),
  						    :after => :start_time,
  						    :after_message => 'The end time must be after the start time',
     						:before_message => 'The start time must be before 11:59 pm',
     						:allow_nil => false
     						
  validates_date :reservation_date
end
