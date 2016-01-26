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
