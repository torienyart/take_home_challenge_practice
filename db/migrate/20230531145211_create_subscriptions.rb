class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :status, default: 0
      t.integer :frequency_in_days

      t.references :tea

      t.timestamps
    end
  end
end
