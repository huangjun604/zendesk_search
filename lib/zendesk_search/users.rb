module ZendeskSearch

  class Users
    include Enumerable

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
      find { |user| user[attr] == value }
    end

    private

    def self.source_path
      File.join(File.dirname(__FILE__), "/data/users.json")
    end
  end
end
