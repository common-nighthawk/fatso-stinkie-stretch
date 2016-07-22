class CreateRetails < ActiveRecord::Migration
  def change
    create_table :retails do |t|
      t.string :name
      t.boolean :wheelchair_accessible

      t.timestamps null: false
    end
  end
end
