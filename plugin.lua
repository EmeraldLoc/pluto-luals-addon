
function OnSetText(uri, text)
    local diffs = {}

    -----------------
    --- Operators ---
    -----------------

    -- ++V syntax
    for start, pluses, varName, finish in text:gmatch '()(%+%+)%s*([%w_]+)()' do
        local lineStart = text:sub(1, start):match("^.*()\n") or 1
        diffs[#diffs+1] =  {
            start  = start,
            finish = start + #pluses - 1,
            text   = '',
        }

        diffs[#diffs+1] = {
            start  = lineStart,
            finish = lineStart - 1,
            text   = string.format('%s = %s + 1; ', varName, varName),
        }
    end

    -- V++ syntax
    for start, plusStart, finish in text:gmatch '()[%w_]+()%+%+()' do
        diffs[#diffs+1] = {
            start  = plusStart,
            finish = finish,
            text   = "",
        }
    end

    -- ** syntax
    --[[for start, finish in text:gmatch '%w+()%*%*()%w+' do
        diffs[#diffs+1] = {
            start = start,
            finish = finish,
            text = "^",
        }
    end--]]

    ---------------------
    --- Uncategorized ---
    ---------------------

    -- handle v: type expressions
    -- TODO: BUG: This code applies even in comments, which causes errors!
    for localPos, colonPos, typeName, finish in text:gmatch '()[%w_]+()%s*%:%s*([%w_]+)()' do
        diffs[#diffs+1] = {
            start  = localPos,
            finish = localPos - 1,
            text   = ('---@type %s\n'):format(typeName),
        }
        diffs[#diffs+1] = {
            start  = colonPos,
            finish = finish - 1,
            text   = '',
        }
    end

    -- handle break num expressions
    for start, finish in text:gmatch '()break%s+%d+()' do
        diffs[#diffs+1] = {
            start  = start,
            finish = finish,
            text   = ('break'),
        }
    end

    return diffs
end