require 'csv'

input_file = ARGV[0]
command = ARGV[1]
csv = CSV.read input_file

if command == "sort"
	sort_column = ARGV[2].to_i
	sort_order = ARGV[3]

	csv = csv.sort_by { |item| item[sort_column] }

	if sort_order == "DESC"
		csv = csv.reverse
	end
elsif command == "filter_costs"
	min_cost = ARGV[2].to_i
	max_cost = ARGV[3].to_i

	csv = csv.select { |item| item[2].to_i >= min_cost and item[2].to_i <= max_cost }
end

p csv