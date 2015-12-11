require 'httparty'
require 'json'

module Lita
  module Handlers
    class OnewheelImages < Handler
      config :custom_search_engine_id
      config :google_api_key

      route /image\s+(.*)$/, :image, command: true

      def image(response)
        query = response.matches[0][0]
        search_result = get_results query
        puts search_result.inspect
        response.reply search_result['items'][0]['link']
      end

      def get_results(query)
        puts "Searching for #{query}"
        response = HTTParty.get "https://www.googleapis.com/customsearch/v1?q=#{query}&cx=#{config.custom_search_engine_id}&num=10&searchType=image&key=#{config.google_api_key}"
        JSON.parse response.body
      end

      Lita.register_handler(self)
    end
  end
end
