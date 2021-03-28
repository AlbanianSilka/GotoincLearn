# load './Task3/route.rb'
# load '../Task3/station.rb'
load '../stations/route.rb'
load '../stations/station.rb'
load '../task5/company.rb'
load '../Trains/Train.rb'
load '../Trains/PasTrain.rb'
load '../Trains/CargoTrain.rb'

# Создание первоначальной станции
my_station = Station.new
my_station.station_info

# Создание двух пассажирских вагонов с указанием компании производителя (указывается в скобках отдельной строкой)
new_car = PassCar.new(12)
new_car.car_company('ООО Трансмаш')
new_car2 = PassCar.new(13)
new_car2.car_company('ООО Трансмаш')
# Создание двух грузовых вагонов с указанием компании производителя
new_car3 = CargoCar.new(19)
new_car3.car_company('ООО Азовмаш')
new_car4 = CargoCar.new(30)
new_car4.car_company('ООО Азовмаш')


# Создание пассажирского поезда, его производителя и его запуск
my_train = PassTrain.new
my_train.train_info
my_train.train_company('Хюндай')
my_train.accept_car(new_car.contain_passengers, new_car.car_number)
my_train.accept_car(new_car2.contain_passengers, new_car2.car_number)
my_train.show_cars
my_train.start_train
my_train.turbo


# Создание грузового поезда и его производителя
my_train2 = CargoTrain.new
my_train2.train_company('French National Railway Company')
my_train2.accept_car(new_car3.goods, new_car3.car_number)
my_train2.accept_car(new_car4.goods, new_car4.car_number)
my_train2.show_cars
my_train2.train_info
#показать все поезда
Train.find_train

#Подсчёт всех поездов на станции
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

# Вызов метода класса Station
Station.show_stations(my_route.station_list)
