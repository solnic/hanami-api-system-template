# frozen_string_literal: true

require "rack/test"

module Test
  module Web
    module Helpers
      include Rack::Test::Methods

      def app
        Suite.instance.application
      end

      def response
        last_response
      end
    end
  end
end
