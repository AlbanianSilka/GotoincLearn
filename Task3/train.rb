class Train
  attr_accessor :train_type, :speed, :vagon_number, :train_number

  def train_info
    puts 'Введите номер вашего поезда'
    @train_number = gets.strip
    puts "Номера вашего поезда - #{@train_number}"
  end

  def initialize(train_type=nil, speed = 0, vagon_number=0)
    @train_type = train_type
    @speed = speed
    @vagon_number = vagon_number
  end

  def set_train_type
    puts 'Введите вид вашего поезда, если это пассажирский - вбейте "пас", а если грузовой - "груз"'
    @train_type = gets.chomp.to_s
    puts 'Ваш поезд - пассажирский' if @train_type.to_s == 'пас'
    puts 'Ваш поезд - грузовой' if @train_type.to_s == 'груз'
  end

  # параметры скорости поезда
  def stop_train
    @speed = 0
  end

  def start_train
    @speed = 100
    puts "Скорость вашего поезда - #{speed}км/ч"
  end

  def turbo
    puts 'Нельзя разогнаться, когда вы стоите не месте' if @speed.zero?
    @speed += 50 if @speed.positive?
  end

  #Установка количества вагонов и отцепление одного с выводом нового количества
  def set_vagons
    puts 'Введите количество вагонов в вашем поезде'
    @vagon_number = gets.to_i
    puts "У вашего поезда #{@vagon_number} вагонов"
  end

  def detach_vagons
    puts 'Вы не можете отцепить вагоны, пока едете' if @speed.positive?
    if @speed.zero?
      puts 'Вы отцепили один вагон'
      @vagon_number -= 1
      puts 'Теперь у вас 0 вагонов' if @vagon_number <= 0
      puts "Теперь у вас #{@vagon_number} вагонов" if @vagon_number.positive?
    end
  end

  def train_route(route, station_name, departed_train)
    puts "Маршрут вашего поезда - #{route}"
    current_station = 1
    puts "Сейчас вы на станции #{route[current_station - 1]}"
    puts 'До какой станции вы хотите доехать? Введите номером'
    our_station = gets.chomp.to_i
    while current_station != our_station
      current_station += 1
      puts "Поезд прибыл на станцию #{route[current_station - 1]}"
    end
    puts 'Поезд покидает первую станцию'
    x = [station_name]
    x.shift(departed_train)
    puts x
    puts 'Поезда на вашей станции: '
  end
end
