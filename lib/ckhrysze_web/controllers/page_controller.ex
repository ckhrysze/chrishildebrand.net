defmodule CkhryszeWeb.PageController do
  alias Ckhrysze.BlogEngine
  use CkhryszeWeb, :controller

  def home(conn, _params), do: render(conn, :home)
  def blog(conn, _params), do: render(conn, :blog)
  def radar(conn, _params), do: render(conn, :radar)
  def learn(conn, _params), do: render(conn, :learn)
  def contact(conn, _params), do: render(conn, :contact)

  def blog_entry(conn, params) do
    post = BlogEngine.get_post_by_id!(params["id"])

    render(conn, :blog_entry, post: post)
  end
end
