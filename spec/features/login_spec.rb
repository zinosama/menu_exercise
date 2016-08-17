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
			visit login_path
			fill_in "session[username]", with: "zino"
			fill_in "session[password]", with: "dasda"

			admin_stub = instance_double(Admin)
			expect(admin_stub).to receive(:authenticate).and_return(true)
			expect(admin_stub).to receive(:id).and_return(123)
			expect(admin_stub).to receive(:username).at_least(:twice).and_return("zino")
			expect(Admin).to receive(:find_by).at_least(:twice).and_return(admin_stub)

			click_on("commit")
			current_path.should eq(items_path)
			expect(page).to have_selector(".ui.success.message", count: 1)
			expect(page).to have_selector("#username", count: 1)
		end
	end
end