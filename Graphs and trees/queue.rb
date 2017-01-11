class Queue
	attr_reader :end_index
	def initialize
		@data = []
		@end_index = 0
		@enqueue_counter = 0
	end

	def enqueue(object)
		@data[@end_index] = object
		@end_index += 1
		return object
	end

	def dequeue
		return if empty?

		first_element = @data[0]
		index_counter = 0

		while !@data[index_counter].nil?
			@data[index_counter] = @data[index_counter + 1]
			index_counter += 1
		end
		@end_index -= 1

		return first_element
	end

	def peek
		return @data[0]
	end

	def empty?
		@end_index == 0? true : false
	end
end