require "spec_helper"

RSpec.describe ZendeskSearch::Collection do
  describe "#find_by" do
    let(:user_0) { create(:user, _id: 1, name: 'User Zero', suspended: false, organization_id: 100) }
    let(:user_1) { create(:user, _id: 2, name: 'User One', suspended: true, organization_id: 101) }
    let(:user_2) { create(:user, _id: 3, name: 'User Two', organization_id: 100, tags: ['Kersey', 'Lucy']) }
    let(:users) { ZendeskSearch::Users.new([user_0, user_1, user_2]) }

    before do
      allow(ZendeskSearch::User).to receive(:all).and_return(users)
    end

    it "can search numbers" do
      user = users.find_by(:_id, '1')
      expect(user.name).to eq('User Zero')
    end

    it "can search strings" do
      user = users.find_by(:name, 'User One')
      expect(user._id).to eq(2)
    end

    it "can search booleans" do
      user = users.find_by(:suspended, 'true')
      expect(user.suspended).to be_truthy
    end

    it "can search arrays" do
      user = users.find_by(:tags, 'Kersey')
      expect(user.tags).to include('Kersey')
    end

    it "return nil if nothing find" do
      user = users.find_by(:name, 'Stephen')
      expect(user).to be_nil
    end
  end

  describe "#where" do
    let(:ticket_0) { create(:ticket, _id: '436bf9b0-1147-4c0a-8439-zero', subject: 'Ticket Zero', has_incidents: true, organization_id: 100, tags: ["Ohio", "Pennsylvania"]) }
    let(:ticket_1) { create(:ticket, _id: '436bf9b0-1147-4c0a-8439-one', subject: 'Ticket One', organization_id: 100, tags: ["Lucy", "Pennsylvania"]) }
    let(:ticket_2) { create(:ticket, subject: 'Ticket Two', has_incidents: true, organization_id: 101, tags: ["Ohio", "Lucy"]) }
    let(:tickets) { ZendeskSearch::Tickets.new([ticket_0, ticket_1, ticket_2]) }

    before do
      allow(ZendeskSearch::Ticket).to receive(:all).and_return(tickets)
    end

    it "can search numbers" do
      filtered_tickets = tickets.where(:organization_id, '100')
      expect(filtered_tickets.map(&:subject)).to eq(['Ticket Zero', 'Ticket One'])
    end

    it "can search strings" do
      filtered_tickets = tickets.where(:subject, 'Ticket Zero')
      expect(filtered_tickets.map(&:_id)).to eq(['436bf9b0-1147-4c0a-8439-zero'])
    end

    it "can search booleans" do
      filtered_tickets = tickets.where(:has_incidents, 'true')
      expect(filtered_tickets.map(&:subject)).to eq(['Ticket Zero', 'Ticket Two'])
    end

    it "can search arrays" do
      filtered_tickets = tickets.where(:tags, 'Pennsylvania')
      expect(filtered_tickets.map(&:subject)).to eq(['Ticket Zero', 'Ticket One'])
    end

    it "return nil if nothing find" do
      filtered_tickets = tickets.where(:subject, 'Stephen')
      expect(filtered_tickets).to be_empty
    end
  end
end
