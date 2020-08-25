-- SETTINGS_DEFAULT.lua - Default configuration values for fzf-bookmarks.

-- TIP: Your personal ovverides of these values can go into SETTINGS_LOCAL.lua.

-- PLATFORM - set your operating system.
-- 0: Linux/*BSD with X11
-- 1: macOS
-- 2: Termux on Android with termux-api
-- 3: Microsoft Windows
PLATFORM = 0

-- BROWSER_CMDS: A list of available web browsers.
if PLATFORM == 0
then
    BROWSER_CMD = {
        "sensible-browser %s", -- Debian/*buntu GNU/Linux symlink to an installed default browser
        "chrome %s",
        "firefox -new-tab %s",
    }
end

if PLATFORM == 1
then
    BROWSER_CMD = {
        "safari %s",
        "chrome %s",
        "firefox -new-tab %s",
    }
end

if PLATFORM == 2
then
    BROWSER_CMD = {
        "termux-open-url %s"
    }
end

if PLATFORM == 3
then
    BROWSER_CMD = {
        "start %s", -- Point to Windows default http/s URL handler. Requires BROWSER_CMD_IS_SEQ=true
        "start chrome %s",
        "start edge %s",
        "start firefox -new-tab %s",
    }
end

-- BOOKMARKS_FILE - Path to your bookmarks file.
-- You can also pass this path as a parameter to fzfb[.bat].
if PLATFORM == 0 or PLATFORM == 1 or PLATFORM == 2
then
    if (fileExists('bookmarks.txt')) -- determine if there's a personal 'bookmarks.txt' present
    then
        BOOKMARKS_FILE=arg[1].."/bookmarks.txt"
    else
        BOOKMARKS_FILE=arg[1].."/example.bookmarks.txt"
    end
end

if PLATFORM == 3
then
    if (fileExists(arg[1]..'bookmarks.txt')) -- determine if there's a personal 'bookmarks.txt' present
    then
        BOOKMARKS_FILE=arg[1].."bookmarks.txt"
    else
        BOOKMARKS_FILE=arg[1].."example.bookmarks.txt"
    end
end


-- CLIPBOARD_CMD - system clipboard utility
-- Typically on
--- Linux/Unix with X11:
--- CLIPBOARD_CMD="xclip -selection c"
--- macOS:
--- CLIPBOARD_CMD="pbcopy"
--- Termux on Android with termux-api:
--- CLIPBOARD_CMD="termux-clipboard-set"
--- Microsoft Windows:
--- CLIPBOARD_CMD="clip"
if PLATFORM == 0
then
    CLIPBOARD_CMD="xclip -selection c"
end

if PLATFORM == 1
then
    CLIPBOARD_CMD="pbcopy"
end

if PLATFORM == 2
then
    CLIPBOARD_CMD="termux-clipboard-set"
end

if PLATFORM == 3
then
    CLIPBOARD_CMD="clip"
end
    
-- BROWSER_CMD_IS_SEQ - determines what pressing Enter on selected bookmarks does:
-- true - repeats BROWSER_CMD call for each link individually;
-- false - bookmark links are passed as a space-delimeted argument to single BROWSER_CMD call;
if PLATFORM == 0 or PLATFORM == 1
then
    BROWSER_CMD_IS_SEQ=false
end

if PLATFORM == 2
then
    -- termux-clipboard-set accepts single URL argument, so let's repeat it for each URL
    BROWSER_CMD_IS_SEQ=true
end

if PLATFORM == 3
then
    -- start accepts single URL argument, so let's repeat it for each URL
    BROWSER_CMD_IS_SEQ=true
end

-- fzf parameters. Check fzf manual for more information on these.
FZF_PREVIEW=true
FZF_PREVIEW_WINDOW="up:8"
FZF_LAYOUT="reverse-list"
