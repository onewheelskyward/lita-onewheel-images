require 'httparty'
require 'json'
require 'addressable/uri'

module Lita
  module Handlers
    class OnewheelImages < Handler
      config :custom_search_engine_id
      config :google_api_key
      config :safe_search, required: false, default: 'medium'

      route /^image\s+(.*)$/, :image, command: true

      def image(response)
        query = response.matches[0][0]
        search_result = get_results query
        puts search_result.inspect
        response.reply search_result['items'][0]['link']
      end

      def get_results(query)
        puts "Searching for #{query}"
        uri = Addressable::URI.new
        uri.query_values = {
            q: query,
            cx: config.custom_search_engine_id,
            searchType: 'image',
            num: 10,
            key: config.google_api_key,
            safe: config.safe_search}
        Lita.logger.debug uri.query
        response = HTTParty.get "https://www.googleapis.com/customsearch/v1?#{uri.query}"
        JSON.parse response.body
      end

      Lita.register_handler(self)
    end
  end
end
