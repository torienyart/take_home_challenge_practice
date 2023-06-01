require "rails_helper"

RSpec.describe "Cancel Customer Subscription API", type: :request do
  before do
    @customer = Customer.create!(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St Denver, CO 80204")
    @tea = Tea.create!(title: "Green Tea", description: "Green Tea Description", temperature: 180, brew_time: 120)
    @subscription = Subscription.create!(title: "Green Tea Subscription", price: 10.00, frequency_in_days: 30, tea_id: @tea.id)
    @customer_subscription = CustomerSubscription.create!(customer_id: @customer.id, subscription_id: @subscription.id)
  end

  context "when successful" do
    it "returns the updated customer subscription" do
      params = {
        status: "cancelled"
      }
      patch "/api/v1/customers/#{@customer.id}/customer_subscriptions/#{@customer_subscription.id}", params: params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to be 200
      expect(json[:data][:attributes][:status]).to eq("cancelled")
      expect(json[:data][:attributes][:customer_id]).to eq(@customer.id)
      expect(json[:data][:attributes][:subscription_id]).to eq(@subscription.id)
    end

    it "can return an error message if the customersub doesn't exist" do
      params = {
        status: "cancelled"
      }

      patch "/api/v1/customers/#{@customer.id}/customer_subscriptions/54832059438689", params: params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(json[:errors]).to eq("Couldn't find CustomerSubscription with 'id'=54832059438689")
    end

    it "can return an error message if the update didn't work" do
      params = {
        status: "frozen"
      }

      patch "/api/v1/customers/#{@customer.id}/customer_subscriptions/#{@customer_subscription.id}", params: params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(json[:errors]).to eq("'frozen' is not a valid status")
    end
  end

end