require 'roar/json'

module MTG
  module ForeignNameRepresenter
    include Roar::JSON
  
    property :name
    property :language
    property :multiverse_id, as: :multiverseid
    property :image_url, as: :imageUrl
  end
end