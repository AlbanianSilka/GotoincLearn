class Station
  attr_accessor :station_name, :list_trains, :listed_trains

  def self.show_stations(station_list)
    puts 'Это метод класса Station, он показывает вам все станции, которые существуют.'
    puts "Список всех станций: #{station_list}"
  end

  def station_info
    puts 'Введите название вашей главной станции'
    @station_name = gets
    puts "Ваша главная станция - #{@station_name}"
  end

  def initialize(list_trains = nil)
    @list_trains = list_trains
    @listed_trains = list_trains
  end

  # Вывод всех поездов на главной станции
  def train_list(train_num)
    @list_trains = []
    @list_trains.append(train_num)
    listed_trains = @list_trains[0]
    puts "Номера поездов на станции #{@station_name}: #{listed_trains}"
  end

end