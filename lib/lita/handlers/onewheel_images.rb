require 'onewheel-google'
require 'open-uri'
require 'json'

module Lita
  module Handlers
    class OnewheelImages < Handler
      config :custom_search_engine_id
      config :google_api_key
      config :safe_search, required: false, default: 'medium'
      config :giphy_enabled, required: false, default: true

      route /^image\s+(.*)$/i, :image, command: true
      route /^img\s+(.*)$/i, :image, command: true
      route /^giphy\s+(.*)$/i, :giphy, command: true
      route /^gif\s+(.*)$/i, :giphy, command: true

      def image(response)
        query = response.matches[0][0]
        result = ::OnewheelGoogle::search(query, config.custom_search_engine_id, config.google_api_key, config.safe_search, image = true)
        Lita.logger.debug "response: #{result['items'][0]['link']}"
        response.reply({text: result['items'][0]['link']})
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

              Lita.logger.debug "response: #{r['link']}"
              message = {text: r['link'],
                         attachments: MultiJson.dump([{text: 'Choose a game to play'}].map(&:to_hash))
                        }
              #]}
              response.reply(message)
              break
            end
          end
        end
      end

      Lita.register_handler(self)
    end
  end
end
