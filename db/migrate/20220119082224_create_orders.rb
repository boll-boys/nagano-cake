class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :payment_method
      t.integer :total_payment
      t.string :name
      t.string :adress
      t.string :postal_code
      t.integer :status

      t.timestamps
    end
  end
end
