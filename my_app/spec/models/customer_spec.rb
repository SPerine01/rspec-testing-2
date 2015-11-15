require 'rails_helper'

RSpec.describe Customer, :type => :model do
	# allows RSpec to recognize the type of test that this is and it enables running tests by their type.
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:customers) do
		[Customer.create, Customer.create]
	end


describe "is invalid without a " do     
	let(:dog){ Dog.new(valid_attributes) }  

	it "name" do
	    dog.name = nil       
	    expect(dog).to be_invalid     
    end 



end


