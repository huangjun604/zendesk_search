module ZendeskSearch
  class CLI
    SEARCHABLE_RESOURCES = %w(User)

    def initialize
      @cli = HighLine.new
      @printer = Printer.new(@cli)
    end

    def run
      @cli.say("Welcome to Zendesk Search!")
      loop do
        exit_or_continue
        select_search_options
      end
    end

    private

    def exit_or_continue
      answer = @cli.ask "Type 'quit' to exit at any time, Press 'Enter' to continue"
      exit(0) if answer == 'quit'
    end


    def select_search_options
      case @cli.ask("Select search options
        * Press 1 to search Zendesk
        * Press 2 to view a list of searchable fields
        * Type 'quit' to exit", ['1', '2', 'quit'] )
      when 'quit'
        exit(0)
      when '1'
        search_zendesk
      when '2'
        view_searchable_fields
      end
    end


    def search_zendesk
      resource_class = select_resources
      term = enter_search_term(resource_class)
      value = enter_search_value

      @cli.say("Searching the <%= color('#{resource_class.to_s.downcase}', BOLD) %> for <%= color('#{term}', BOLD) %> with a value of <%= color('#{value}', BOLD) %>")

      resource = resource_class.find_by(term, value)

      @printer.print_resource_table(resource)
      @printer.print_result(resource)
    end


    def view_searchable_fields
      SEARCHABLE_RESOURCES.each do |resource_name|
        @printer.print_searchable_fields(resource_name)
      end
    end


    def select_resources
      options = []
      SEARCHABLE_RESOURCES.each_with_index do |resource_name, index|
        options << "#{index + 1}) #{resource_name}"
      end

      question = "Select " + options.join(' or ')
      answer_type = ('1'..SEARCHABLE_RESOURCES.length.to_s).to_a << 'quit'

      answer = @cli.ask(question, answer_type)

      exit(0) if answer == 'quit'

      ZendeskSearch.const_get SEARCHABLE_RESOURCES[answer.to_i - 1]
    end


    def enter_search_term(resource_class)
      @cli.ask("Enter search term", resource_class.attribute_names)
    end


    def enter_search_value
      @cli.ask("Enter search value")
    end
  end
end
