indexes = ('a'..'z').each_with_index.map{ |l,i| [l, i + 1] }.to_h
puts 'euioa'.chars.map{ |l| indexes[l] }
