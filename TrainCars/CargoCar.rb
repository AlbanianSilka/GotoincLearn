load '../task5/company.rb'
load '../TrainCars/Car.rb'

class CargoCar < Car
  include Company

  attr_reader :car_volume, :occupied_volume

  attr_accessor :contain_passengers


  def initialize(*args)
    super
    @car_type = 'Cargo'
  end

  def show_number
    puts "Номер вагона: #{@car_number}"
  end

end
