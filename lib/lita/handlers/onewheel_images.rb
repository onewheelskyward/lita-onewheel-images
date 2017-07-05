require 'onewheel-google'

module Lita
  module Handlers
    class OnewheelImages < Handler
      config :custom_search_engine_id
      config :google_api_key
      config :safe_search, required: false, default: 'medium'
      config :giphy_enabled, required: false, default: true

      route /^image\s+(.*)$/, :image, command: true
      route /^giphy\s+(.*)$/, :giphy, command: true

      def image(response)
        query = response.matches[0][0]
        result = ::OnewheelGoogle::search(query, config.custom_search_engine_id, config.google_api_key, config.safe_search, image = true)
        response.reply result['items'][0]['link']
      end

      def giphy(response)
        unless config.giphy_enabled
          return
        end

        query = 'giphy ' + response.matches[0][0]
        result = ::OnewheelGoogle::search(query, config.custom_search_engine_id, config.google_api_key, config.safe_search, image = true)

        if result
          result['items'].each do |r|
            if r['mime'] == 'image/gif'
              if r['link'][/200_s.gif$/]
                r['link'].gsub! /200_s.gif/, 'giphy.gif'
              end

              response.reply r['link']
              break
            end
          end
        end
      end

      Lita.register_handler(self)
    end
  end
end
