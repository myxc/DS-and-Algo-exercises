#each number is sum of multiples of every number prior to it.
def factorial_r(num)
	#base case
	return 1 if num == 1
	return 0 if num == 0
	#reducing calls
	return factorial_r( num - 1 ) * num #num * num -1 * 
end
puts factorial_r(9)
def factorial_i(num)
	return [0] if num == 0
	return [1] if num == 1
	facto = [1]
	total = 1
	2.upto(num) do |num|
		facto << num
		total *= facto[num - 1]
	end
	return total
end
puts factorial_i(9)
