defmodule RagErlangVm.Erts.Tune do
  def max_heap_size(info) when is_map(info) do
    :erlang.system_flag(:max_heap_size, info)
  end

  def max_heap_size(pid, info) when is_pid(pid) and is_map(info) do
    :erlang.process_flag(pid, :max_heap_size, info)
  end
end
