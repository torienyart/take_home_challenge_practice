require "rails_helper"

RSpec.describe "New Customer Subscription API", type: :request do
  before do
    @customer = Customer.create!(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St Denver, CO 80204")
    @tea = Tea.create!(title: "Green Tea", description: "Green Tea Description", temperature: 180, brew_time: 120)
    @subscription = Subscription.create!(title: "Green Tea Subscription", price: 10.00, frequency_in_days: 30, tea_id: @tea.id)
  end

  context "when successful" do
    it "returns the new entry" do
      params = {
        customer_id: @customer.id,
        subscription_id: @subscription.id
      }
  
      post "/api/v1/customers/#{@customer.id}/customer_subscriptions", params: params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data][:attributes][:customer_id]).to eq(@customer.id)
      expect(json[:data][:attributes][:subscription_id]).to eq(@subscription.id)
    end
  end

  context "when unsuccessful" do
    it "returns an error message when attributes are invalid" do
      params = {
        customer_id: @customer.id,
        subscription_id: nil
      }
  
      post "/api/v1/customers/#{@customer.id}/customer_subscriptions", params: params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to be 422
      expect(json[:data][:attributes][:errors]).to eq(["Subscription must exist"])
    end
  end
end