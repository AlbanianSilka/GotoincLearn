# frozen_string_literal: true
load './train.rb'
load './station.rb'
load './route.rb'

# Создание первоначальной станции
my_station = Station.new
my_station.station_info
# Поезд №1
my_train = Train.new
# Задаём тип поезда
my_train.train_info
my_train.set_train_type
my_train.set_vagons
# Вагоны можно отцеплять только стоя, запустить поезд можно через команду
my_train.detach_vagons
# Поезд №2
my_train2 = Train.new
my_train2.train_info
my_train2.set_train_type
my_train2.set_vagons
my_train2.detach_vagons
# Подсчёт всех поездов на станции
all_trains = []
all_trains.append(my_train.train_number, my_train2.train_number)
all_trains.join(',')
my_station.train_list(all_trains)
# Рассчёт движения поезда
my_route = Route.new
my_route.add_last
my_route.create_stations
my_route.full_route(my_station.station_name)
my_train.train_route(my_route.station_list, my_station.listed_trains, 1)
puts all_trains.delete_at(1).to_s
