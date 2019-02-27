module ZendeskSearch
  class Organization < Base
    attributes :_id, :url, :external_id, :name, :domain_names, :created_at, :details, :shared_tickets, :tags

    def users
      User.where(:organization_id, _id)
    end

    def tickets
      Ticket.where(:organization_id, _id)
    end

    def association_rows
      rows = []
      users.each_with_index do |user, index|
        rows << ["user_#{index}", user.name]
      end
      tickets.each_with_index do |ticket, index|
        rows << ["ticket_#{index}", ticket.subject]
      end
      rows
    end
  end
end
