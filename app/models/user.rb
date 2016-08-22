class User 
  attr_reader :hash
  
  def initialize(session)
    session[:selection_owner_hash] ||= User.generate_owner_hash
    @hash = session[:selection_owner_hash]
  end

  def self.generate_owner_hash
    SecureRandom.urlsafe_base64
  end

  def self.find_session(session)
    User.new(session)
  end
end 