def sumdig_r(num)
	#base case
	return num if num <= 9 
	#reducer
	sum = sumdig_r( num / 10 ) + num % 10#will reduce the number by a power of 10
end
puts sumdig_r(1222)

def sumdig_i(num)
	num_str = "#{num}"
	sum_arr = num_str.split(//)
	total = 0
	sum_arr.each do |n|
		total += Integer(n)
	end
	return total
end
puts sumdig_i(103)
