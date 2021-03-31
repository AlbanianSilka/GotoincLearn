class Car
  attr_accessor :car_number, :car_type

  @@num_list = []

  def initialize(*args)
    @contain_passengers = args[0] || 'Unknown'
    @goods = args[1] || 'Unknown'
    @car_volume = args[2] || 0
    @occupied_volume = 0
    @seats_number = args[3] || 0
    @occupied_seats = 0
    @car_type = nil
  end


  def set_number(hash)
    loop do
      @car_number = gets.to_i
      if @@num_list.include?(@car_number)
        puts 'Уже существует вагон с таким номером, попробуйте ещё раз!'
      else
        @@num_list.push(@car_number)
        hash.store(@car_number, @car_type)
        break
      end
    end
  end

  def fill_car(oc_volume)
    if @car_type == 'Passenger'
      puts 'Вы не можете загружать груз в пассажирский поезд!'
    else
      @car_volume = oc_volume
      puts "Вы хотите загрузить товар в ваш вагон? Общий объём вашего вагона - #{@car_volume}кг. Да - 1, нет - 0."
      user_input = gets.to_i
      if user_input == 1
        loop do
          puts 'Введите, сколько товара вы хотите загрузить?'
          user_goods = gets.to_i
          if user_goods <= @car_volume
            @occupied_volume = user_goods
            puts "Теперь в вашем вагоне загружено #{@occupied_volume}кг товаров."
            break
          end
          puts 'Вы не можете загрузить так много товаров!' if user_goods > @car_volume
        end
      end
    end
  end

  def accept_passengers(all_seats)
    if car_type == 'Cargo'
      puts 'Нельзя загружать людей в товарные вагоны, мы всё же не в Советском Союзе!'
    else
      @seats_number = all_seats
      user_input = gets.to_i
      if user_input == 1
        @seats_number -= 1
        @occupied_seats += 1
        puts "Вы заняли одно место, теперь в вагоне #{@seats_number} свободных мест."
        puts "Количество занятых мест в вагоне: #{@occupied_seats}"
      end
      nil if user_input.zero?
    end
  end

end
