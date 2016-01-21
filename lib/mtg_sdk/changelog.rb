require_relative 'representers/changelog_representer'
require_relative 'resource'

module MTG
  class Changelog < Resource
    include Roar::JSON
    include RestClient
    include ChangelogRepresenter
  
    attr_accessor :version, :details, :release_date
    
    # Get all changelogs
    #
    # @return [Array<Changelog>] Array of Changelog objects
    def self.all
      changelogs = []
      response = RestClient.get('changelogs')
      data = response.body['changelogs']
      
      data.each do |changelog|
        changelogs << new.extend(ChangelogRepresenter).from_json(changelog.to_json)
      end
      
      @query = nil
      changelogs
    end
  end
end
