require 'ostruct'
require 'json'
require 'byebug'
require 'highline'
require 'terminal-table'

require "zendesk_search/version"
require "zendesk_search/cli"
require "zendesk_search/collection"
require "zendesk_search/users"
require "zendesk_search/user"


module ZendeskSearch
  class Error < StandardError; end
  # Your code goes here...
end
