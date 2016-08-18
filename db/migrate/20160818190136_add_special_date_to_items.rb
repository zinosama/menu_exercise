class AddSpecialDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :special_date, :integer
  end
end
