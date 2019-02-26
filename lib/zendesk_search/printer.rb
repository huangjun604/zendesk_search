module ZendeskSearch
  class Printer
    attr_reader :cli

    def initialize(cli)
      @cli = cli
    end

    def print_resource_table(resource)
      rows = resource.each_pair.to_a
      table = Terminal::Table.new rows: rows, headings: ['Term', 'Value']
      cli.say table
    end

    def print_result(resource)
      cli.say("No result found") if resource.empty?
    end

    def print_searchable_fields(resource_name)
      print_separator
      cli.say("<%= color('Search #{resource_name} with', BOLD) %>")

      resource_class = ZendeskSearch.const_get(resource_name)
      resource_class.attribute_names.each do |attribute_name|
        cli.say attribute_name
      end
    end

    private

    def print_separator
      cli.say("----------------------------------------------")
    end
  end
end
