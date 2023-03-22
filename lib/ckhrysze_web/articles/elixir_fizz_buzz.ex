defmodule CkhryszeWeb.Articles.ElixirFizzBuzz do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-05-30]
  def title, do: "Fizz Buzz in Elixir"
  def desc, do: "Simple fizz buzz example in Elixir"
  def keywords, do: ~w[elixir example snippet fizzbuzz]
  def tags, do: ~w[elixir]

  def render(assigns) do
    ~H"""


<p>I've been an advocate for <a href="http://elixir-lang.org/">Elixir</a> for some time now, but still haven't brought
  enough people over to write it full time...yet. An old friend of mine just started at my company, and we were
  discussing Elixir. By way of example, we discussed the lack of obvious (or perhaps traditional?) conditionals when
  writing something like Fizz Buzz. He was intrigued, but when we did a quick search, we didn't see the kind of examples
  I was hoping for.</p>

<p>Obviously, this meant I had to not only write it myself, but to then create a public gist and figure out how to embed
  said gist into my blog.</p>

<script src="https://gist.github.com/ckhrysze/a6486389d4ed5dfd2fd004b3973e6376.js"></script>

<p>Turns out Github has this covered...I see little reason to even try inlining like I did <a
    href="/blog/should_mock/">in my first python mock post</a>.</p>

<p>Full disclosure, I read the example given by <a href="https://pragdave.me">Dave Thomas</a> in <a
    href="https://pragprog.com/book/elixir/programming-elixir">Programming Elixir</a> a while ago, and this is largely
  inspired by that memory.</p>
"""
  end
end
