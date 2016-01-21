require 'roar/json'
require 'roar/coercion'

module MTG
  module ChangelogRepresenter
    include Roar::JSON
    include Roar::Coercion
  
    property :release_date, as: :releaseDate, type: Date
    property :version
    property :details
  end
end