defmodule CkhryszeWeb.Articles.RelaunchWithLiveview do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2023-03-18]
  def title, do: "LiveView Relaunch!"
  def desc, do: "Overview of my site's relaunch using Phoenix LiveView"
  def keywords, do: ~w[]
  def tags, do: ~w[]

  def render(assigns) do
    ~H"""


<p>I've relauched my site using Phoenix and LiveView! There were several reasons that pushed me to go from a Hugo
  powered static site to a hosted webapp.</p>

<p class="mt-2">First, I'm most comfortable here. Although the static site was mostly easy, doing interesting things
  still
  involved a learning curve. That isn't an issue per se, but lessons I learn in the current form are far more applicable
  to my career.</p>

<p class="mt-2">Along the lines of the first, the deep integration with Tailwind out of the box means the Phoenix 1.7 is
  by default the ideal stack for me as I'd currently define it. As such, I want to use it for any project that it is
  even remotely applicable to. This also allows me to create and share experiments in a more direct and, well, 'live'
  way.</p>

<p class="mt-2">Lastly, the hosting isn't a concern for me. I've wanted to use Fly.io for a while now, and this is a
  nice small project to experiment with. I've been in the DevOps camp for a while anyway, and most of the projects have
  been Elixir base, so managing an Elixir app deployment is nothing new.</p>

<p class="mt-2">The new app is up and running, and switching the domain will follow soon. I was able to take all my old
  posts and bring them in with minimal updates thanks to NimblePublisher. The only thing I'd like to have and don't yet
  is to be able to use components within the blog posts...something for the future.</p>
"""
  end
end
