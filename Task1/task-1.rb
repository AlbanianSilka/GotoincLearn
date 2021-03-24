#расчёт идеального веса
puts 'Пожалуйста, введите своё имя'
user_name = gets.chomp
puts "#{user_name}, введите ваш рост (в см)"
user_weight = gets
perfect_weight = user_weight.to_i - 110
puts "#{user_name}, ваш идеальный вес - #{perfect_weight}кг"

