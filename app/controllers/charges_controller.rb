class ChargesController < ApplicationController

def create
  @amount = 1500 #Amount in cents

  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: "Premium Membership #{current_user.email}",
    currency: 'usd'
    )

  current_user.role = "premium"
  current_user.save
  
  flash[:success] = "Thank you for upgrading to a premium Blocipedia account!"
  redirect_to user_path(current_user)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to wikis_path
end

def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "Premium Membership #{current_user.email}",
    amount: @amount
  }
end
end