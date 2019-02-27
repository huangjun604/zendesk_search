module ZendeskSearch
  class Organization < Base
    attributes :_id, :url, :external_id, :name, :domain_names, :created_at, :details, :shared_tickets, :tags
  end
end