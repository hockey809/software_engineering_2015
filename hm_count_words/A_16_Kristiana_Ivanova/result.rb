class Result
  attr_accessor :marks_count
  attr_accessor :word_counts

  def initialize
    @marks_count = 0
    @word_counts = Hash.new(0)
  end

  def to_csv
    word_counts.each do |item, amount|
      puts item + "," + amount.to_s
    end

    if marks_count != 0
      puts "\"marks\"," + marks_count.to_s
    end
  end

  # -----------------------------------------------------
  def to_xml
    xml_document = REXML::Document.new
    xml_item_counts = xml_document.add_element 'word-counts'
    xml_marks = xml_item_counts.add_element 'marks'
    xml_marks.add_text "#{marks_count}"
    xmls_items = xml_item_counts.add_element 'words' # xml words

    word_counts.each do |item, amount|
      item = xmls_items.add_element('word', 'count' => amount).text = "#{item}" #item = word
    end

    formatter = REXML::Formatters::Pretty.new(2)
    formatter.compact = true
    formatter.write(xml_document, $stdout)
  end

  # ----------------------------------------------------
  def to_json
    json_output = { "marks" => marks_count, "items" => word_counts}
    puts JSON.pretty_generate(json_output)
  end
end
