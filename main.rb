load '../stations/route.rb'
load '../stations/station.rb'
load '../task5/company.rb'
load '../Trains/Train.rb'
load '../Trains/PasTrain.rb'
load '../Trains/CargoTrain.rb'
load '../task6/validation.rb'


class Main

  attr_accessor :st_name

  ACTIONS = {
    1 => :create_station,
    2 => :add_carriage,
    3 => :create_train,
    4 => :detach_cars,
    # 5 => :add_train_to_station,
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
    @new_car = PassCar.new(12)
    @new_car.car_company('ООО Трансмаш')
    @new_car2 = PassCar.new(13)
    @new_car2.car_company('ООО Трансмаш')
    # Создание двух грузовых вагонов с указанием компании производителя
    @new_car3 = CargoCar.new(19)
    @new_car3.car_company('ООО Азовмаш')
    @new_car4 = CargoCar.new(30)
    @new_car4.car_company('ООО Азовмаш')
  end


  def create_train
    # Создание пассажирского поезда, его производителя и его запуск
    @my_train = PassTrain.new
    puts 'Введите номер вашего первого поезда.'
    pass_train = gets.to_i
    @my_train.train_info(pass_train)
    @my_train.train_company('Хюндай')
    @my_train.accept_car(@new_car.contain_passengers, @new_car.car_number)
    @my_train.accept_car(@new_car2.contain_passengers, @new_car2.car_number)
    @my_train.show_cars
    @my_train.start_train
    @my_train.turbo


    # Создание грузового поезда и его производителя
    @my_train2 = CargoTrain.new
    @my_train2.train_company('French National Railway Company')
    @my_train2.accept_car(@new_car3.goods, @new_car3.car_number)
    @my_train2.accept_car(@new_car4.goods, @new_car4.car_number)
    @my_train2.show_cars
    puts 'Введите номер вашего второго поезда.'
    cargo_train = gets.to_i
    @my_train2.train_info(cargo_train)
    #показать все поезда
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
    puts "Ваша конечная станция - #{@last_station}"
    my_route.create_stations
    my_route.full_route(@my_station.station_name)
    puts 'Если это полный маршрут - пропишите "0", если вам нужно добавить станцию - пропишите "add",
если убрать - "remove"'
    @my_train.train_route(my_route.station_list)
  end

  def detach_cars
    # Отцепляем вагоны от пассажирского и от грузового поезда
    @my_train.detach_cars
    @my_train2.detach_cars
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



