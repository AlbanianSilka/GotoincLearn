class Route
  attr_accessor :last_station, :station_list

  def initialize(last_station = nil, station_list = nil)
    @last_station = last_station
    @station_list = station_list
  end

  def add_last
    puts 'Введите название вашей последней станции'
    @last_station = gets.chomp
    puts "Ваша конечная станция - #{@last_station}"
  end

  def create_stations
    @station_list = []
    puts 'Вводите поочёдно ваши станции, а когда закончите, то напишите "stop"'
    while user_input = gets.chomp
      @station_list.push(user_input.to_s)

      break if %w[стоп stop].include?(user_input)
    end
    @station_list[-1] = @last_station
  end

  def full_route(num)
    puts @station_list.unshift(num)
    puts 'Если это полный маршрут - пропишите "0", если вам нужно добавить станцию - пропишите "add",
если убрать - "remove"'
    user_get = gets.chomp
    if user_get == '0'
      nil
    end
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
