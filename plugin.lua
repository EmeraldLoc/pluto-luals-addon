
function OnSetText(uri, text)
    local diffs = {}

    -- handle v: type expressions
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