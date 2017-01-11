Move = Struct.new(:x, :y, :depth, :children, :parent)


class MoveTree
	attr_accessor :x, :y, :children, :parent, :movesarray, :root, :max_depth, :depth
	#constructs a tree of potential moves from a given position by using a series of Move structs. 
	#It should take two inputs: coordinate pair to represent the starting position and a max_depth value which prevents
	#the tree from continuing to get infinitely large.
	#It's okay to repeat positions in different subtrees but you can't go off the board..
	#Start with max_depth value of 1 and see that everything works properly before you move on further.
	def initialize(array, max_depth)
		#x and y are the coords of the starting value
		@max_depth = max_depth
		@nodes_counter = 1
		@root = Move.new(array[0] - 1, array[1] - 1, 0, [], nil) #array values are adjusted to match indices which start from 0 not 1
		buildTree(@root)
	end

	def buildTree(move_node)
		max_depth = @max_depth
		current_depth = move_node.depth
		x = move_node.x 
		y = move_node.y 
		current_depth += 1 #building the next layer.
		possible_moves = possible_moves_array(x, y)
		possible_moves.each do |child|
			child_move = Move.new(child[0], child[1], current_depth, [], move_node)
			move_node.children << child_move
			@nodes_counter += 1
			if child_move.depth < @max_depth
				buildTree(child_move)
			end #works because the values are local to the block each time it is called, so later incremented values of current depth don't affect the other child nodes from the original which have yet to be resolved.
		end
	end

	def possible_moves_array(x, y)
		array = []

		#1 space up or down and 2 spaces to the right
		x1 = x + 2
		array.push [x1, y + 1] if x1 <= 7 && (y + 1) <= 7
		array.push [x1, y - 1] if x1 <= 7 && (y - 1) >= 0

		#1 space up or down and 2 spaces to the left
		x2 = x - 2
		array.push [x2, y + 1] if x2 >= 0 && (y + 1) <= 7
		array.push [x2, y - 1] if x2 >= 0 && (y - 1) >= 0

		#2 spaces up and 1 space left or right
		y1 = y + 2
		array.push [x - 1, y1] if x - 1 >= 0 && (y1) <= 7
		array.push [x + 1, y1] if x + 1 <= 7 && (y1) <= 7		

		#2 spaces down 1 space left or right
		y2 = y - 2
		array.push [x - 1, y2] if x - 1 >= 0 && (y2) >= 0
		array.push [x + 1, y2] if x + 1 <= 7 && (y2) >= 0

		return array
	end

	def inspect
		num = @nodes_counter #number of nodes in the tree
		puts "Your tree has #{num} Move nodes and a maximum depth of #{@max_depth}."
	end

end
