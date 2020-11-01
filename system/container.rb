# frozen_string_literal: true

require "bundler/setup"

require "dry/system/container"
require "dry/system/components"

# TODO: fix this
require "warning"
Warning.ignore(/hanami/)
Warning.ignore(/monitor/)

require "csv"

module Example
  class Container < Dry::System::Container
    use :env, inferrer: -> { (ENV["HANAMI_ENV"] || "development").to_sym }
    use :notifications
    use :logging

    configure do |config|
      config.default_namespace = :example
      config.auto_register = %w[lib]
    end

    load_paths!("lib")
  end
end
