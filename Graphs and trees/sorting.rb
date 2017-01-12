class Data_Sort
	def initialize
		@sorted_array = []
	end

	def insertion_sort(array)
		sorted_array = []
		sorted_array << array[0]
		array.delete_at(0)
		array.each do |element| #for sorting each element of the array
			sorted_array.each_with_index do |sorted_element, index|
				if element <= sorted_element
					#if the element is less than the element being tested, then insert it before that element.
					sorted_array.insert(index, element)
					break
				elsif index == sorted_array.length - 1
					sorted_array << element
					break
				end
			end
		end
		puts sorted_array
	end

	def bubble_sort(array)
		@initial_sample = array #after each time something is swapped, it should start checking again from the beginning.
		sorted_element_index = 0
		while sorted_element_index < @initial_sample.length - 1
			if @initial_sample[sorted_element_index] > @initial_sample[sorted_element_index + 1] #sorting mechanism
				temp = @initial_sample[sorted_element_index + 1]
				@initial_sample[sorted_element_index + 1] = @initial_sample[sorted_element_index]
				@initial_sample[sorted_element_index] = temp
				sorted_element_index = 0
				next
			end
			sorted_element_index += 1
		end
		puts @initial_sample
	end

	def recursive_merge_sort(array)

		size = array.length
		left_half_array = [] #each time the recursion is called, these are reset to empty arrays because the previous halves are the array calling the recursion
		right_half_array = []
		left_side_end = size / 2 - 1 #creates the array regardless of odd or even, just that in odd case the right side gets 1 more recursion b.c it'll have an odd # of elements
		array.each_with_index do |element, index|
			left_half_array << element
			break if index == left_side_end
		end
		left_half_array = recursive_merge_sort(left_half_array) if left_half_array.size != 1
		right_side_end = size - 1
		array[(left_side_end + 1)..right_side_end].each_with_index do |element, index|
			right_half_array << element
			break if index == right_side_end
		end
		right_half_array = recursive_merge_sort(right_half_array) if right_half_array.size != 1

		#all of the splitting should be done by the time it reaches this point, and now we will merge the split pieces
		#the left/right halves are continuously split until they have a size of 1. In each step of the process the array var is just either the left or right half
		array = []
		left_half_index = 0
		left_half_end = left_half_array.size 
		right_half_end = right_half_array.size 
		right_half_index = 0
		while true
			if left_half_index == left_half_end && right_half_index == right_half_end
				break
			end
			if left_half_index == left_half_end
				array << right_half_array[right_half_index]
				right_half_index += 1
				next
			end
			if right_half_index == right_half_end
				array << left_half_array[left_half_index]
				left_half_index += 1
				next
			end
			if left_half_array[left_half_index] <= right_half_array[right_half_index]
				array << left_half_array[left_half_index]
				left_half_index += 1
			elsif right_half_array[right_half_index] <= left_half_array[left_half_index]
				array << right_half_array[right_half_index]
				right_half_index += 1
			end
		end
		return array
	end
end

asd = Data_Sort.new
asd.recursive_merge_sort([3,1,7,5,2])