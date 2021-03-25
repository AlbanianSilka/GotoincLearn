load '../Task3/station.rb'
load './trains.rb'
load './TrainCars.rb'
load '../Task3/route.rb'

# Создание первоначальной станции
my_station = Station.new
my_station.station_info

# Создание двух пассажирских вагонов
new_car = PassCar.new(12)
new_car2 = PassCar.new(13)
# Создание двух грузовых вагонов
new_car3 = CargoCar.new(19)
new_car4 = CargoCar.new(30)

# Создание пассажирского поезда и его запуск
my_train = PassTrain.new
my_train.train_info
my_train.accept_car(new_car.contain_passengers, new_car.car_number)
my_train.accept_car(new_car2.contain_passengers, new_car2.car_number)
my_train.show_cars
my_train.start_train
my_train.turbo


# Создание грузового поезда
my_train2 = CargoTrain.new
my_train2.accept_car(new_car3.goods, new_car3.car_number)
my_train2.accept_car(new_car4.goods, new_car4.car_number)
my_train2.show_cars
my_train2.train_info

# Подсчёт всех поездов на станции
all_trains = []
all_trains.append(my_train.train_number, my_train2.train_number)
all_trains.join(',')
my_station.train_list(all_trains)

# Создаём маршрут для поездов
my_route = Route.new
my_route.add_last
my_route.create_stations
my_route.full_route(my_station.station_name)
my_train.train_route(my_route.station_list)

# Отцепляем вагоны от пассажирского и от грузового поезда
my_train.detach_cars
my_train2.detach_cars
