module StationCommands
  def create_station
    puts 'Введите название вашей станции'
    station_name = gets.chomp
    stations << Station.new(station_name)
    puts "Станция #{station_name} была успешно создана"
  end
end
