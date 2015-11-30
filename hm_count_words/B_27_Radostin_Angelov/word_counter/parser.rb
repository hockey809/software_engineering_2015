module WordCounter
  class Parser
    def parse(text)
	words_count = Hash.new(0)
	    words = text.downcase.scan(/[a-zA-Z0-9]+/)

	    words.each {
		|x|
		if words_count.has_key?("#{x}")
		    words_count["#{x}"] += 1
		else
		    words_count["#{x}"] = 1
		end
	    }
	words_count = words_count.sort_by {|word, count| [-count, word]}
	
	marks_count = text.scan(/[[:punct:]|+-=\/\\p{S}]/).size
	
	Result.new(words_count, marks_count)      
    end
  end
end
