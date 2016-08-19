RSpec.describe "Log In" do 

	describe "create session" do
		it "displays error msgs when invalid" do
			visit login_path
			fill_in "session[username]", with: ""
			fill_in "session[password]", with: ""
			click_on("commit")
			expect(page).to have_selector(".ui.error.message", count: 1)
		end

		it "redirects and flashes when valid" do
			Admin.create(username: "zino", password: "dasda", password_confirmation: "dasda")
		
			log_in_as("zino", "dasda")

			expect(current_path).to eq(root_path)
			expect(page).to have_selector(".ui.success.message", count: 1)
			expect(page).to have_selector("#username", count: 1)
		end
	end
end