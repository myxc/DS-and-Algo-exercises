TreeNode = Struct.new(:left, :right, :data)
class BinaryTree
	attr_accessor :values
	def initialize(array = nil)
		@rootNode = nil
		@currentNode = nil
		@values = array
	end

	def addNode(number) #if no node is given it defaults to root otherwise it operates on that node.
		if @rootNode == nil
			@rootNode = TreeNode.new(nil, nil, number)
			return
		end
		@currentNode = @rootNode
		while true
			if number < @currentNode.data
				if @currentNode.left == nil
					@currentNode.left = TreeNode.new(nil, nil, number)
					break 
				else
					@currentNode = @currentNode.left
				end
			elsif number > @currentNode.data
				if @currentNode.right == nil
					@currentNode.right = TreeNode.new(nil, nil, number)
					break
				else
					@currentNode = @currentNode.right
				end
			end
		end
	end

	def outputNodes()
		nodeArray = [@rootNode]
		while nodeArray.length != 0
			nodeArray.each_with_index do |node|
				if node.nil?
					next
				end
				print "#{node.data} "
			end
			print "\n"
			tempArray = []
			nodeArray.each do |node|
				if node.nil?
					next
				end
				tempArray << node.left
				tempArray <<node.right
			end
			nodeArray = tempArray
		end	
	end
end

binary_tree = BinaryTree.new([8, 10, 3, 1, 6, 14, 4, 7, 13])
binary_tree.values.each do |val|
	binary_tree.addNode(val)
end
binary_tree.outputNodes()