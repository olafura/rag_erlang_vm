defmodule RagErlangVm.Rag.Serving do
  @moduledoc """
  Functions to build servings that can be used with `Rag.Ai.Nx`.
  """

  alias Bumblebee.Text

  def build_embedding_serving do
    repo = {:hf, "thenlper/gte-small"}

    {:ok, model_info} = Bumblebee.load_model(repo)

    {:ok, tokenizer} = Bumblebee.load_tokenizer(repo)

    Text.TextEmbedding.text_embedding(model_info, tokenizer,
      compile: [batch_size: 64, sequence_length: 512],
      defn_options: [compiler: EXLA],
      output_attribute: :hidden_state,
      output_pool: :mean_pooling
    )
  end

  def build_llm_serving do
    repo = {:hf, "HuggingFaceTB/SmolLM2-135M-Instruct"}

    {:ok, model_info} = Bumblebee.load_model(repo)
    {:ok, tokenizer} = Bumblebee.load_tokenizer(repo)
    {:ok, generation_config} = Bumblebee.load_generation_config(repo)

    generation_config = Bumblebee.configure(generation_config, max_new_tokens: 100)

    Text.generation(model_info, tokenizer, generation_config,
      compile: [batch_size: 1, sequence_length: 6000],
      defn_options: [compiler: EXLA],
      stream: false
    )
  end
end
