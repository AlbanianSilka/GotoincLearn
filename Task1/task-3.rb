def valid?(sides)
  hypotenuse = sides.index(sides.max)
  sum = 0
  sides.each_with_index do |x, index|
    sum += x unless index == hypotenuse
  end
  sum > sides[hypotenuse]
end

def rectangular?(sides)
  hypotenuse = sides.index(sides.max)
  sum = 0
  sides.each_with_index do |x, index|
    sum += x**2 unless index == hypotenuse
  end
  sides[hypotenuse]**2 == sum
end

def isosceles?(sides)
  sides.uniq.size == 2
end

sides = []
print 'Введите размер первой стороны: '
sides.push(gets.chomp.to_f)
print 'Введите размер второй стороны: '
sides.push(gets.chomp.to_f)
print 'Введите размер третьей: '
sides.push(gets.chomp.to_f)
if valid?(sides)
  print "Этот треугольник #{rectangular?(sides) ? '' : 'не '}прямоугольный"
  print ', а также он равнобедренный.' if isosceles?(sides)
else
  print 'Что-то вы ввели неправильно...'
end
