defmodule RagErlangVm.Repo do
  use Ecto.Repo,
    otp_app: :rag_erlang_vm,
    adapter: Ecto.Adapters.Postgres
end
