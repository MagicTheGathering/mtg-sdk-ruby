require_relative 'representers/legality_representer'

module MTG
  class Legality
    include Roar::JSON
    include LegalityRepresenter
  
    attr_accessor :format, :legality
  end
end
