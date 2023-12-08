local function flatten(input)
    local result = {}
    for i = 1, #input do
        if type(input[i]) == "table" then
            local nested = flatten(input[i])
            for j = 1, #nested do
                table.insert(result, nested[j])
            end
        else
            table.insert(result, input[i])
        end
    end
    return result
end

return flatten
