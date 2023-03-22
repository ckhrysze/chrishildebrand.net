defmodule CkhryszeWeb.Articles.Cli do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2019-03-13]
  def title, do: "CLI"
  def desc, do: "An evergreen collection of useful but infrequent CLI commands"
  def keywords, do: ~w[tools bash cli]
  def tags, do: ~w[tools]

  def render(assigns) do
    ~H"""


<p>
  This will act as an evergreen collection of cli commands I find myself using often enough to
  want a reference but not often enough to actually remember them between uses.
</p>

<div>
  <h4 class="mt-8">What is listening on which port?</h4>
  <ul class="border border-solid border-gray-500 rounded bg-gray-300 text-sm code-list">
    <li>netstat -ltnp</li>
    <li>lsof -iTCP -sTCP:LISTEN -n -P</li>
  </ul>
</div>

<div>
  <h4 class="mt-8">Find out what is using my disk space</h4>
  <ul class="border border-solid border-gray-500 rounded bg-gray-300 text-sm code-list">
    <li>du -h --max-depth=1 | sort -hr</li>
  </ul>
</div>

<div>
  <h4 class="mt-8">Start a web server in the current directory with Python 3</h4>
  <ul class="border border-solid border-gray-500 rounded bg-gray-300 text-sm code-list">
    <li>python -m http.server 8000</li>
  </ul>
</div>
"""
  end
end
