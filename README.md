# fzf-bookmarks

Platform & browser independent, portable, small, fast, delightful solution for organizing web bookmarks.

## Features

- Type and select multiple bookmarks for opening them the web browser.
- It's plaintext! Manage bookmarks via your favorite text editor & version control.
- Runs the same in Unix-like system & Windows command-line interfaces.

## Incentive

I began to grow tired with everchanging, clunky graphical interfaces and completely non-flexible storage formats of the popular web-browsers and wanted a simple bookmarks management tool somewhat independent from these browsers. What's more simple than a text file really...

So, on the shoulders of `fzf`, `lua` and `some *nix text utilities`, the `fzf-bookmarks` became a thing.

## The format

One bookmark per line in your `bookmarks.mx.txt`, like this:
```
#  50 Watts  ~  http://50watts.com/  ~  Illustration and book art with a literary bent. Focus on international illustrated books and Surrealism.  ~  visual arts, inspiration, illustration, archive
#  DigitalOcean  ~  https://cloud.digitalocean.com/login  ~  Helping millions of developers easily build, test, manage, and scale applications of any size – faster than ever before.  ~  
#  PHP: The Right Way  ~  https://phptherightway.com/  ~  An easy-to-read, quick reference for PHP best practices, accepted coding standards, and links to authoritative PHP tutorials around the Web  ~  php, web, development, help, guide
...
```

## How can I run this?

1. Download and extract the <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">zip archive</a> or clone the repository (`git clone git@github.com:andis-spr/fzf-bookmarks.git`).
2. Make sure your system has the <a href="#requirements">required packages</a> installed.
3. Rename `./bookmarks.example.mx.txt` to `bookmarks.mx.txt` or create your own.

### Windows

3. Run the `start.bat` file.

### Unix-like systems (macOS, Linux etc.)

3. Set `start.sh` as an executable by running `chmod +x ./start.sh`.
4. Run the `start.sh` file.

## Usage and tips

### "Copy-a-bookmark" bookmarklet

Save this string as a bookmark in your web-browser for conveniently copying page information (the title, URL & description) to your `bookmarks.mx.txt` file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

### Configuration

`SETTINGS_LOCAL.lua` is the intended place for personal settings overrides. Refer to `SETTINGS.lua` for the default values you can change.

If you want to update `fzf-bookmarks` via `git`, you can exlude your `SETTINGS_LOCAL.lua` configuration file changes from being tracked by running `git update-index --skip-worktree SETTINGS_LOCAL.lua`.

### Bookmarks file path launcher parameter

The `start` scripts accept an optional bookmarks file path parameter, e.g.

`start.sh ~/myfiles/bookmarks.mx.txt` / `start.bat "C:/myfiles/bookmarks.mx.txt"`.

Useful for having multiple bookmarks collection files, combined with custom aliases and launchers.

### Creating a Windows taskbar shortcut

To have a launcher on your Windows taskbar, create a new `Shortcut` with `Right click -> New -> Shortcut`, set the `Target` field to `cmd.exe /c .\start.bat` and `Start in` field to your `fzf-bookmarks` directory, then drag it on the taskbar.

Wrap `start.bat` in another `.bat` if you want more than one pinned shortcut icon.

## Requirements

- <a href="https://www.lua.org/">`lua`</a>, <a href="https://github.com/junegunn/fzf">`fzf`</a>
- `printf`, `sed`, `awk`, `cat` are usually included with Unix-like systems like macOS and Linux. For Windows see below.

### Windows

On Windows you can install these dependencies with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install busybox lua fzf
```
You can also put manually downloaded binaries in `dependencies-win/{dependency-name}` directories. See links below.

#### Links to Windows binaries
- <a href="https://sourceforge.net/projects/luabinaries/files/5.4.0/Tools%20Executables/">`lua`</a>
- <a href="https://github.com/junegunn/fzf-bin/releases">`fzf`</a>
- `printf`, `sed`, `awk`, `cat` can be found either in <a href="https://frippery.org/busybox/">`busybox`</a> or in GNU <a href="http://gnuwin32.sourceforge.net/packages/coreutils.htm">`coreutils`</a> + <a href="http://gnuwin32.sourceforge.net/packages/gawk.htm">`gawk`</a> packages.
