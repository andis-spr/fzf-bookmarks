# fzf-bookmarks

The really simple bookmarks menu.

## Features

- Query and select multiple bookmarks for opening in the web browser.

- Manage bookmarks collection from your favorite text editor.

- Made to run from macOS, Linux and Windows command line interfaces.

## Incentive

I realized I wanted a dead simple search tool and plaintext storage for my bookmarks outside of the browser after growing tired with the clunky browser UIs and their weird everchanging storage formats.

## "Save-a-bookmark"

Save this string as a bookmark in your web browser for conveniently copying page information (the title, URL & description) to your `bookmarks.txt` file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

## Windows taskbar shortcut

To have an `fzf-bookmarks` launcher icon you can pin on your Windows taskbar, create a new Shortcut (`Right click --> New --> Shortcut`) with the `Target` field of

`cmd.exe /c .\start.bat`

and set `Start in` path to `fzf-bookmarks` directory.

## Requirements

- `sed`, `awk`, `cat`
- `lua`, `fzf`

### Windows

On Windows you can install these packages with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install lua fzf sed gawk coreutils
```
Or you can manually download the binaries and extract them inside `dep-bin-win/-package-` directories.
