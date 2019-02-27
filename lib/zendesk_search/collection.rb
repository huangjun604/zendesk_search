module ZendeskSearch
  class Collection
    include Enumerable

    def initialize resources=[]
      @resources ||= resources
    end

    def each(&block)
      @resources.each(&block)
    end

    def where(attr, value)
      find_all do |resource|
        resource[attr].to_s == value.to_s || (resource[attr].class == Array && resource[attr].include?(value))
      end
    end

    def find_by(attr, value)
      where(attr, value).first
    end
  end
end
