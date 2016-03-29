require_relative 'representers/changelog_representer'

module MTG
  class Changelog
    include Roar::JSON
    include ChangelogRepresenter
  
    attr_accessor :version, :details, :release_date
    
    # Get the resource string
    #
    # @return [string] The API resource string
    def self.Resource
      "changelogs"
    end
    
    # Get all changelogs
    #
    # @return [Array<Changelog>] Array of Changelog objects
    def self.all
      QueryBuilder.new(Changelog).all
    end
  end
end
