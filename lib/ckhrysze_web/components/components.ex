defmodule CkhryszeWeb.Components do
  use Phoenix.Component

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
  slot :inner_block, required: true

  def a(assigns) do
    ~H"""
    <a href={@href} class={["text-blue-900", @class]}><%= render_slot(@inner_block) %></a>
    """
  end
end
