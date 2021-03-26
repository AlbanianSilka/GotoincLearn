load '../task5/company.rb'

class PassCar

  include Company

  attr_accessor :contain_passengers, :goods, :car_number

  def initialize(car_number, contain_passengers=true, goods=false)
    @car_number = car_number
    @contain_passengers = contain_passengers
    @goods = goods
  end

  def show_number
    puts "Номер вагона: #{@car_number}"
  end

  def accept_passengers
    puts 'Скольких пассажиров вы хотите запустить?'
    entered_passengers = gets.to_i
    puts "В вагоне №#{@car_number} теперь #{entered_passengers} пассажиров"
  end

  def check_goods
    puts 'В пассажирский вагон запрещено завозить груз, для этого есть грузовые вагоны'
  end
end

class CargoCar
  include Company

  attr_accessor :contain_passengers, :goods, :goods_list, :car_number

  def initialize(car_number, contain_passengers = false , goods = true, goods_list = nil )
    @car_number = car_number
    @contain_passengers = contain_passengers
    @goods = goods
    @goods_list = goods_list
  end

  def show_number
    puts "Номер вагона: #{@car_number}"
  end

  def accept_passengers
    puts 'В товарные вагоны нельзя загружать людей'
  end

  def insert_goods
    @goods_list = []
    puts 'Вводите поочёдно ваши продукты, а когда закончите, то напишите "stop" или "стоп"'
    while user_input = gets.chomp
      @goods_list.push(user_input.to_s)

      break if %w[стоп stop].include?(user_input)
    end
    @goods_list.delete_at(-1)
    puts "Вагон №#{@car_number} перевозит эти товары: #{@goods_list}"
  end
end

