class Admin < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, allow_nil: true
end
