# frozen_string_literal: true

require 'expressions'

module Low
  class Dependency < Expressions::Expression
    attr_reader :provider_key, :var_name

    def initialize(var:)
      super()

      @provider_key = var_name
      @var_name = var_name
    end

    private

    def receive_value(value)
      @provider_key = value
    end
  end
end
