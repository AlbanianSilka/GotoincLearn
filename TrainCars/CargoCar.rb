load '../task5/company.rb'

class CargoCar
  include Company

  attr_reader :car_volume, :occupied_volume

  attr_accessor :contain_passengers, :goods, :car_number

  def initialize(car_number, *args)
    @car_number = car_number
    @contain_passengers = args[0] || false
    @goods = args[1] || true
    @car_volume = args[2] || 0
    @occupied_volume = 0
  end

  def show_number
    puts "Номер вагона: #{@car_number}"
  end

  def accept_passengers
    puts 'В товарные вагоны нельзя загружать людей'
  end

  def fill_car(oc_volume)
    @car_volume = oc_volume
    puts "Вы хотите загрузить товар в ваш вагон? Общий объём вашего вагона - #{@car_volume}кг. Да - 1, нет - 0."
    user_input = gets.to_i
    if user_input == 1
      puts 'Сколько товара вы хотите загрузить?'
      user_goods = gets.to_i
      if user_goods <= @car_volume
        @occupied_volume = user_goods
        puts "Теперь в вашем вагоне загружено #{@occupied_volume}кг товаров."
      end
      puts 'Вы не можете загрузить так много товаров!' if user_goods > @car_volume
    end
  end
end
