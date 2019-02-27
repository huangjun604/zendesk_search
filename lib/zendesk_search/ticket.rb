module ZendeskSearch
  class Ticket < Base
    attributes :_id, :url, :external_id, :created_at, :type, :subject, :description, :priority, :status,
               :submitter_id, :assignee_id, :organization_id, :tags, :has_incidents, :due_at, :via
    collection 'Tickets'

    def organization
      Organization.find_by(:_id, organization_id)
    end

    def submitter
      User.find_by(:_id, submitter_id)
    end

    def assignee
      User.find_by(:_id, assignee_id)
    end

    def association_rows
      rows = []
      rows << ["organization_name", organization.name] if organization
      rows << ["submitter_name", submitter.name] if submitter
      rows << ["assignee_name", assignee.name] if assignee
      rows
    end
  end
end
