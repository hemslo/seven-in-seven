# Print the string "Hello, world."
puts 'Hello, world.'

# For the string "Hello, Ruby," find the index of the word "Ruby."
puts 'Hello, Ruby'.index('Ruby')

# Print your name ten times.
10.times { puts 'Hemslo' }

# Print the string "This is sentence number 1," where the number 1 changes from 1 to 10.
(1..10).each { |n| puts "This is sentence number #{n}" }

# Run a Ruby program from a file.
# ruby /path/to/file

# Bonus problem: If you're feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high. (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)
number = rand(10)
loop do
  puts 'Enter number(0-9):'
  case gets.to_i <=> number
  when -1
    puts 'too low'
  when 0
    puts 'correct'
    break
  when 1
    puts 'too high'
  else
    puts 'error'
  end
end
