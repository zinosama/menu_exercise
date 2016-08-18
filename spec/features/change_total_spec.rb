RSpec.describe "Change Total" do
	describe "before tip" do
		before do
			@item = Item.create(name: "item1", price: 1.23) 
			visit items_path
			click_on "item_#{@item.id}_add"
		end

		it "has correct total" do
			expect(page).to have_selector("span#total", :text=>"1.23", count: 1)
		end
	end

	describe "adding tip" do
		before do
			create_and_select_item
		end

		it "adds tip correctly" do
			click_on "10%"
			expect(page).to have_selector("span#total", :text=>"1.35", count: 1)
		end
	end

	describe "Removing tip" do
		before do
			create_and_select_item
			click_on "10%"
		end

		it "removes tip correctly" do
			click_on "removeTipButton"
			expect(page).to have_selector("span#total", :text=>"1.23", count: 1)
		end
	end
end