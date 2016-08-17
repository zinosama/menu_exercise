RSpec.describe "Log Out" do

	describe "delete session" do
		it "redirects and flashes" do
			Admin.create(username: "zino", password: "dasda", password_confirmation: "dasda")
			
			log_in_as("zino","dasda")

			visit root_url
			click_on("Log Out")
			expect(page).to have_selector(".ui.success.message", count: 1)
			expect(page).to have_selector("#username", count: 0)
		end
	end
end 