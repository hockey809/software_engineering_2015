file = ARGV.first
f = File.open(file, "r")
hash = Hash.new(0)

f.each_line do |line|
	alignment = line.downcase.split
	alignment.each do |word|
		word = word.gsub(/[,()'"„“.*?:]/, '')
			hash[word] += 1
	end	
end

hash.sort{|x, y| x <=> y}.sort{|x, y| y[1] <=> x[1]}.each do |word, count|	
	puts "#{word},#{count}"
end