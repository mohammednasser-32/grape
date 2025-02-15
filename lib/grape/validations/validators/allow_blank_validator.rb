# frozen_string_literal: true

module Grape
  module Validations
    module Validators
      class AllowBlankValidator < Base
        def validate_param!(attr_name, params)
          return if (options_key?(:value) ? @option[:value] : @option) || !params.is_a?(Hash)

          value = params[attr_name]
          value = value.scrub if value.respond_to?(:scrub)

          return if value == false || value.present?

          raise Grape::Exceptions::Validation.new(params: [@scope.full_name(attr_name)], message: message(:blank))
        end
      end
    end
  end
end
