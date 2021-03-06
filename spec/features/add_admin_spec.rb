require 'rails_helper' 

RSpec.describe "Sign Up" do
  describe "create admin page" do
    it "displays error msgs when invalid" do
      visit signup_path
      fill_in "admin[username]"            , with: ""
      fill_in "admin[password]"            , with: "" 
      fill_in "admin[password_confirmation]", with: ""
      click_on("Register")
      expect(page).to have_selector(".list li", count: 2)
    end

    it "displays flash msg when valid" do
      visit signup_path
      fill_in "admin[username]"            , with: "zino"
      fill_in "admin[password]"            , with: "dasda" 
      fill_in "admin[password_confirmation]", with: "dasda"
      click_on("Register")
      expect(page).to have_selector(".ui.success.message", count: 1)
    end
  end

  describe "login after signup" do
    before do
      visit signup_path
      fill_in "admin[username]"            , with: "zino"
      fill_in "admin[password]"            , with: "dasda" 
      fill_in "admin[password_confirmation]", with: "dasda"
      click_on("Register")
    end

    it "should automatically login" do
      expect(current_path).to eq(root_path)
      expect(page).to have_selector("#username")
    end
  end

end