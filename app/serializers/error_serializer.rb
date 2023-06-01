class ErrorSerializer
  include JSONAPI::Serializer
  attribute :message do
    "That didn't work"
  end

  attribute :errors do |item|
    errors = item.errors.map do |error|
      error.full_message
    end
  end
end
