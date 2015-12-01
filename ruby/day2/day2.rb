# Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable.
counter = 0
(1..16).each do |n|
  print n, ' '
  counter += 1
  puts if counter % 4 == 0
end
puts

(1..16).each_slice(4) { |numbers| puts numbers.join(' ') }
puts

# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure of hashes. You should be able to specify a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.
class Tree
  attr_accessor :children, :node_name

  def initialize(hsh)
    @node_name = hsh.keys.first
    @children = hsh[@node_name].map { |k, v| self.class.new(k => v) }
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts

# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

def grep(filename, phrase)
  File.foreach(filename).with_index do |line, line_number|
    puts "#{line_number}: #{line}" if line =~ /\W#{phrase}\W/i
  end
end

grep('day2.rb', 'ruby')
