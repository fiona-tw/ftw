# Notes: Day 1

## notes of commands used to publish package

Following this tutorial: https://packaging.python.org/tutorials/packaging-projects/

To setup the source distribution run:

`python3 setup.py sdist bdist_wheel`

which allows others to simple do `pip install <pkg-name>` instead of cloning
the repo etc.

Then run the following to publish to pypi:

`python3 -m twine upload dist/*`

Note: To upload to the test pypi you will need to include it's url as a flag to upload: (e.g. could probably do this to our internal pypi server!)

`--repository-url https://test.pypi.org/legacy/`


To install (test version of) your new pkg, run:

`python3 -m pip install <pkg-name>`

test version add:

`--index-url https://test.pypi.org/simple/ --no-deps <pkg-name-on-test-pypi>`

no deps as only test pypi, might be missing them.


## Attempting to setup auto publishing to PyPI

- I added a GitHub action using the publish-python template so that on every push to master we run the above commands to publish to PyPI. However currently it is trying to re-publish v0.0.2 (which already existed before I started this section). So now I am trying to find out where GitHun builds the `dist` directory!


# Notes: Day 1 follow up with Romain

GitHub actions, GitLab CI are just types of __script runners__ used to deploy code (according to a script -> .yml)
Another example of this (which Romain users) is Travis, where his GitHub projects define a travis.yml file instead
of using GitHub actions. Importantly he mentioned about the password used there is envrypted to only be used when 
publishing to pypi from that specific directory (unique to GitHub!) for that specific package. So, for instance, 
no one else can fork that project and succsesfully gain access to his pypi.


There are web servers other than `./manage.py runserver` that can host a django (or more generally any) app, examples:

  - gnuicorn
  - http-server (basic python)
      - can run a one line command in a given directory to serve its contents to the web
      - python -m http.server 8000 (https://gist.github.com/willurd/5720255)
      - if there is an `index.html` file in that directory then it will instead show it's contents --> funamental to webservers!
      - the ultimate goal of web server is to serve the html file
      - By default web server serves all static files within the folder


# Helpful links

__Exit Codes__: https://bencane.com/2014/09/02/understanding-exit-codes-and-how-to-use-them-in-bash-scripts/
__Github Env Vars__: https://help.github.com/en/actions/automating-your-workflow-with-github-actions/using-environment-variables
