# frozen_string_literal: true

# Code to find day index in year
puts 'Пожалуйста, введите нужный год '
user_year = gets.to_i
puts 'Пожалуйста, введите нужный день '
user_day = gets.to_i
puts 'Пожалуйста, введите нужный месяц '
user_month = gets.to_i
days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze
def leap_year?(year)
  (year % 4).zero? && (year % 100 != 0 || (year % 400).zero?)
end
if leap_year?(user_year.to_i)
  puts 'Год високосный'
  days[1] = 29
else
  puts 'Год не високосный'
end
number_date = 0
(0..user_month - 1).each { |month_index| number_date += days[month_index] }
number_date -= days[user_month - 1] - user_day
puts number_date
