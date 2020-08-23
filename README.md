# fzf-bookmarks

Portable, small, fast, delightful solution for organizing web bookmarks.

## Features

- Type and select multiple bookmarks for opening them the web browser.
- Manage bookmarks via your favorite text editor and version control.
- Runs the same in Unix-like system & Windows command-line interfaces.

## `bookmarks.txt`

```
#  50 Watts  ~  http://50watts.com/  ~  Illustration and book art with a literary bent. Focus on international illustrated books and Surrealism.  ~  visual arts, inspiration, illustration, archive
#  DigitalOcean  ~  https://cloud.digitalocean.com/login  ~  Helping millions of developers easily build, test, manage, and scale applications of any size – faster than ever before.  ~  
#  PHP: The Right Way  ~  https://phptherightway.com/  ~  An easy-to-read, quick reference for PHP best practices, accepted coding standards, and links to authoritative PHP tutorials around the Web  ~  php, web, development, help, guide
...
```

Get web page info as `bookmarks.txt` line via this handy <a href="https://en.wikipedia.org/wiki/Bookmarklet">bookmarklet</a>:

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20metaKeywords%20%3D%20document.querySelector(%60meta%5Bname%3D%22keywords%22%5D%60)%3Bconst%20title%20%3D%20document.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%20bookmark%60%2C%60%24%7Bprepend%7D%24%7Btitle.length%20%3E%200%20%3F%20title%20%3A%20window.location.hostname%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%3F%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%20%3A%20'-'%7D%24%7BcolDelimeter%7D%24%7BmetaKeywords%20%3F%20metaKeywords.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%20%3A%20'-'%7D%60)%3B%7D)()%7D)()
```

## Running

1. Extract the <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">zip archive</a> or clone the repository locally.
2. Make sure your system has the <a href="#requirements">requirements</a> installed.
3. Create your own `bookmarks.txt` (check out `example.bookmarks.txt`).
4. On **Windows** — launch `fzfb.bat`.<br />On **Unix-like systems** — run `chmod +x ./fzfb` (1st-time only), then `./fzfb`.

## Tips & tricks

### Windows taskbar shortcut

To have a launcher on your Windows taskbar, create a new `Shortcut` with `Right click -> New -> Shortcut`, set the `Target` field to `cmd.exe /c .\fzfb.bat` and `Start in` field to your `fzf-bookmarks` directory, then drag it on the taskbar.

Wrap `fzfb.bat` in another `.bat` if you want more than one pinned shortcut icon.

### File path launch parameter

The `start` scripts accept an optional bookmarks file path parameter, e.g.

`fzfb ~/myfiles/bookmarks.txt` / `fzfb.bat "C:/myfiles/bookmarks.txt"`.

## Requirements

<a href="https://www.lua.org/">`lua`</a>, <a href="https://github.com/junegunn/fzf">`fzf`</a>, `printf`, `sed`, `awk`, `cat` are required.

---

On Windows you can install all these dependencies with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install busybox lua fzf
```

---

For a truly portable Windows package, get the dependencies from here:

- <a href="https://sourceforge.net/projects/luabinaries/files/5.4.0/Tools%20Executables/">`lua`</a>, <a href="https://github.com/junegunn/fzf-bin/releases">`fzf`</a>
- `printf`, `sed`, `awk`, `cat` can be extracted either from <a href="https://frippery.org/busybox/">`busybox`</a> or GNU <a href="http://gnuwin32.sourceforge.net/packages/coreutils.htm">`coreutils`</a> + <a href="http://gnuwin32.sourceforge.net/packages/gawk.htm">`gawk`</a> packages.

Put them in the right `dependencies-win/*` directories.

## License

MIT
