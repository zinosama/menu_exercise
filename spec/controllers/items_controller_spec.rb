require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	describe "GET new" do
		it "get form for new item" do
			get :new
			expect(page).to render_template(:new)
			expect(assigns(:item)).to be_present
		end
	end

	describe "POST create" do
		it "creates new item when valid" do
			post :create, item:{ name: "item1", price: 1.2 }
			expect(page).to redirect_to(items_path)
			expect(assigns(:item).name).to eq("item1")
		end

		it "returns to new item form when invalid" do
			post :create, item:{ name: "", price: "" }
			expect(page).to render_template(:new)
			expect(assigns(:item)).to be_present
		end
	end
end
