defmodule CkhryszeWeb.Articles.MultiPageVue do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-10-03]
  def title, do: "Multi-Page Vue"
  def desc, do: "Basic setup for a multi-page Vue application"
  def keywords, do: ~w[vue example]
  def tags, do: ~w[vue]

  def render(assigns) do
    ~H"""
    <p>
      For front end work, my current tool of choice is
      <.a href="https://vuejs.org/">Vue</.a>. However, the benefits of a SPA
      (single page app) don't out-weight the costs to me for most applications I've worked on. Vue is flexible enough to
      accommodate this, but I didn't have a great example of what that would truly look like.
    </p>

    <p>
      I'm still not comfortable with Webpack, and feel as if each line is a research project. There is really no denying
      its power though, nor the variety of tasks it can accomplish. In the end, my solution is more of a Webpack solution
      than a Vue one, but does involve both.
    </p>

    <script src="https://gist.github.com/ckhrysze/8b619740db7d1e67094e0ea9d700acd3.js">
    </script>

    <p>
      Webpack will take each folder name under the pages directory, and capture the name. For each (chunk) name, it will
      create an entry point, and with the HtmlWebpackPlugin, an HTML page. This page, in turn, is based on the template in
      the templates folder. The source for the project is
      <.a href="https://github.com/ckhrysze/multipage-vue/tree/basic">at
        Github here</.a>, and looks like this:
    </p>

    <script src="https://gist.github.com/ckhrysze/48b6ef6569e5b6bd6b127b76a022b04c.js">
    </script>

    <p>The output directory, dist, is very simple:</p>

    <script src="https://gist.github.com/ckhrysze/b183251944057e23ae05a509fded6838.js">
    </script>

    <p>
      This is meant as a starting point, both for myself and anyone that comes across it. Some things I'd like to see
      working (and will create a new branch in this repository if/when I do):
    </p>

    <ul style="list-style: '- '">
      <li>SASS support within the Vue files</li>
      <li>Global stylesheets also used within the template</li>
      <li>Merge app.js into the template, and have each page determined by a Vue file</li>
      <li>Create a common bundle for better client request management</li>
      <li>Turn this into a template for jump starting new projects</li>
      <li>
        Convert this blog into something using this process, since it did in the end create a bunch of static assets
      </li>
    </ul>

    <p>
      Thanks to Plortinus
      for creating
      <.a href="https://github.com/Plortinus/vue-multiple-pages">Vue Multiple Pages</.a>, which was a great resource and guide
      for creating this.
    </p>
    """
  end
end
