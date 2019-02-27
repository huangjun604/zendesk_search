require "spec_helper"

RSpec.describe ZendeskSearch::Collection do
  describe "#find_by" do
    let(:users) { ZendeskSearch::User.all }

    it "can search numbers" do
      user = users.find_by(:_id, '1')
      expect(user._id).to eq(1)
    end

    it "can search strings" do
      user = users.find_by(:name, 'Cross Barlow')
      expect(user.name).to eq('Cross Barlow')
    end

    it "can search booleans" do
      user = users.find_by(:suspended, 'true')
      expect(user.suspended).to be_truthy
    end

    it "can search arrays" do
      user = users.find_by(:tags, 'Kersey')
      expect(user.tags).to include('Kersey')
    end

    it "return nil if nothing find" do
      user = users.find_by(:name, 'Stephen')
      expect(user).to be_nil
    end
  end
end
