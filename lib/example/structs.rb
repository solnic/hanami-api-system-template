# auto_register: false
#
# frozen_string_literal: true

module Example
  module Structs
  end
end

Dir[File.join(__dir__, "structs", "*.rb")].each(&method(:require))
