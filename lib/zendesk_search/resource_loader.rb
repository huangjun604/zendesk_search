module ZendeskSearch
  class ResourceLoader
    def initialize(resource_name)
      @resource_name = resource_name
    end

    def load
      puts "=========#{@resource_name}============="
      data = File.read(source_path)
      resources = JSON.parse(data, object_class: ZendeskSearch.const_get(@resource_name))
      ZendeskSearch.const_get("#{@resource_name}s").new(resources)
    end

    private

    def source_path
      File.join(File.dirname(__FILE__), "/data/#{@resource_name.downcase}s.json")
    end
  end
end
