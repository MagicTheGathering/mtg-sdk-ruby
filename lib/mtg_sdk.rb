require "mtg_sdk/version"
require "mtg_sdk/configuration"
require "mtg_sdk/card"
require "mtg_sdk/legality"
require "mtg_sdk/foreign_name"
require "mtg_sdk/ruling"
require "mtg_sdk/set"
require "mtg_sdk/type"
require "mtg_sdk/subtype"
require "mtg_sdk/supertype"
require "mtg_sdk/changelog"
require "mtg_sdk/rest_client"
require "mtg_sdk/query_builder"

module MTG
  API_URL = 'https://api.magicthegathering.io'

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end
end