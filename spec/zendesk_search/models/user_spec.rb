require "spec_helper"

RSpec.describe ZendeskSearch::User do

  describe '#initalize' do
    let(:user) { ZendeskSearch::User.new({ name: 'Stephen', age: '30' }) }

    it 'create a user by json' do
      expect(user.name).to eq('Stephen')
      expect(user.age).to eq('30')
    end
  end

  describe "#all" do
    it "loads a user collection from json file" do
      expect(ZendeskSearch::User.all).to be_a_kind_of(ZendeskSearch::Users)
    end
  end

  describe '#organization' do
    context 'when user belongs to organization' do
      let(:user) { ZendeskSearch::User.find_by(:organization_id, 119) }

      it "returns the related organization" do
        expect(user.organization._id).to eq(119)
      end
    end

    context "when user doesn't belong to any organization" do
      let(:user) { ZendeskSearch::User.find_by("_id", 16) }
      
      it 'will return nil' do
        expect(user.organization).to be_nil
      end
    end
  end
end
