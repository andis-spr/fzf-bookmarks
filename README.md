# fzf-bookmarks

The really simple bookmarks menu.

## Features

- Find and select multiple bookmarks for opening in the web browser.

- Manage bookmarks list via your favorite text editor & version control.

- Portable and launches quickly.

- Runs from macOS, *BSD, Linux, HaikuOS etc. & Windows command-line interfaces.

## Incentive

I imagined having a fast, portable, searchable, platform-agnostic, no-bells-and-whistles bookmarks management UI, as I really began to dislike the everchanging, clunky GUIs and completely non-flexible storage formats of the popular web-browsers. What's more simple than a text file really...

So, on the shoulders of `fzf`, `lua` and `some *nix text utilities`, the `fzf-bookmarks` became a thing.

## The format

Each bookmark is represented a single line in `bookmarks.txt`,  like this:
```
#  50 Watts  ~  http://50watts.com/  ~  Illustration and book art with a literary bent. Focus on international illustrated books and Surrealism.  ~  visual arts, inspiration, illustration, archive
#  PHP: The Right Way  ~  https://phptherightway.com/  ~  An easy-to-read, quick reference for PHP best practices, accepted coding standards, and links to authoritative PHP tutorials around the Web  ~  php, web, development, help, guide
...
```
Check `bookmarks.txt.example` for more explanation.

## How do I run this?

1. Download and extract the <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">zip archive</a> or clone the repository (`git clone git@github.com:andis-spr/fzf-bookmarks.git`).
2. Make sure your system has the <a href="#requirements">required packages</a> installed.
3. Rename `./bookmarks.txt.example` to `bookmarks.txt` or create your own.

### on Windows

3. Run the `start.bat` file.

### on *nix (macOS, Linux etc.)

3. Set `start.sh` as an executable by running `chmod +x ./start.sh`.
4. Run the `start.sh` file.

## Usage and tips

### "Copy-a-bookmark" bookmarklet

Save this string as a bookmark in your web-browser for conveniently copying page information (the title, URL & description) to your `bookmarks.txt` file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

### Configuration

There are bunch of options you can set in configuration files, like changing the bookmarks file location or toggling `fzf` result preview.

On *nix systems the main config. values are read from `ENV_NIX.lua`, on Windows respectively - `ENV_WIN.lua`.

The `ENV_NIX_LOCAL.lua` and `ENV_WIN_LOCAL.lua` files are intended as the real place for setting personal value overrides, as they are read after the main `ENV..` files.

If you choose to update `fzf-bookmarks` via pulling latest commits from GitHub repository and don't want to deal with conflicts, you can exlude your local configuration from being tracked by running `git update-index --skip-worktree <FILE>` on the corresponding config file.

### Bookmarks file path command-line parameter

The `start` scripts accept an optional bookmarks file path parameter, e.g.

`start.sh ~/myfiles/bookmarks.txt` / `start.bat "C:/myfiles/bookmarks.txt"`.

This parameter allows setting up different aliases, keyboard shortcuts, Windows shortcuts, UI buttons etc. for handling different bookmark files. Possibilities are endless!

### Creating a Windows taskbar shortcut

To have a convenient launcher icon on your Windows taskbar, create a new `Shortcut` with `Right click -> New -> Shortcut`, set the `Target` field to `cmd.exe /c .\start.bat` and `Start in` field to your `fzf-bookmarks` directory, then drag it on the taskbar.

Above mentioned command line parameter can also be used here. Normally Windows won't let you pin another launcher because of the same path, but you can wrap it in another `.bat` script and make a shortcut of that.

## Requirements

- `sed`, `awk`, `cat`
- `lua`, `fzf`

### Windows

On Windows you can install these packages with <a href="https://scoop.sh" target="_blank">`scoop`</a> by running

```
scoop install busybox lua fzf
```
Or you can download the binaries from somewhere else and put them inside `dep-bin-win/{package-name}` directories.
- `<a href="https://sourceforge.net/projects/luabinaries/files/5.4.0/Tools%20Executables/">lua</a>`
- `<a href="https://github.com/junegunn/fzf-bin/releases">fzf</a>`
- `sed`, `awk`, `cat` are found either in `<a href="https://frippery.org/busybox/">busybox</a>` or <a href="http://gnuwin32.sourceforge.net/packages/coreutils.htm">coreutils</a>` + `<a href="http://gnuwin32.sourceforge.net/packages/gawk.htm">gawk</a>` packages.
