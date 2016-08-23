RSpec.describe User do 
  describe ".find_session" do

    context "when session doesn't contain user id" do
      let(:session) { Hash.new }
      it "user should have a new id" do
        expect(User.find_session(session).id).not_to eq("")
      end
    end

    context "when session contains user id" do
      let(:session) { { selection_owner_id: "abc" } }
      it "user should have the existing id" do
        expect(User.find_session(session).id).to eq("abc")
      end
    end

  end
end
