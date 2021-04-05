# frozen_string_literal: true

# Module for getters and setters and their history
module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  # Module for class definition
  module ClassMethods
    # The Class.attr_accessor_with_history method, which provides the same functionality as attr_accessor,
    # but also keeps track of every value the attribute has ever had
    def attr_accessor_with_history(attr_name)
      attr_name = attr_name.to_s
      attr_reader attr_name
      attr_reader "#{attr_name}_history"

      class_eval %{
      def #{attr_name}=(new_value)
        @#{attr_name}_history = [nil] if @#{attr_name}_history.nil?
        @#{attr_name}_history << @#{attr_name} = new_value
      end
    }, __FILE__, __LINE__ - 5
    end

    def strong_attr_accessor(name, klass)
      var_name = "@#{name}"

      define_method(name) do
        instance_variable_get(name)
      end

      define_method("#{name}=") do |value|
        raise TypeError, "value should be #{klass}" unless value.is_a?(klass)

        instance_variable_set(var_name, value)
      end
    end
  end
end
