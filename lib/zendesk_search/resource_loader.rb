module ZendeskSearch
  class ResourceLoader
    def initialize(resource_name)
      @resource_name = resource_name
    end

    def load
      data = File.read(source_path)
      resources = JSON.parse(data, object_class: ZendeskSearch.const_get(@resource_name))
      ZendeskSearch.const_get("#{@resource_name}s").new(resources)
    rescue Errno::ENOENT
      puts "File #{source_path} does not exists, please check and run again!"
      exit(0)
    rescue JSON::ParserError
      puts "File #{source_path} does not have correct format, please check and run again!"
      exit(0)
    rescue StandardError => e
      puts e.message
      exit(0)
    end

    private

    def source_path
      File.join(File.dirname(__FILE__), "/data/#{@resource_name.downcase}s.json")
    end
  end
end
