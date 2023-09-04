defmodule CkhryszeWeb.PageHTML do
  use CkhryszeWeb, :html

  embed_templates "page_html/*"

  @doc """
  MoveTo: M, m
  LineTo: L, l, H, h, V, v
  Cubic Bézier Curve: C, c, S, s
  Quadratic Bézier Curve: Q, q, T, t
  Elliptical Arc Curve: A, a rx ry angle large-arc sweep x y
  ClosePath: Z, z
  # <.company :for={job <- @jobs} job={job} />
  """
  def experience(assigns) do
    ~H"""
    <main class="w-full md:w-2/3 bg-stone-400 bg-opacity-80 opacity-80 border-y md:border border-stone-300">
      <svg viewBox="0 0 100 100" class="w-full" xmlns="http://www.w3.org/2000/svg">
        <.company :for={job <- @jobs} job={job} />
      </svg>
    </main>
    """
  end

  attr :job, :any

  def company(assigns) do
    assigns =
      assigns
      |> assign(:lines, String.split(assigns.job.name, "|"))

    ~H"""
    <g class="cursor-pointer" phx-click="job_click" phx-data={@job}>
      <path
        id={@job.id <> "1"}
        fill="none"
        stroke-width={@job.weight}
        stroke={@job.color}
        d={arc(50, 50, @job.radius, @job.angle_s, @job.angle_e)}
      />
      <%= for {line, i} <- Enum.with_index(@lines) do %>
        <path
          id={"#{@job.id}#{2+i}"}
          fill="none"
          d={arc(50, 50, @job.radius - i * 2, @job.angle_s, @job.angle_e)}
        />
        <text
          class="font-bold fill-white"
          style="font-size: 0.09rem"
          rotate="180"
          textLength="7"
          text-anchor="middle"
          lengthAdjust="spacingAndGlyphs"
        >
          <textPath class="text-center" href={"##{@job.id}#{2+i}"} startOffset="50%">
            <%= String.reverse(line) %>
          </textPath>
        </text>
      <% end %>
      <.role :for={role <- @job.roles} role={role} job_index={@job.index} />
    </g>
    """
  end

  attr :role, :any
  attr :job_index, :integer

  def role(assigns) do
    ~H"""
    <path
      id={@role.id <> "1"}
      fill="none"
      stroke-width={@role.weight}
      stroke={@role.color}
      d={arc(50, 50, @role.radius, @role.angle_s, @role.angle_e)}
    />
    <path
      id={"#{@role.id}2"}
      fill="none"
      d={arc(50, 50, @role.radius - 0.8 + 0.1 * @job_index, @role.angle_s, @role.angle_e)}
    />
    <text
      class="font-bold"
      style="font-size: 0.08rem"
      fill="white"
      rotate="180"
      textLength="3"
      text-anchor="middle"
      lengthAdjust="spacingAndGlyphs"
    >
      <textPath class="text-center" href={"##{@role.id}2"} startOffset="50%">
        <%= String.reverse(@role.name) %>
      </textPath>
    </text>
    <.skill :for={skill <- @role.skills} skill={skill} />
    """
  end

  attr :skill, :any

  def skill(assigns) do
    ~H"""
    <path
      id={@skill.id <> "1"}
      fill="none"
      stroke-width={@skill.weight}
      stroke={@skill.color}
      d={arc(50, 50, @skill.radius + @skill.weight / 2, @skill.angle_s, @skill.angle_e)}
    />
    <text
      x={51 + @skill.radius}
      y="50"
      class="font-bold"
      transform-origin="50 50"
      transform={"rotate(#{271 + (@skill.angle_s + @skill.angle_e)/2})"}
      style={"font-size: #{0.02 + @skill.weight * 0.004}rem"}
      fill="white"
    >
      <%= @skill.name %>
    </text>
    """
  end

  def arc(cx, cy, radius, start, stop) do
    {start_x, start_y} = polar_to_cartesian(cx, cy, radius, start)
    {end_x, end_y} = polar_to_cartesian(cx, cy, radius, stop)

    [
      "M",
      end_x,
      end_y,
      "A",
      radius,
      radius,
      0,
      0,
      0,
      start_x,
      start_y
    ]
    |> Enum.join(" ")
  end

  def polar_to_cartesian(cx, cy, r, angle) do
    radians = (angle - 90.0) * :math.pi() / 180.0

    {
      cx + r * :math.cos(radians),
      cy + r * :math.sin(radians)
    }
  end
end
