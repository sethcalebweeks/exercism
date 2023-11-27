function wordcount(sentence)
    dict = Dict()
    normalized = lowercase(filter(isnotpunctuation, sentence))
    words = filter((word -> word != "'"), split(normalized, delimiters, keepempty=false))
    for word in words
        word = strip(word, '\'')
        dict[word] = get(dict, word, 0) + 1
    end
    return dict
end

function isnotpunctuation(char)
    isletter(char) || isspace(char) || isdigit(char) || char in ",'"
end

function delimiters(char)
    char == ',' || isspace(char)
end