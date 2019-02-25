module ZendeskSearch
  class User < OpenStruct

    def self.all
      data = File.read(source_path)
      JSON.parse(data).map { |object_json| self.new(object_json) }
    end

    private

    def self.source_path
      File.join(File.dirname(__FILE__), "/data/users.json")
    end
  end
end
