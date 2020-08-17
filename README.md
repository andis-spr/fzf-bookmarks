# fzf-bookmarks

The really simple bookmarks menu.

## Features

- Find and select multiple bookmarks for opening them in a web browser.

- Manage bookmarks collection via your favorite text editor and version control.

- Portable and made to run from macOS, Linux and Windows command-line interfaces.

## Incentive

I wanted a platform agnostic bookmarks management interface, as I've had become tired with clunky GUIs and non-portable storage formats of popular web browsers. On the shoulders of `lua`, `fzf` & *nix text editing utilities, fzf-bookmarks came into being.

## "Save-a-bookmark"

Save this string as a bookmark in your web browser for conveniently copying page information (the title, URL & description) to your `bookmarks.txt` file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

## How do I run this?

On Windows simply execute the `start.bat` file.

On macOS and Linux you first have to set `start.sh` as executable program by issuing command `chmod +x ./start.sh`, then you can launch it with `./start.sh`.

### Command line parameters

Launch files `./start.{script-ext.}` accept a bookmarks file path parameter, e.g.

`start.sh ~/myfiles/bookmarks` or `start.bat "C:/myfiles/bookmarks"` (path forward-slashes in both cases).

This allows having different aliases or shortcuts for different bookmark files.

### Windows taskbar shortcut

To have an `fzf-bookmarks` launcher icon you can pin on your Windows taskbar, create a new Shortcut (`Right click --> New --> Shortcut`) with the `Target` field of

`cmd.exe /c .\start.bat`

and set `Start in` path to `fzf-bookmarks` directory.

## Requirements

- `sed`, `awk`, `cat`
- `lua`, `fzf`

### Windows

On Windows you can install these packages with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install sed gawk coreutils lua fzf
```
Or you can download the binaries from somewhere else and put them inside `dep-bin-win/{package-name}` directories.
