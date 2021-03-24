puts "Пожалуйста, введите нужный год "
user_year = gets.to_i
puts "Пожалуйста, введите нужный день "
user_day = gets.to_i
puts "Пожалуйста, введите нужный месяц "
user_month = gets.to_i
days = [31,28,31,30,31,30,31,31,30,31,30,31]
COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def leap_year?(num)
  if (num%4).zero? && num%100 != 0
    true
  elsif (num%400).zero?
    true
  elsif (num%4).zero? && (num%100).zero? && num%400 != 0
    false
  elsif num%4 != 0
    false
  end
end
if leap_year?(user_year.to_i) == true
  puts "Год високосный"
  days[1] = 29
  number_date = 0
  (0..user_month-1).each { |month_index| number_date += days[month_index] }
  number_date -= days[user_month-1] - user_day

  puts number_date
else
  puts "Год не високосный"
  number_date = 0
  (0..user_month-1).each { |month_index| number_date += days[month_index] }
  number_date -= days[user_month-1] - user_day

  puts number_date
end

