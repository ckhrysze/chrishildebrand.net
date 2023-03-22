defmodule CkhryszeWeb.BlogController do
  use CkhryszeWeb, :controller

  def article(conn, %{"slug" => article_slug}) do
    mod =
      article_slug
      |> Phoenix.Naming.camelize()
      |> String.replace_prefix("", "Elixir.CkhryszeWeb.Articles.")
      |> String.to_existing_atom()

    render(conn, :article, slug: article_slug, mod: mod)
  end

  def list(conn, _) do
    {:ok, modules} = :application.get_key(:ckhrysze, :modules)

    article_mods =
      modules
      |> Enum.filter(&(&1 |> Module.split() |> Enum.take(2) == ["CkhryszeWeb", "Articles"]))
      |> Enum.sort_by(& &1.date(), {:desc, Date})

    render(conn, :list, articles: article_mods)
  end
end
