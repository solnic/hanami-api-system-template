# frozen_string_literal: true

# auto_register: false

require "hanami/api"

module Example
  class App < Hanami::API
    use Container[:rack_monitor]

    get "/ping" do
      "ok"
    end
  end
end
