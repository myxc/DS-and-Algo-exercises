require_relative 'moves_tree'
require_relative 'queue'
require 'benchmark'

class KnightSearcher
	attr_accessor :startPoint, :matchingMove, :moveCounter
	def initialize(tree)
		@moveTree = tree
		@startPoint = tree.root
		@matchingMove = nil
		@moveQueue = Queue.new
		@moveCounter = 1
	end

	def bfs_for(array)
		search_x = array[0] - 1
		search_y = array[1] - 1
		@moveQueue.enqueue(@startPoint)
		while !@moveQueue.empty?
			current_comparison = @moveQueue.dequeue

			if current_comparison.nil? == false
				if [current_comparison.x, current_comparison.y] == [search_x, search_y]
					@matchingMove = current_comparison
					output_Moves
					return
				else
					current_comparison.children.each do |child|
						@moveQueue.enqueue(child)
					end
				end
			end
		end
		if @moveQueue.empty?
			puts "Impossible for Knight to move from #{startPoint.x + 1},#{startPoint.y + 1} to #{search_x + 1}, #{search_y + 1} in #{@moveTree.max_depth} moves."
		end		
	end

	def output_Moves
		@end = @matchingMove
		@orderedMoves = []
		if @matchingMove.nil? == false
			while !(@end == @startPoint)
				@orderedMoves.unshift(@end)
				@end = @end.parent
			end
		end
		@orderedMoves.unshift(@startPoint)
		puts "#{@orderedMoves.length} Move(s):"
		for i in 0..(@orderedMoves.length - 1)
			puts "[#{@orderedMoves[i].x + 1},#{@orderedMoves[i].y + 1}]"
		end
	end

	def dfs_for(array)
		search_x = array[0] - 1
		search_y = array[1] - 1

		dfs_stack = [@startPoint]
		current_comparison = @startPoint
		if (current_comparison.x == search_x && current_comparison.y == search_y)
			@matchingMove = current_comparison
			output_Moves
			return
		else
			current_comparison.children.each do |child|
				dfs_stack << child
			end
		end
		stack_last_index = dfs_stack.length - 1
		while !(dfs_stack[stack_last_index] == @startPoint)
			current_comparison = dfs_stack.pop
			if (current_comparison.x == search_x && current_comparison.y == search_y)
				@matchingMove = current_comparison
				output_Moves
				return
			else
				current_comparison.children.each do |child|
					dfs_stack << child
				end
			end
			stack_last_index = dfs_stack.length - 1
		end
		puts "Too few turns to move to there."
	end
end


tree = MoveTree.new([3,3], 5)
tree.inspect

searcher = KnightSearcher.new(tree)
Benchmark.bm(10) do |x|
	x.report('bfs:') { searcher.bfs_for([7,7]) }
	x.report('dfs:') { searcher.dfs_for([7,7]) }
end
