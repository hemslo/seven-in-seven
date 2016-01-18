import List

-- Write a function to find the product of a list of numbers.
product numbers = List.product numbers

-- Write a function to return all of the x fields from a list of point records.
x_fields records = List.map .x records

-- Use records to describe a person containing name, age, and address. You should also express the address as a record.
address = { city = "Shanghai", country = "China" }
person = { name = "Hemslo", age = 25, address = address }

-- Is it easier to use abstract data types or records to solve the previous problem? Why?

-- Write a function called multiply.
multiply x y = x * y

-- Use currying to express 6 * 8.
multiply6 = multiply 6
multiply6 8

-- Make a list of person records. Write a function to find all of the people in your list older than 16.
persons = [{ name = "Alice", age = 15 }, { name = "Bob", age = 24 }]
old = List.filter (\x -> x.age > 16)

-- Write the same function, but allow records where the age field might be nothing. How does Elm support nil values?
persons2 = [{ name = "Alice", age = Just 15 }, { name = "Bob", age = Nothing }]
old2 = List.filter (\x -> case x.age of
                            Just age -> age > 16
                            Nothing -> False)
