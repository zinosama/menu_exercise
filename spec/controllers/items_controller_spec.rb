require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET new" do
    it "redirects when not logged in" do
      get :new
      expect(response).to redirect_to(login_path)
    end

    it "get form for new item when logged in" do
      session[:admin_id] = "123"
      allow(Admin).to receive(:find_by).with( { id: "123" } ).and_return(true)

      get :new
      expect(response).to render_template(:new)
      expect(assigns(:item)).to be_present
    end
  end

  describe "POST create" do
    it "redirects when not logged in" do
      post :create, item: { name: "item1", price: 1.2 }
      expect(response).to redirect_to(login_path)
    end

    it "creates new item when valid" do
      session[:admin_id] = "123"
      allow(Admin).to receive(:find_by).with( { id: "123" } ).and_return(true)

      post :create, item: { name: "item1", price: 1.2 }
      expect(response).to redirect_to(items_path)
      expect(assigns(:item).name).to eq("item1")
    end

    it "returns to new item form when invalid" do
      session[:admin_id] = "123"
      allow(Admin).to receive(:find_by).with( { id: "123" } ).and_return(true)

      post :create, item: { name: "", price: "" }
      expect(response).to render_template(:new)
      expect(assigns(:item)).to be_present
    end
  end
end
