require "spec_helper"

RSpec.describe ZendeskSearch::Users do

  describe "#load" do
    it "loads a user collection from json file" do
      expect(ZendeskSearch::Users.load).to be_a_kind_of(ZendeskSearch::Users)
    end
  end


  describe "#find_by" do
    let(:users) { ZendeskSearch::Users.load }

    it "can find user by _id" do
      user = users.find_by(:_id, 1)
      expect(user._id).to eq(1)
    end

    it "can find user by name" do
      user = users.find_by(:name, 'Cross Barlow')
      expect(user.name).to eq('Cross Barlow')
    end

    it "return nil if nothing find" do
      user = users.find_by(:name, 'Stephen')
      expect(user).to be_nil
    end
  end
end
