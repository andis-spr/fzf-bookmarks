function fileExists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function magicLines(str)
    local pos = 1;
    return function()
        if not pos then return nil end
        local  p1, p2 = string.find( str, "\r?\n", pos )
        local line
        if p1 then
            line = str:sub( pos, p1 - 1 )
            pos = p2 + 1
        else
            line = str:sub( pos )
            pos = nil
        end
        return line
    end
end

function isInt(n)
  return (type(n) == "number") and (math.floor(n) == n)
end

if package.config:sub(1,1) == '/'
then
    -- Assume a Unix-like system e.g. GNU/Linux --

    require(arg[1]..'/SETTINGS')
    require(arg[1]..'/SETTINGS_LOCAL')

    CMD_EXTRACT_URL=arg[1].."/cmd-nix/extract-url.sh \"%s\""
    CMD_OPEN_URL_IN_BROWSER=arg[1].."/cmd-nix/open-url-in-browser.sh %s"
    CMD_GET_BOOKMARK_LINE=arg[1].."/cmd-nix/get-bookmark-line.sh %s %s %s %s"

    if (arg[2] ~= nil)
    then
        BOOKMARKS_FILE = arg[2]
    end
else
    -- Assume a Microsoft Windows system --
    package.path=package.path..";"..arg[1].."SETTINGS.lua"
    package.path=package.path..";"..arg[1].."SETTINGS_LOCAL.lua"

    require('SETTINGS')
    require('SETTINGS_LOCAL')

    CMD_EXTRACT_URL=arg[1].."\\cmd-win\\extract-url \"%s\""
    CMD_OPEN_URL_IN_BROWSER=arg[1].."\\cmd-win\\open-url-in-browser %s"
    CMD_GET_BOOKMARK_LINE=arg[1].."\\cmd-win\\get-bookmark-line %s %s %s %s"

    if (arg[2] ~= nil)
    then
        BOOKMARKS_FILE = arg[2]
    end
end


local function getBookmarkLines()
    local handle = io.popen(string.format(CMD_GET_BOOKMARK_LINE, BOOKMARKS_FILE, FZF_LAYOUT, FZF_PREVIEW_WINDOW, FZF_PREVIEW))
    
    local result = handle:read("*a")
    handle:close()
    return result
end


local function getURLFromBookmark(bookmark)
    local handle = io.popen(string.format(CMD_EXTRACT_URL, bookmark))
    local result = handle:read("*a")
    handle:close()
    return result
end

local function selectBrowserCMD()
    for index,value in ipairs(BROWSER_CMD) do
        if index == 1
        then
            io.write('  ',index, ": ", value, " (ENTER)\n" );
        else
            io.write('  ',index, ": ", value, "\n" );
        end
    end
    
    io.write('\n  c: copy URL(s) to clipboard\n')
    io.write('  C: copy bookmark(s) to clipboard\n')

    io.write('\n> ')

    local indexInput = io.read()

    if indexInput == 'c'
    then
        return "copy-url-to-clipboard"
    end
    
    if indexInput == 'C'
    then
        return "copy-bookmark-to-clipboard"
    end

    local CMDIndex = 1

    if (isInt(tonumber(indexInput)))
    then
        CMDIndex = tonumber(indexInput)
    else
        CMDIndex = 1
    end

    io.write('Opening URLs in ', BROWSER_CMD[CMDIndex], '...\n')

    return BROWSER_CMD[CMDIndex]
end

local function formatURLToBrowserCMD(url, cmd)
    return string.format(cmd, url)
end

local function bookmarksToBrowser(bookmarks)
    local browserCMD;

    if string.len(bookmarks) ~= 0
    then
        browserCMD = selectBrowserCMD()

        if (browserCMD == 'copy-url-to-clipboard')
        then
            local URLstring = ""
            for bookmark in magicLines(bookmarks) do
                if (string.len(bookmark) > 0)
                then
                    local url = string.gsub(getURLFromBookmark(bookmark), "\n", "") 
                    URLstring = URLstring.."\n"..url
                end
            end
            io.popen(CLIPBOARD_CMD,'w'):write(URLstring):close()
        else if (browserCMD == 'copy-bookmark-to-clipboard')
        then
            io.popen(CLIPBOARD_CMD,'w'):write(bookmarks):close()
        else
            if (BROWSER_CMD_IS_SEQ == true)
                then
                    for bookmark in magicLines(bookmarks) do
                        if (string.len(bookmark) > 0)
                        then
                            local url = getURLFromBookmark(bookmark)
                            if (not(string.len(url) == 0))
                            then
                                local browserCMDWithURL = formatURLToBrowserCMD(url, browserCMD)
                                os.execute(string.format(CMD_OPEN_URL_IN_BROWSER, browserCMDWithURL))
                            end
                        end
                    end
                else
                    local URLstring = ""
                    for bookmark in magicLines(bookmarks) do
                        if (string.len(bookmark) > 0)
                        then
                            local url = string.gsub(getURLFromBookmark(bookmark), "\n", "") 
                            URLstring = URLstring.." "..url
                        end
                    end
                    local browserCMDWithURL = formatURLToBrowserCMD(URLstring, browserCMD)
                    if (not(string.len(URLstring) == 0))
                    then
                        os.execute(string.format(CMD_OPEN_URL_IN_BROWSER, browserCMDWithURL))
                    end
                end
            end
        end
    end
end

bookmarksToBrowser(getBookmarkLines())
