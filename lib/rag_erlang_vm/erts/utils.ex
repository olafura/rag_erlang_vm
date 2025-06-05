defmodule RagErlangVm.Erts.Utils do
  def string_to_pid(id) when is_binary(id) do
    id
    |> String.to_charlist()
    |> :erlang.list_to_pid()
  end

  def pid_to_string(pid) when is_pid(pid) do
    pid
    |> :erlang.pid_to_list()
    |> to_string()
  end
end
