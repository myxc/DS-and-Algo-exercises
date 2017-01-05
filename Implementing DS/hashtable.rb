require_relative 'linked.rb'

class HashTable
	def initialize()
		buckets = []
	end

	def hash(word)
		hashindex = word.upcase.ord - 65
		return hashindex
	end

	def insert(word, definition = "")
		hashindex = hash(word)
		if buckets[hashindex].nil?
			buckets[hashindex] = Linkedlist.new()
		end
		buckets[hashindex].add_node([word, definition])
	end

	def renderlist()
		for i in 0..25
			char = (i + 65).chr
			puts "For the letter #{char}, "
			buckets[i].crawler(979797979)
		end
	end

	def define(word)
		hashindex = hash(word)
		if buckets[hashindex].find_data(word) == false
			puts "The definition corresponding with #{word} was not found in the table"
		else 
			puts "#{buckets[hashindex].find_data(word)[1]}\"."
		end
	end


end

