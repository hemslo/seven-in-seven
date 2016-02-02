# Use typeof to find the types of types. Try Symbol or Int64. Can you find the types of operators?
typeof(Symbol)
typeof(Int64)
typeof(+)

# Create a typed dictionary with keys that are symbols and values that are floats. What happens when you add :thisis => :notanumber to the dictionary?
dict = Dict(:a => 1.1)
dict[:thisis] = :notanumber

# Create a 5×5×5 array where each 5×5 block in the first two dimensions is a single number but that number increases for each block. For example, magic[:,:,1] would have all elements equal to 1, and magic[:,:,2] would have all elements equal to 2.
magic = [z for x in 1:5, y in 1:5, z in 1:5]

# Run some arrays of various types through functions like sin and round. What happens?
sin(fill(1.5,(3,3)))
round(fill(1.5, (3,3)))
sin(fill(:a, (3,3))
round(fill(:a, (3,3)))

# Create a matrix and multiply it by its inverse. Hint: inv computes the inverse of a matrix, but not all matrices are invertable.
m = [1 2; 3 4]
m * inv(m)

# Create two dictionaries and merge them. Hint: Look up merge in the manual.
d1 = Dict(:a => 1)
d2 = Dict(:b => 2)
merge(d1, d2)

# sort and sort! both operate on arrays. What is the difference between them?
a = [2, 3, 4, 1, 5]
sort(a)
a
sort!(a)
