def valid?(user_product, product_price, product_number)
  return false if !user_product.length.positive? || !product_price.positive? || !product_number.positive?

  true
end

user_bucket = {}

loop do
  puts 'Какой товар вы хотите с собой взять? Если захотите остановится - введите stop или стоп'
  user_product = gets.chomp
  break if %w[стоп stop].include?(user_product)

  puts 'Цена за ваш товар, вводится цифрой, можно с плаващей точкой'
  product_price = gets.chomp.to_f
  break if %w[стоп stop].include?(product_price)

  puts 'Сколько товара вы хотите с собой взять?'
  product_number = gets.chomp.to_f
  break if %w[стоп stop].include?(product_number)


  if valid? user_product, product_price, product_number
    user_bucket[user_product] = { product_price: product_price, product_number: product_number, total_price: product_price * product_number }
  else
    puts 'Неверно, попробуйте снова!'
  end
end

bucket_price = 0
user_bucket.each do |product, info|
  printf("%3s - $%6f - %9f штук - Всего за товар %12f \n", product, info[:product_price], info[:product_number], info[:total_price])
  bucket_price += info[:total_price]
end
puts "Ваш чек составляет: #{bucket_price}"
