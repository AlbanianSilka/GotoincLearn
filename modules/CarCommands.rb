# frozen_string_literal: true

# Actions regarding carriages
module CarriageActions
  include(TrainActions)

  def choose_carriage
    train = choose_train
    puts train
    take_place_or_volume(list_carriages(train))
  end

  def list_carriages(train)
    i = 0
    train.iterate_carriages do |carriage|
      puts "#{i += 1}: #{carriage}"
      puts 'Выберите вагон по его номеру'
      carriage_index = gets.chomp.to_i

      return train.carriages[carriage_index - 1]
    end
  end

  def take_place_or_volume(carriage)
    case carriage.type
    when :PassengerCarriage
      take_place(carriage)
    when :CargoCarriage
      take_volume(carriage)
    else
      raise ArgumentError
    end
  end

  def take_place(carriage)
    carriage.occupy_seat
    puts 'Вы заняли одно место'
  end

  def take_volume(carriage)
    puts "Выберите количество места, которые вы хотите занять! Свободно: #{carriage.free_space}"
    volume = gets.chomp.to_i
    if carriage.free_space > volume
      carriage.load_cargo(volume)
      puts "Вы заняли: #{volume}"
    else
      puts 'Вы не можете занять так много места'
    end
  end

  def remove_carriage
    train = choose_train
    remove(train)
  end

  def remove(train)
    carriage = list_carriages(train)
    if train.remove_carriage(carriage)
      puts 'Вы успешно отцепили вагоны'
    else
      puts 'К этому поезду не прицеплены никакие вагоны'
    end
  end

  def add_carriage
    train = choose_train
    return unless train

    case train.type.to_sym
    when :PassengerTrain
      add_passenger_carriage(train)
    when :CargoCarriage
      add_cargo_carriage(train)
    else
      puts 'Что-то не так...'
    end
  end

  def add_passenger_carriage(train)
    puts 'Введите количество мест'
    seats = gets.chomp.to_i
    train.add_carriage(PassengerCarriage.new(:PassengerCarriage, seats))
    puts 'Вы успешно прицепили пассажирский вагон!'
  end

  def add_cargo_carriage(train)
    puts 'Введите объём для вагона'
    volume = gets.chomp.to_i
    train.add_carriage(CargoCarriage.new(:CargoCarriage, volume))
    puts 'Вы успешно прицепили товарный вагон!'
  end
end
