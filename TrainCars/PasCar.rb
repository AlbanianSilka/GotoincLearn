# frozen_string_literal: true
load '../task5/company.rb'

class PassCar

  include Company

  attr_reader :seats_number, :occupied_seats

  attr_accessor :contain_passengers, :goods, :car_number

  def initialize(car_number, *args)
    @car_number = car_number
    @contain_passengers = args[0] || true
    @goods = args[1] || false
    @seats_number = args[2] || 0
    @occupied_seats = 0
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

  def check_goods
    puts 'В пассажирский вагон запрещено завозить груз, для этого есть грузовые вагоны'
  end
end
