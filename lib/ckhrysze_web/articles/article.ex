defmodule CkhryszeWeb.Article do
  @callback date :: Date.t()
  @callback title :: String.t()
  @callback desc :: String.t()
  @callback tags :: [String.t()]
  @callback keywords :: [String.t()]

  @callback render(Map.t()) :: any()
end
