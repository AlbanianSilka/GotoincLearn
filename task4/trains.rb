load './TrainCars.rb'
load '../task5/company.rb'
class Train
  attr_accessor :train_type, :speed, :cars_list, :train_number

  @@train_list = []

  include Company


  def initialize(train_type = nil, speed = 0)
    @train_type = train_type
    @speed = speed
    @cars_list = []
  end

  def train_info()
    puts 'Введите номер вашего поезда'
    @train_number = gets.to_i
    puts "Номера вашего поезда - #{@train_number}"
    @@train_list.push(@train_number)
  end

  def self.find_train
    puts 'Введите номер поезда, который вы хотите найти: '
    user_train = gets.to_i
    if @@train_list.include?(user_train)
      puts "Поезд под номером #{user_train} найден"
    else
      puts 'Такого поезда не существует!'
    end
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
    puts "Вы разогнали ваш поезд, теперь ваша скорость - #{@speed}"
  end

  def show_cars
    puts "Список вагонов в вашем поезде: #{cars_list}"
  end

  def train_route(route)
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
  end


end

class PassTrain < Train
  def accept_car(check_pass, accepted_cars)
    puts 'Вагон присоединён' if check_pass == true
    puts 'Этот вагон добавить нельзя' if check_pass == false
    @cars_list.append(accepted_cars)
  end

  def detach_cars
    puts "Вот список вагонов на вашем поезде: #{cars_list}. Какой вы хотите отцепить от своего поезда? Введите номером."
    user_input = gets.to_i
    cars_list.delete_at(user_input - 1)
    puts "Ваш новый список вагонов: #{cars_list}"
  end

end

class CargoTrain < Train
  def show_cars
    puts "Список вагонов в вашем поезде: #{cars_list}"
  end

  def detach_cars
    puts "Вот список вагонов на вашем поезде: #{cars_list}. Какой вы хотите отцепить от своего поезда? Введите номером."
    user_input = gets.to_i
    cars_list.delete_at(user_input - 1)
    puts "Ваш новый список вагонов: #{cars_list}"
  end

  def accept_car(check_pass, accepted_cars)
    puts 'Вагон присоединён' if check_pass == true
    puts 'Этот вагон добавить нельзя' if check_pass == false
    @cars_list.append(accepted_cars)
  end
end
