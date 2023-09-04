defmodule CkhryszeWeb.PageController do
  use CkhryszeWeb, :controller

  def home(conn, _params), do: render(conn, :home)
  def experience(conn, _params), do: render(conn, :experience, jobs: Ckhrysze.Experience.data())
  def blog(conn, _params), do: render(conn, :blog)
  def radar(conn, _params), do: render(conn, :radar)
  def learn(conn, _params), do: render(conn, :learn)
  def contact(conn, _params), do: render(conn, :contact)
end
