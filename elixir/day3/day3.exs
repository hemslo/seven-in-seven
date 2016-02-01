# Add a timeout to the pitcher or catcher. What happens when you time out?

ball_glove  = fn -> receive do
  {:pitch, pitcher} ->
    send pitcher, {:catch, self()}
  after
    1_000 -> IO.puts "nothing after 1s in catcher"
  end
end

catcher = spawn ball_glove

:timer.sleep(2000)
send catcher, {:pitch, self()}
receive do
  {:catch, _pid} ->
    IO.puts "Caught it!"
  after
    1_000 -> IO.puts "nothing after 1s in pitcher"
end
