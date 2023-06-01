class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :frequency_in_days, :tea_id, :status

  attribute :status do |object|
    require 'pry'; binding.pry
  end
end