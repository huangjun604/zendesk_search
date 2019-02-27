require "spec_helper"

RSpec.describe ZendeskSearch::Organization do
  describe '#users' do
    context 'when organization has many users' do
      let(:organization) { ZendeskSearch::Organization.find_by(:_id, 101) }

      it 'will return realated users' do
        expect(organization.users.map(&:name)).to eq ["Loraine Pittman", "Francis Bailey", "Haley Farmer", "Herrera Norman"]
      end
    end

    context 'when organization has no users' do
      let(:organization) { ZendeskSearch::Organization.find_by(:_id, 117) }

      it 'will return empty' do
        expect(organization.users).to be_empty
      end
    end
  end
end
