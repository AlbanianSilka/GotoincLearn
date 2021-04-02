# frozen_string_literal: true

# Actions regarding trains
module TrainActions
  def trains_on_station
    station = choose_station
    return puts 'Такой станции не существует' unless station

    puts "Список станций #{station.name}:"
    station_info(station)
  end

  def choose_station
    puts "Список станций: #{stations_list}"
    puts 'Введите название вашей станции'
    station_name = gets.chomp
    station_by_name(station_name)
  end

  def stations_list
    stations.map(&:name).join(' ')
  end

  def station_by_name(name)
    stations.select { |station| station.name == name }.first
  end

  def choose_train
    puts "Список поездов: #{trains_list}"
    puts 'Введите номер вашего поезда'
    train_number = gets.chomp
    train = train_by_number(train_number)
    raise 'Такого поезда не существует' if train.nil?

    train
  end

  def train_by_number(number)
    Train.find(number)
  end

  def create_train(train_type)
    puts 'Введите номер поезда'
    train_number = gets.chomp
    puts 'Введите его компанию-производителя'
    train_company = gets.chomp
    case train_type
    when 1
      create_passenger_train(train_number, train_company)
    when 2
      create_cargo_train(train_number, train_company)
    else
      'Неправильный выбран поезд'
    end
  end

  def create_passenger_train(train_number, train_company)
    trains << PassengerTrain.new(train_number, train_company)
    puts "Вы успешно создали пассажирский поезд под номером #{train_number}! И создан компанией #{train_company}"
  end

  def create_cargo_train(train_number, train_company)
    trains << CargoTrain.new(train_number, train_company)
    puts "Товарный поезд был успешно создан под номером #{train_number}! И создан компанией #{train_company}"
  end

  def control_train
    train = choose_train
    puts train
    action = choose_train_action
    perform_action(action, train)
  end

  def choose_train_action
    puts '1 - Ускориться на 10 км'
    puts '2 - Снизить скорость на 10 км'
    puts '3 - Отправиться на следующую станцию'
    gets.chomp.to_i
  end

  def perform_action(action, train)
    case action
    when 1
      train.speed_up(10)
    when 2
      train.speed_down(10)
    when 3
      puts train.move_station
    else
      puts 'Что-то нет так...'
    end
  end
end