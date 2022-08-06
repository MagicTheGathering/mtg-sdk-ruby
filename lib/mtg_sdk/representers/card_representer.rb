require 'roar/json'
require 'roar/coercion'
require_relative 'legality_representer'
require_relative 'foreign_name_representer'
require_relative 'ruling_representer'
require_relative '../legality'
require_relative '../foreign_name'
require_relative '../ruling'

module MTG
  module CardRepresenter
    include Roar::JSON
    include Roar::Coercion

    property :name
    property :layout
    property :mana_cost, as: :manaCost
    property :cmc
    property :type
    property :rarity
    property :text
    property :flavor
    property :artist
    property :number
    property :power
    property :toughness
    property :loyalty
    property :multiverse_id, as: :multiverseid
    property :watermark
    property :border
    property :timeshifted
    property :hand
    property :life
    property :reserved
    property :release_date, as: :releaseDate, type: Types::Params::Date
    property :starter
    property :original_text, as: :originalText
    property :original_type, as: :originalType
    property :source
    property :set
    property :set_name, as: :setName
    property :id
    property :image_url, as: :imageUrl

    collection :names
    collection :supertypes
    collection :subtypes
    collection :types
    collection :colors
    collection :color_identity, as: :colorIdentity
    collection :variations
    collection :printings
    collection :legalities, extend: LegalityRepresenter, class: Legality
    collection :rulings, extend: RulingRepresenter, class: Ruling
    collection :foreign_names, as: :foreignNames, extend: ForeignNameRepresenter, class: ForeignName
  end
end
