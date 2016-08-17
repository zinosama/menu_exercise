require 'rails_helper'

RSpec.describe Admin, type: :model do

  it{ should validate_presence_of(:username) }
  it{ should validate_presence_of(:password) }

  describe "username should be unique" do
    let(:admin) { Admin.create(username: "zino", password: "dasda", password_confirmation: "dasda") }
    it "should have unique username" do
      dup_admin = admin.dup
      expect(dup_admin.valid?).to be_falsy
    end
  end 
  

end
