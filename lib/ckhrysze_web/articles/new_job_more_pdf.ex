defmodule CkhryszeWeb.Articles.NewJobMorePdf do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-01-27]
  def title, do: "New Job More PDF"
  def desc, do: "Somehow, PDFs are a thing I do"
  def keywords, do: ~w[ruby prawn pdf]
  def tags, do: ~w[pdf]

  def render(assigns) do
    ~H"""
    <p>
      About a month ago I started a new job. My first real task? Update a manual document generation process with automatic
      PDF creation. Apparently knowing PDF frameworks and also not hating PDF is a rare combination. The stack is mostly
      python, but the team is small and flexible, so had no issue with my using
      <.a href="https://github.com/prawnpdf/prawn">Prawn</.a>.
    </p>

    <p>
      During the job hunt I had no free time, and getting up to speed this last month has left me too mentally drained most
      evenings to work on side projects. However, the one I have spent more than zero time on has been a school (mostly
      math) worksheet generation thing. As I do with side projects, I'm also using it to try new things, and the big new
      thing will likely be
      <.a href="https://vuejs.org/">Vue.js</.a>
      or some other front end tech. However, with the help of
      <.a href="https://medium.com/@Stephanbv/ruby-code-in-elixir-project-97614a9543d">
        this blog post
      </.a>
      (which also ends up
      with Prawn) the server side already has a phoenix project that uses Prawn to generate the worksheets.
    </p>
    """
  end
end
