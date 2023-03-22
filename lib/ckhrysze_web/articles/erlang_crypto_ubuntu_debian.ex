defmodule CkhryszeWeb.Articles.ErlangCryptoUbuntuDebian do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2018-12-22]
  def title, do: "Erlang, SSL, and Ubuntu vs Debian"
  def desc, do: "Solving a strange Ubuntu vs Debian issue with OpenSSL lib versioning"
  def keywords, do: ~w[debian ubuntu elixir linux docker]
  def tags, do: ~w[linux elixir docker]

  def render(assigns) do
    ~H"""


<p>As a bit of background, I've had a linux OS on a computer in my home since college, and most of the time its been my
    primary. My current OS is Ubuntu, and as they have a stripped down version intended for server use, its my go to for
    remote servers unless I have a reason to choose something else. Unfortunetly, one of my projects just found such a
    reason.</p>

<p class="mt-8">I still don't have all the details around the root cause, be I'll go over the initial symptom and some
    of the deeper
    ones. The project in question has grown to the point that it no longer makes sense to build it from my machine. The
    project is an Elixir application that uses <a href="https://github.com/bitwalker/distillery">Distillery</a> to build
    releases, which are pushed to a server and run. I moved the build process from my machine to a CI service, and the
    image doing the building there is the <a href="https://hub.docker.com/_/elixir/">official Elixir docker image</a>.
    The transition was very smooth until I actually went to run the release on the server. The Erlang process
    immediately crashed, and the erl_crash.dump file included these snippets:</p>

<pre class=" border-gray-500 rounded bg-gray-300 my-4">
    args: [load_failed,"Failed to load NIF library
           ./lib/crypto-4.4/priv/lib/crypto: 'libcrypto.so.1.1:
           cannot open shared object file: No such file or directory'",
           "OpenSSL might not be installed on this system."]
    format: "Unable to load crypto library.

</pre>

<p>The initial round of searching online didn't reveal anything that just worked, so I took a step back and worked
    through what had changed. In tracing the Elixir docker image back several steps, the base OS was Debian. I had been
    building and still was deploying to Ubuntu...but those typically are close enough to not matter. A bit more digging,
    however, revealed that the default version of OpenSSL on Debain was 1.1.0j vs 1.0.2g on Ubuntu. I did not delve in
    further as changing the OS of the server to Debian resolved the issue.
</p>
"""
  end
end
