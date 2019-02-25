require "spec_helper"

RSpec.describe ZendeskSearch::User do

  describe '#initalize' do
    let(:user) { ZendeskSearch::User.new({ name: 'Stephen', age: '30' }) }

    it 'create a user by json' do
      expect(user.name).to eq('Stephen')
      expect(user.age).to eq('30')
    end
  end

  describe '#all' do
    let(:users) { ZendeskSearch::User.all }

    it 'returns a list of users' do
      expect(users).to be_a_kind_of(Array)
      expect(users).to all(be_an(ZendeskSearch::User))
    end
  end

  describe '#find_by' do

  end
end
