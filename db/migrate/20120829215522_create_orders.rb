class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :amount
      t.string :shipping_address
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
