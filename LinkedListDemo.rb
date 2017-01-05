# Build simple node struct
Node = Struct.new(:data, :next)

# Create unordered linked-list
class LinkedList

	# We want to keep track of the head node and the 
	# last node to make adding and subtracting easy
	attr_accessor :head, :last

	# Allow initializing the list with a first node.
	def initialize(first_node = nil)
		@head = first_node
		@last = first_node
	end

	# To add the first node
	def add_first_node(data)
		@head = Node.new(data, nil)
		@last = @head
	end

	# Add a node to the end of the list
	def add_node(data)

		# change tactics if we're adding the first node
		if @head.nil?

			add_first_node(data)

		else

			new_node = Node.new(data)

			# point the last node to our new one
			@last.next = new_node

			# set our new node as the official last node
			@last = new_node

		end
		puts "Added node with the value: #{data}"
	end

	# Remove the node at this position assuming there is one
	# We'll crawl the list and save the prev
	def remove_node(index)

		# Start at the head
		counter = 0
		current_node = @head
		prev_node = nil

		# crawl to the index position
		while counter < index 
			prev_node = current_node
			current_node = current_node.next
			counter += 1
		end

		# Now perform removal (cutting out current_node)
		next_node = current_node.next
		current_node.next = nil # clear the pointer
		prev_node.next = new_node

		puts "Removed node at index #{index} with value: #{current_node.data}"
	end

	# Return the node at that position, like in an array
	# No error handling
	def find_node(index)

		#start at the head
		counter = 0
		current_node = @head

		# crawl to index position
		# outputs each node value for visibility
		while counter < index
			current_node = current_node.next
			counter += 1
		end

		puts "Found node at index #{index} with value: #{current_node.data}"
		current_node
	end

	# crawls and prints the list
	def print_list
		counter = 0
		current_node = @head
		loop do
			puts "Node at index #{counter}: #{current_node.data}"
			break if current_node.next.nil?
			current_node = current_node.next
			counter += 1
		end
	end
	
end
