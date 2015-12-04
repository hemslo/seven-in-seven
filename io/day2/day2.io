# 1. A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

fib_recursive := method(n, if(n < 3, 1, fib_recursive(n - 1) + fib_recursive(n - 2)))
fib_recursive(4) println

fib_iterative := method(n,
  num := 1
  prev := 1
  for(i, 3, n,
    tmp := num
    num = num + prev
    prev = tmp
  )
  num
)
fib_iterative(4) println

# 2. How would you change / to return 0 if the denominator is zero?

oldDiv := Number getSlot("/")
Number / := method(n, if(n == 0, 0, oldDiv(n)))
(100 / 0) println

# 3. Write a program to add up all of the numbers in a two-dimensional array.

sum2d := method(arr, arr flatten sum)
sum2d(list(list(1, 2, 3), list(4, 5, 6))) println

# 4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

List myAverage := method(reduce(sum, n, if(n type == "Number", sum + n, Exception raise("Not Number"))) / size)
list(1, 2, 3) myAverage println

# 5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.
# 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.
# 7. Write the matrix to a file, and read a matrix from a file.

TwoDList := Object clone do(
  init := method(self lists := list())

  dim := method(x, y,
    self lists setSize(y) mapInPlace(_, list() setSize(x))
  )

  set := method(x, y, value,
    self lists at(y) atPut(x, value)
  )

  get := method(x, y,
    self lists at(y) at(x)
  )

  transpose := method(
    new_matrix := TwoDList clone
    new_matrix dim(self lists size, self lists at(0) size)
    self lists foreach(y, l, l foreach(x, v, new_matrix set(y, x, v)))
    new_matrix
  )

  toFile := method(name,
    File with(name) open write(serialized) close
  )

  fromFile := method(name,
    doFile(name)
  )
)

l := TwoDList clone
l dim(2, 3)
l set(0, 0, 1)
l set(0, 1, 2)
l set(0, 2, 3)
l set(1, 0, 4)
l set(1, 1, 5)
l set(1, 2, 6)
l get(0, 1) println
new_matrix := l transpose
new_matrix get(0, 1) println
l toFile("matrix.io")
matrix := TwoDList fromFile("matrix.io")
matrix get(0, 1) println

# 8. Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.
num := (Random value * 100) floor
for(i, 1, 10,
  guess := File standardInput readLine("Enter number(1-100): ") asNumber
  if(guess == num, "win" println break,
     if(guess < num, "hotter" println, "colder" println))
)
if(guess != num, "failed" println)
