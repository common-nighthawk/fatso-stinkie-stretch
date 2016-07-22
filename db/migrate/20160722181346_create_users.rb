class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :type
      t.integer :location_id
      t.string :location_type

      t.timestamps null: false
    end
  end
end
