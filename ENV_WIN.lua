-- Default settings on Windows systems:

BOOKMARKS_FILE_PATH="./bookmarks.mx.txt"

-- BROWSER_CMD="start %s"
-- BROWSER_CMD="start chrome %s"
-- BROWSER_CMD="start firefox -new-tab %s"
BROWSER_CMD="start firefox -new-tab %s"
BROWSER_CMD_SEQ=false -- true: repeats BROWSER_CMD command call for each selected link; false: add all selected links as argument to single BROWSER_CMD command call; default: false;

FZF_PREVIEW=true
FZF_PREVIEW_WINDOW="up:8"
FZF_LAYOUT="reverse-list"

CMD_EXTRACT_URL=".\\cmd-win\\extract-url \"%s\""
CMD_OPEN_URL_IN_BROWSER=".\\cmd-win\\open-url-in-browser %s"
CMD_GET_BOOKMARK_LINE=".\\cmd-win\\get-bookmark-line %s %s %s %s"

-- Load settings personal overrides:

require('ENV_WIN_LOCAL')
