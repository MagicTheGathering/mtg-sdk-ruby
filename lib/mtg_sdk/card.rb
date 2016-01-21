require_relative 'representers/card_representer'
require_relative 'resource'

module MTG
  class Card < Resource
    include Roar::JSON
    include CardRepresenter
    include RestClient
    
    attr_accessor :name, :layout, :names, :mana_cost, :cmc, :colors, :type, :supertypes, :subtypes, :types,
                  :rarity, :text, :flavor, :artist, :number, :power, :toughness, :loyalty, :multiverse_id, :variations,
                  :watermark, :border, :timeshifted, :hand, :life, :reserved, :release_date, :starter,
                  :rulings, :foreign_names, :printings, :original_text, :original_type, :legalities,
                  :source, :image_url, :set, :id
                
    # Find a single card by the card multiverse id
    #
    # @param id [Integer] the multiverse id
    # @return [Card] the Card object response
    def self.find(id)
      response = RestClient.get("cards/#{id}")
      
      if response.body['card'].nil?
        raise ArgumentError, 'Card not found'
      end
      
      new.from_json(response.body['card'].to_json)
    end
    
    # Execute a query and convert the response
    # into a list of Card objects
    #
    # @return [Array<Card>] Array of Card objects
    def self.get
      cards = []
      response = RestClient.get('cards', query[:parameters])
      data = response.body['cards']
      
      data.each do |card|
        cards << new.from_json(card.to_json)
      end
      
      @query = nil
      cards
    end
  end
end