class Selection < ActiveRecord::Base
	belongs_to :item

	validates :item, presence: true

	def self.generate_owner_hash
		SecureRandom.urlsafe_base64
	end

	def self.calculate_sum(selections)
		selections.to_a.map(&:item).sum(&:price).round(2)
	end
end
