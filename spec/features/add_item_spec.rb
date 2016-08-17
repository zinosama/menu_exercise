RSpec.describe "New Item" do
	describe "displays error when invalid" do
		visit new_item_path
		fill_in "item[name]", with: ""
		fill_in "item[price]", with: ""
		click_on "commit"

		expect(page).to have_selector(".list li", count: 2)
	end

	describe "redirects and flashes when valid" do
		visit new_item_path
		fill_in "item[name]", with: "item1" 
		fill_in "item[price]", with: 1.23
		click_on "commit"

		current_path.should eq(items_path)
		expect(page).to have_selector(".ui.success.message", count: 1)
	end
end