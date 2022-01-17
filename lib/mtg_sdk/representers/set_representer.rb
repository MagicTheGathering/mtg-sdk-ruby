require 'roar/json'
require 'roar/coercion'

module MTG
  module SetRepresenter
    include Roar::JSON
    include Roar::Coercion
  
    property :code
    property :name
    property :type
    property :border
    property :mkm_id
    property :mkm_name
    property :block
    property :old_code, as: :oldCode
    property :online_only, as: :onlineOnly
    property :release_date, as: :releaseDate, type: Types::Params::Date
    property :gatherer_code, as: :gatherCode
    property :magic_cards_info_code, as: :magicCardsInfoCode
    
    collection :booster
  end
end
