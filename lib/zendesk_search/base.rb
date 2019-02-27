module ZendeskSearch
  class Base < OpenStruct

    def self.all
      @resources ||= ResourceLoader.new(class_name).load
    end

    def self.find_by(attr, value)
      all.find_by(attr, value)
    end

    def self.attributes(*args)
      @attribute_names ||= args
    end

    def self.attribute_names
      @attribute_names
    end

    def self.collection(collection_name)
      @collection_name = collection_name
    end

    def self.collection_name
      @collection_name
    end

    def rows
      each_pair.to_a
    end

    def association_rows
      []
    end

    private

    def self.class_name
      self.name.split("::").last
    end
  end
end
