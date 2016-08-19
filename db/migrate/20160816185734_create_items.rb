class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description
      t.string :category
      t.decimal :price, null: false

      t.timestamps null: false
    end
  end
end
