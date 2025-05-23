defmodule CkhryszeWeb.Articles.Fullscreen do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-06-28]
  def title, do: "Fullscreen"
  def desc, do: "Automatic fullscreen on emacs start"
  def keywords, do: ~w[emacs ubuntu fullscreen lsned]
  def tags, do: ~w[emacs tools lsned]

  def render(assigns) do
    ~H"""


<p>My editor of choice is Emacs. I admit I've been impressed with VSCode, and currently use it for editing .vue files.
  I'll also use it for breakpoint enabled debugging when working with some languages. However, I don't foresee a sharp
  decline in my Emacs usage anytime soon, and therefore I'll sporadically step back and see if there are things to make
  my use even better.</p>

<p>Tonight, I was working on my elixir-mode and alchemist usage and config, and was restarting Emacs frequently. At some
  point I became frustrated by having to maximize the window (frame, technically) each time. <.a
    href="https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up">Stack Exchange</.a>
  to the rescue! I learned two things from that page. First, on my machine at least (Ubuntu 16.04) <span
    class="fa-border">ctrl</span>+<span class="fa fa-windows fa-border"></span>+<span
    class="fa fa-arrow-up fa-border"></span> will make any window full screen.</p>

<p>Second, for Emacs, I added <span style="font-family: monospace">(add-to-list 'default-frame-alist '(fullscreen .
    maximized))</span> to my <.a href="https://github.com/ckhrysze/emacsd">Emacs config</.a>.</p>
"""
  end
end
