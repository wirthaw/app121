require 'spec_helper'

describe Item do
	describe "An empty item model" do
		before(:each) do
			@item = Item.new
			@item.valid?
		end
		
		it "should require a category_id" do
			@item.errors[:category_id].should include("can't be blank");
		end
		
		it "should require a value" do
			@item.errors[:value].should include("can't be blank");
		end
		
		it "should require an item number" do
			@item.errors[:item_number].should include("can't be blank");
		end
		
		it "should require a purchase date" do
			@item.errors[:purchase_date].should include("can't be blank");
		end
		
		it "should require a description" do
			@item.errors[:description].should include("can't be blank");
		end
	end
	
	describe "An item model with bad data" do
		before(:each) do
			@item = Item.new(
				:description => "123",
				:value => "foo",
				:category_id => "foo",
				:item_number => "foo",
				:purchase_date => "foo"
			)	
			@item.valid?			
		end
		
		it "should be a numeric category id" do
			@item.errors[:category_id].should include("is not a number")
		end
		
		it "should be a numeric value" do
			@item.errors[:value].should include("is not a number")
		end
		
		it "should be a numeric item_number" do
			@item.errors[:item_number].should include("is not a number")
		end
		
		it "should require a valid date" do
			@item.errors[:purchase_date].should include("is not a valid date")
		end
		
	end
	
	describe "A non-unique item" do
		before(:each) do
		    Item.create!(
				:description => "foobar",
				:value => 20,
				:category_id => 1,
				:item_number => 1,
				:purchase_date => "10/24/1990"
			)
			@item = Item.new(
				:description => "foobar",
				:value => 20,
				:category_id => 1,
				:item_number => 1,
				:purchase_date => "10/24/1990"
			)	
			@item.valid?			
		end
		
		it "should require a unique item_number within it's category" do
			@item.errors[:item_number].should include("has already been taken")
		end		
	end
	
	describe "An item model with good data" do
		before(:each) do
			@item = Item.new(
				:description => "hello,world",
				:value => "200",
				:category_id => "1",
				:item_number => "1",
				:purchase_date => 1.day.ago
			)
			@item.valid?
		end
		
		it "should accept the category_id" do
			@item.errors[:category_id].should_not include("is not a number")
		end
		
		it "should accept the value" do
			@item.errors[:value].should_not include("is not a number")
		end
		
		it "should accept the item_number" do
			@item.errors[:item_number].should_not include("is not a number")
		end
		
		it "should accept the purchase date" do
			@item.errors[:purchase_date].should_not include("is not a valid date")
		end
	end
end
