#create a list
#puts that read nodes at particular index and returns number of steps or crawlers progress
#insert node to particular index or end of list
#method reverse that flips the entire order of the list so that the head and tail are swapped and each pointer points backwards
#explain how quickly the reverse method runs
Node = Struct.new(:data, :next)

class LinkedList

	def initialize(first = nil)
		@head = first
		@temp = first
		@end = first
	end

	def add_node(data)
		if @head.nil?
			@head = Node.new(data, nil)
			@end = @head
		else
			new_node = Node.new(data,nil)
			@end.next = new_node
			@end = new_node
		end
	end

	def find_data(data)
		counter = 0
		current_node = @head
		while true
			break if current_node.data.include? 'data'
			if current_node.next.nil?
				return false
			end
			current_node = current_node.next
			counter += 1
		end
		steps = counter + 1
		puts "It took #{steps} number of steps to find the definition, which is \""
		return current_node.data[1]
	end 

	def insert(index, node)#insert node to a certain index
		counter = 0
		current_node = @head
		prev_node = nil
		if index == 0
			node.next = @head
			@head = node
		end
		while counter < index
			prev_node = current_node
			current_node = current_node.next
			counter +=1
		end
		node.next = current_node
		prev_node.next = node
	end

	def crawler(index)
		counter = 0
		current_node = @head
		while counter < index
			step = counter + 1
			puts "Step number #{step}, node at index #{counter} with value: #{current_node.data}"
			break if current_node.next.nil?
			current_node = current_node.next
			counter += 1
		end
	end


	def remove(index)
		counter = 0
		current_node = @head
		prev_node = nil

		while counter < index
			prev_node = current_node
			current_node = current_node.next
			counter += 1
		end
		#now you've reached the index of the node you want to remove. Remove it's pointer and data
		#The previous node points to it so you should have the prev node point to the next node
		next_node = current_node.next
		current_node.next = nil
		current_node.data = nil
		prev_node.next = next_node
	end

	def reverse()
		counter = 1 #remove works by starting from @head, and then moving a number of steps equal to index, so for the first iteration, after the new head is inserted and considered at index 0, the node to be removed is at index 1.
		current_node = @head
		while current_node.next.nil? == false
			#go through each node to the next and for each node, insert that node which makes it the new head, and then remove the current node
			insert(0, current_node) 
			remove(counter)
			counter += 1
		end
		crawler(99)
	end		
end
#this reverse method is O(n) to iterate through each node that is being replaced and O(n) to run the removal which iterates through it until it reaches the spot that the node to be removed is, so it is O(n^2).
