defmodule CkhryszeWeb.ExperienceLive do
  use CkhryszeWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket |> assign(jobs: Ckhrysze.Experience.data())}
  end

  def handle_event("job_click", index, socket) do
    IO.inspect(socket.assigns.jobs)
    IO.inspect(index)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <main class="w-full md:w-2/3 bg-stone-400 bg-opacity-80 opacity-80 border-y md:border border-stone-300">
      <svg viewBox="0 0 100 100" class="w-full" xmlns="http://www.w3.org/2000/svg">
        <.company :for={job <- @jobs} job={job} />
      </svg>

      <.modal id="versus-systems-modal">
        <div>
          <p>Versus Systems</p>
          <p>Work in progress...</p>
        </div>
      </.modal>

      <.modal id="freelancing-modal">
        <div>
          <p>Freelancing</p>
          <p>Work in progress...</p>
        </div>
      </.modal>

      <.modal id="advanced-health-communications-modal">
        <div>
          <p>Advanced Health Communications</p>
          <p>Work in progress...</p>
        </div>
      </.modal>

      <.modal id="scientific-games-modal">
        <div>
          <p>Scientific Games</p>
          <p>Work in progress...</p>
        </div>
      </.modal>

      <.modal id="trustwave-modal">
        <div>
          <p>Trustwave</p>
          <p>Work in progress...</p>
        </div>
      </.modal>

      <.modal id="business-logic-modal">
        <div>
          <p>Business Logic</p>
          <p>Work in progress...</p>
        </div>
      </.modal>
    </main>
    """
  end

  attr(:job, :any)

  def company(assigns) do
    ~H"""
    <g class="" phx-data={@job.index}>
      <path
        id={@job.id <> "1"}
        fill="none"
        stroke-width={@job.weight}
        stroke={@job.color}
        d={arc(50, 50, @job.radius, @job.angle_s, @job.angle_e)}
      />
      <.company_name job={@job} />
      <.role :for={role <- @job.roles} role={role} job_index={@job.index} />
    </g>
    """
  end

  attr(:job, :any)

  def company_name(%{job: %{line_count: 2}} = assigns) do
    ~H"""
    <path
      id={"#{@job.id}3"}
      fill="none"
      d={
        reverse_arc(
          50,
          50,
          @job.radius + 0.5,
          @job.angle_e,
          @job.angle_s
        )
      }
    />
    <path
      id={"#{@job.id}4"}
      fill="none"
      d={
        reverse_arc(
          50,
          50,
          @job.radius - 1.2,
          @job.angle_e,
          @job.angle_s
        )
      }
    />
    <text
      class="font-bold"
      style={"font-size: #{@job.font_size}rem"}
      fill="white"
      textLength={@job.name_length}
      text-anchor="middle"
      lengthAdjust="spacingAndGlyphs"
    >
      <textPath class="text-center" href={"##{@job.id}3"} startOffset="50%">
        <%= @job.lines |> List.first() %>
      </textPath>
    </text>
    <text
      class="font-bold"
      style={"font-size: #{@job.font_size}rem"}
      fill="white"
      textLength={@job.name_length}
      text-anchor="middle"
      lengthAdjust="spacingAndGlyphs"
    >
      <textPath class="text-center" href={"##{@job.id}4"} startOffset="50%">
        <%= @job.lines |> List.last() %>
      </textPath>
    </text>
    """
  end

  def company_name(assigns) do
    ~H"""
    <path
      id={"#{@job.id}3"}
      fill="none"
      d={
        reverse_arc(
          50,
          50,
          @job.radius - 0.5,
          @job.angle_e,
          @job.angle_s
        )
      }
    />
    <text
      class="font-bold"
      style={"font-size: #{@job.font_size}rem"}
      fill="white"
      textLength={@job.name_length}
      text-anchor="middle"
      lengthAdjust="spacingAndGlyphs"
    >
      <textPath class="text-center" href={"##{@job.id}3"} startOffset="50%">
        <%= @job.name %>
      </textPath>
    </text>
    """
  end

  attr(:role, :any)
  attr(:job_index, :integer)

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
      d={reverse_arc(50, 50, @role.radius - 0.8 + 0.1 * @job_index, @role.angle_e, @role.angle_s)}
    />
    <text
      class="font-bold"
      style="font-size: 0.08rem"
      fill="white"
      textLength="3"
      text-anchor="middle"
      lengthAdjust="spacingAndGlyphs"
    >
      <textPath class="text-center" href={"##{@role.id}2"} startOffset="50%">
        <%= @role.name %>
      </textPath>
    </text>
    <.skill :for={skill <- @role.skills} skill={skill} />
    """
  end

  attr(:skill, :any)

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

  def reverse_arc(cx, cy, radius, start, stop) do
    {start_x, start_y} = polar_to_cartesian(cx, cy, radius, stop)
    {end_x, end_y} = polar_to_cartesian(cx, cy, radius, start)

    [
      "M",
      start_x,
      start_y,
      "A",
      radius,
      radius,
      0,
      0,
      1,
      end_x,
      end_y
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
