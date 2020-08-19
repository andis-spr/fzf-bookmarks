# fzf-bookmarks

Platform & browser independent, portable, small, fast, delightful solution for organizing web bookmarks.

## Features

- Type and select multiple bookmarks for opening them the web browser.
- It's plaintext! Manage bookmarks via your favorite text editor & version control.
- Runs the same in Unix-like system & Windows command-line interfaces.

## Bookmarks

One bookmark per line in `bookmarks.txt`, e.g.
```
#  50 Watts  ~  http://50watts.com/  ~  Illustration and book art with a literary bent. Focus on international illustrated books and Surrealism.  ~  visual arts, inspiration, illustration, archive
#  DigitalOcean  ~  https://cloud.digitalocean.com/login  ~  Helping millions of developers easily build, test, manage, and scale applications of any size – faster than ever before.  ~  
#  PHP: The Right Way  ~  https://phptherightway.com/  ~  An easy-to-read, quick reference for PHP best practices, accepted coding standards, and links to authoritative PHP tutorials around the Web  ~  php, web, development, help, guide
...
```

## How do I run this?

1. Download and extract the <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">zip archive</a> or clone the repository locally and make sure your system has the <a href="#requirements">required packages</a> installed.
2. Create your own 'bookmarks.txt' file.

### Windows

3. Run the `fzfb.bat` file.

### Unix-like systems (macOS, Linux etc.)

3. Set `fzfb` as an executable by running `chmod +x ./fzfb`, then run `./fzfb`.

## Some usage tips

### "Copy-a-bookmark" bookmarklet

Copy and paste a ready-made bookmark string to your `bookmarks.txt` file via browser <a href="https://en.wikipedia.org/wiki/Bookmarklet">bookmarklet</a>:

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20metaKeywords%20%3D%20document.querySelector(%60meta%5Bname%3D%22keywords%22%5D%60)%3Bconst%20title%20%3D%20document.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%20bookmark%60%2C%60%24%7Bprepend%7D%24%7Btitle.length%20%3E%200%20%3F%20title%20%3A%20window.location.hostname%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%3F%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%20%3A%20'-'%7D%24%7BcolDelimeter%7D%24%7BmetaKeywords%20%3F%20metaKeywords.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%20%3A%20'-'%7D%60)%3B%7D)()%7D)()
```

### Bookmarks file path launch parameter

The `start` scripts accept an optional bookmarks file path parameter, e.g.

`fzfb ~/myfiles/bookmarks.txt` / `fzfb.bat "C:/myfiles/bookmarks.txt"`.

Useful for having multiple bookmarks collection files, combined with custom aliases and launchers.

### Creating a Windows taskbar shortcut

To have a launcher on your Windows taskbar, create a new `Shortcut` with `Right click -> New -> Shortcut`, set the `Target` field to `cmd.exe /c .\fzfb.bat` and `Start in` field to your `fzf-bookmarks` directory, then drag it on the taskbar.

Wrap `fzfb.bat` in another `.bat` if you want more than one pinned shortcut icon.

## Requirements

- <a href="https://www.lua.org/">`lua`</a>, <a href="https://github.com/junegunn/fzf">`fzf`</a>
- `printf`, `sed`, `awk`, `cat` are usually included with Unix-like systems like macOS and Linux. For Windows see below.

### Windows

On Windows you can install these dependencies with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install busybox lua fzf
```
#### Manually adding Windows dependencies

If you want a truly portable Windows package, you can get the dependencies from here:

- <a href="https://sourceforge.net/projects/luabinaries/files/5.4.0/Tools%20Executables/">`lua`</a>
- <a href="https://github.com/junegunn/fzf-bin/releases">`fzf`</a>
- `printf`, `sed`, `awk`, `cat` can be found either in <a href="https://frippery.org/busybox/">`busybox`</a> or in GNU <a href="http://gnuwin32.sourceforge.net/packages/coreutils.htm">`coreutils`</a> + <a href="http://gnuwin32.sourceforge.net/packages/gawk.htm">`gawk`</a> packages.

Then you can put them in right `dependencies-win/{dependency-name}` directories.
