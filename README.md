# fzf-bookmarks

A simple solution for website bookmarks management.

## Features

- Query and select multiple bookmarks for opening in a web browser.

- Manage entire bookmarks collection from your favorite text editor.

- Made to run from within a macOS, Linux and Windows command line interface.

## Incentive

I realized I wanted a dead simple search tool and plaintext storage for my bookmarks outside of the browser after growing tired with the clunky browser UIs and their weird everchanging storage formats.

## "Save-a-bookmark"

Save this string as a bookmark in your web browser for conveniently copying page information (title, URL & description) to your bookmarks.txt file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%20%20%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20-%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

## Requirements

- lua
- fzf
- sed, awk, cat

On Windows you can install these packages using package "scoop.sh" package manager OR manually download the binaries for these tools and place them in the right folders as /dep-bin-win/{package}.
