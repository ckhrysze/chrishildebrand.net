defmodule CkhryszeWeb.Articles.ShouldMock do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-03-27]
  def title, do: "Pytest part I"
  def desc, do: "Setup and simple mocking with Python and Pytest"
  def keywords, do: ~w[python pytest]
  def tags, do: ~w[python pytest]

  def render(assigns) do
    ~H"""
    <p>
      This post (and maybe eventually series) is meant to document my journey with the Pytest library (combined with native
      Python testing libs). Of my, admittedly few, posts thus far, this one is really aimed at future me.
    </p>

    <p>
      When I was in college, testing wasn't a subject that came up. At my first job out of college, it was entirely manual.
      At my next job...there were tests, but it was part of a 15-20 minute build process, and was therefore not part of the
      basic dev cycle. Or at least, that was the state when I started there.
    </p>

    <p>
      A few years later, the company started shifting from Java to Ruby (entirely via Rails). With that shift came a
      healthy questioning of assumptions, which among other things led to a test first approach to new projects. Given the
      Rails ecosystem at that time, our testing framework of choice was
      <.a href="https://github.com/thoughtbot/factory_bot">Factory Bot</.a>. Since then, that approach to projects has stuck
      with me. Even if I tend to agree with
      <.a href="https://pragdave.me/">(prag) Dave Thomas</.a>
      with respect to
      questioning the need for all the tests, I still usually write them, especially with team projects.
    </p>

    <p>
      That was a long preamble to my recent experience with Pytest. At my latest gig, Python is the language of choice for
      both the main server side code as well as background tasks, scripting, and basically anything not client side. The
      project was using Nose, but the team had no issue with my transitioning to Pytest given the relative level of
      maintenance.
    </p>

    <p>
      Due to my testing roots, and my continued preference for expressive test method names, I much prefer should* names
      over test*. The following config (pytest.ini) will set that up.
    </p>

    <.highlight lang="ini" cache_id={title() <> "1"} phx-no-format>
      [pytest]
      python_functions=should_*
    </.highlight>

    <p>
      Next, I wanted my mocks back. I held off for some time, because Pytests fixture's are very nice (and well
      documented). Python's built in mocks are plenty sufficient for my current needs, but the documentation examples are
      somewhat lacking (they are there, but it kinda shows many ways to achieve similar results without even a gentle push
      in a decent direction). After a bit of research this is roughly what I settled on for my first use.
    </p>

    <.highlight lang="python" cache_id={title() <> "2"} phx-no-format>
      def should_work():
        with mock.patch('module_under_test.ThingToBeMocked') as Mock:
          instance = Mock.return_value
          instance.instance_method.return_value = 'some value'

          actual = module_under_test.ThingToBeMocked.instance_method()
          assert actual == expected
    </.highlight>

    <p>
      I'm not a huge fan of my example. If I end up writing a part two, it will be a small but more real project, likely
      Github hosted and highlighted here, so that the examples can be a bit closer to what someone might actually write.
    </p>
    """
  end
end
