defmodule Ckhrysze.BlogEngine do
  use NimblePublisher,
    build: Ckhrysze.BlogPost,
    from: Application.app_dir(:ckhrysze, "priv/posts/*"),
    as: :posts

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})
  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  def entries, do: @posts
  def tags, do: @tags

  def get_post_by_id!(id) do
    Enum.find(entries(), &(&1.path == id))
  end
end
