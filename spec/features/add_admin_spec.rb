require 'rails_helper' 

RSpec.describe "Sign Up" do
	describe "new admin page" do
		it "displays registration form" do
			visit signup_path
			fill_in "Username"						 , with: "Zino"
			fill_in "Password"						 , with: "dasda" 
			fill_in "Password Confirmation", with: "dasda"
			click_on("Register")
		end
	end
end