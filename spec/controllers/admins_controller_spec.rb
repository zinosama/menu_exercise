require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
	describe "GET new" do
		it "gets form for new admin" do
			get :new
			expect(response).to render_template(:new)
			expect(assigns(:admin)).to be_present
		end
	end
end
