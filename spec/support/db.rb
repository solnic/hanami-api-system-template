# require_with_metadata: true

require_relative "db/helpers"
require_relative "db/database_cleaner"
require_relative "db/factory"

RSpec.configure do |config|
  config.before :suite do
    Example::Container.start :persistence
  end

  config.include Test::DB::Helpers, :db
  config.include Test::DB::FactoryHelper.new
end
