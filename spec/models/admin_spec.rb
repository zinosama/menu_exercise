require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin){Admin.new(username:'name', password:'password', password_confirmation:'password')}

  it "should be valid" do
  	expect(admin.valid?).to be_truthy
  end

  it "should have a username" do
  	admin.username = ""
  	expect(admin.valid?).to be_falsy
  end

  it "should have a password" do 
  	admin.password 				= ""
  	admin.password_confirmation = ""
  	expect(admin.valid?).to be_falsy
  end
  
end
