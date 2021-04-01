# Calculating the area of a triangle
puts 'Введите основание треугольника в см'
begin
  a = gets
  a = Integer(a)
  puts 'Введите высоту треугольника в см'
  h = gets
  h = Integer(h)
rescue ArgumentError
  puts 'Вводите свои значения цифрами'
  retry
end
s = (a.to_i * h.to_i) / 2
puts "Плошадь вашего треугольника равна #{s}см"
