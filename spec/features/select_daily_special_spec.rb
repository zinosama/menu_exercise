RSpec.describe "Select Daily Special" do
  describe "cannot select on the wrong date" do
    before do
      @item = Item.create(name: "item1", price: 1.34, special_date: Time.now.utc.in_time_zone("Central Time (US & Canada)").strftime("%w").to_i + 1)
      visit items_path
    end

    it "fails with flash msg" do
      click_on "item_#{@item.id}_add"
      expect(page).to have_selector(".ui.error.message", count: 1)
      expect(page).to have_selector(".column#menu .header", :text=> @item.name.capitalize)
    end
  end

  describe "can select on the right date" do
    before do
      @item = Item.create(name: "item1", price: 1.34, special_date: Time.now.utc.in_time_zone("Central Time (US & Canada)").strftime("%w").to_i)
      visit items_path
    end

    it "succeeds with flash msg" do
      click_on "item_#{@item.id}_add"
      expect(page).to have_selector(".ui.success.message", count: 1)
      expect(page).to have_selector(".column#selection .header", :text=> @item.name.capitalize)
    end
  end
end