require_relative 'rest_client'
require_relative 'resource'

module MTG
  class Supertype < Resource
    include RestClient
    
    # Get all supertypes
    #
    # @return [Array<String>]  All supertypes
    def self.all
      RestClient.get('supertypes').body['supertypes']
    end
  end
end