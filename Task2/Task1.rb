months = {
  'FEB' => 28,
  "MAR" => 31,
  'APR' => 30,
  'MAY' => 31,
  'JUN' => 30,
  'JUL' => 31,
  'AUG' => 31,
  'SEP' => 30,
  'OCT' => 31,
  'NOV' => 30,
  'DEC' => 31,
  'JAN' => 31
}

months.each do |month, days|
  puts("#{month} состоит из #{days} дней") if days == 30
end
