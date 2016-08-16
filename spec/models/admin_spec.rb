require 'rails_helper'

RSpec.describe Admin, type: :model do

  it{ is_expected.to validate_presence_of(:username) }
  it{ is_expected.to validate_presence_of(:password) }
  it{ is_expected.to validate_presence_of(:password_confirmation) }

end
