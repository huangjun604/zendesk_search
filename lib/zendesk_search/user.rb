module ZendeskSearch
  class User < Base
    attributes :_id, :url, :external_id, :name, :alias, :created_at, :active, :verified, :shared, :locale, :timezone,
               :last_login_at, :email, :phone, :signature, :organization_id, :tags, :suspended, :role
    collection 'Users'

    def organization
      Organization.find_by(:_id, organization_id)
    end
  end
end
