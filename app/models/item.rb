class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true

	has_many :selections

	def self.group_by_category(items)
		items.group_by{ |item| item.category }
	end
end
