# fzf-bookmarks

The really simple bookmarks menu.

## Features

- Find and select multiple bookmarks for opening them in a web browser.

- Manage bookmarks collection via your favorite text editor and version control.

- Portable and made to run from macOS, Linux and Windows command-line interfaces.

## Incentive

I wanted a fast, portable, simple, platform-agnostic bookmarks management interface, as I dislike like clunky GUIs and non-so-portable storage formats of popular browsers. What can be better than text file.

On the shoulders of `fzf`, `lua` and *nix text utilities, fzf-bookmarks became a thing. Your'e welcome.

## How do I run this?

1. Clone the repository with `git clone git@github.com:andis-spr/fzf-bookmarks.git` or download and extract the <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">zip archive</a>.
2. Make sure your system has the <a href="#requirements">necessary packages</a> installed.
3. Rename `./bookmarks.txt.example` to `bookmarks.txt` or create your own.

### on Windows

3. Run `start.bat` file.

### on macOS / Linux

3. Set `start.sh` as executable program by running `chmod +x ./start.sh` in fzf-bookmarks directory.
4. Run `./start.sh` file.

## Tips and tricks

### "Copy-a-bookmark"

Save this string as a bookmark in your web browser for conveniently copying page information (the title, URL & description) to your `bookmarks.txt` file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

### Command line parameters

The launch scripts `./start.{script-ext.}` accept an optional bookmarks file path parameter, e.g.

`start.sh ~/myfiles/bookmarks` or `start.bat "C:/myfiles/bookmarks"` (forward-slashes in both cases).

This allows setting up different aliases/shortcuts/button etc. for different bookmark files.

### Creating Windows taskbar shortcut

To have a convenient launcher icon on your Windows taskbar, create a new `Shortcut` with `Right click -> New -> Shortcut`, set the `Target` field to `cmd.exe /c .\start.bat` and `Start in` field to your `fzf-bookmarks` directory, then drag it on the taskbar.

Above mentioned command line parameter can also be used here. Normally Windows won't let you pin another launcher because of the same path, but you can wrap it in another `.bat` script and make shortcut of that.

## Requirements

- `sed`, `awk`, `cat`
- `lua`, `fzf`

### Windows

On Windows you can install these packages with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install sed gawk coreutils lua fzf
```
Or you can download the binaries from somewhere else and put them inside `dep-bin-win/{package-name}` directories.
