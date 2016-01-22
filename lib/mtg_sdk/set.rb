require_relative 'representers/set_representer'
require_relative 'card'
require_relative 'resource'

module MTG
  class Set < Resource
    include Roar::JSON
    include SetRepresenter
    include RestClient
  
    attr_accessor :code, :name, :type, :border, :mkm_id, :mkm_name,
                  :release_date, :gatherer_code, :magic_cards_info_code, :booster,
                  :old_code, :block, :online_only

    # Find a single set by the set code
    #
    # @param code [String] the Set code
    # @return [Set] a Set object
    def self.find(code)
      response = RestClient.get("sets/#{code}")
      
      if response.body['set'].nil?
        raise ArgumentError, 'Set not found'
      end
      
      new.from_json(response.body['set'].to_json)
    end
    
    # Get all sets from a query
    #
    # @return [Array<Set>] Array of Set objects
    def self.all
      get
    end
    
    # Generate a booster pack for a specific set
    #
    # @param code [String] the Set code
    # @return [Array<Card>] Array of Card objects
    def self.generate_booster(code)
      cards = []
      response = RestClient.get("sets/#{code}/booster")
      data = response.body['cards']
      
      data.each do |card|
        cards << Card.new.from_json(card.to_json)
      end
      
      @query = nil
      cards
    end
    
    # Execute a query and convert the response
    # into a list of Set objects
    #
    # @return [Array<Set>] Array of Set objects
    def self.get
      sets = []
      response = RestClient.get('sets', query[:parameters])
      data = response.body['sets']
      
      data.each do |set|
        sets << new.from_json(set.to_json)
      end
      
      @query = nil
      sets
    end
  end
end
