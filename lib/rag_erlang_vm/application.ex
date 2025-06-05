defmodule RagErlangVm.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RagErlangVm.Repo,
      {Nx.Serving,
       [
         serving: RagErlangVm.Rag.Serving.build_llm_serving(),
         name: Rag.LLMServing,
         batch_timeout: 100
       ]},
      {Nx.Serving,
       [
         serving: RagErlangVm.Rag.Serving.build_embedding_serving(),
         name: Rag.EmbeddingServing,
         batch_timeout: 100
       ]}
    ]

    opts = [strategy: :one_for_one, name: RagErlangVm.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
