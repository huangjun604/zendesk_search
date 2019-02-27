require "spec_helper"

RSpec.describe ZendeskSearch::Organization do
  let(:organization) { create(:organization, _id: 100) }
  let(:user_0) { create(:user, _id: 1, name: 'User Zero', organization_id: 100) }
  let(:user_1) { create(:user, _id: 2, name: 'User One', organization_id: 101) }
  let(:user_2) { create(:user, _id: 2, name: 'User Two', organization_id: 100) }
  let(:ticket_0) { create(:ticket, subject: 'Ticket Zero', organization_id: 100) }
  let(:ticket_1) { create(:ticket, subject: 'Ticket One', organization_id: 101) }
  let(:users) { ZendeskSearch::Users.new([user_0, user_1, user_2]) }
  let(:tickets) { ZendeskSearch::Tickets.new([ticket_0, ticket_1]) }

  before do
    allow(ZendeskSearch::User).to receive(:all).and_return(users)
    allow(ZendeskSearch::Ticket).to receive(:all).and_return(tickets)
  end

  describe '#users' do
    context 'when organization has users' do

      it 'will return realated users' do
        expect(organization.users.map(&:name)).to eq ["User Zero", "User Two"]
      end
    end

    context 'when organization has no users' do
      let(:organization) { create(:organization, _id: 102) }

      it 'will return empty' do
        expect(organization.users).to be_empty
      end
    end
  end

  describe '#tickets' do
    context 'when organization has tickets' do
      it 'will return realated tickets' do
        expect(organization.tickets.map(&:subject)).to eq ["Ticket Zero"]
      end
    end

    context 'when organization has no tickets' do
      let(:organization) { create(:organization, _id: 102) }
      
      it 'will return empty' do
        expect(organization.tickets).to be_empty
      end
    end
  end
end
