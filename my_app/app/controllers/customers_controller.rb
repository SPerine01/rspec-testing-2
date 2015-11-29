class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
  	@customer = Customer.find params[:id]
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer, notice: 'Customer successfully created.'
    else
      render :new
    end
  end

  def update
    if @customer = Customer.new(customer_params)
      redirect_to @customer, notice: 'Customer successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to dogs_url, notice: 'Customer successfully deleted.'
  end

  private
  
  def customer_params
    params.require(:customer).permit(:customer_id, :email, :password, :birthday,)
  end
  
end
