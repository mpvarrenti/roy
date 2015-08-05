class CreateOptionLights < ActiveRecord::Migration
  def change
    create_table :option_lights do |t|
      t.references :light, index: true, foreign_key: true
      t.belongs_to :option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
