require 'csv'
require 'json'
require 'rexml/document'

filename = ARGV[0]
output = ARGV[1]

class Result
    def intialize
        @mark_counts = 0
        @word_counts = Hash.new(0)
    end
    
    attr_accessor :mark_counts, :word_counts

    def to_csv
        word_counts.each do |words,number|
        puts "#{words}, #{number}"
        end
 
        if mark_counts!=0
            puts "\"marks\", #{@mark_counts}"
        end
    end

    def to_json
        json_hash = Hash.new(0)
        json_hash["marks"] = @mark_counts
        json_hash["words"] = @word_counts
        puts json_hash.to_json
    end

    def to_xml
            xml_ = REXML::Document.new('') 
            word_c_t = xml_.add_element('word-counts')
            word_c_t.add_element('marks').add_text mark_counts.to_s
            words_t = word_count.add_element('words')

            @word_counts.each do |word, count|
            words_t.add_element('word', {'count' => count}).add_text word
            end
            formatter = REXML::Formatters::Pretty.new(4)
            formatter.compact = true
            formatter.write(xml_, $stdout)
    end

end
class WordCounter
    def parse(string)
  	result = Result.new
	result.mark_counts = string.scan(/[^A-Za-z0-9_ \s]/).count
		
	string.gsub!(/[^A-Za-z0-9_\s]/, ' ')
	string.downcase!
	string = string.split(" ")

	hash = Hash.new(0)
	string.each do |word|
		hash[word] += 1
	end
		
	hash = hash.sort_by{|word, i| [-i, word]}
	result.word_counts = hash
	result
 
 end


     def parse_file(filename)
       f = File.open(filename)
       text = ''
       f.each_line do |line|
         text += line
       end
       parse text
     end
end

count_words = WordCounter.new
result = count_words.parse_file ARGV[0]

if ARGV[1] == 'json'
  puts result.to_json
elsif ARGV[1] == 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
