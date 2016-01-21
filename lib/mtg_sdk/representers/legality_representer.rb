require 'roar/json'

module MTG
  module LegalityRepresenter
    include Roar::JSON
  
    property :format
    property :legality
  end
end