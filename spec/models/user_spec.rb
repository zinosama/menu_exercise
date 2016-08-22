RSpec.describe User do 
  describe ".find_session" do

    context "when session doesn't contain user hash" do
      let(:session){ Hash.new }
      it "user should have a new hash" do
        expect(User.find_session(session).hash).not_to eq("")
      end
    end

    context "when session contains user hash" do
      let(:session){ { :selection_owner_hash => "abc" } }
      it "user should have the existing hash" do
        expect(User.find_session(session).hash).to eq("abc")
      end
    end

  end
end