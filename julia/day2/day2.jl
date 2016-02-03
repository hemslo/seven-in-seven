# Write a for loop that counts backward using Julia’s range notation.
for i = 10:-1:1
  println(i)
end

#Write an iteration over a multidimensional array like [1 2 3; 4 5 6; 7 8 9]. In what order does it get printed out?
for i = [1 2 3; 4 5 6; 7 8 9]
  println(i)
end

# Write a factorial function as a parallel for loop.
function factorial(n)
  @parallel (*) for i = 1:n
    i
  end
end

# Add a method for concat that can concatenate an integer with a matrix. concat(5,[1 2 ; 3 4]) should produce [ 5 5 1 2 ; 5 5 3 4].
function concat(a :: Int64, b :: Array)
  hcat(fill(a, (size(b)[1], 2)), b)
end

# You can extend built-in functions with new methods too. Add a new method for + to make "jul" + "ia" work.
function +(a :: ASCIIString, b :: ASCIIString)
  "$a$b"
end
