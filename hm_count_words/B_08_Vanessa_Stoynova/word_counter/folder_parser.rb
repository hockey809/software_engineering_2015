require 'word_counter/file_parser'

module WordCounter
	class FolderParser < Parser
		def parse(folder)
		
			words = Hash.new(0)
			max_marks = 0
			
  			Dir.glob(folder + "**/" + "*").each do |file|
				if File.file?(file)
					result = super(File.read(file).downcase)
					words = words.merge(result.word_counts.to_h) { |key, old, new| old + new }
					max_marks += result.marks_count
				end
			end	
			
			sorted_words = words.sort_by { |word, occurence| [-occurence, word]}
			Result.new(sorted_words, max_marks)
		end
	end
end