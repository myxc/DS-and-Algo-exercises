def palindrome_r(string)

	#break case
	if string.length == 0 || string.length == 1 #all strings are palindromes when length is 0 or 1
		puts "true"
		return true

	end
	if %w(? ,).any?{|s| string.include? s}
		string = string.gsub(/[^a-z0-9]/i, '')
	end
	
	#ASSUMING STRINGS ARE ALPHANUMERIC AND PUNCTUATION FREE (because regex hates me???/)

	if string.is_a? String
	string = string.downcase.split(//)
	end #string is now an array
	if string[0] == string[-1]
		string.delete_at(0)
		string.delete_at(-1)
		palindrome_r(string)
	else
		puts "false"
		return false
		
	end
end

palindrome_r("abb,A")

def palindrome_i(string)
	