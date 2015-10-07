This simple Ruby utility takes a file on your local machine and turns it into a gist on GitHub.

I could have used gems to simplify the development process, but I'm not sure how much code that would have actually saved me writing, and it would have undoubtedly added a layer of complexity in terms of understanding the codebase, so I decided to use only libraries which are built in to Ruby itself.

### Getting started

`gem install gistdoit`

If it's the first time you're pushing a gist to GitHub with Gistdoit, then you will be asked to submit a personal access token, which you can get on your GitHub account [here](https://github.com/settings/tokens). All you have to do is click `generate new token` and make sure to select only the `gist` scope. Pass this token to Gistdoit one time and you're good to go.

This token is stored in `~/.gistdoit`

### Usage

To create a new gist, you simply type `gistdoit` along with the relative file path for the file you want to make a gist out of

```
// PWD is /Users/AwesomeUser/Dev/Projects

gistdoit cool_project_file.rb
```


If you want to edit a file that is currently on GitHub, then you can pass the `patch` flag

```
// PWD is /Users/AwesomeUser/Dev/Projects

gistdoit patch cool_project_file.rb
```

If you like to update your gists remotely on GitHub, then we recommend that you first make sure that your local gist is up to date with the remote version

```
// PWD is /Users/AwesomeUser/Dev/Projects

gistdoit pull cool_project_file.rb

// Gistdoit needs permission to update the file
Password: ********

The file was successfully updated!
```

At the moment, Gistdoit only recognizes files which were added to gist.github via Gistdoit. 

### Internals

Gistdoit keeps a record of the full file paths for gists you've uploaded to GitHub via Gistdoit along with the slug for that file, and a SHA of the file itself. This allows Gistdoit to quickly check for changes in the file without having to parse it.

### Things I would like to add in the future

- Allowing the user to select whether they would like a gist to be either secret or public.
- Listing all gists which the option of limited to a certain number of most recent.
- Editing a particular gist after selecting it by name.
- Show the diff of what was changed when files are updated
