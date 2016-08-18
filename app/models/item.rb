class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true
	before_save :downcase_category

	has_many :selections

	enum special_date: %i(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

	def self.group_by_category(items)
		items.group_by{ |item| item.category }
	end

	def currently_available?
		if special_date
			current_time = Time.now.utc.in_time_zone("Central Time (US & Canada)")
			special_date == current_time.strftime("%A")
		else 
			true
		end
	end

	private

		def downcase_category
			self.category.downcase! if category
		end	

end
