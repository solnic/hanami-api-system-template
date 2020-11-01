# frozen_string_literal: true

load "spec/support/tasks.rake"

Rake.add_rakelib "lib/tasks"

require "rom/sql/rake_task"

task :environment do
  require_relative "system/boot"
end

namespace :db do
  task setup: :environment do
    Example::Container.init(:persistence)
  end
end
