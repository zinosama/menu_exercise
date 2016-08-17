RSpec.describe "Log Out" do

	describe "delete session" do
		it "redirects and flashes" do
			#login TODO: remove this section
			visit login_path
			fill_in "session[username]", with: "zino"
			fill_in "session[password]", with: "dasda"

			admin_stub = instance_double(Admin)
			expect(admin_stub).to receive(:authenticate).and_return(true)
			expect(admin_stub).to receive(:id).and_return(123)
			expect(admin_stub).to receive(:username).at_least(:twice).and_return("zino")
			expect(Admin).to receive(:find_by).at_least(:twice).and_return(admin_stub)

			click_on("Log In")

			#logout
			click_on("Log Out")
			expect(page).to have_selector(".ui.success.message", count: 1)
			expect(page).to have_selector("#username", count: 0)
		end
	end
end 