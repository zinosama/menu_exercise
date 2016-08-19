require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  describe "GET new" do
    it "gets form for new admin" do
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:admin)).to be_present
    end
  end

  describe "POST create" do
    it "creates new admin" do
      post :create, admin: { username: "zino", password: "dasda", password_confirmation: "dasda" }
      expect(response).to redirect_to(root_path)
      expect(assigns(:admin).username).to eq("zino")
    end

    it "goes back to the form on failure" do 
      post :create, admin: { username: "", password: "", password_confirmation: "" }
      expect(response).to render_template(:new)
      expect(assigns(:admin)).to be_present
    end
  end

end
