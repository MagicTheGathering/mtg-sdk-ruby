require_relative 'rest_client'

module MTG
  class Resource
  
    # Get the hash of query parameters
    #
    # @return [Hash] query parameters
    def self.query
      @query ||= {:parameters => {}}
    end
  
    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [Resource] the Resource
    def self.where(args)
      query[:parameters].merge!(args)
      self
    end
    
  end
end