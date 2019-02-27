require "spec_helper"

RSpec.describe ZendeskSearch::CLI do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:highline) { HighLine.new(input, output) }
  let(:cli) { ZendeskSearch::CLI.new }

  describe "#exit_or_continue" do

    context "when press Enter" do
      let(:input) { StringIO.new('Enter') }

      it "should print prompt message" do
        cli.instance_variable_set :@cli, highline
        cli.send(:exit_or_continue)
        expect(output.string).to eq("Type 'quit' to exit at any time, Press 'Enter' to continue\n")
      end
    end

    context "when type quit" do
      let(:input) { StringIO.new('quit') }

      it "should print prompt message and quit" do
        cli.instance_variable_set :@cli, highline
        expect { cli.send(:exit_or_continue) }.to raise_error(SystemExit)
        expect(output.string).to eq("Type 'quit' to exit at any time, Press 'Enter' to continue\nGood Bye!\n")
      end
    end
  end

  describe "#enter_search_term" do
    let(:resource_class) { ZendeskSearch::User }

    context "when enter valid term" do
      let(:input) { StringIO.new('_id') }


      it "should return term name" do
        cli.instance_variable_set :@cli, highline
        expect(cli.send(:enter_search_term, resource_class)).to eq(:_id)
        expect(output.string).to eq("Enter search term\n")
      end
    end
  end

  describe "#enter_search_value" do
    let(:resource_class) { ZendeskSearch::User }

    context "when enter valid term" do
      let(:input) { StringIO.new('\n') }

      it "should return term name" do
        cli.instance_variable_set :@cli, highline
        cli.send(:enter_search_value)
        expect(output.string).to eq("Enter search value\n")
      end
    end
  end
end
