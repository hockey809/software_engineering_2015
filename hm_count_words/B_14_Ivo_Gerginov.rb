require './B_14_Ivo_Gerginov/word_counter'


f_path = ARGV[0]
op = ARGV[1]

res = WordCounter::parseFile f_path 

if op == 'json'
  res.to_json
  File.open('result.json', 'r').each_line do |line|
  	puts line
  end

elsif op == 'xml'
  res.to_xml
  File.open('result.xml', 'r').each_line do |line|
  	puts line
  end

else res.to_csv
  File.open('result.csv', 'r').each_line do |line|
  	puts line
  end

end

