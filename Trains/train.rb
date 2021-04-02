# frozen_string_literal: true
load './modules/Company.rb'
# Train class
class Train
  include Company
  class << self
    attr_accessor :trains

    def find(number)
      trains ||= Train.trains
      trains.find do |x|
        x.number == number
      end
    end
  end

  attr_accessor :speed, :number, :carriages, :current_station

  @trains = []

  def initialize(number, company_name)
    @number = number
    @speed = 0
    @carriages = []
    self.company_name = company_name
    if self.class.trains.nil?
      Train.trains.push(self)
    else
      self.class.trains.push(self)
    end
  end

  def type
    @type ||= self.class.to_s
  end

  def speed_up(amount)
    @speed += amount
  end

  def speed_down(amount)
    @speed -= amount
    brake if @speed.negative?
  end

  def brake
    @speed = 0
  end

  def take_route(route)
    @route = route
    @current_station = 0
    @route.stations.first.accept_train(self)
  end

  def move_station
    return 'Конец маршрута' if @current_station.next_station.nil?

    @current_station = @current_station.next_station
  end

  def print_stations
    puts "\n#{@route.get_stations(@current_station)}\n"
  end

  def iterate_carriages(&block)
    @carriages.map(&block)
  end

  def to_s
    "Номер: #{@number}, Вид: #{type}, Вагоны: #{@carriages.count}, Скорость: #{@speed}, Станция: #{@current_station}"
  end
end
