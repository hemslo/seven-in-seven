defprotocol StateMachineProtocol do
  def state(data)
  def update_state(data, to)
end

defimpl StateMachineProtocol, for: Any do
  def state(data), do: data.state
  def update_state(data, to), do: %{data | state: to}
end
