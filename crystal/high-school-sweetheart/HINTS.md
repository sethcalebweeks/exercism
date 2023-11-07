# Hints

## General

- Read about strings in the official [String guide][string-guide].
- Browse the [methods available for _Strings_][string-methods].

## 1. Clean up the name

- There is a [built-in method][string-replace] to replace all occurrences of a substring in a string.
- There is a [built-in method][string-strip] to remove leading and trailing whitespaces from a string.

## 2. Get the name's first letter

- To get a specific character from a string, you can use the [indexing operator][string-indexing].

## 3. Format the first letter as an initial

- There is a [built-in method][string-upcase] to convert all characters in a string to their uppercase variant.

## 4. Put the initials inside of the heart

- There is a special syntax for [interpolating][string-interpolation] an expression inside of a string.
- You can put a heart emoji in a string by using escpaing: `\u<id>`, the id for the heart emoji is `2764`.

[string-guide]: https://crystal-lang.org/reference/latest/tutorials/basics/40_strings.html
[string-methods]: https://crystal-lang.org/api/latest/String.html
[string-replace]: https://crystal-lang.org/api/latest/String.html#gsub%28string%3AString%2Creplacement%29%3AString-instance-method
[string-strip]: https://crystal-lang.org/api/latest/String.html#strip%3AString-instance-method
[string-indexing]: https://crystal-lang.org/api/latest/String.html#%5B%5D%28index%3AInt%29%3AChar-instance-method
[string-upcase]: https://crystal-lang.org/api/latest/String.html#upcase%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[string-interpolation]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/string.html#interpolation