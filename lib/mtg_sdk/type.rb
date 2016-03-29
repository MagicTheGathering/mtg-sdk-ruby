module MTG
  class Type
    include RestClient
    
    # Get all types
    #
    # @return [Array<String>]  All types
    def self.all
      RestClient.get('types').body['types']
    end
  end
end