defmodule CkhryszeWeb.Articles.BashAssertEnvVar do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-08-08]
  def title, do: "Assert Bash Environment Variable"
  def desc, do: "A simple way to assert environment variable existence in bash"
  def keywords, do: ~w[tools direnv bash lsned]
  def tags, do: ~w[tools lsned]

  def render(assigns) do
    ~H"""


<p>I was modifying a setup script at work when I came across an environment variable not set by the
  script, or anywhere else in the project. Tracing back, the original code to set the variable relied
  on <span class="highlight">find</span> from the current user's home directory, and was therefore not
  scaling well. The commit suggested moving it to any of the other places one might set environment
  variables (for example, <.a href="/blog/direnv/">Direnv</.a>).</p>

<p>However, there was nothing ensuring that variable existed. Seeing a good opportunity to make things
  clearer for the next developer to come along, I went to Stack Overflow (well, Google, but clicked the
  first Stack Overflow result). Not only did I find
  <.a href="https://stackoverflow.com/a/307735/9276">an answer</.a>, but a very thorough explaination.
</p>

<p>This gist is just a quick example to remind myself how this technique works.</p>

<script src="https://gist.github.com/ckhrysze/98842f979b6ff909f512c0c8398d5a31.js"></script>
"""
  end
end
