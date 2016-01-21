require_relative 'rest_client'
require_relative 'resource'

module MTG
  class Type < Resource
    include RestClient
    
    # Get all types
    #
    # @return [Array<String>]  All types
    def self.all
      RestClient.get('types').body['types']
    end
  end
end