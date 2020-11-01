# frozen_string_literal: true

Example::Container.boot(:web) do |container|
  init do
    use :monitoring
    container.require_from_root("web/app")
  end

  start do
    register(:web, Example::App.new)
  end
end
