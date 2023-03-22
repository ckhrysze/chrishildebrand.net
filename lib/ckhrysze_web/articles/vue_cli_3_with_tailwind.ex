defmodule CkhryszeWeb.Articles.VueCli3WithTailwind do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2018-06-18]
  def title, do: "Vue CLI 3 With Tailwind"
  def desc, do: "Tailwindcss setup with Vue CLI 3"
  def keywords, do: ~w[vue cli tailwind webpack]
  def tags, do: ~w[vue]

  def render(assigns) do
    ~H"""
    <p>
      I have been happily using <.a href="https://vuejs.org/">Vue.js</.a>
      for some time now, and a bit more recently <.a href="https://tailwindcss.com/">Tailwind CSS</.a>. Although there were likely some webpack weirdness to get them
      working the first time, it was painless enough that I no longer remember the process. However, I recently felt like
      spinning up something new with the shiny <.a href="https://cli.vuejs.org/">Vue CLI</.a>, but was a bit worried on how
      the integration would work.
    </p>

    <p>
      After not immediately finding anything in the docs, I went to google, and quickly found
      <.a href="https://medium.com/@morrislaptop">this article.</.a>
      Although it got me most of the way there, it left off a
      few key things I needed to be fully integrated. I'll list all the steps, but essentially it skipped actually
      installing Tailwind (I assume because that seemed obvious) and didn't set the config to use the tailwind.js file
      created (which leads me to believe Tailwind has a fall back default, but I didn't verify that).
    </p>

    <div>
      <div class="text-3xl">Complete Steps</div>
      <span class="text-sm">
        These steps assume vue cli is already installed and that each step is run from a terminal
        unless otherwise noted.
      </span>
    </div>

    <div>
      <div class="text-lg">Create and enter project</div>
      <.codelist>
        <li>vue create my_project</li>
        <li>cd my_project</li>
      </.codelist>
    </div>

    <div>
      <div class="text-lg">Install Tailwind</div>
      <.codelist>
        <li>yarn add tailwindcss --dev</li>
      </.codelist>
    </div>

    <div>
      <div class="text-lg">Create Tailwind config</div>
      <span class="text-sm">
        The name and location of this file doesn't matter, as we'll explicitly point to it
        later.
      </span>
      <.codelist>
        <li>./node_modules/.bin/tailwind init src/tailwind.js</li>
      </.codelist>
    </div>

    <div>
      <div class="text-lg">Create a css file using Tailwind directives</div>
      <span class="text-sm">
        I typically just start with exactly the file contents listed <.a href="https://tailwindcss.com/docs/installation#3-use-tailwind-in-your-css">here</.a>. If you do that, don't run
        the second command in this section.
      </span>
      <.codelist>
        <li>touch src/assets/main.css</li>
        <li>
          printf '@tailwind preflight;\n@tailwind components;\n@tailwind utilities;' > src/assets/main.css
        </li>
      </.codelist>
    </div>

    <div>
      <div class="text-xl">Update package.json</div>

      <span class="text-sm">
        One of the big changes (for me, anyway) with cli 3 is that most config lives in the
        package.json file directly. When I started a project, there was already a top level section for 'postcss' in
        package.json. I updated it to add tailwind, and to point at the tailwind.js config file created earlier. The postcss
        section of my package.json file is now:
      </span>
    </div>

    <pre>
        <.highlight lang="javascript">
          "postcss": {
            "plugins": {
              "tailwindcss": "./src/tailwind.js",
              "autoprefixer": {}
            }
          },
        </.highlight>
      </pre>

    <div>
      <div class="text-lg">Add reference to css file</div>
      <span class="text-sm">
        Finally, add a reference to the css file. Given the default structure, I added the import to
        the App.vue file, which meant also adding a script section in the first place. The script section in src/App.vue
        became:
      </span>
      <pre>
        <.highlight lang="html">
          <script>
            import "./assets/main.css";

            export default {};
          </script>
        </.highlight>
      </pre>
    </div>

    <p>
      At this point I was able to run <span class="font-mono">yarn server</span>, and observe everything was working by
      adding a bg-white to an element then changing the color value in the tailwind.js config file.
    </p>
    """
  end
end
