defmodule Ckhrysze.BlogPost do
  @enforce_keys [:path, :title, :desc, :body, :tags, :date]
  defstruct [:path, :title, :desc, :body, :tags, :date]

  def build(filename, attrs, body) do
    path = filename |> String.split("/") |> Enum.reverse() |> hd() |> String.split(".") |> hd()
    date = Date.from_iso8601!(attrs.date)

    struct!(__MODULE__,
      path: path,
      title: attrs.title,
      desc: attrs.desc,
      body: body,
      tags: [],
      date: date
    )
  end
end
