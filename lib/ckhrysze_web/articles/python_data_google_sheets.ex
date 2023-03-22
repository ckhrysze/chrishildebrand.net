defmodule CkhryszeWeb.Articles.PythonDataGoogleSheets do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2017-12-15]
  def title, do: "Google Sheets and Python"
  def desc, do: "Creating a Google Sheet file with Python"
  def keywords, do: ~w[tools python]
  def tags, do: ~w[tools python]

  def render(assigns) do
    ~H"""
    <p>
      At work, we have nothing in place to supply ad hoc reports, I'm therefore frequently (but not often enough to raise
      the priority of enabling ad hoc reports) asked to generate a report manually. The result is nearly always a 2d array
      of data, and my company already uses Google Suites. Additionally, my primary language at work happens to be Python, a
      known first class citizen in the world of Google. Put that all together, and it seemed obvious that it would be simple
      to create a script that would fetch and format the data, then push it into a new spreadsheet.
    </p>

    <p>
      As it turns out, this wasn't nearly as easy as I thought it would be, or should be. First, the current
      <.a href="https://developers.google.com/sheets/api/quickstart/python">quick start guide</.a>
      uses a
      <.a href="https://google-auth.readthedocs.io/en/latest/oauth2client-deprecation.html">
        deprecated
      </.a>
      auth library. Also,
      because the new library is more in touch with how Google wants developers to use APIs, it actually takes far less code
      that the quick start guide suggests, but additional setup steps.
    </p>

    <p>
      First, I needed to generate credentials. I feel like this has changed a lot since I last attempted to use a Google
      API (that was probably at least 5 years ago though...), and I'm not sure there aren't alternatives, but what worked
      for me was the following:
      <ol class="my-4 border border-solid border-gray-500 rounded bg-gray-300 text-sm font-mono p-2">
        <li>
          - Go to
          <.a href="https://console.cloud.google.com/home/dashboard">the Google Cloud console</.a>
          (No, I didn't need
          to setup an actual Google Cloud account...)
        </li>
        <li>- Go to 'IAM & Admin' > 'Service accounts'</li>
        <li>- Click on 'Create Service Account'</li>
        <li>- Pick a name</li>
        <li>- For Role, select 'Project' > 'Editor'</li>
        <li>- Click 'Furnish a new private key', leave JSON selected</li>
        <li>- Click 'Enable G Suite Domain-wide Delegation'</li>
        <li>- Click 'Create'</li>
      </ol>
      I'm not entirely sure what all of those actually do, and I'm sure different options could be selected and have this
      still work, but those are the steps I took. Additionally, there is a wizard elsewhere that will ask questions to guide
      the credential creation process, which likely means there are other types of valid auth mechanisms. I also vaguely
      remember creating a project, and Google Cloud seems to want everything to be part of a project, which might make that a
      step zero.
    </p>

    <div>
      Moving on, that last step should have downloaded a json file. Move and name that however, then setup an environment
      variable to point at it.
    </div>

    <pre>
      <.highlight lang="bash">
        export GOOGLE_APPLICATION_CREDENTIALS=just_downloaded_credentials.json
      </.highlight>
    </pre>

    <p>
      Now that we have credentials in place, lets install some libraries. I'm using Python 3, though the docs suggest some
      if not all Google libraries still support Python 2. <pre>
        <.highlight lang="bash">
          python3 -m venv ~/.venv/googleapi
          pip install google-api-python-client
          pip install google-auth
          pip install google-auth-httplib2
        </.highlight>
      </pre>
    </p>

    <p>
      Setup is done, lets write some code!
    </p>
    <pre>
        <.highlight lang="python">
          data = []
          for i in range(4):
            data.append([4, 3, 2])

          create("Test Doc", data, owner="ckhrysze@gmail.com")
        </.highlight>
      </pre>

    <p>
      This is all I really want to get working. The next step will create a new spreadsheet, figure out the area to update
      based on the size of the data, then update the sheet with the given data.
    </p>

    <pre>
        <.highlight lang="python">
          def create(title='NoTitle', data=[], owner=None):
            '''
            Use the sheets API to create a sheet
            '''
            discoveryUrl = ('https://sheets.googleapis.com/$discovery/rest?version=v4')
            service = discovery.build('sheets', 'v4', discoveryServiceUrl=discoveryUrl)

            body = dict(properties=dict(title=title))
            spreadsheet = service.spreadsheets().create(body=body).execute()
            spreadsheet_id = spreadsheet['spreadsheetId']

            # 96 is the ascii value of the character before 'a'
            last_column = 96 + len(data[0])
            col = str(chr(last_column))
            rows = len(data)
            update_body = dict(values=data)
            sheet_range = 'a1:{}{}'.format(col, rows)

            service.spreadsheets().values() \
                                  .update(spreadsheetId=spreadsheet_id,
                                          valueInputOption='RAW',
                                          range=sheet_range,
                                          body=update_body) \
                                  .execute()
        </.highlight>
      </pre>

    <p>Finally, use the Google Drive API to change the owner.</p>

    <pre>
        <.highlight lang="python">
          def change_owner(spreadsheet_id, owner):
            '''
            Use the drive api to change the owner
            '''
            drive_service = discovery.build('drive', 'v3')

            permission = drive_service.permissions().create(
              fileId=spreadsheet_id,
              transferOwnership=True,
              body={
                'type': 'user',
                'role': 'owner',
                'emailAddress': owner,
              }
            ).execute()

            drive_service.files().update(
              fileId=spreadsheet_id,
              body={'permissionIds': [permission['id']]}
            ).execute()
        </.highlight>
      </pre>

    <p>
      Putting it all together, we get this:
      <script src="https://gist.github.com/ckhrysze/18e21470edb7d682e1f9f0a0ee6e830a.js">
      </script>
    </p>
    """
  end
end
