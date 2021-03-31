load '../stations/route.rb'
load '../stations/station.rb'
load '../task5/company.rb'
load '../Trains/Train.rb'
load '../Trains/PasTrain.rb'
load '../Trains/CargoTrain.rb'
load '../task6/validation.rb'
load '../TrainCars/Car.rb'


class Main

  attr_accessor :st_name

  @@car_hash = {}

  ACTIONS = {
    1 => :create_station,
    2 => :add_carriage,
    3 => :create_train,
    4 => :detach_cars,
    5 => :trains_on_station,
    6 => :train_route
  }.freeze

  def text_ui
    loop do
      action = choose_action
      break if action.zero?

      begin
        send(ACTIONS[action])
      rescue StandardError
        puts 'Не правильно введен номер'
      end
      puts 'Введите следующее действие'
    end
  end

  def create_station
    # Создание первоначальной станции
    @my_station = Station.new
    puts 'Введите название вашей главной станции'
    st_name = gets.chomp
    if st_name.empty?
      puts 'Название поезда не может быть пустым!'
    else
      @name_station = st_name
      @my_station.station_info(@name_station)
      puts "Ваша главная станция - #{@name_station}"
    end
  end

  def add_carriage
    # Создание двух пассажирских вагонов с указанием компании производителя (указывается в скобках отдельной строкой)
    @new_car = PassCar.new
    puts 'Введите номер вашего первого вагона.'
    @new_car.set_number(@@car_hash)
    @new_car.car_company('ООО Трансмаш')
    # Функция для добавления пассажиров в вагон, в скобках указывается общее количество мест
    puts "В Вагоне №#{@new_car.car_number} есть 50 свободных мест"
    puts 'Вы хотите занять место в вагоне? Если да - введите 1, если нет - введите 0'
    @new_car.accept_passengers(50)
    @new_car.fill_car(230)
    @new_car2 = PassCar.new
    puts 'Введите номер вашего второго вагона.'
    @new_car2.set_number(@@car_hash)
    @new_car2.car_company('ООО Трансмаш')
    puts "В Вагоне №#{@new_car2.car_number} есть 55 свободных мест"
    puts 'Вы хотите занять место в вагоне? Если да - введите 1, если нет - введите 0'
    @new_car2.accept_passengers(55)
    # Создание двух грузовых вагонов с указанием компании производителя
    @new_car3 = CargoCar.new
    puts 'Введите номер вашего третьего вагона.'
    @new_car3.set_number(@@car_hash)
    @new_car3.car_company('ООО Азовмаш')
    @new_car3.fill_car(300)
    @new_car4 = CargoCar.new(30)
    puts 'Введите номер вашего четвёртого вагона.'
    @new_car4.set_number(@@car_hash)
    @new_car4.car_company('ООО Азовмаш')
    @new_car4.fill_car(350)
  end

  def create_train
    # Создание пассажирского поезда, его производителя и его запуск
    @my_train = PassTrain.new
    puts 'Введите номер вашего первого поезда.'
    @my_train.train_info
    puts "Номера вашего поезда - #{@my_train.train_number}"
    @my_train.train_company('Хюндай')
    puts "Список всех ваших вагонов - #{@@car_hash}"
    puts 'Введите номер первого вагона, который вы захотите присоединить к первому поезду'
    @my_train.attach_car(@@car_hash)

    puts 'Введите номер второго вагона, который вы захотите присоединить к первому поезду'
    @my_train.attach_car(@@car_hash)
    @my_train.show_cars
    @my_train.start_train
    puts "Скорость вашего поезда - #{@my_train.speed}км/ч"
    @my_train.turbo


    # Создание грузового поезда и его производителя
    @my_train2 = CargoTrain.new
    @my_train2.train_company('French National Railway Company')
    puts 'Введите номер первого вагона, который вы захотите присоединить ко второму поезду'
    @my_train2.attach_car(@@car_hash)
    puts 'Введите номер второго вагона, который вы захотите присоединить ко второму поезду'
    @my_train2.attach_car(@@car_hash)
    @my_train2.show_cars
    puts 'Введите номер вашего второго поезда.'
    @my_train2.train_info
    puts "Номера вашего поезда - #{@my_train2.train_number}"
    #показать все поезда
    puts 'Введите номер поезда, который вы хотите найти: '
    Train.find_train
  end

  def trains_on_station
    #Подсчёт всех поездов на станции
    @all_trains = []
    @all_trains.append(@my_train.train_number, @my_train2.train_number)
    @my_station.train_list(@all_trains)
  end

  def train_route
    my_route = Route.new
    puts 'Введите название вашей последней станции'
    my_route.add_last
    puts "Ваша конечная станция - #{my_route.last_station}"
    puts 'Вводите поочёдно ваши станции, а когда закончите, то напишите "stop" или "стоп"'
    my_route.create_stations
    puts 'Если это полный маршрут - пропишите "0", если вам нужно добавить станцию - пропишите "add",
если убрать - "remove"'
    my_route.full_route(@my_station.station_name)
    puts "Маршрут вашего поезда - #{my_route.station_list}"
    @my_train.train_route(my_route.station_list)
  end

  def detach_cars
    # Отцепляем вагоны от пассажирского и от грузового поезда
    puts "Вот список вагонов на вашем поезде: #{@my_train.cars_list}. Какой вы хотите отцепить от своего поезда? Введите номером."
    @my_train.detach_cars
    puts "Ваш новый список вагонов: #{@my_train.cars_list}"
    puts "Вот список вагонов на вашем поезде: #{@my_train2.cars_list}. Какой вы хотите отцепить от своего поезда? Введите номером."
    @my_train2.detach_cars
    puts "Ваш новый список вагонов: #{@my_train2.cars_list}"
  end

  def choose_action
    puts %(
Список действий
0 - Выход
1 - Создавать станции
2 - Создать вагоны
3 - Создать поезда
4 - Отцеплять вагоны от поезда
5 - Просматривать список станций и список поездов на станции
6 - Выбрать маршрут поезда
ВВЕДИТЕ НОМЕР:)
    gets.chomp.to_i
  end


end

Main.new.text_ui
