RSpec.describe "New Item" do
  it "displays error when invalid" do
    visit new_item_path
    fill_in "item[name]", with: ""
    fill_in "item[price]", with: ""
    click_on "Create Item"

    expect(page).to have_selector(".list li", count: 2)
  end

  it "redirects and flashes when valid" do
    visit new_item_path
    fill_in "item[name]", with: "item1" 
    fill_in "item[price]", with: 1.23
    click_on "Create Item"

		expect(current_path).to eq(items_path)
		expect(page).to have_selector(".ui.success.message", count: 1)
	end

	it "should be default to not have a special date" do
		visit new_item_path
		fill_in	"item[name]", with: "item1"
		fill_in "item[price]", with: 1.24
		click_on "Create Item" 

		expect(page).to have_selector(".meta", :text => /^\$ 1.24$/, count: 1)
	end	

  it "should be default to not have a special date" do
    visit new_item_path
    fill_in "item[name]", with: "item1"
    fill_in "item[price]", with: 1.24
    click_on "Create Item" 

    expect(page).to have_selector(".meta", :text => /^\$ 1.24$/, count: 1)
  end 

end