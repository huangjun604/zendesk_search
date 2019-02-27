require 'ostruct'
require 'json'
require 'byebug'
require 'highline'
require 'terminal-table'

require "zendesk_search/version"
require "zendesk_search/cli"
require "zendesk_search/printer"
require "zendesk_search/resource_loader"

require "zendesk_search/collection"
require "zendesk_search/users"
require "zendesk_search/organizations"

require "zendesk_search/base"
require "zendesk_search/user"
require "zendesk_search/organization"


module ZendeskSearch
  class Error < StandardError; end
  # Your code goes here...
end
