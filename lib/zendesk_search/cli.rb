module ZendeskSearch
  class CLI
    def initialize
      @cli = HighLine.new
    end

    def run
      @cli.say("Welcome to Zendesk Search!")
      loop do
        # Ask for continue
        answer = @cli.ask "Type 'quit' to exit at any time, Press 'Enter' to continue"
        exit(0) if answer == 'quit'

        # Ask for search or view terms
        case @cli.ask("Select search options
          * Press 1 to search Zendesk
          * Press 2 to view a list of searchable fields
          * Type 'quit' to exit", ['1', '2', 'quit'] )
        when 'quit'
          exit(0)
        when '1'
          search_zendesk
        when '2'
          nil
        end
      end
    end

    private

    def search_zendesk
      case @cli.ask("Select 1) Users", ['1', 'quit'])
      when 'quit'
        exit(0)
      when '1'
        resource_class = Users
      end

      term = @cli.ask("Enter search term") { |q| q.in = resource_class.attribute_names }
      value = @cli.ask("Enter search value")

      @cli.say("Searching the <%= color('#{resource_class.to_s.downcase}', BOLD) %> for <%= color('#{term}', BOLD) %> with a value of <%= color('#{value}', BOLD) %>")
      results = resource_class.load.find_by(term, value)

      if results.empty?
        @cli.say("No result found")
      else
        @cli.say("<%= color('#{results.size}', BOLD) %> results found")
      end
    end

    def view_searchable_fields
    end
  end
end
