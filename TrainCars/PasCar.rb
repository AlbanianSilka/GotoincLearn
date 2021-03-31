# frozen_string_literal: true
load '../task5/company.rb'
load '../TrainCars/Car.rb'

class PassCar < Car

  include Company

  attr_reader :seats_number, :occupied_seats

  attr_accessor :contain_passengers


  def initialize(*args)
    super
    @car_type = 'Passenger'
  end

  def show_number
    puts "Номер вагона: #{@car_number}"
  end

  def accept_passengers(all_seats)
    @seats_number = all_seats
    user_input = gets.to_i
    if user_input == 1
      @seats_number -= 1
      @occupied_seats += 1
      puts "Вы заняли одно место, теперь в вагоне #{@seats_number} свободных мест."
      puts "Количество занятых мест в вагоне: #{@occupied_seats}"
    end
    nil if user_input.zero?
  end

end
