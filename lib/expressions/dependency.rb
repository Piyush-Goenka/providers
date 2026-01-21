# frozen_string_literal: true

require 'expressions'

module Low
  # A Dependency Expression requires LowType in order to be injected via a constructor.
  # See "LowDependency[:dependency]" for traditional dependency injection sans LowType.
  class Dependency < Expressions::Expression
    attr_reader :provider_key, :var_name

    def initialize(var_name: nil)
      super()

      @provider_key = var_name
      @var_name = var_name
    end

    private

    def receive_value(value)
      @provider_key = value
      @var_name = LowDependency.var_name_via_namespace(value)
    end
  end
end
