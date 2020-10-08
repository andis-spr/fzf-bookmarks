# `fzf-bookmarks`

Windows / *nix script for conveniently using web bookmarks stored in a text file.

## Preview

<img src="https://i.imgur.com/r7ApRJR.png" />

## Features

- Search and open one or multiple bookmarks in the web browser or copy them to clipboard.
- Manage bookmarks via your favorite text editor and version control.
- Run from command line of Windows and *nix systems.

## Running

1. Extract <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">the archive</a> or clone the repository.
2. Make sure your system has the <a href="#requirements">requirements</a> installed.
2. Customize your `PLATFORM`, prefered `BROWSER_CMD` order and other settings in `SETTINGS_LOCAL.lua`.
3. Create your own `~/bookmarks.txt` / `%USERPROFILE%\bookmarks.txt` and add some bookmarks (check out `example.bookmarks.txt`).
4. **Windows** — run `fzfb.bat`.<br />***nix systems** — run `./fzfb`.

## `bookmarks.txt`

```
#  50 Watts  ~  http://50watts.com/  ~  visual arts, inspiration, illustration, archive
#  DigitalOcean  ~  https://cloud.digitalocean.com/login
#  PHP: The Right Way  ~  https://phptherightway.com/  ~  php, web, development, help, guide
...
```

Get web page info as `bookmarks.txt` line via this handy <a href="https://en.wikipedia.org/wiki/Bookmarklet">bookmarklet</a>:

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaKeywords%20%3D%20document.querySelector(%60meta%5Bname%3D%22keywords%22%5D%60)%3Bconst%20title%20%3D%20document.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%20bookmark%60%2C%60%24%7Bprepend%7D%24%7Btitle.length%20%3E%200%20%3F%20title%20%3A%20window.location.hostname%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaKeywords%20%3F%20metaKeywords.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%20%3A%20'-'%7D%60)%3B%7D)()%7D)()
```

## Tips & tricks

You can select multiple bookmarks using the `Tab` key.

---

The `fzfb` script(s) accept an optional bookmarks file path parameter e.g.
```
fzfb ~/myfiles/bookmarks.txt`
fzfb.bat "C:/myfiles/bookmarks.txt"
```

## Requirements

<a href="https://www.lua.org/">`lua`</a>, <a href="https://github.com/junegunn/fzf">`fzf`</a>, `awk` are required.

---

On Windows you can install all these dependencies with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install gawk lua fzf
```

---

For a truly portable Windows package, get the dependencies from here:

- <a href="https://sourceforge.net/projects/luabinaries/files/5.4.0/Tools%20Executables/">`lua`</a>, <a href="https://github.com/junegunn/fzf-bin/releases">`fzf`</a>
- `awk` can be extracted either from <a href="https://frippery.org/busybox/">`busybox`</a> or GNU <a href="http://gnuwin32.sourceforge.net/packages/gawk.htm">`gawk`</a> packages.

Put these dependencies in the right `dependencies-win/*` directories.

## License

MIT
