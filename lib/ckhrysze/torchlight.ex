defmodule Ckhrysze.Torchlight do
  use Tesla

  @theme "github-light"
  @cache :torchlight_cache

  def client do
    token = Application.get_env(:ckhrysze, :torchlight_key)

    [
      {Tesla.Middleware.BaseUrl, "https://api.torchlight.dev"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers,
       [
         {"Authorization", "Bearer #{token}"},
         {"X-Torchlight-Client", "Torchlight CLI"}
       ]}
    ]
    |> Tesla.client()
  end

  def process(input, %{cache_id: cache_id} = assigns) do
    {_, output} =
      Cachex.fetch(@cache, cache_id, fn _ ->
        request_formatted_code(input, assigns)
      end)

    output
  end

  def request_formatted_code(input, assigns) do
    IO.puts("requesting formatted code from torchlight")

    client()
    |> Tesla.post("/highlight", %{
      blocks: [
        %{
          id: assigns.cache_id,
          theme: @theme,
          language: assigns.lang,
          code: input |> String.slice(1..-1)
        }
      ]
    })
    |> case do
      {:ok, result} -> result.body["blocks"] |> hd() |> Map.get("highlighted")
      _ -> input
    end
  end
end
