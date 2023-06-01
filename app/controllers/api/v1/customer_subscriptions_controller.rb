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

  def update
    customer_subscription = CustomerSubscription.find(params[:id])
    
    if customer_subscription.update(customer_subscription_params)
      render json: CustomerSubscriptionSerializer.new(customer_subscription).serializable_hash, status: 200
    else
      serialized_errors = ErrorSerializer.new(customer_subscription)
      render json: serialized_errors, status: :unprocessable_entity
    end

  rescue ActiveRecord::RecordNotFound, ArgumentError => e
    render json: {errors: e.message}, status: 404
  end

  private

  def customer_subscription_params
    params.permit(:customer_id, :subscription_id, :status)
  end
  
end