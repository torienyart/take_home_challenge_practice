class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :subscription_id, :status, :title, :price, :frequency_in_days, :tea_id

  attribute :title do |object|
    object.subscription.title
  end

  attribute :price do |object|
    object.subscription.price
  end

  attribute :frequency_in_days do |object|
    object.subscription.frequency_in_days
  end

  attribute :tea_id do |object|
    object.subscription.tea_id
  end
end