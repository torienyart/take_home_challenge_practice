class ErrorSerializer
  include JSONAPI::Serializer
  attribute :message do
    "That didn't work"
  end

  attribute :errors do |error|
    require 'pry'; binding.pry
    [error.message]
  end
end
