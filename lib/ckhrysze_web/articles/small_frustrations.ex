defmodule CkhryszeWeb.Articles.SmallFrustrations do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-02-23]
  def title, do: "A Series of Small Frustrations"
  def desc, do: "A Series of Small Frustrations"
  def keywords, do: ~w[python lsned]
  def tags, do: ~w[python lsned]

  def render(assigns) do
    ~H"""
    <p>
      I intended this to be a simple account of some of the small issues and eventual solutions I encountered today.
      However, in an effort to distill one of my problems into a shareable example, I ended up learning something entirely
      new!
    </p>

    <p>
      The issue I thought I was going to present is as follows. I'm using python's sql alchemy library, and I was adding a
      nested structure using relationships. I had an attribute names insurance, but typoed it as insurnace. This didn't
      raise an exception, but obviously failed to actually save the nested objects. When I went to distill my example, I
      was surprised to learn the following works just fine:
    </p>

    <.highlight lang="python" cache_id={title() <> "1"} phx-no-format>
      class Example:
        pass

      ex = Example()
      ex.unexpected = 5
      print(ex.unexpected)
    </.highlight>

    <p>
      The next frustration of the day was centered around the relationship between sql alchemy's transaction handling and
      the underlying db (driver?). In order for my db centered tests to make assertions with model objects that actually
      have ids, I needed said ids to be generated. The call 'begin_nested' had me reading documentation about nested
      transactions. However, what it turns out I really wanted (for postgres, anyway) was to just use flush() over
      commit() in the tests, and be very deliberate about committing in the source. In the end, my code was the better for
      it, because it forced me to more deeply consider where in the flow I really needed to commit().
    </p>

    <p>
      Finally, and this was more worked around than resolved,
      <.a href="http://www.hug.rest/">python's hug</.a>
      does not seem
      to get along well with
      <.a href="https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API">fetch</.a>
      (or at least
      the
      <.a href="https://github.github.io/fetch/">polyfill I tried</.a>). I would see the request come into the server,
      which claimed to return a 200. However, the client only ever reported sending a pre-flight options request with a
      204 response, and just appeared to stop. My work around was to use
      <.a href="https://github.com/naugtur/xhr">XHR</.a>
      instead. Had that not just worked, I would have used basic direct XMLHttpRequests (the horror ☺️ ).
    </p>
    """
  end
end
