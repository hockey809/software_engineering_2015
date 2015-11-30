require_relative './A_19_Nikolay_Rangelov/word_counter'


def ifSite(filename)
	first = filename.split('/').first
	return first == 'http:' || first == 'https:'
end

file_name = ARGV[0].to_s
out_format = ARGV[1].to_s
format = "string"

if File.file? file_name
    format = "file"
end

if ifSite file_name
	format= "url"
end 


if format == "file"
	result = WordCounter.parse_file file_name
end

if format == "url"
	result = WordCounter.parse_webpage file_name
end

if format == "string"
	result = WordCounter.parse file_name
end

if out_format=="csv" or out_format == ""
	puts result.to_csv
end

if out_format=="json"
	puts result.to_json
end

if out_format=="xml" 
	puts result.to_xml
end

if out_format=="svg" 
	puts result.to_svg
end
