class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :owner_hash, index: true, null: false

      t.references :item, index: true, null: false
      t.timestamps null: false
    end
  end
end
