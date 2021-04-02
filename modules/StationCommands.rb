load './Route/route.rb'
# frozen_string_literal: true
# Actions regarding stations
module StationActions
  def station_info(station)
    station.iterate_trains do |train|
      puts "Номер поезда: #{train.number}, Его тип: #{train.type}, Вагоны: #{train.carriages.count}"
      i = 1
      train.iterate_carriages do |carriage|
        puts "#{i}: #{carriage}"
        i += 1
      end
    end
  end

  def add_train_to_station
    train = choose_train
    return puts 'Такого вагона не существует' unless train

    if !@route.nil?
      train.take_route(@route)
      puts "Поезд №#{train.number} был успешно помещён #{@route.stations.first.name}!"
    else
      puts 'Ваш маршрут слишком короткий'
    end
  end

  def create_station
    puts 'Введите название вашей станции'
    station_name = gets.chomp
    stations << Station.new(station_name)
    self.route = Route.new(*stations) if stations.size > 1
    puts "Станция #{station_name} была успешно создана!"
  end

  def stations_list
    x = stations.map(&:name).join(' ')
    puts "Список всех станций: #{x}"
  end
end

