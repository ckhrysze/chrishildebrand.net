defmodule CkhryszeWeb.PageController do
  use CkhryszeWeb, :controller

  alias Ckhrysze.BlogEngine

  def home(conn, _params), do: render(conn, :home)
  def blog(conn, _params), do: render(conn, :blog)
  def articles(conn, _params), do: render(conn, :articles)
  def radar(conn, _params), do: render(conn, :radar)
  def learn(conn, _params), do: render(conn, :learn)
  def contact(conn, _params), do: render(conn, :contact)
end
