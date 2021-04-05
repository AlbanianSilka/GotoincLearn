# frozen_string_literal: true

load './modules/validation.rb'
# Carriage class
class Carriage
  include Validation

  validate(:type, :format, option: /(passenger) | (cargo)/)

  attr_reader :type
  attr_accessor :parent_train

  def initialize(type)
    @type = type
    valid?
  end

  def add_train(train)
    raise ArgumentError unless train.is_a?(Train)

    self.parent_train = train
  end
end
