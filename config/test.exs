import Config

config :rag_erlang_vm, RagErlangVm.Repo,
  database: "rag_erlang_vm_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

