BOOKMARKS_FILE_PATH="./bookmarks.txt"

-- BROWSER_CMD="sensible-browser %s"
-- BROWSER_CMD="epiphany %s"
-- BROWSER_CMD="chrome %s"
-- BROWSER_CMD="start chrome %s"
BROWSER_CMD="firefox -new-tab %s"
BROWSER_CMD_SEQ=false -- true: repeats BROWSER_CMD command call for each selected link; false: add all selected links as argument to single BROWSER_CMD command call; default: false;

FZF_PREVIEW_WINDOW="up:6"
FZF_LAYOUT="reverse-list"

CMD_EXTRACT_URL="./cmd-nix/extract-url.sh \"%s\""
CMD_OPEN_URL_IN_BROWSER="./cmd-nix/open-url-in-browser.sh %s"
CMD_GET_BOOKMARK_LINE="./cmd-nix/get-bookmark-line.sh %s %s %s"
