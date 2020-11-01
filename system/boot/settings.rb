# frozen_string_literal: true

Example::Container.boot(:settings, from: :system) do
  before(:init) do
    require "example/types"
  end

  settings do
    key :database_url, Example::Types::String.constrained(filled: true)
  end
end
