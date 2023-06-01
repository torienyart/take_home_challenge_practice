class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.float :price
      t.integer :frequency_in_days

      t.references :tea

      t.timestamps
    end
  end
end
