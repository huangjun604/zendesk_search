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
require "zendesk_search/models/users"
require "zendesk_search/models/organizations"
require "zendesk_search/models/tickets"

require "zendesk_search/base"
require "zendesk_search/models/user"
require "zendesk_search/models/organization"
require "zendesk_search/models/ticket"


module ZendeskSearch
  class Error < StandardError; end
  # Your code goes here...
end
