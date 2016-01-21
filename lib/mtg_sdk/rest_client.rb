require 'faraday'
require 'faraday_middleware'

module MTG
  module RestClient

    def self.get(endpoint, params=nil)
      if params.nil?
        query = endpoint
      else
        query = "#{endpoint}?#{params_to_query(params)}"
      end
      
      client.get(query)
    end
    
    protected
    
    def self.client
      @client = Faraday.new "#{API_URL}/v#{MTG.configuration.api_version}" do |conn|
        conn.response :xml,  :content_type => /\bxml$/
        conn.response :json, :content_type => /\bjson$/    
        conn.adapter Faraday.default_adapter
      end
    end
            
    def self.params_to_query(params)
      params.map {|p, v| "#{p}=#{URI.escape(v.to_s)}"}.join('&')
    end
  end
end