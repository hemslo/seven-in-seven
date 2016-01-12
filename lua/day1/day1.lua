-- Write a function called ends_in_3(num) that returns true if the final digit of num is 3, and false otherwise.
function ends_in_3(num)
  return num % 10 == 3
end

print(ends_in_3(13))
print(ends_in_3(14))

-- Now, write a similar function called is_prime(num) to test if a number is prime (that is, it’s divisible only by itself and 1).
function is_prime(num)
  for i = 2, num - 1 do
    if num % i == 0 then return false end
  end
  return true
end

print(is_prime(13))
print(is_prime(14))

-- Create a program to print the first n prime numbers that end in 3. Do (Medium):
function first_n_prime_numbers_end_in_3(n)
  local num = 2
  while n > 0 do
    if ends_in_3(num) and is_prime(num) then
      print(num)
      n = n - 1
    end
    num = num + 1
  end
end

first_n_prime_numbers_end_in_3(4)

-- What if Lua didn’t have a for loop? Using if and while, write a function for_loop(a, b, f) that calls f() on each integer from a to b (inclusive).
function loop(a, b, f)
  local i = a
  while i <= b do
    f(i)
    i = i + 1
  end
end

loop(1, 3, print)

-- Write a function reduce(max, init, f) that calls a function f() over the integers from 1 to max like so:
-- function add(previous, next)
--   return previous + next
-- end
-- reduce(5, 0, add) -- add the numbers from 1 to 5
-- We want reduce() to call add() 5 times with each intermediate -- result, and return the final value of 15:
--
-- add( 0, 1) --> returns 1; feed this into the next call
-- add( 1, 2) --> returns 3 add( 3, 3) --> returns 6 add( 6, 4) --> returns 10 add(10, 5) --> returns 15
function reduce(max, init, f)
  local acc = init
  for i = 1, max do
    acc = f(acc, i)
  end
  return acc
end

print(reduce(5, 0, function(a, b) return a + b end))

-- Implement factorial() in terms of reduce().
function factorial(num)
  return reduce(num, 1, function(a, b) return a * b end)
end

print(factorial(6))
