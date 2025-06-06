import Config

config :rag_erlang_vm, ecto_repos: [RagErlangVm.Repo]

config :rag_erlang_vm, RagErlangVm.Repo, types: RagErlangVm.PostgrexTypes
config :rag_erlang_vm, openai_key: System.fetch_env!("OPENAI_TOKEN")
config :nx, default_backend: EXLA.Backend

import_config "#{config_env()}.exs"
