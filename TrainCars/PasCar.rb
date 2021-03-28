load 'task5/company.rb'

class PassCar

  include Company

  attr_accessor :contain_passengers, :goods, :car_number

  def initialize(car_number, contain_passengers=true, goods=false)
    @car_number = car_number
    @contain_passengers = contain_passengers
    @goods = goods
  end

  def show_number
    puts "Номер вагона: #{@car_number}"
  end

  def accept_passengers
    puts 'Скольких пассажиров вы хотите запустить?'
    entered_passengers = gets.to_i
    puts "В вагоне №#{@car_number} теперь #{entered_passengers} пассажиров"
  end

  def check_goods
    puts 'В пассажирский вагон запрещено завозить груз, для этого есть грузовые вагоны'
  end
end
