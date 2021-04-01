# Quadratic equitation
def valid?(first, second, third)
  return false if first.zero? || second.zero? || third.zero?

  true
end
puts 'Введите первое значение'
a = gets.to_i
puts 'Введите второе значение'
b = gets.to_i
puts 'Введите третье значение'
c = gets.to_i
D = b**2 - (4 * a * c)
def count(disc, first, second)
  if disc.positive?
    puts 'У уравнения есть два корня'
    x1 = (-second + Math.sqrt(disc)) / (2 * first)
    x2 = (-second - Math.sqrt(disc)) / (2 * first)
    puts "Первый корень: #{x1}"
    puts "Второй корень: #{x2}"
  end
  if disc.zero?
    puts 'У уравнения есть только один корень'
    x1 = (-second + Math.sqrt(disc)) / (2 * first)
    puts "Корень уравнения: #{x1}"
  end
  puts 'Уравнение корней не имеет' if disc.negative?
end
if valid?(a, b, c)
  puts "Ваш дискриминант - #{D}"
  count(D, a, b)
else
  puts 'Неправильно введены значения'
end
