class Queue

	def initialize()
		@array = []
	end

	def enqueue(element)
		length = @array.length
		@array[length] = element
	end

	def dequeue()
		length = @array.length
		temp = @array[0]
		for i in 1..(length - 1)
			@array[i - 1] = @array[i]
		end
		puts temp
	end

	def peek(num)
		length = @array.length
		if num == 1
			return @array[0]
		elsif num == 2
			return @array[length - 1]
		end
	end

	def returnarr
		return @array
	end
end

a = Queue.new()
string = "ALONGASSSTRINGGGG"
x = string.length
for i in 1..x
	a.enqueue(string[i - 1])
end
puts a.returnarr
x.times do
	a.dequeue
end
