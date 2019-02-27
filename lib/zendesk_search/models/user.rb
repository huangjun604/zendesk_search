module ZendeskSearch
  class User < Base
    attributes :_id, :url, :external_id, :name, :alias, :created_at, :active, :verified, :shared, :locale, :timezone,
               :last_login_at, :email, :phone, :signature, :organization_id, :tags, :suspended, :role
    collection 'Users'

    def organization
      Organization.find_by(:_id, organization_id)
    end

    def tickets
      Ticket.where(:submitter_id, _id)
    end

    def association_rows
      rows = []
      rows << ["organization_name", organization.name] if organization
      tickets.each_with_index do |ticket, index|
        rows << ["ticket_#{index}", ticket.subject]
      end
      rows
    end
  end
end
