defmodule RagErlangVm.MixProject do
  use Mix.Project

  def project do
    [
      app: :rag_erlang_vm,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RagErlangVm.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:pgvector, "~> 0.3.0"},
      {:ecto_sql, "~> 3.10"},
      {:ecto, "~> 3.0"},
      {:exla, "~> 0.9.1"},
      {:bumblebee, "~> 0.6.0"},
      {:text_chunker, "~> 0.3.1"},
      {:rag, "~> 0.2.3"}
    ]
  end
end
