# fzf-bookmarks

The really simple bookmarks menu.

## Features

- Find and select multiple bookmarks for opening them in a web browser.

- Manage bookmarks collection via your favorite text editor and version control.

- Portable and runs from macOS / *BSD, Linux etc. and Windows command-line interfaces.

## Incentive

I imagined a fast, portable, searchable, platform-agnostic, no-bells-and-whistles bookmarks management UI, as I grew to dislike everchanging, clunky GUIs and completely non-flexible storage formats of the popular web browsers. What's more simple than a text file really...

So, on the shoulders of `fzf`, `lua` and `*nix text utilities`, the `fzf-bookmarks` became a thing.

## How do I run this?

1. Download and extract the <a href="https://github.com/andis-spr/fzf-bookmarks/archive/master.zip">zip archive</a> OR clone the repository (`git clone git@github.com:andis-spr/fzf-bookmarks.git`).
2. Make sure your system has the <a href="#requirements">required packages</a> installed.
3. Rename `./bookmarks.txt.example` to `bookmarks.txt` or create your own.

### on Windows

3. Run `start.bat` file.

### on macOS / Linux

3. Set `start.sh` as an executable by running `chmod +x ./start.sh` in your `fzf-bookmarks` directory.
4. Run `start.sh` file.

## Usage and tips

### "Copy-a-bookmark" bookmarklet

Save this string as a bookmark in your web browser for conveniently copying page information (the title, URL & description) to your `bookmarks.txt` file.

```
javascript:(function()%7B(()%20%3D%3E%20%7Bconst%20metaDescription%20%3D%20document.querySelector(%60meta%5Bname%3D%22description%22%5D%60)%3Bconst%20prepend%20%3D%20%60%23%20%20%60%3Bconst%20colDelimeter%20%3D%20%60%20%20~%20%20%60%3Bprompt(%60Copy%20this%60%2C%60%24%7Bprepend%7D%24%7Bdocument.title.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%24%7Bwindow.location%7D%24%7BcolDelimeter%7D%24%7BmetaDescription%20%26%26%20metaDescription.content.replace(%2F%5Cs%2B%2Fg%2C%20%60%20%60).trim()%7D%24%7BcolDelimeter%7D%60)%3B%7D)()%7D)()
```

### Configuration

There are bunch of options you can set in configuration files, like changing the bookmarks file location or toggling `fzf` result preview.

On *nix systems the main config. values are read from `ENV_NIX.lua`, on Windows respectively - `ENV_WIN.lua`.

The `ENV_NIX_LOCAL.lua` and `ENV_WIN_LOCAL.lua` files are intended as the real place for setting personal value overrides, as they are read after the main `ENV..` files.

If you choose to update `fzf-bookmarks` via pulling latest commits from GitHub repository and don't want to deal with conflicts, you can exlude your local configuration from being tracked by running `git update-index --skip-worktree <FILE>` on the corresponding config file.

### Bookmarks file path command-line parameter

The launch scripts `start.{script-ext.}` accept an optional bookmarks file path parameter, e.g.

`start.sh ~/myfiles/bookmarks.txt` / `start.bat "C:/myfiles/bookmarks.txt"`.

This parameter allows setting up different aliases, shortcuts, buttons etc. for different bookmark files.

### Creating a Windows taskbar shortcut

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
