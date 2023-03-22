defmodule CkhryszeWeb.Articles.ElmFromTheOutside do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2016-10-02]
  def title, do: "Elm from the Outside"
  def desc, do: "Some thoughts on Elm"
  def keywords, do: ~w[elm]
  def tags, do: ~w[thoughts languages elm]

  def render(assigns) do
    ~H"""


<p>Despite hearing about it from afar for a while, I've yet to really dig into <.a href="http://elm-lang.org/">elm.</.a> I
  listened to a few <.a href="https://changelog.com/191/">Changelog</.a> <.a
    href="https://changelog.com/218/">podcasts</.a>, read through the documentation and even installed it at one point,
  but never had the chance to really sit down and learn what its all about</p>

<p>I recently watched <.a href="http://jessitron.com/">Jessica Kerr's</.a> <.a href="https://youtu.be/cgXhMc8M4X4">GOTO;
    talk about elm</.a> which renewed my excitement, especially as her talk made it feel even more approachable.</p>

<p>Even better, this time I have an actual project I would like to do, and elm seems like an ideal fit for my goals.</p>
"""
  end
end
