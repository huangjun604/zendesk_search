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
          nil
        when '2'
          nil
        end
      end
    end
  end
end
