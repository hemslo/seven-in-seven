class CsvRow
  def initialize(headers, content)
    @headers = headers
    @content = content
  end

  def method_missing(name, *args)
    respond_to?(name) ? @content[@headers.index(name.to_s)] : super
  end

  def respond_to_missing?(method, include_private = false)
    @headers.include?(method.to_s) || super
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      @csv_contents.each { |c| yield(CsvRow.new(headers, c)) }
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each { |row| puts row.one }
