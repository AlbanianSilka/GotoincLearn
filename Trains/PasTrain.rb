require_relative 'Train'

class PassTrain < Train
  def accept_car(check_pass, accepted_cars)
    puts 'Вагон присоединён' if check_pass == true
    puts 'Этот вагон добавить нельзя' if check_pass == false
    @cars_list.append(accepted_cars)
  end

  def detach_cars
    user_input = gets.to_i
    cars_list.delete_at(user_input - 1)
  end

end
