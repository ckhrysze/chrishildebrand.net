defmodule CkhryszeWeb.Articles.Regexr do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-06-15]
  def title, do: "Regexr"
  def desc, do: "A really cool site for helping with all things regex"
  def keywords, do: ~w[tools regex webapp pcre regular expression]
  def tags, do: ~w[tools regex]

  def render(assigns) do
    ~H"""


<p>I have been familiar and comfortable with regular expressions (regexes) most of my career. My first full time job
  after college used Java, and although I needed to use regexes I didn't have much in the way of mentoring or tooling.
  So, I kinda fumbled my way forward and learned gems such as <.a
    href="https://stackoverflow.com/a/4653857/9276">highlighted here</.a>. I moved companies and eventually languages
  from Java to Ruby. I soon discovered <.a href="http://rubular.com/">Rubular</.a> which is an awesome tool for testing
  out and iterating on regular expressions. Still in the Ruby space, my next job was in security working with a team
  creating a scanning engine. Our use of regular expressions there was extensive, and put me in a place where I feel
  extremely comfortable with them.</p>

<p>Fast forward several positions and several language changes, I find I use them less often than I once did, but enough
  that my former experience has been invaluable. However, the main thing I wanted to capture was a tool a co-worker of
  mine introduced me to today, <.a href="http://regexr.com/">RegExr</.a>. I haven't used it much yet, but what little I've
  seen has been very impressive.</p>

<p>Also, a related and rather <.a href="https://regexcrossword.com/">fun game</.a>.</p>
"""
  end
end
