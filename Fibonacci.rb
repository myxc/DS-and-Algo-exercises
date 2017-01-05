def fibonacci(num)
	#base cases
	return 0 if num == 1
	return 1 if num == 2

	#Recursion
	#This will put smaller and smaller fib numbers onto stack
	#until it hits the base case of returning 0 or 1, and then after
	#that each of the lower frames will have values too to build the sum
	#from the bottom up
	return fibonacci( num - 1 ) + fibonacci( num - 2 ) #for example calling fib(4) will evaluate fib(3) + fib(2), and fib (3) will evaluate to fib(2) + fib(1)
end
#1.upto(10) {|i| puts fibonacci(i)}
def fib_exp(num)
	#base case
	return num - 1 if [1,2].include?(num) #returns 1 or 0

	#set up variables to carry our state through the iteration
	#in recursive solution, return statements themselves took
	#care of this once the recursive stack had built itself
	one_back = 1
	two_back = 0
	sum = 1

	#count up to build our sequence from the bottom
	#in the recursive solution, we broke the problem into small pieces
	#before building up from the bottom
	#This time we build up from the bottom from the beginning
	1.upto( num - 2 ) do #for 1 up to the number of fib values - 2 because the first two values of the fib sequence have been hard coded into this method.

		sum = two_back + one_back 
		two_back = one_back #in the next iteration, two numbers back will be the number one back from current number.
		one_back = sum #the sum of both is the current number for the iteration which will be seen as one number back from the current number on the next iteration

	end
end

def fib_seq(num)

	#base case
	return [0] if num == 0
	return [0,1] if num == 1

	fibs = [0,1]
	1.upto( num - 1 ) do 
		fibs << fibs[-1] + fibs[-2]
	end
	puts fibs
end
fib_seq(8)