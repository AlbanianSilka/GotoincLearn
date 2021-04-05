# frozen_string_literal: true

require_relative 'TrainCars'

# Passenger carriage class
class PassengerCarriage < Carriage
  include Validation

  attr_reader :number_of_seats, :occupied_seats

  validate(:number_of_seats, :format, option: /[1-9]+/)

  def initialize(type, number_of_seats)
    raise ArgumentError if number_of_seats.negative?

    @number_of_seats = number_of_seats
    @occupied_seats = 0
    super type
    valid?
  end

  def occupy_seat
    return 'Всё заполнено' if @occupied_seats == @number_of_seats

    self.occupied_seats += 1
    puts self.occupied_seats
  end

  def free_seats
    @number_of_seats - @occupied_seats
  end

  def to_s
    "Общее количество мест: #{@number_of_seats}, Мест занято: #{@occupied_seats}"
  end
end
