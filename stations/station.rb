class Station

  attr_accessor :station_name, :list_trains

  def self.show_stations(station_list)
    puts 'Это метод класса Station, он показывает вам все станции, которые существуют.'
    puts "Список всех станций: #{station_list}"
  end

  def station_info(station_name)
    @station_name = station_name
  end

  def initialize(list_trains = nil)
    @list_trains = list_trains
  end

  # Вывод всех поездов на главной станции
  def train_list(train_num)
    @list_trains = []
    @list_trains.append(train_num)
    @list_trains.each do |train|
      puts "#{train} на станции #{@station_name}"
    end
  end

end
