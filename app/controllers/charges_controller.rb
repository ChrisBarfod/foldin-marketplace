class ChargesController < ApplicationController
  before_action :set_item
  def new
  end
    
  def create
    # Amount in cents
    @amount = @product.price*100
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
  private
  def set_item
    @product = Product.find(params[:product_id])
  end
end
