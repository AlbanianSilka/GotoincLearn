# Count user perfect weight
puts 'Пожалуйста, введите своё имя'
user_name = gets.chomp
begin
  puts "#{user_name}, введите ваш рост (в см)"
  user_weight = gets.chomp
  user_weight = Integer(user_weight)
rescue ArgumentError
  puts 'Введите ваш рост числом'
  retry
end
perfect_weight = user_weight.to_i - 110
puts "#{user_name}, ваш идеальный вес - #{perfect_weight}кг"

