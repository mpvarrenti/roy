class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :building, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
