load 'stations/station.rb'
# load '../stations/station.rb'
load 'task5/company.rb'
load 'Trains/Train.rb'
load 'Trains/PasTrain.rb'
load 'Trains/CargoTrain.rb'
require_relative 'modules/StationCommands'

class Main
  include(StationCommands)

  ACTIONS = {
    1 => :create_station
  }.freeze
  attr_reader :stations

  def initialize
    @stations = []
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

  def choose_action
    puts "Список команд:\n0 - Выход\n1 - Создать станцию\n2 - Создать поезд
Введите номер:"
    gets.chomp.to_i
  end

end

Main.new.text_ui