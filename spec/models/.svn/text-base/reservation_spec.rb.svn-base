require 'spec_helper'

describe Reservation do
  	describe "An empty reservation model" do
		before(:each) do
			@reservation = Reservation.new
			@reservation.valid?
		end
		
		it "should require a reservation date" do
			@reservation.errors[:reservation_date].should include("can't be blank");
		end
		
		it "should require a starting time" do
			@reservation.errors[:start_time].should include("can't be blank");
		end
		
		it "should require an ending time" do
			@reservation.errors[:end_time].should include("can't be blank");
		end
		
		it "should require a user id" do
			@reservation.errors[:user_id].should include("can't be blank");
		end
	end
	
	describe "A reservation model with bad data" do
		before(:each) do
			@reservation = Reservation.new(
				:user_id => "foobar",
				:start_time => "6:00am",
				:reservation_date => "foo",
				:end_time => "11:59pm",
				:number_of_participants => "foo"
			)	
			@reservation.valid?			
		end
		
		it "should be a date for reservation_date" do
			@reservation.errors[:reservation_date].should include("is not a valid date")
		end
		
		it "should be a numeric number of participants" do
			@reservation.errors[:number_of_participants].should include("is not a number")
			@reservation.number_of_participants = -1
			@reservation.valid?
			@reservation.errors[:number_of_participants].should include("must be greater than or equal to 0")
		end
		
		it "should have a start time after 8:00am" do
			@reservation.errors[:start_time].should include("The start time must be after 8:00 am")
		end
		
		it "should have an end time before 11:59pm" do
			@reservation.errors[:end_time].should include("The start time must be before 11:59 pm")
		end
		it "should have an end time after the start time" do
			@reservation.start_time = "9:00am"
			@reservation.end_time = "8:00am"
			@reservation.valid?
			@reservation.errors[:end_time].should include("The end time must be after the start time")
		end
	end
end
