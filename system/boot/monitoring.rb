# frozen_string_literal: true

Example::Container.boot(:monitoring) do |system|
  init do
    require "dry/monitor/rack/middleware"
    require "dry/monitor/rack/logger"
  end

  start do
    rack_monitor = Dry::Monitor::Rack::Middleware.new(system[:notifications])
    rack_logger = Dry::Monitor::Rack::Logger.new(system[:logger])

    register(:rack_monitor, rack_monitor)

    rack_logger.attach(rack_monitor)
  end
end
