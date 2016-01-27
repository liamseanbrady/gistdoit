This simple Ruby utility takes a file on your local machine and turns it into a gist on GitHub.

I could have used gems to simplify the development process, but I'm not sure how much code that would have actually saved me writing, and it would have undoubtedly added a layer of complexity in terms of understanding the codebase, so I decided to use only libraries which are built in to Ruby itself.

### What I Learned

I learned a massive amount from making mistakes whilst building this little app. Gistdoit's code is overly complex and contains a lot of unnecessary indirection. This came from a strong desire to pracice OO design (for better or for worse) and a lack of understanding of the costs of prematurely creating abstractions. It also taught me a lot about the benefit of "make it work, make it right, make it fast", [deliberate discovery](http://dannorth.net/2010/08/30/introducing-deliberate-discovery/) and why DRY and abstractions should not be forced (I loved [this](http://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction) Sandi Metz post on this topic), especially in the early stages of a project.

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

### Things I would like to add in the future

- Allowing the user to select whether they would like a gist to be either secret or public.
- Listing all gists which the option of limited to a certain number of most recent.
- Editing a particular gist after selecting it by name.
- Show the diff of what was changed when files are updated
