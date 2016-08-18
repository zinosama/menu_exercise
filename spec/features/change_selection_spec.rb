RSpec.describe "Change Selection" do
	describe "Adding item to selection" do
		before do
			create_item_and_visit_root
		end
		
		it "item in menu & not in selection" do
			expect(page).to have_no_selector(".column#selection .header", :text=> @item.name.capitalize)
			expect(page).to have_selector("#item_#{@item.id}", :text=> @item.name.capitalize, count: 1)
		end

		it "redirects and flashes" do
			click_on "item_#{@item.id}_add"
			expect(current_path).to eq(root_path)
			expect(page).to have_selector(".ui.success.message", count: 1)
		end

		it "item in selection & not in menu" do
			click_on "item_#{@item.id}_add"
			selection = Selection.find_by(item_id: @item.id)
			expect(page).to have_no_selector("#item_#{@item.id}")
			expect(page).to have_selector("#selection_#{selection.id}", :text=> @item.name.capitalize, count: 1)
		end
	end

	describe "Removing item from selection" do
		before do
			create_item_and_visit_root
			click_on "item_#{@item.id}_add"
			@selection = Selection.find_by(item_id: @item.id)
		end

		it "item in selection & not in menu" do
			expect(page).to have_no_selector("#item_#{@item.id}")
			expect(page).to have_selector("#selection_#{@selection.id}", :text=> @item.name.capitalize, count: 1)
		end

		it "redirects and flashes" do
			click_on "selection_#{@selection.id}_remove"
			expect(current_path).to eq(root_path)
			expect(page).to have_selector(".ui.success.message", count: 1)
		end

		it "item in menu & not in selection" do
			click_on "selection_#{@selection.id}_remove" 
			expect(page).to have_no_selector("#selection_#{@selection.id}")
			expect(page).to have_selector("#item_#{@item.id}", :text=> @item.name.capitalize, count: 1)
		end
	end

	describe "Can't see our users' selections" do
		before do
			@item = Item.create(name: "item1", price: 1.23)
			@selection = Selection.create(item_id: @item.id, owner_hash: "abc")
		end

		it "sees nothing in selection" do
			visit items_url
			expect(page).to have_no_selector("#selection_#{@selection.id}")
		end
	end

end