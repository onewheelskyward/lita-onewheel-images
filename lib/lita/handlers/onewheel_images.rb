module Lita
  module Handlers
    class OnewheelImages < Handler
      # insert handler code here
      route /image/, :image, command: true
      def image(response)
        response.reply 'Image!'
      end

      Lita.register_handler(self)
    end
  end
end
