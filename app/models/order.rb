class Order < ActiveRecord::Base
  attr_accessible :amount, :email, :name, :shipping_address, :stripe_card_token
  attr_accessor :stripe_card_token

    def save_with_payment
    if valid?

      #converting amount to cents
      charge = Stripe::Charge.create(
        :amount => "#{amount}00",
        :currency => "usd",
        :card => stripe_card_token,
        :description => email
      )

      self.stripe_customer_token = charge.id
      save!
    end
  end


end
