# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@customer_1 = Customer.create!(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", address: "123 Main St Denver, CO 80204")
@customer_2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@gmail.com", address: "123 Main St Denver, CO 80204")
@customer_3 = Customer.create!(first_name: "Jimmy", last_name: "Doe", email: "jimmydoe@gmail.com", address: "123 Main St Denver, CO 80204")

@tea_1 = Tea.create!(title: "Green Tea", description: "Green Tea Description", temperature: 180, brew_time: 120)
@tea_2 = Tea.create!(title: "Black Tea", description: "Black Tea Description", temperature: 160, brew_time: 140)
@tea_3 = Tea.create!(title: "Rooibos Tea", description: "Rooibos Tea Description", temperature: 150, brew_time: 130)
@tea_4 = Tea.create!(title: "Sleepy Time Tea", description: "Sleepy Time Tea Description", temperature: 150, brew_time: 130)
@tea_5 = Tea.create!(title: "Matcha Tea", description: "Matcha Tea Description", temperature: 150, brew_time: 130)


@subscription_1 = Subscription.create!(title: "Green Tea Subscription", price: 10.00, frequency_in_days: 30, tea_id: @tea_1.id)
@subscription_2 = Subscription.create!(title: "Black Tea Subscription", price: 12.00, frequency_in_days: 15, tea_id: @tea_2.id)
@subscription_3 = Subscription.create!(title: "Rooibos Tea Subscription", price: 14.00, frequency_in_days: 30, tea_id: @tea_3.id)
@subscription_4 = Subscription.create!(title: "Sleepy Time Tea Subscription", price: 14.00, frequency_in_days: 30, tea_id: @tea_4.id)
@subscription_5 = Subscription.create!(title: "Matcha Tea Subscription", price: 17.00, frequency_in_days: 30, tea_id: @tea_5.id)

@customer_subscription_1 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_1.id)
@customer_subscription_2 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_2.id, status: 1)
@customer_subscription_3 = CustomerSubscription.create!(customer_id: @customer_1.id, subscription_id: @subscription_3.id)

@customer_subscription_4 = CustomerSubscription.create!(customer_id: @customer_2.id, subscription_id: @subscription_3.id)
