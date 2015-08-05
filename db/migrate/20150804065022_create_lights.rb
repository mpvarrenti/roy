class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :name
      t.integer :watts
      t.decimal :price

      t.timestamps null: false
    end
  end
end
