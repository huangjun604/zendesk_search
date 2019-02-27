require "spec_helper"

RSpec.describe ZendeskSearch::Ticket do
  let(:ticket) { create(:ticket, submitter_id: 1, assignee_id: 2, organization_id: 100) }
  let(:submitter) { create(:user, _id: 1, name: "Submitter") }
  let(:assignee) { create(:user, _id: 2, name: "Assignee") }
  let(:organization) { create(:organization, _id: 100, name: "Organization One") }
  let(:users) { ZendeskSearch::Users.new([submitter, assignee]) }
  let(:organizations) { ZendeskSearch::Users.new([organization]) }

  before {
    allow(ZendeskSearch::User).to receive(:all).and_return(users)
    allow(ZendeskSearch::Organization).to receive(:all).and_return(organizations)
  }

  describe '#organization' do
    context 'when tickets belongs to organization' do
      it "will return the related organization" do
        expect(ticket.organization.name).to eq 'Organization One'
      end
    end

    context "when user doesn't belong to any organization" do
      let(:ticket) { create(:ticket, organization_id: 101) }

      it 'will return nil' do
        expect(ticket.organization).to be_nil
      end
    end
  end

  describe '#submitter' do
    context 'when tickets submitted by user' do
      it "will return the related submitter" do
        expect(ticket.submitter.name).to eq 'Submitter'
      end
    end
  end

  describe '#assignee' do
    context 'when tickets assigned to a user' do
      it "will return the related assignee" do
        expect(ticket.assignee.name).to eq 'Assignee'
      end
    end

    context "when tickets don't assigned to a user" do
      let(:ticket) { create(:ticket, assignee_id: 3) }
      it "will return nil" do
        expect(ticket.assignee).to be_nil
      end
    end
  end
end
