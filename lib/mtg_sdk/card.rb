require_relative 'representers/card_representer'

module MTG
  class Card
    include Roar::JSON
    include CardRepresenter

    attr_accessor :name, :layout, :names, :mana_cost, :cmc, :colors, :type, :supertypes, :subtypes, :types,
                  :rarity, :text, :flavor, :artist, :number, :power, :toughness, :loyalty, :multiverse_id, :variations,
                  :watermark, :border, :timeshifted, :hand, :life, :reserved, :release_date, :starter,
                  :rulings, :foreign_names, :printings, :original_text, :original_type, :legalities,
                  :source, :image_url, :set, :id, :set_name, :color_identities

    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      "cards"
    end

    # Find a single card by the card multiverse id
    #
    # @param id [Integer] the multiverse id
    # @return [Card] the Card object response
    def self.find(id)
      QueryBuilder.new(Card).find(id)
    end

    # Get all cards from a query by paging through data
    #
    # @return [Array<Card>] Array of Card objects
    def self.all
      QueryBuilder.new(Card).all
    end

    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [QueryBuilder] the QueryBuilder
    def self.where(args)
      QueryBuilder.new(Card).where(args)
    end
  end
end
