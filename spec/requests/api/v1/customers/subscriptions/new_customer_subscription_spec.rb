require "rails_helper"

RSpec.describe "New Subscription API", type: :request do
  before do
    @customer = Customer.create!(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St Denver, CO 80204")
    @tea = Tea.create!(title: "Green Tea", description: "Green Tea Description", temperature: 180, brew_time: 120)
    @subscription = Subscription.create!(title: "Green Tea Subscription", price: 10.00, frequency_in_days: 30, tea_id: @tea.id)

    params = {
      customer_id: @customer.id,
      subscription_id: 1
    }

    post "/api/v1/customers/#{@customer.id}/customer_subscriptions", params: params
  end

  context "when successful" do
    it "returns the new entry" do
      json = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
      expect(response).to be_successful
      expect(json[:data][:attributes][:customer_id]).to eq(@customer.id)
      expect(json[:data][:attributes][:subscription_id]).to eq(@subscription.id)
    end
  end
end