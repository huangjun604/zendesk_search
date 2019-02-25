require "spec_helper"

RSpec.describe ZendeskSearch::Users do

  describe "#load" do
    it "loads a user collection from json file" do
      expect(ZendeskSearch::Users.load).to be_a_kind_of(ZendeskSearch::Users)
    end
  end


  describe "#find_by" do
    let(:users) { ZendeskSearch::Users.load }

    it "can search numbers" do
      results = users.find_by(:id, '1')
      expect(results.map(&:_id)).to all(eq(1))
    end

    it "can search strings" do
      results = users.find_by(:name, 'Cross Barlow')
      expect(results.map(&:name)).to all(eq('Cross Barlow'))
    end

    it "can search booleans" do
      results = users.find_by(:suspended, 'true')
      expect(results.map(&:suspended)).to all(be_truthy)
    end

    it "can search arrays" do
      results = users.find_by(:tags, 'Kersey')
      expect(results.map(&:tags)).to all(include('Kersey'))
    end

    it "return nil if nothing find" do
      user = users.find_by(:name, 'Stephen')
      expect(user).to be_empty
    end
  end
end
