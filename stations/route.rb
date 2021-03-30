class Route
  attr_accessor :last_station, :station_list

  def initialize(last_station = nil, station_list = nil)
    @last_station = last_station
    @station_list = station_list
  end

  def add_last
    @last_station = gets.chomp
  end

  # Создание маршрута для поезда
  def create_stations
    @station_list = []
    while (user_input = gets.chomp)
      @station_list.push(user_input.to_s)

      break if %w[стоп stop].include?(user_input)
    end
    @station_list[-1] = @last_station
  end

  # Создание полного маршрута для поезда с записью первой станцией станции из Station и последней той, что ввели выше
  # Ниже удаление или добавление станции в маршрут
  def full_route(num)
    puts @station_list.unshift(num)
    user_get = gets.chomp
    nil if user_get == '0'
    if user_get == 'add'
      puts 'Введите номер станции, перед которой вы бы хотели вставить новую станцию '
      choose_station = gets.chomp.to_i
      puts 'Теперь введите название новой станции'
      new_station = gets.chomp.to_s
      @station_list.insert(choose_station - 1, new_station)
      puts @station_list
    end
    if user_get == 'remove'
      puts 'Введите номер станции, которую вы бы хотели удалить из маршрута'
      choose_station = gets.chomp.to_i
      @station_list.delete_at(choose_station - 1)
      puts @station_list
    end
  end
end

