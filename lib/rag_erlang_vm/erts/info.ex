defmodule RagErlangVm.Erts.Info do
  def max_heap_size do
    :erlang.system_info(:max_heap_size)
  end

  def max_heap_size(pid) do
    case :erlang.process_info(pid, :max_heap_size) do
      {:max_heap_size, info} -> info
      _ -> nil
    end
  end

  def pid(id) when is_binary(id) do
    id
    |> String.to_charlist()
    |> :erlang.list_to_pid()
  end
end
