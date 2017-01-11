Moves = Struct.new(:x, :y, :depth, :children, :parent)

class MovesTree
	attr_accessor :x, :y, :start_point, :max_depth, 
	def initialize(coord_array, max_depth)
		@max_depth = max_depth
		@start_point = Moves.new(coord_array[0] - 1, coord_array[1] - 1, 0, [], nil)
		avaiable_moves(@start_point)
	end

	def possible_moves(x, y)
		possible_moves_array = []

		if x - 1 >= 0 #1 space to left up and down
			if y + 2 <= 7
				possible_moves_array.push [x -1 , y + 2] 
			end
			if y - 2 >= 0
				possible_moves_array.push [x -1, y - 2] 
			end
		end
		if x + 1 <= 7  #1 space to right up and down
			if y + 2 <= 7
				possible_moves_array.push [x + 1, y + 2] 
			end
			if y - 2 >= 0
				possible_moves_array.push [x + 1, y - 2] 
			end
		end 
		if x - 2 >= 0  #2 spaces to the left and up and down 1
			if y + 1 <= 7
				possible_moves_array.push [x - 2, y + 1] 
			end
			if y - 1 >= 0
				possible_moves_array.push [x - 2, y - 1] 
			end
		end
		if x + 2 <= 7  #2 spaces to the right and up and down 1
			if y + 1 <= 7
				possible_moves_array.push [x + 2, y + 1] 
			end
			if y - 1 >= 0
				possible_moves_array.push [x + 2, y - 1] 
			end
		end

		return possible_moves_array
	end

	def avaiable_moves(move_node)
		max_depth = @max_depth
		current_depth = move_node.depth
		x = move_node.x
		y = move_node.y
		current_depth += 1
		all_available_moves = possible_moves(x, y)
		all_available_moves.each do |move|
			subsequent_move = Moves.new(move[0],move[1], current_depth, [], move_node)
			move_node.children << subsequent_move
			avaiable_moves(subsequent_move) if subsequent_move.depth < max_depth
		end
	end
end