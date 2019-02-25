require "spec_helper"

RSpec.describe ZendeskSearch::User do

  describe '#initalize' do
    let(:user) { ZendeskSearch::User.new({ name: 'Stephen', age: '30' }) }

    it 'create a user by json' do
      expect(user.name).to eq('Stephen')
      expect(user.age).to eq('30')
    end
  end
end
