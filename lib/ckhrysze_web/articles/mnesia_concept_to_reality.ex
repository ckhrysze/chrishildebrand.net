defmodule CkhryszeWeb.Articles.MnesiaConceptToReality do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2021-01-08]
  def title, do: "Mnesia Training Class Notes"
  def desc, do: "Brief description of the Mnesia training class I helped create and lead."
  def keywords, do: ~w[elixir mnesia terraform]
  def tags, do: ~w[elixir]

  def render(assigns) do
    ~H"""


<p>At the virtual ElixirConf 2020 <.a href="https://twitter.com/alex_peachey" class="text-blue-900">@alex_peachey</.a>
  and
  I led a class on
  building a small liveview app and deploying it to AWS. Although the video is not posted anywhere (yet), the steps we
  followed, the code we used, and the Terraform scripts to setup the structure created before the class is all hosted <.a
    href="https://github.com/versus-systems/nook_book" class="text-blue-900">here.</.a> and the outline is reprinted
  below:
</p>

<div class="flex mt-8">
  <div class="flex-1">
    <span class="text-lg">Build the Nook Book Application</span>

    <ul>
      <li class="text-sm">Step 1: Project Setup </li>
      <li class="text-sm">Step 2: Mnesia Schema Setup </li>
      <li class="text-sm">Step 3: Table Setup </li>
      <li class="text-sm">Step 4: Create a Repo for Easier Mnesia Access </li>
      <li class="text-sm">Step 5: Expand the GenericCache Module </li>
      <li class="text-sm">Step 6: A Simple API Client </li>
      <li class="text-sm">Step 7: Create a Simple Cache </li>
      <li class="text-sm">Step 8: Create a LiveView for the Application </li>
      <li class="text-sm">Step 9: Create a Controller for Our Images </li>
      <li class="text-sm">Step 10: Update Our Router </li>
      <li class="text-sm">Step 11: Build Out the HTML </li>
      <li class="text-sm">Step 12: Setup Local Multi-Node Mnesia </li>
    </ul>
  </div>
  <div class="flex-1">
    <span class="text-lg p-1">Deploy Nook Book to AWS</span>

    <ul>
      <li class="text-sm">Step 13: Setup Release </li>
      <li class="text-sm">Step 14: Setup Circle </li>
      <li class="text-sm">Step 15: Setup AWS </li>
      <li class="text-sm">Step 16: Setup Terraform </li>
      <li class="text-sm">Step 17: Implement Security Group </li>
      <li class="text-sm">Step 18: Update Release Files </li>
      <li class="text-sm">Step 19: Finish Infrastructure Setup </li>
      <li class="text-sm">Step 20: Use Terraform Output for Hosts </li>
      <li class="text-sm">Step 21: Setup Libcluster </li>
      <li class="text-sm">Step 22: Use Terraform Output for SSH Config </li>
      <li class="text-sm">Step 23: Build and Download Release </li>
      <li class="text-sm">Step 24: Upload and Run the Release </li>
    </ul>
  </div>
</div>
"""
  end
end
