# Квадратное уравнение
puts 'Введите первое значение'
a = gets.to_i
puts 'Введите второе значение'
b = gets.to_i
puts 'Введите третье значение'
c = gets.to_i
D = b**2 - (4 * a * c)
puts D
if D.positive?
  puts 'У уравнения есть два корня'
  x1 = (-b + Math.sqrt(D)) / (2 * a)
  x2 = (-b - Math.sqrt(D)) / (2 * a)
  puts "Первый корень: #{x1}"
  puts "Второй корень: #{x2}"
end
if D.zero?
  puts 'У уравнения есть только один корень'
  x1 = (-b + Math.sqrt(D)) / (2 * a)
  puts "Корень уравнения: #{x1}"
end
puts 'Уравнение корней не имеет' if D.negative?
