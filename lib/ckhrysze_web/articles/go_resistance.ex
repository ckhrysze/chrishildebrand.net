defmodule CkhryszeWeb.Articles.GoResistance do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2016-10-15]
  def title, do: "Resistance to Go"
  def desc, do: "Thoughts on not being as drawn to Go as I would think"
  def keywords, do: ~w[go]
  def tags, do: ~w[thoughts languages go elixir]

  def render(assigns) do
    ~H"""
    <p>
      <span class="font-bold">UPDATE:</span>This site was written in Hugo. Although I enjoyed it, I wanted to
      double down on my continued interest in Elixir.
    </p>

    <p>
      I don't yet want to learn <.a href="https://golang.org/">Go</.a>, and I can not explain why. I feel like I'd be fine
      having Go be my main language at work. I love what I know of the community, and have listened to and enjoyed every
      episode of <.a href="https://changelog.com/gotime">Go Time</.a>. This site is created with Hugo, the last AWS setup I
      did used <.a href="https://caddyserver.com/">Caddy</.a>
      over NGINX. I think <.a href="https://ngrok.com/">ngrok</.a>
      is
      one of the coolest tools ever. And yet, my desire to actually learn to write it myself is still just barely more than
      the mass of things I'll never actually learn.
    </p>

    <p>
      I love <.a href="http://elixir-lang.org/">Elixir</.a>, and don't foresee that interest waning anytime soon. On the
      surface a lot of the things that attract me to Elixir are also true of Go. Right now, I can only conclude that exactly
      how things work in Elixir just appeals to me more. By putting this out in the world, I hope to revisit this in the
      future and maybe then I'll have a better answer.
    </p>
    """
  end
end
