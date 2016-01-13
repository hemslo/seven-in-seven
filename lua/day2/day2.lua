-- Write a function called concatenate(a1, a2) that takes two arrays and returns a new array with all the elements of a1 followed by all the elements of a2.
function concatenate(a1, a2)
  a = {}
  for _, arr in pairs({a1, a2}) do
    for _, v in pairs(arr) do
      a[#a + 1] = v
    end
  end
  return a
end

-- Our strict table implementation in Reading and Writing, on page 19 doesn’t provide a way to delete items from the table. If we try the usual approach, treasure.gold = nil, we get a duplicate key error. Modify strict_write() to allow deleting keys (by setting their values to nil).
-- strict.lua

 -- Change the global metatable you discovered in the Find section earlier so that any time you try to add two arrays using the plus sign (e.g., a1 + a2), Lua concatenates them together using your concatenate() function.

local mt = {
  __add = concatenate
}

-- Using Lua’s built-in OO syntax, write a class called Queue that implements a first-in, first-out (FIFO) queue as follows:
-- – q = Queue:new() returns a new object.
-- – q:add(item) adds item past the last one currently in the queue.
-- – q:remove() removes and returns the first item in the queue, or nil if the queue is empty.
Queue = {
  new = function(self)
     local obj = {
        data = {}
     }
     setmetatable(obj, self)
     self.__index = self
     return obj
  end
}

function Queue:add(item)
  self.data[#self.data + 1] = item
  return self
end

function Queue:remove()
  if #self.data == 0 then
    return nil
  else
    return table.remove(self.data, 1)
  end
end

-- Using coroutines, write a fault-tolerant function retry(count, body) that works as follows:
-- – Call the body() function.
-- – If body() yields a string with coroutine.yield(), consider this an error message and restart body() from its beginning.
-- – Don’t retry more than count times; if you exceed count, print an error message and return.
-- – If body() returns without yielding a string, consider this a success.
-- Most of the time, the inner function will fail; retry() should keep trying until it’s achieved success or tried five times.
-- Hint: You may need to create more than one coroutine.

function retry(count, body)
  local err = nil
  for i = 1, count do
    local c = coroutine.create(body)
    _, err = coroutine.resume(c)
    if not err then return end
  end
  print(err)
end

math.randomseed(os.time())

-- Example usage:
retry(5,
      function()
        if math.random() > 0.2 then
          coroutine.yield('Something bad happened')
        end
        print('Succeeded')
      end
)
