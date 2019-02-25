module ZendeskSearch
  class Collection

    def self.attributes *args
      @attribute_names ||= args
    end

    def self.attribute_names
      @attribute_names
    end
  end
end
