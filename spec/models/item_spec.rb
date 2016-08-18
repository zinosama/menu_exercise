require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "should have name and price" do
	  it{ should validate_presence_of(:name) }
	  it{ should validate_presence_of(:price) }
	end

	describe "should downcase category" do
		it "performs downcases when category is provided" do
			item = Item.create(name: "item1", price: 1.23, category: "ABC")
			expect(item.category).to eq("abc")
		end

		it "does not raise error when category is not provided" do
			expect{Item.create(name: "item1", price: 1.23)}.to_not raise_error
		end
	end
end

