require "spec_helper"

RSpec.describe ZendeskSearch::Ticket do

  describe '#organization' do
    context 'when tickets belongs to organization' do
      it "will return the related organization" do
        ticket = ZendeskSearch::Ticket.find_by("_id", "436bf9b0-1147-4c0a-8439-6f79833bff5b")
        expect(ticket.organization.name).to eq 'Zentry'
      end
    end

    context "when user doesn't belong to any organization" do
      it 'will return nil' do
        ticket = ZendeskSearch::Ticket.find_by("_id", "e68d8bfd-9826-42fd-9692-add445aa7430")
        expect(ticket.organization).to be_nil
      end
    end
  end

  describe '#submitter' do
    context 'when tickets submitted by user' do
      it "will return the related submitter" do
        ticket = ZendeskSearch::Ticket.find_by("_id", "436bf9b0-1147-4c0a-8439-6f79833bff5b")
        expect(ticket.submitter.name).to eq 'Elma Castro'
      end
    end
  end

  describe '#assignee' do
    context 'when tickets assigned to a user' do
      it "will return the related assignee" do
        ticket = ZendeskSearch::Ticket.find_by("_id", "436bf9b0-1147-4c0a-8439-6f79833bff5b")
        expect(ticket.assignee.name).to eq 'Harris Côpeland'
      end
    end

    context "when tickets don't assigned to a user" do
      it "will return nil" do
        ticket = ZendeskSearch::Ticket.find_by("_id", "e68d8bfd-9826-42fd-9692-add445aa7430")
        expect(ticket.assignee).to be_nil
      end
    end
  end
end
