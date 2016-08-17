RSpec.describe "Log In" do 

	describe "create session page" do
		it "displays error msgs when invalid" do
			visit login_path
			fill_in "session[username]", with: ""
			fill_in "session[password]", with: ""
			click_on("Log In")
			expect(page).to have_selector(".ui.error.message.column", count: 1)
		end

		it "redirects and flashes when valid" do
			visit login_path
			fill_in "session[username]", with: "zino"
			fill_in "session[password]", with: "dasda"
			click_on("Log In")
			expect(page).to redirect_to(items_path)
		end
	end
end