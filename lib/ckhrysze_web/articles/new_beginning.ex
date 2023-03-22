defmodule CkhryszeWeb.Articles.NewBeginning do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2016-09-28]
  def title, do: "A New Beginning"
  def desc, do: "Blogging. Again."
  def keywords, do: ~w[blog]
  def tags, do: ~w[thoughts]

  def render(assigns) do
    ~H"""


<p>This is not my first attempt at blogging. I've always enjoyed writing, but never kept a journal. I like sharing the
  things I learn with people in either written or spoken mediums. I frequently start conversations with people by asking
  questions I've thought of since we last talked, and just generally value the exchange of ideas. Despite these things,
  this format has never seemed ideal for how I want to communicate.
</p>

<p>However, something clicked for me recently. Instead of speaking at the nameless masses, or a void given the traffic
  past attempts have brought, the audience for these writings will be, at least in the beginning, me. More specifically,
  my future self. I hope that I'll eventually have answers where I currently have questions; that when I run into a
  problem I've already solved, I can find it here. If nothing else I can look back on these and chart at least part of
  my journey.
</p>

<p>Maybe, at some point down the road, other people will find and connect with what I write.
</p>
"""
  end
end
