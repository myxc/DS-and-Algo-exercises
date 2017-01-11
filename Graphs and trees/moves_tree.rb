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
		@root = Move.new(array[0] - 1, array[1] - 1, @max_depth, [], nil)
		@movesarray = []
	end

	def buildTree
		@movesarray = [@root]
		counter = 1
		@movesChecked = 0
		while counter <= @max_depth
			if counter == 1
				@currentMove = @root
				if @currentMove.x - 1 >= 0 
					if @currentMove.y + 2 <= 7
						@currentMove.children << Move.new(@currentMove.x - 1, @currentMove.y + 2, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x - 1, @currentMove.y + 2, counter, [], @currentMove)
					end
					if @currentMove.y - 2 >= 0
						@currentMove.children << Move.new(@currentMove.x - 1, @currentMove.y - 2, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x - 1, @currentMove.y - 2, counter, [], @currentMove)
					end
				end
				if @currentMove.x + 1 <= 7 
					if @currentMove.y + 2 <= 7
						@currentMove.children << Move.new(@currentMove.x + 1, @currentMove.y + 2, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x + 1, @currentMove.y + 2, counter, [], @currentMove)
					end
					if @currentMove.y - 2 >= 0
						@currentMove.children << Move.new(@currentMove.x + 1, @currentMove.y - 2, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x + 1, @currentMove.y - 2, counter, [], @currentMove)
					end
				end 
				if @currentMove.x - 2 >= 0 
					if @currentMove.y + 1 <= 7
						@currentMove.children << Move.new(@currentMove.x - 2, @currentMove.y + 1, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x - 2, @currentMove.y + 1, counter, [], @currentMove)
					end
					if @currentMove.y - 1 >= 0
						@currentMove.children << Move.new(@currentMove.x - 2, @currentMove.y - 1, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x - 2, @currentMove.y - 1, counter, [], @currentMove)
					end
				end
				if @currentMove.x + 2 <= 7 
					if @currentMove.y + 1 <= 7
						@currentMove.children << Move.new(@currentMove.x + 2, @currentMove.y + 1, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x + 2, @currentMove.y + 1, counter, [], @currentMove)
					end
					if @currentMove.y - 1 >= 0
						@currentMove.children << Move.new(@currentMove.x + 2, @currentMove.y - 1, counter, [], @currentMove)
						@movesarray << Move.new(@currentMove.x + 2, @currentMove.y - 1, counter, [], @currentMove)
					end
				end
				@movesChecked += 1
				counter  += 1
				next
			else
				@iterateFrom = (@movesChecked)
				@iterateTo = @movesarray.length - 1
				for i in @iterateFrom..(@iterateTo)
					@currentMove = @movesarray[i]
					if @currentMove.x - 1 >= 0 	
						if @currentMove.y + 2 <= 7
							@currentMove.children << Move.new(@currentMove.x - 1, @currentMove.y + 2, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x - 1, @currentMove.y + 2, counter, [], @currentMove)
						end
						if @currentMove.y - 2 >= 0
							@currentMove.children << Move.new(@currentMove.x - 1, @currentMove.y - 2, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x - 1, @currentMove.y - 2, counter, [], @currentMove)
						end
					end
					if @currentMove.x + 1 <= 7 
						if @currentMove.y + 2 <= 7
							@currentMove.children << Move.new(@currentMove.x + 1, @currentMove.y + 2, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x + 1, @currentMove.y + 2, counter, [], @currentMove)
						end
						if @currentMove.y - 2 >= 0
							@currentMove.children << Move.new(@currentMove.x + 1, @currentMove.y - 2, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x + 1, @currentMove.y - 2, counter, [], @currentMove)
						end
					end 
					if @currentMove.x - 2 >= 0 
						if @currentMove.y + 1 <= 7
							@currentMove.children << Move.new(@currentMove.x - 2, @currentMove.y + 1, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x - 2, @currentMove.y + 1, counter, [], @currentMove)
						end
						if @currentMove.y - 1 >= 0
							@currentMove.children << Move.new(@currentMove.x - 2, @currentMove.y - 1, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x - 2, @currentMove.y - 1, counter, [], @currentMove)
						end
					end
					if @currentMove.x + 2 <= 7 
						if @currentMove.y + 1 <= 7
							@currentMove.children << Move.new(@currentMove.x + 2, @currentMove.y + 1, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x + 2, @currentMove.y + 1, counter, [], @currentMove)
						end
						if @currentMove.y - 1 >= 0
							@currentMove.children << Move.new(@currentMove.x + 2, @currentMove.y - 1, counter, [], @currentMove)
							@movesarray << Move.new(@currentMove.x + 2, @currentMove.y - 1, counter, [], @currentMove)
						end
					end
					@movesChecked += 1
				end
				counter += 1
			end
		end
	end

	def inspect 
		num = @movesarray.length - 1
		puts "You have #{@movesarray.length} Move nodes with a maximum depth of #{@movesarray[num].depth}."
	end
end

s = MoveTree.new([3,3], 4)
s.buildTree
s.inspect