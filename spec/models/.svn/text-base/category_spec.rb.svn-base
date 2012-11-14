require 'spec_helper'

describe Category do
  describe "empty category validation" do
    before(:each) do
      @category = Category.new
      @category.valid?
    end
    
    it "should require a name" do
      @category.errors[:name].should include("can't be blank")
    end
  end
  
  describe "incorect model validations" do
	before(:each) do
		Category.create!(
			:name => "foobar"
		)
		@category = Category.new(
			:name => "foobar"
		)
		@category.valid?
		
	end
	
	it "should require a unique name" do
		@category.errors[:name].should include("has already been taken")
	end
	
  end
end
