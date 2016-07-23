class CreateRetailStores < ActiveRecord::Migration
  def change
    create_table :retail_stores do |t|
      t.string :name
      t.boolean :wheelchair_accessible

      t.timestamps null: false
    end
  end
end
