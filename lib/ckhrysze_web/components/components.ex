defmodule CkhryszeWeb.Components do
  use Phoenix.Component

  IO.puts("Compiling components")

  slot :inner_block, required: true

  def title_block(assigns) do
    ~H"""
    <div class="w-4/5 md:w-2/3 xl:w-1/2 bg-stone-400 bg-opacity-50 opacity-80 border border-stone-300 rounded-lg p-8">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true

  def main(assigns) do
    ~H"""
    <main class={[
      "w-4/5 md:w-2/3 xl:w-1/2 bg-stone-400 bg-opacity-80 opacity-80 border border-stone-300 rounded-lg p-8",
      @class
    ]}>
      <%= render_slot(@inner_block) %>
    </main>
    """
  end

  attr :class, :string, default: nil
  attr :href, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true

  def a(assigns) do
    ~H"""
    <a href={@href} class={["text-blue-900", @class]} {@rest}><%= render_slot(@inner_block) %></a>
    """
  end

  slot :inner_block, required: true

  def codelist(assigns) do
    ~H"""
    <ul class="code-list my-4 border border-solid border-gray-500 rounded bg-gray-300 text-sm font-mono">
      <%= render_slot(@inner_block) %>
    </ul>
    """
  end

  slot :inner_block, required: true

  def cmd(assigns) do
    ~H"""
    <span class="bg-slate-600 bg-opacity-10 inline rounded-sm pl-2 font-mono text-amber-800">
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  attr :cache_id, :string, required: true
  attr :lang, :string, default: nil
  slot :inner_block, required: true

  def highlight(assigns) do
    ~H"""
    <pre class="bg-white rounded">
      <%= render_slot(@inner_block)
      |> Phoenix.HTML.html_escape()
      |> Phoenix.HTML.safe_to_string()
      |> Ckhrysze.Torchlight.process(assigns)
      |> Phoenix.HTML.raw() %>
    </pre>
    """
  end
end
