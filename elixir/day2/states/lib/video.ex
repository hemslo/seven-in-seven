defmodule Video do
  @derive StateMachineProtocol
  defstruct title: "", state: :available, times_rented: 0, log: []
end
