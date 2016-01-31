defmodule StateMachine do
  defmacro __using__(_) do
    quote do
      import StateMachine
      @states []
      @before_compile StateMachine
    end
  end

  defmacro state(name, events) do
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end

  defmacro __before_compile__(env) do
    states = Module.get_attribute(env.module, :states)
    events = states
             |> Keyword.values
             |> List.flatten
             |> Keyword.keys
             |> Enum.uniq

    quote do
      def state_machine do
        unquote(states)
      end

      unquote event_callbacks(events, env.module)
    end
  end

  def event_callback(name, module) do
    quote do
      def unquote(name)(context) do
        context = perform_callback(context, unquote(module), "before_#{unquote(name)}")
        context = StateMachine.Behavior.fire(state_machine, context, unquote(name))
        perform_callback(context, unquote(module), "after_#{unquote(name)}")
      end
    end
  end

  def perform_callback(context, module, callback) do
    func = String.to_atom(callback)
    if function_exported?(module, func, 1) do
      apply(module, func, [context])
    else
      context
    end
  end

  def event_callbacks(names, module) do
    Enum.map names, &(event_callback(&1, module))
  end
end
