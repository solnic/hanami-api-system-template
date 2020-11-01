Example::Container.boot(:persistence, namespace: true) do |container|
  init do
    require "sequel"
    require "rom-changeset"
    require "rom/core"
    require "rom/sql"

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    max_connections = Integer(ENV["WEB_MAX_THREADS"] || 8) # Match config/puma.rb

    database_url = container[:settings].database_url

    rom_config = ROM::Configuration.new(
      :sql,
      database_url,
      max_connections: max_connections,
      extensions: %i[error_sql]
    )

    rom_config.plugin(:sql, relations: :instrumentation) do |plugin_config|
      plugin_config.notifications = notifications
    end

    rom_config.plugin(:sql, relations: :auto_restrictions)

    register "config", rom_config
    register "db", rom_config.gateways[:default].connection
  end

  start do
    config = container["persistence.config"]
    config.auto_registration container.root.join("lib/example/persistence"), namespace: "Example::Persistence"

    register "rom", ROM.container(config)
  end
end
