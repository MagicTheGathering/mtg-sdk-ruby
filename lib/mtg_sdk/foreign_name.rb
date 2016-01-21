require_relative 'representers/foreign_name_representer'

module MTG
  class ForeignName
    include Roar::JSON
    include LegalityRepresenter
  
    attr_accessor :language, :name, :multiverse_id
  end
end
