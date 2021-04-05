# frozen_string_literal: true

load './modules/InstanceCounter.rb'
load './modules/validation.rb'
# Station class
class Station
  include InstanceCounter
  include Validation

  attr_reader :name

  attr_accessor :trains, :previous_station, :next_station

  validate(:name, :presence)
  validate(:previous_station, :type, option: Station)
  validate(:next_station, :type, option: Station)

  @all_stations = []

  class << self
    attr_accessor :all_stations

    def all
      self.class.all_stations
    end
  end

  def initialize(name, previous_station = nil, next_station = nil)
    @name = name
    @trains = []
    previous_station.next_station = self unless previous_station.nil?
    @previous_station = previous_station
    @next_station = next_station
    self.class.all_stations.push(self)
    valid?
  end

  def accept_train(train)
    unless train.is_a? Train
      puts 'Ошибка...'
      return false
    end
    train.current_station = self
    @trains.push(train)
  end

  def show_trains(type = nil)
    current_trains = @trains.select do |x|
      type.nil? ? x : x.type == type
    end
    return 'Тут поездов нет' if current_trains.empty?

    current_trains.map(&:to_s)
  end

  def send_train(train)
    return 'Тут поездов нет' if @trains.empty?

    @trains.delete(train)
  end

  def iterate_trains(&block)
    puts "Станция: #{@name}"
    @trains.map(&block)
  end

  def to_s
    @name
  end
end
