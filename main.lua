function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function magiclines(str)
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

function is_int(n)
  return (type(n) == "number") and (math.floor(n) == n)
end

do

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
        require('SETTINGS')
        require('SETTINGS_LOCAL')
        CMD_EXTRACT_URL=".\\cmd-win\\extract-url \"%s\""
        CMD_OPEN_URL_IN_BROWSER=".\\cmd-win\\open-url-in-browser %s"
        CMD_GET_BOOKMARK_LINE=".\\cmd-win\\get-bookmark-line %s %s %s %s"

        if (arg[1] ~= nil)
        then
            BOOKMARKS_FILE = arg[1]
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
        if #BROWSER_CMD > 0
        then
            io.write('\n Select a browser (press ENTER for default):\n\n')
            for index,value in ipairs(BROWSER_CMD) do
                if index == 1
                then
                    io.write('  ',index, ": ", value, " (default)\n" );
                else
                    io.write('  ',index, ": ", value, "\n" );
                end
            end
            io.write('\n> ')

            local indexInput = io.read()
            local CMDIndex = 1

            if (is_int(tonumber(indexInput)))
            then
                CMDIndex = tonumber(indexInput)
            else
                CMDIndex = 1
            end
            io.write('Opening URLs in ', BROWSER_CMD[CMDIndex], '...\n')
            return BROWSER_CMD[CMDIndex]
        else
            error("No browsers have been specified")
        end
    end
    
    local function formatURLToBrowserCMD(url, cmd)
        return string.format(cmd, url)
    end

    local function bookmarksToBrowser(bookmarks)
        local browserCMD;

        if string.len(bookmarks) ~= 0
        then
            browserCMD = selectBrowserCMD()

            if (BROWSER_CMD_IS_SEQ == true)
            then
                for bookmark in magiclines(bookmarks) do
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
                for bookmark in magiclines(bookmarks) do
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

    bookmarksToBrowser(getBookmarkLines())
end
