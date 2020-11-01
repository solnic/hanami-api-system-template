# auto_register: false

require "rom-repository"
require "example/structs"

module Example
  class Repo < ROM::Repository::Root
    include Deps[container: "persistence.rom"]

    struct_namespace Structs
    commands :create, update: :by_pk, delete: :by_pk
  end
end
