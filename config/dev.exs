import Config

config :rag_erlang_vm, RagErlangVm.Repo,
  database: "rag_erlang_vm_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
