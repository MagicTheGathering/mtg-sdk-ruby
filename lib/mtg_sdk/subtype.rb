require_relative 'rest_client'
require_relative 'resource'

module MTG
  class Subtype < Resource
    include RestClient
    
    # Get all subtypes
    #
    # @return [Array<String>]  All subtypes
    def self.all
      RestClient.get('subtypes').body['subtypes']
    end
  end
end