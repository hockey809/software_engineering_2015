require 'json'
require_relative 'A_21_Nikolay_Danailov/svg_tree_generator.rb'


RESULT_FILE = "A_21_Nikolay_Danailov.svg"

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
tree_generator = SVGTreeGenerator.new

File.open(RESULT_FILE, 'w') do |file|
  file << '<svg xmlns="http://www.w3.org/2000/svg">'
  file << tree_generator.generate_from_json(json)
  file << '</svg>'
end
