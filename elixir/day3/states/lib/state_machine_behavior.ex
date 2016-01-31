defmodule StateMachine.Behavior do
  def fire(context, event) do
    StateMachineProtocol.update_state(context, event[:to])
    |> activate(event)
  end

  def fire(states, context, event_name) do
    event = states[StateMachineProtocol.state(context)][event_name]
    fire(context, event)
  end

  def activate(context, event) do
    Enum.reduce(event[:calls] || [], context, &(&1.(&2)))
  end
end
