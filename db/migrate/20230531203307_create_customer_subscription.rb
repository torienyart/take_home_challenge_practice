class CreateCustomerSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_subscriptions do |t|
      t.references :subscription
      t.references :customer

      t.timestamps
    end
  end
end
