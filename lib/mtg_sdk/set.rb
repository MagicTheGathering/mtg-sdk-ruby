require_relative 'representers/set_representer'
require_relative 'card'
require_relative 'rest_client'

module MTG
  class Set
    include Roar::JSON
    include SetRepresenter
    include RestClient
  
    attr_accessor :code, :name, :type, :border, :mkm_id, :mkm_name,
                  :release_date, :gatherer_code, :magic_cards_info_code, :booster,
                  :old_code, :block, :online_only

    # Get the resource string
    #
    # @return [string] The API resource string
    def self.Resource
      "sets"
    end

    # Find a single set by the set code
    #
    # @param code [String] the Set code
    # @return [Set] a Set object
    def self.find(code)
      QueryBuilder.new(Set).find(code)
    end
    
    # Get all sets from a query
    #
    # @return [Array<Set>] Array of Set objects
    def self.all
      QueryBuilder.new(Set).all
    end
    
    # Generate a booster pack for a specific set
    
    # @param code [String] the Set code
    # @return [Array<Card>] Array of Card objects
    def self.generate_booster(code)
      cards = []
      response = RestClient.get("sets/#{code}/booster")
      data = response.body['cards']
      
      data.each do |card|
        cards << Card.new.from_json(card.to_json)
      end
      
      cards
    end
  end
end
