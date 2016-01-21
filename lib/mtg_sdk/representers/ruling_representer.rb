require 'roar/json'
require 'roar/coercion'

module MTG
  module RulingRepresenter
    include Roar::JSON
    include Roar::Coercion
  
    property :date, type: Date
    property :text
  end
end