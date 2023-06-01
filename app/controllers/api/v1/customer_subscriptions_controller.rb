class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    customer_subscription = CustomerSubscription.new(customer_subscription_params)
    if customer_subscription.save
      render json: CustomerSubscriptionSerializer.new(customer_subscription).serializable_hash, status: :created
    else
      serialized_errors = ErrorSerializer.new(customer_subscription)
      render json: serialized_errors, status: :unprocessable_entity
    end
  end


  private

  def customer_subscription_params
    params.permit(:customer_id, :subscription_id)
  end
  
end