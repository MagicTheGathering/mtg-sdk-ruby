module MTG
  class Configuration
    attr_accessor :api_version

    def initialize
      @api_version = 1
    end
  end
end