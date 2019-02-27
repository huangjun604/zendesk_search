require "spec_helper"

RSpec.describe ZendeskSearch::ResourceLoader do
  describe "load" do
    let(:resource_loader) { ZendeskSearch::ResourceLoader.new('User') }
    it "loads the resource from json file" do
      expect(resource_loader.load).to be_a_kind_of(ZendeskSearch::Users)
    end
  end
end
