require_relative 'representers/ruling_representer'

module MTG
  class Ruling
    include Roar::JSON
    include RulingRepresenter
    
    attr_accessor :date, :text
  end
end
