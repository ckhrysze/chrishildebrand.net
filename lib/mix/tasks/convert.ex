defmodule Mix.Tasks.Convert do
  @tmpl """
  defmodule CkhryszeWeb.Articles.<%= camel_name %> do
    use CkhryszeWeb, :html

    @behaviour CkhryszeWeb.Article

    def date, do: ~D[<%= attrs.date %>]
    def title, do: "<%= attrs.title %>"
    def desc, do: "<%= attrs.desc %>"
    def keywords, do: ~w[<%= attrs.keywords |> Enum.join(" ") %>]
    def tags, do: ~w[<%= attrs.tags |> Enum.join(" ") %>]

    def render(assigns) do
      <%= content %>
    end
  end
  """
  def run(_) do
    IO.puts("Parsing files...")

    File.ls!("priv/posts/")
    |> Enum.each(&convert_file/1)
  end

  def convert_file(filename) do
    [name, _ext] = String.split(filename, ".")
    [front, content] = File.read!("priv/posts/" <> filename) |> String.split("---")
    camel_name = Phoenix.Naming.camelize(name)

    {attrs, _} = Code.eval_string(front)

    EEx.eval_string(@tmpl,
      camel_name: camel_name,
      attrs: attrs,
      content: "~H\"\"\"\n" <> content <> "\n\"\"\""
    )
    |> write_file(name)
  end

  def write_file(content, name) do
    File.write("lib/ckhrysze_web/articles/#{name}.ex", content)
  end
end
