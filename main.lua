do
    if package.config:sub(1,1) == '/'
    then
        require('ENV_NIX')
    else
        require('ENV_WIN')
    end
   
	local function magiclines(str)
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
    
    function string:split( inSplitPattern, outResults )
        if not outResults then
            outResults = { }
        end
        local theStart = 1
        local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
        while theSplitStart do
            table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
            theStart = theSplitEnd + 1
            theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
        end
        table.insert( outResults, string.sub( self, theStart ) )
        return outResults
    end    
    
    local function getURLFromBookmark(bookmark)
        local handle = io.popen(string.format(CMD_EXTRACT_URL, bookmark))
        local result = handle:read("*a")
        handle:close()
        return result
    end
    
    local function getURLBrowserCMD(url)
        return string.format(BROWSER_CMD, url)
    end

	local function bookmarksInBrowser(bookmarks)
        if (BROWSER_CMD_SEQ_EXEC == true)
        then
            for bookmark in magiclines(bookmarks) do
                if (string.len(bookmark) > 0)
                then
                    local url = getURLFromBookmark(bookmark)
                    if (not(string.len(url) == 0))
                    then
                        local browserCMD = getURLBrowserCMD(url)
                        os.execute(string.format(CMD_OPEN_URL_IN_BROWSER, browserCMD))
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
            local browserCMD = getURLBrowserCMD(URLstring)
            if (not(string.len(URLstring) == 0))
            then
                os.execute(string.format(CMD_OPEN_URL_IN_BROWSER, browserCMD))
            end
        end
	end

	local function getBookmarkLines()
		local handle = io.popen(string.format(CMD_GET_BOOKMARK_LINE, BOOKMARKS_FILE_PATH, FZF_LAYOUT, FZF_PREVIEW_WINDOW, FZF_PREVIEW))
		
		local result = handle:read("*a")
		handle:close()
		return result
	end

	local bookmarks = getBookmarkLines()
	bookmarksInBrowser(bookmarks)
end
