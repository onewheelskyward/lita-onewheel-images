require 'onewheel-google'

module Lita
  module Handlers
    class OnewheelImages < Handler
      config :custom_search_engine_id
      config :google_api_key
      config :safe_search, required: false, default: 'medium'

      route /^image\s+(.*)$/, :image, command: true

      def image(response)
        query = response.matches[0][0]
        result = ::OnewheelGoogle::search(query, config.custom_search_engine_id, config.google_api_key, config.safe_search, image = true)
        response.reply result['items'][0]['link']
      end

      Lita.register_handler(self)
    end
  end
end
