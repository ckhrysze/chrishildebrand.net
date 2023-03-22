defmodule CkhryszeWeb.BlogHTML do
  use CkhryszeWeb, :html

  def article(assigns) do
    ~H"""
    <.title_block>
      <div class="text-center text-3xl sm:text-5xl">
        <%= @mod.title %>
      </div>
      <div class="text-center text-xs italic pt-2">
        <%= @mod.date %>
      </div>
    </.title_block>

    <.main class="flex flex-col gap-4">
      <%= @mod.render(assigns) %>
    </.main>
    <script>
      hljs.highlightAll();
    </script>
    """
  end

  def list(assigns) do
    ~H"""
    <.main class="flex flex-col gap-10">
      <div :for={article <- @articles} class="flex flex-col gap-8">
        <a href={~p"/blog/#{path(article)}"}>
          <div class="text-2xl"><%= article.title %></div>
          <div class="text-sm text-gray-800"><%= article.date %></div>
          <div class="mt-2"><%= article.desc %></div>
        </a>
      </div>
    </.main>
    """
  end

  def path(module) do
    module
    |> Module.split()
    |> Enum.reverse()
    |> hd()
    |> Phoenix.Naming.underscore()
  end
end
