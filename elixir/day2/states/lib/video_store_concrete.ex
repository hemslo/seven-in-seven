defmodule VideoStore.Concrete do import StateMachine.Behavior
  def rent(video), do: fire_with_callbacks(state_machine, video, :rent)

  def return(video), do: fire_with_callbacks(state_machine, video, :return)

  def lose(video), do: fire_with_callbacks(state_machine, video, :lose)

  def find(video), do: fire_with_callbacks(state_machine, video, :find)

  def fire_with_callbacks(states, context, event_name) do
    context = perform_callback(context, "before_#{event_name}")
    context = fire(states, context, event_name)
    perform_callback(context, "after_#{event_name}")
  end

  def perform_callback(context, callback) do
    func = String.to_atom(callback)
    if function_exported?(VideoStore, func, 1) do
      apply(VideoStore, func, [context])
    else
      context
    end
  end

  def state_machine do
    [ available: [
        rent:   [ to: :rented,    calls: [&VideoStore.renting/1]   ]],
      rented: [
        return: [ to: :available, calls: [&VideoStore.returning/1] ],
        lose:   [ to: :lost,      calls: [&VideoStore.losing/1]    ]],
      lost: [
        find:   [ to: :found,     calls: [&VideoStore.finding/1]   ]],
      found: []]
  end
end
