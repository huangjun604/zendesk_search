module ZendeskSearch
  class Collection
    include Enumerable

    def initialize resources=[]
      @resources ||= resources
    end

    def each(&block)
      @resources.each(&block)
    end

    def find_by(attr, value)
      find do |resource|
        resource[attr].to_s == value.to_s || (resource[attr].class == Array && resource[attr].include?(value))
      end
    end
  end
end
