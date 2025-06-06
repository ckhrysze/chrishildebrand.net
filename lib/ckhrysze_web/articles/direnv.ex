defmodule CkhryszeWeb.Articles.Direnv do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-07-27]
  def title, do: "Direnv"
  def desc, do: "Direnv, a nice tool for setting environment variable per project"
  def keywords, do: ~w[go tools direnv ubuntu lsned docker]
  def tags, do: ~w[go tools lsned]

  def render(assigns) do
    ~H"""
    <p>
      tl;dr - use
      <.a href="https://direnv.net/">direnv</.a>.
    </p>

    <p>
      I enjoy learning new languages and bouncing between side projects in my spare time. One of the most painful aspects
      of this, especially given my environment variable heavy approach to config and secret management, is switching between
      local setups for the various stacks and projects I work with.
    </p>

    <p>
      Docker has been wonderful at solving many aspects of this, especially in terms of varying databases and database
      versions. However, the config to setup the app and connect with said databases was still more manual than I cared for.
      There were a few times this was enough of a pain point for me I considered making my own terminal emulator that was
      focused on solving my problems as a develop switching environment, hoping it might help others as well.
    </p>

    <p>
      However, I recently discovered yet another awesome golang project that solved my problems. The tool is is
      <.a href="https://direnv.net/">direnv</.a>. The basic idea is that there is a .envrc file in the project directory (or a
      parent directory, so shared config or multiple repos sharing a config is incredibly simple). When I
      <.cmd>cd</.cmd>
      into the directory, it will execute the .envrc script. Mine contains several
      <.cmd>export</.cmd>
      statements setting the value of keys such as:
      <div>
        <ul>
          <li>GIT_AUTHOR_EMAIL</li>
          <li>GIT_AUTHOR_NAME</li>
          <li>DATABASE_URL</li>
          <li>SECRET_KEY_BASE</li>
        </ul>
      </div>
      <p>
        or
        <.cmd>sourcing</.cmd>
        additional scipts such as
        <.cmd>$HOME/.venv/pyproject/bin/activate</.cmd>
      </p>
    </p>

    <p>
      Thus far, I've been extremely happy with it, and have yet to encounter any issues or even annoyances.
    </p>
    """
  end
end
