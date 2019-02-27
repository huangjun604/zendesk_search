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
    let(:user) { ZendeskSearch::User.find_by(:organization_id, "119") }

    it 'return related organization' do
      expect(user.organization._id).to eq(119)
    end
  end
end
