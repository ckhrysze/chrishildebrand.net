defmodule Ckhrysze.Experience do
  @moduledoc """
  Colors from hslpicker.com with s at 75 and l at 25
  """

  @weight 7
  @radius 20
  @step 0.5

  def color([], {h, s, l}) do
    hex =
      Chameleon.HSL.new(h, s, l)
      |> Chameleon.convert(Chameleon.Hex)

    "##{hex.hex}"
  end

  def color([i], {h, s, l}) do
    i = i + 1

    hex =
      Chameleon.HSL.new(h, s + i, l + i * 3)
      |> Chameleon.convert(Chameleon.Hex)

    "##{hex.hex}"
  end

  def color([j, i], {h, s, l}) do
    i = i + 2
    j = j + 1

    hex =
      Chameleon.HSL.new(h, s + j, l + i + j * 3)
      |> Chameleon.convert(Chameleon.Hex)

    "##{hex.hex}"
  end

  def data do
    [
      %{
        id: "vs",
        name: "Versus Systems",
        modal_id: "versus-systems-modal",
        name_length: 18,
        font_size: 0.1,
        reverse: true,
        months: 56,
        hsl: {221, 90, 30},
        roles: [
          %{
            name: "Dev",
            skills: [
              %{name: "Elixir", weight: 4},
              %{name: "Shell", weight: 2.5},
              %{name: "JS", weight: 1.5}
            ]
          },
          %{
            name: "Ops",
            skills: [
              %{name: "Terraform", weight: 3},
              %{name: "GCP", weight: 3},
              %{name: "CircleCI", weight: 2},
              %{name: "AWS", weight: 1.2}
            ]
          },
          %{
            name: "Leader",
            skills: [
              %{name: "Manager", weight: 3},
              %{name: "Mentor", weight: 3},
              %{name: "Recruiter", weight: 2}
            ]
          }
        ]
      },
      %{
        id: "fr",
        name: "Freelancing",
        modal_id: "freelancing-modal",
        name_length: 12,
        font_size: 0.09,
        reverse: true,
        months: 30,
        hsl: {120, 85, 35},
        roles: [
          %{
            name: "Dev",
            skills: [
              %{name: "Elixir", weight: 4},
              %{name: "Ruby", weight: 2},
              %{name: "JS", weight: 2}
            ]
          },
          %{
            name: "Ops",
            skills: [
              %{name: "Digital Ocean", weight: 3},
              %{name: "Fly.io", weight: 3},
              %{name: "Github", weight: 2},
              %{name: "AWS", weight: 1.5}
            ]
          },
          %{
            name: "Product",
            skills: [
              %{name: "Design", weight: 3},
              %{name: "Risk", weight: 2}
            ]
          }
        ]
      },
      %{
        id: "ahc",
        name: "Advanced Health|Communications",
        modal_id: "advanced-health-communications-modal",
        name_length: 7,
        font_size: 0.04,
        reverse: false,
        months: 19,
        hsl: {288, 90, 35},
        roles: [
          %{
            name: "Dev",
            skills: [
              %{name: "Python", weight: 4},
              %{name: "PHP", weight: 3}
            ]
          },
          %{
            name: "Ops",
            skills: [
              %{name: "Docker", weight: 3.5},
              %{name: "Mongo", weight: 3},
              %{name: "Rancher", weight: 2.5}
            ]
          },
          %{
            name: "Product",
            skills: [
              %{name: "Design", weight: 3},
              %{name: "Security", weight: 3}
            ]
          }
        ]
      },
      %{
        id: "sg",
        name: "Scientific Games",
        modal_id: "scientific-games-modal",
        name_length: 14,
        font_size: 0.07,
        reverse: false,
        months: 47,
        hsl: {25, 85, 45},
        roles: [
          %{
            name: "Dev",
            skills: [
              %{name: "Python", weight: 4},
              %{name: "PHP", weight: 3},
              %{name: "JS", weight: 1.5},
              %{name: "C++", weight: 1}
            ]
          },
          %{
            name: "Ops",
            skills: [
              %{name: "AWS", weight: 3},
              %{name: "Couchbase", weight: 3}
            ]
          },
          %{
            name: "Leader",
            skills: [
              %{name: "Manager", weight: 4},
              %{name: "Mentor", weight: 3}
            ]
          }
        ]
      },
      %{
        id: "tw",
        name: "Trustwave",
        modal_id: "trustwave-modal",
        name_length: 9,
        font_size: 0.06,
        reverse: false,
        months: 21,
        hsl: {180, 90, 30},
        roles: [
          %{
            name: "Dev",
            skills: [
              %{name: "Ruby", weight: 4.5},
              %{name: "Shell", weight: 2}
            ]
          },
          %{
            name: "Leader",
            skills: [
              %{name: "Manager", weight: 3},
              %{name: "Mentor", weight: 3}
            ]
          }
        ]
      },
      %{
        id: "blc",
        name: "Business Logic|Corporation",
        modal_id: "business-logic-modal",
        name_length: 10,
        font_size: 0.07,
        reverse: true,
        months: 65,
        hsl: {0, 90, 30},
        roles: [
          %{
            name: "Dev",
            skills: [
              %{name: "Ruby", weight: 3},
              %{name: "Java", weight: 2},
              %{name: "Flex", weight: 2}
            ]
          },
          %{
            name: "Ops",
            skills: [
              %{name: "AWS", weight: 3},
              %{name: "Websphere", weight: 3}
            ]
          },
          %{
            name: "Leader",
            skills: [
              %{name: "Recruiter", weight: 2},
              %{name: "Mentor", weight: 2}
            ]
          }
        ]
      }
    ]
    |> calc_segments()
  end

  def calc_segments(data) do
    total_months =
      data
      |> Enum.reduce(0, fn job, acc ->
        acc + job.months
      end)

    {_, data} =
      data
      |> Enum.reduce({0, []}, fn job, {deg, jobs} ->
        ratio = job.months / total_months
        arc = 330 * ratio
        lines = String.split(job.name, "|")

        {
          deg + arc + 2,
          [
            job
            |> Map.put(:angle_s, deg)
            |> Map.put(:angle_e, deg + arc)
            |> Map.put(:lines, lines)
            |> Map.put(:line_count, Enum.count(lines))
            | jobs
          ]
        }
      end)

    data = Enum.reverse(data)

    data
    |> Enum.with_index()
    |> Enum.map(fn {job, i} ->
      job
      |> Map.put(:index, i)
      |> Map.put(:color, color([], job.hsl))
      |> Map.put(:weight, @weight - @step * i)
      |> Map.put(:radius, @radius - @step * i / 2)
      |> add_roles_for_job()
    end)
  end

  def add_roles_for_job(%{roles: []} = job), do: job

  def add_roles_for_job(job) do
    num_roles = Enum.count(job.roles)
    offset = num_roles - 1
    size = (job.angle_e - job.angle_s) / num_roles

    Map.put(
      job,
      :roles,
      job.roles
      |> Enum.with_index()
      |> Enum.map(fn {role, i} ->
        role
        |> Map.put(:id, [job.id, role.name] |> Enum.join("_"))
        |> Map.put(:indicies, [i])
        |> Map.put(:color, color([i], job.hsl))
        |> Map.put(:hsl, job.hsl)
        |> Map.put(:weight, job.weight - 2)
        |> Map.put(:radius, job.radius + job.weight - 1)
        |> Map.put(:angle_s, job.angle_s + size * i)
        |> Map.put(:angle_e, job.angle_e - size * (offset - i))
        |> add_skills_for_role()
      end)
    )
  end

  def add_skills_for_role(%{skills: []} = role), do: role

  def add_skills_for_role(role) do
    num_skills = Enum.count(role.skills)
    offset = num_skills - 1
    size = (role.angle_e - role.angle_s) / num_skills

    Map.put(
      role,
      :skills,
      role.skills
      |> Enum.with_index()
      |> Enum.map(fn {skill, i} ->
        skill
        |> Map.put(:id, [role.id, skill.name] |> Enum.join("_"))
        |> Map.put(:color, color([i | role.indicies], role.hsl))
        |> Map.put(:weight, role.weight * skill.weight)
        |> Map.put(:radius, role.radius + role.weight - role.weight / 2)
        |> Map.put(:angle_s, role.angle_s + size * i)
        |> Map.put(:angle_e, role.angle_e - size * (offset - i))
      end)
    )
  end
end
