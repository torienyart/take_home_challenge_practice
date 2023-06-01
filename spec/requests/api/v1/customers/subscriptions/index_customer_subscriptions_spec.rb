require "rails_helper"

RSpec.describe "All Customer Subscription API", type: :request do
  before do
    @customer_1 = Customer.create!(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St Denver, CO 80204")
    @customer_2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@gmail.com", address: "123 Main St Denver, CO 80204")
    @customer_3 = Customer.create!(first_name: "Jimmy", last_name: "Doe", email: "jimmydoe@gmail.com", address: "123 Main St Denver, CO 80204")

    @tea_1 = Tea.create!(title: "Green Tea", description: "Green Tea Description", temperature: 180, brew_time: 120)
    @tea_2 = Tea.create!(title: "Black Tea", description: "Black Tea Description", temperature: 160, brew_time: 140)
    @tea_3 = Tea.create!(title: "Rooibos Tea", description: "Rooibos Tea Description", temperature: 150, brew_time: 130)

    @subscription_1 = Subscription.create!(title: "Green Tea Subscription", price: 10.00, frequency_in_days: 30, tea_id: @tea_1.id)
    @subscription_2 = Subscription.create!(title: "Black Tea Subscription", price: 12.00, frequency_in_days: 15, tea_id: @tea_2.id)
    @subscription_3 = Subscription.create!(title: "Rooibos Tea Subscription", price: 14.00, frequency_in_days: 30, tea_id: @tea_3.id)

    @customer_subscription_1 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_1.id)
    @customer_subscription_2 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_2.id, status: 1)
    @customer_subscription_3 = CustomerSubscription.create!(customer_id: @customer_2.id, subscription_id: @subscription_3.id)
  end

  context "when successful" do
    it "returns all subscriptions for the correct customer" do
      get "/api/v1/customers/#{@customer_1.id}/customer_subscriptions"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(2)
      expect(json[:data][0][:attributes][:customer_id]).to eq(@customer_1.id)
      expect(json[:data][1][:attributes][:customer_id]).to eq(@customer_1.id)
      expect(json[:data][0][:attributes][:status]).to eq("active")
      expect(json[:data][1][:attributes][:status]).to eq("cancelled")
      expect(json[:data][0][:type]).to eq("customer_subscription")
    end

    it "returns a blank array when customer doesn't have any subscriptions" do
      get "/api/v1/customers/#{@customer_3.id}/customer_subscriptions"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(0)
    end
  end

  context "when unsuccessful" do
    it "returns an error message when customer doesn't exist" do
      get "/api/v1/customers/45728904356/customer_subscriptions"

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(json[:errors]).to eq("Couldn't find Customer with 'id'=45728904356")
    end
  end
end