require 'spec_helper'

describe Court do
  	describe "An empty court model" do
		before(:each) do
			@court = Court.new
			@court.valid?
		end
		
		it "should require a name" do
			@court.errors[:name].should include("can't be blank");
		end
	end
	
	describe "An court model with good data" do
		before(:each) do
			@court = Court.new(
				:name => "Court 1"
			)
			@court.valid?
		end
		
		it "should have a value for name" do
			@court.errors[:name].should_not include("can't be blank")
		end
	end
end
