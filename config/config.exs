import Config
config :rag_erlang_vm, RagErlangVm.Repo, types: RagErlangVm.PostgrexTypes
config :rag_erlang_vm, openai_key: "your openai API key"
config :nx, default_backend: EXLA.Backend
