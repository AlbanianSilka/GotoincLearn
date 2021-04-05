# frozen_string_literal: true

require_relative 'Stations/station'
require_relative 'Route/route'
require_relative 'Cars/CargoCar'
require_relative 'Cars/PassCar'
require_relative 'Cars/TrainCars'
require_relative 'modules/TrainCommands'
require_relative 'modules/StationCommands'
require_relative 'modules/CarCommands'
require_relative 'Trains/train'
require_relative 'Trains/PassTrain'
require_relative 'Trains/CargoTrain'
require_relative 'modules/Company'
require_relative 'modules/InstanceCounter'

# Class, that contain text UI and functions from another files
class Main
  include(CarriageActions)
  include(StationActions)
  include(TrainActions)
  include(Company)
  include(InstanceCounter)

  ACTIONS = {
    1 => :create_station,
    2 => :choose_train_type,
    3 => :add_carriage,
    4 => :remove_carriage,
    5 => :add_train_to_station,
    6 => :trains_on_station,
    7 => :control_train,
    8 => :stations_list,
    9 => :check_counter
  }.freeze
  attr_reader :stations, :trains

  def initialize
    @stations = []
    @trains = []
  end

  def text_ui
    loop do
      action = choose_action
      break if action.zero?

      send(ACTIONS[action])
    end
  rescue StandardError
    puts 'Wrong input'
    retry
  end

  private

  attr_writer :stations, :trains, :route

  def choose_train_type
    puts 'Выберите вид вашего поезда:
      1 - Пассажирский
      2 - Товарняк'
    train_type = gets.chomp.to_i
    create_train(train_type)
  end

  def trains_list(type = nil)
    if type
      trains.map { |t| t.number if t.type == type }.compact.join(' ')
    else
      trains.map(&:number).join(' ')
    end
  end

  def check_counter
    puts "Количество элементов класса Station равно #{InstanceCounter.count_instances}"
  end

  def choose_action
    puts %(Список действий
0 - Выход
1 - Создавать станции
2 - Создать поезд
3 - Добавить вагон к поезду
4 - Отцеплять вагоны от поезда
5 - Отправить поезд на станцию
6 - Просматривать список станций и список поездов на станции
7 - Управление поездом
8 - Показать все станции
9 - Задание №5 - число всех элементов класса Station
ВВЕДИТЕ НОМЕР:)
    gets.chomp.to_i
  end
end

Main.new.text_ui
