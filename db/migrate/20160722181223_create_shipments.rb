class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :warehouse_id
      t.date :expected_departure_date
      t.date :actual_departure_date

      t.timestamps null: false
    end
  end
end
