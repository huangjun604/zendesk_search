module ZendeskSearch
  class Users < Collection
    include Enumerable
    attributes :_id, :url, :external_id, :name, :alias, :created_at, :active, :verified, :shared, :locale, :timezone,
               :last_login_at, :email, :phone, :signature, :organization_id, :tags, :suspended, :role

    def self.load
      data = File.read(source_path)
      users = JSON.parse(data, object_class: OpenStruct)
      Users.new(users)
    end

    def initialize users=[]
      @users = users
    end

    def each(&block)
      @users.each(&block)
    end

    def find_by(attr, value)
      find { |user| user[attr].to_s == value }
    end

    private

    def self.source_path
      File.join(File.dirname(__FILE__), "/data/users.json")
    end
  end
end
