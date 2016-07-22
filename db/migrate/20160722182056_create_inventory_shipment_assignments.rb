class CreateInventoryShipmentAssignments < ActiveRecord::Migration
  def change
    create_table :inventory_shipment_assignments do |t|
      t.integer :inventory_id
      t.integer :shipment_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
