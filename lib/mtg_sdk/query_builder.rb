module MTG
  class QueryBuilder
    include RestClient
    attr_accessor :type, :query
    
    def initialize(type)
      @type = type
      @query = {}
    end

    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [QueryBuilder] the QueryBuilder
    def where(args)
      @query.merge!(args)
      self
    end
    
    # Find a single resource by the resource id
    #
    # @param id [String] the resource id
    # @return [Object] the Type object response
    def find(id)
      response = RestClient.get("#{@type.Resource}/#{id}")
      singular_resource = @type.Resource[0...-1]
      if response.body[singular_resource].nil?
        raise ArgumentError, 'Resource not found'
      end
      
      type.new.from_json(response.body[singular_resource].to_json)
    end
    
    # Get all resources from a query by paging through data
    #
    # @return [Array<Object>] Array of resources
    def all
      list = []
      page = 1
      fetch_all = true

      if @query.has_key?(:page)
        page = @query[:page]
        fetch_all = false
      end
      
      while true
        response = RestClient.get(@type.Resource, @query)
        data = response.body[@type.Resource]      
        if !data.empty?
          data.each {|item| list << @type.new.from_json(item.to_json)}
          
          if !fetch_all
            break
          else
            where(page: page += 1)
          end
        else
          break
        end
      end

      return list
    end
  end
end