require 'rails_helper'

RSpec.describe Selection, type: :model do
  describe "#self.calculate_sum" do
  	it "returns 0 when passed an empty array" do
  		expect(Selection.calculate_sum([])).to eq(0)
  	end

  	it "returns sum when passed an array of selections" do
  		item1 = double(price: 1.2)
  		item2 = double(price: 11.1)
  		sel1 = double(item: item1)
  		sel2 = double(item: item2)

  		expect(Selection.calculate_sum([sel1, sel2])).to eq(12.3)
  	end
  end
end
