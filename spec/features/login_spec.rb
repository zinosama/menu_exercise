RSpec.describe "Log In" do 

	describe "create session page" do
		it "displays error msgs when invalid" do
			visit login_path
			fill_in "session[username]", with: ""
			fill_in "session[password]", with: ""
			click_on("Log In")
			expect(page).to have_selector(".ui.error.message", count: 1)
		end

		it "redirects and flashes when valid" do
			visit login_path
			fill_in "session[username]", with: "zino"
			fill_in "session[password]", with: "dasda"

			admin_stub = instance_double(Admin)
			expect(admin_stub).to receive(:authenticate).and_return(true)
			expect(admin_stub).to receive(:id).and_return(123)
			expect(admin_stub).to receive(:username).and_return("zino")
			expect(Admin).to receive(:find_by).with(username: "zino").and_return(admin_stub)

			click_on("Log In")
			current_path.should eq(items_path)
			expect(page).to have_selector(".ui.success.message", count: 1)
		end
	end
end