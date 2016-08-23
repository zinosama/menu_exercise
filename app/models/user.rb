class User 
  attr_reader :id
  
  def initialize(id)
    @id = id
  end

  def self.generate_owner_id
    SecureRandom.urlsafe_base64
  end

  def self.find_session(session)
    session[:selection_owner_id] ||= User.generate_owner_id
    User.new(session[:selection_owner_id])
  end
end 
