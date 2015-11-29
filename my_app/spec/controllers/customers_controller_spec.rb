require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
	let(:valid_session) do
		{ customer_id: 444 }
	end

	let(:valid_attributes) do
		{
			customer_id: 444,
			email: "darealmvp@hotmail.com",
			password: "datdivedoe",
			password_confirmation: "datdivedoe",
			birthday: Time.new(1925, 05, 19)
		}
	end

	let(:invalid_attributes) do
		{ email: nil }
	end

	describe "GET index" do
	    it "assigns all customers to @customers" do
	     customer = Customer.create! valid_attributes
	      get :index, {}, valid_session
	      expect(assigns(:customers)).to eq(customer)
	    end
	end

	describe "GET show" do
		it "assigns requested customer as @customer" do
			customer = Customer.create! valid_attributes
			get :show, valid_session
			expect(assigns(:customer)).to eq(customer)
		end
	end

	describe "GET edit" do
		it "assigns requested customer as @customer" do
			customer = Customer.create! valid_attributes
			get :edit, { id: customer.id }, valid_session
			expect(assigns(:customer)).to eq(customer)
		end
	end

	describe "GET new" do
		it "assigns new customer as @customer" do
			get :new, {}, valid_session
			expect(assigns(:customer)).to be_instance_of(Customer)
		end
	end

	describe 'POST create' do
		context 'when valid attributes' do

		it 'creates requested customer' do
			post(:create, {customer: valid_attributes}, valid_session)
			expect(Customer.find_by_email(valid_attributes[:email])).to be_present
		end

		it 'assigns requested customer to @customer' do
			post :create, {customer: valid_attributes}, valid_session
			expect(assigns(:customer)).to eq(Customer.find_by_email(valid_attributes[:email]))
		end

		it 'redirects to certain customer' do
			post :create, { customer: valid_attributes }, valid_session
			expect(response).to redirect_to assigns(:customer)
	  	end
  	end
end

  context "when invalid attributes" do
			it "does not create requested customer" do
				post :create, { customer: invalid_attributes }, valid_session
				expect(Customer.find_by_email(valid_attributes[:email])).to eq(nil)
			end

		it "redirects to new template" do
			post :create, {customer: invalid_attributes}, valid_attributes
			expect(response).to render_template :new
		end
	end

  	# describe "#birthday?" do
  	describe "DELETE destroy" do
  		it "destroys specific customer account" do
  			customer = Customer.create! valid_attributes
  			delete :destroy, { id: customer.id }, valid_session
			expect(Customer.find_by_id(customer.id)).to be_nil
  		end

  		it "redirects to the customers path" do
  			customer = Customer.create! valid_attributes
  			delete :destroy, {id: customer.id}, valid_session
  			expect(response).to redirect_to (customer_path)
  		end
	end
end
