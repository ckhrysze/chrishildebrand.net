defmodule CkhryszeWeb.Articles.LocalHttps do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2018-03-23]
  def title, do: "Local HTTPS"
  def desc, do: "Green bar with https on localhost"
  def keywords, do: ~w[tools lsned go]
  def tags, do: ~w[tools lsned go]

  def render(assigns) do
    ~H"""
    <p>
      Several years ago, when I was still doing a lot of web development in Ruby, I used <a href="http://pow.cx">Pow</a>.
      Pow made a lot of local networking tasks easier (or rather, often prevented the need to do anything), especially when
      switching between several projects. When using Pow, (Rack) apps would be accesible at appname.dev, and ever since I've
      used myapp.dev for local development when 'localhost' wouldn't cut it.
    </p>

    <p>
      I'm not the only one to make heavy use of .dev, so was able to find
      <a href="https://iyware.com/dont-use-dev-for-development/">several</a>
      <a href="https://medium.engineering/use-a-dev-domain-not-anymore-95219778e6fd">posts</a>
      when one day it stopped
      working. Turns out, Google owns .dev now, and all indications suggest they are keeping it for internal use. However,
      as .dev is also now in the
      <a
        href="https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security"
        title="HTTP Strict Transport Security"
      >
        HSTS
      </a>
      list, undesired behavior when doing local development for the rest
      of us is basically a given.
    </p>

    <p>
      When researching the problem, I learned that .localhost is reserved (along with .test, .invalid, and
      .example) for
      exactly this scenario. Because I want as much production parity as possible, I also wanted to solve the problem of
      having accepted certificates when building webapps served locally over HTTPS. Wondering if
      <a href="https://letsencrypt.org/">LetsEncrypt</a>
      had anything to solve the issue, I came across <a href="https://letsencrypt.org/docs/certificates-for-localhost/">this article</a>. From there, I grabbed and used
      <a href="https://github.com/jsha/minica">Minica</a>
      (another golang tool) and took the following steps.
    </p>

    <ul class="border border-solid border-gray-500 rounded bg-gray-300 text-sm code-list">
      <li>mkdir directory/for/local/certificates</li>
      <li>cd directory/for/local/certificates</li>
      <li>go get github.com/jsha/minica</li>
      <li>minica -domains 'myapp.localhost'</li>
      <li>openssl x509 -in minica.pem -inform PEM -out minica.crt</li>
      <li>mkdir /usr/share/ca-certificates/extra</li>
      <li>sudo cp minica.crt /usr/share/ca-certificates/extra</li>
      <li>sudo dpkg-reconfigure ca-certificates</li>
      <li>cp myapp.localhost/*.pem path/that/can/serve/up/certificates</li>
    </ul>

    <p>
      I didn't dig into whether or not sufficient restarting of things would matter for browsers picking
      up the new root
      cert from the OS, so I just added the root cert to both Chrome and Firefox. The benefit of Minica in regards to
      browsers is that each new app I create, and therefore each new cert, is done from that root cert Minica first created.
      Therefore, importing into browsers is just a one time thing as the root cert is trusted.
    </p>
    """
  end
end
