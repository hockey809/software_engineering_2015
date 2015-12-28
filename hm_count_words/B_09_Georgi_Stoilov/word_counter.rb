require_relative 'word_counter/parser'
require_relative 'word_counter/file_parser'
require_relative 'word_counter/web_parser'
require_relative 'word_counter/folder_parse'

module WordCounter

  def self.parse(string)
    Parser.new.parse_string(string)
  end

  def self.parsing_the_file(filename)
    FileParser.new.parse_file(filename)
  end

  def self.parsing_web_source(url)
    WebParser.new.parse_web(url)
  end

  def self.parse_folder(folder, format)
    FolderParse.new.parsing_folder(folder, format)
  end

end
