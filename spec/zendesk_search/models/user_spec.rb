require "spec_helper"

RSpec.describe ZendeskSearch::User do
  let(:user) { create(:user, _id: 1, organization_id: 100) }
  let(:organization) { create(:organization, _id: 100) }
  let(:organizations) { ZendeskSearch::Organizations.new([organization]) }
  let(:ticket_0) { create(:ticket, subject: "Ticket 0", submitter_id: 1) }
  let(:ticket_1) { create(:ticket, subject: "Ticket 1", submitter_id: 2) }
  let(:tickets) { ZendeskSearch::Tickets.new([ticket_0, ticket_1]) }


  before do
    allow(ZendeskSearch::Organization).to receive(:all).and_return(organizations)
    allow(ZendeskSearch::Ticket).to receive(:all).and_return(tickets)
  end

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
      it "returns the related organization" do
        expect(user.organization._id).to eq(100)
      end
    end

    context "when user doesn't belong to any organization" do
      let(:organization) { create(:organization, _id: 300) }

      it 'will return nil' do
        expect(user.organization).to be_nil
      end
    end
  end

  describe '#tickets' do
    context 'when user has many tickets' do
      it 'will return realated tickets' do
        expect(user.tickets.map(&:subject)).to eq ["Ticket 0"]
      end
    end

    context 'when user has no ticket' do
      let(:user) { create(:user, _id: 5) }

      it 'will return empty list' do
        expect(user.tickets).to be_empty
      end
    end
  end
end
