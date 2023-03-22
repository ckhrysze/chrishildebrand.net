defmodule CkhryszeWeb.Articles.MnesiaSetup do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2019-10-06]
  def title, do: "Mnesia Setup"
  def desc, do: "Mnesia setup in a production environment"
  def keywords, do: ~w[elixir mnesia]
  def tags, do: ~w[elixir]

  def render(assigns) do
    ~H"""
    <p>
      A while back at work we decided to transition to MNesia from the existing combiniation of ETS and Genservers.
      Although replacing the in memory scenarios on local dev machines was straight forward, we had several obstacles when
      moving to a clustered cloud setup. I wrote up some of the lessons we learned at the <a
        href="https://engineering.versussystems.com/mnesia-and-distillery"
        class="text-blue-900"
      >company engineering
        blog</a>.
    </p>
    """
  end
end
