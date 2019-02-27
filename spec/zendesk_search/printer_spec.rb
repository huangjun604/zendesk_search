require "spec_helper"

RSpec.describe ZendeskSearch::Printer do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:cli) { HighLine.new(input, output) }
  let(:printer) { ZendeskSearch::Printer.new(cli) }

  describe "#print_resource_table" do
    context "when resource is nil" do
      let(:resource) { nil }

      it "does not print" do
        printer.print_resource_table(resource)
        expect(output.string).to be_empty
      end
    end

    context "when resource is present" do
      let(:resource) { create(:user) }

      it "prints table" do
        printer.print_resource_table(resource)
        expect(output.string).to match(/Term/)
      end
    end
  end

  describe "#print_result" do
    context "when resource is nil" do
      let(:resource) { nil }
      it "prints when resource is nil" do
        printer.print_result(resource)
        expect(output.string).to eq("No result found\n")
      end
    end

    context "when resource is present" do
      let(:resource) { create(:user) }

      it "does not print" do
        printer.print_result(resource)
        expect(output.string).to be_empty
      end
    end
  end

  describe "#print_searchable_fields" do
    let(:resource_name) { 'User' }

    it "print list of attributes name" do
      printer.print_searchable_fields(resource_name)
      expect(output.string).to match(/external_id/)
    end
  end
end
