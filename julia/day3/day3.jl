# Write a macro that runs a block of code backward.
macro backward(b)
  quote
    map(eval,reverse($b.args))[1]
  end
end
