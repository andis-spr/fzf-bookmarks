-- SETTINGS_DEFAULT.lua - Default configuration values for fzf-bookmarks.

-- TIP: Your personal ovverides of these values can go into SETTINGS_LOCAL.lua.

-- BROWSER_CMD -- command for sending bookmark link to web browser
if package.config:sub(1,1) == '/' -- (Determine system by checking the path separator.)
then
    -- Assume a Unix-like system e.g. GNU/Linux, macOS --

    -- BROWSER_CMD="chrome %s"
    -- BROWSER_CMD="firefox -new-tab %s"
    -- BROWSER_CMD="safari %s"
    -- BROWSER_CMD="epiphany %s"
    BROWSER_CMD="sensible-browser %s" -- Debian/*buntu GNU/Linux symlink to an installed default browser
else
    -- Assume a Microsoft Windows system --

    -- BROWSER_CMD="start chrome %s"
    -- BROWSER_CMD="start edge %s"
    -- BROWSER_CMD="start firefox -new-tab %s"
    BROWSER_CMD="start %s" -- Point to Windows default http/s URL handler
end

-- BOOKMARKS - Path to your bookmarks file.
BOOKMARKS_FILE="./example-bookmarks.fzb.txt"
-- You can also pass this path as a parameter to start[.sh|.bat].

-- BROWSER_CMD_IS_SEQ - determines what pressing Enter on selected bookmarks does:
-- true - repeats BROWSER_CMD call for each link individually;
-- false - bookmark links are passed as a space-delimeted argument to single BROWSER_CMD call;
BROWSER_CMD_IS_SEQ=true

-- fzf parameters. Check fzf manual for more information on these.
FZF_PREVIEW=true
FZF_PREVIEW_WINDOW="up:8"
FZF_LAYOUT="reverse-list"
