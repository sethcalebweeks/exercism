# High School Sweetheart

Welcome to High School Sweetheart on Exercism's Crystal Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## String Methods

String has a number of methods that can be used to manipulate strings.  
These methods are called on the string itself, and are often chained together to perform multiple operations on a string.

Following is a list of some of the most common methods, for a full list of methods, see the [String API documentation][string-api].

### String#upcase & String#downcase

The [`upcase`][upcase] method returns a new string with all the characters converted to uppercase.

```crystal
"hello".upcase
# => "HELLO"
```

The [`downcase`][downcase] method returns a new string with all the characters converted to lowercase.

```crystal
"HELLO".downcase
# => "hello"
```

### String#sub & String#gsub

Crystal has methods for replacing parts of a string.
These are known as [`sub`][sub] (_substitution_) and [`gsub`][gsub] (_global substitution_).

These methods can take a string, char or regex as the first argument, and a string or char as the second argument.
The first argument is the part of the string that will be replaced, and the second argument is the replacement.
Chars and regex will be explained at later concepts.

The `sub` method will replace the first occurrence of the first argument with the second argument.

```crystal
"hello".sub("l", "r")
# => "herlo"
```

The `gsub` method works the same as sub but will replace all occurrences of the first argument with the second argument.

```crystal
"hello".gsub("l", "r")
# => "herro"
```

### String#chomp & String#strip

Chomp and strip are methods that can be used to remove unwanted characters from a string.

The [`chomp`][chomp] method will be default remove the last `\r`, `\n` or `\r\n` characters from a string.
If the method is called with an argument, it will remove the given value from the end of the string.
If it does exist at the end of the string.

```crystal
"hello\n".chomp
# => "hello"

"hello".chomp("llo")
# => "he"
```

The [`strip`][strip] method will by default remove all whitespace from the beginning and end of a string.
If the method is called with an argument, it will remove that argument from the beginning and end of the string.
If it does exist at the beginning or end of the string.

```crystal
" hello ".strip
# => "hello"
```

### String#index

The [`index`][index] method can be used to find the index of a character in a string.
The `index` method takes a string, char or regex as an argument.
And can take an optional second argument to specify the index to start searching from.
The `index` method will return the index of the first occurrence of the argument.

```crystal
"hello".index("l")
# => 2

"hello".index("l", 3)
# => 3
```

### String#delete_at

To remove a character from a string, you can use the [`delete_at`][delete_at] method.
The `delete_at` method takes an index as an argument and will remove the character at that index.

```crystal
"hello".delete_at(0)
# => "ello"

"hello".delete_at(3)
# => "helo"
```

### String#insert

The [`insert`][insert] method can be used to insert a string at a specific index.
The `insert` method takes an index as the first argument and a string as the second argument.
The `insert` method will return a new string with the second argument inserted at the index.

```crystal
"hello".insert(0, "h")
# => "hhello"

"hello".insert(3, "l")
# => "helllo"
```

[string-api]: https://crystal-lang.org/api/latest/String.html
[upcase]: https://crystal-lang.org/api/latest/String.html#upcase%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[downcase]: https://crystal-lang.org/api/latest/String.html#downcase%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[sub]: https://crystal-lang.org/api/latest/String.html#sub%28string%3AString%2Creplacement%29%3AString-instance-method
[gsub]: https://crystal-lang.org/api/latest/String.html#gsub%28string%3AString%2Creplacement%29%3AString-instance-method
[chomp]: https://crystal-lang.org/api/latest/String.html#chomp%28suffix%3AString%29%3AString-instance-method
[strip]: https://crystal-lang.org/api/latest/String.html#strip%28chars%3AString%29%3AString-instance-method
[index]: https://crystal-lang.org/api/latest/String.html#index%28search%3AString%2Coffset%3D0%29-instance-method
[delete_at]: https://crystal-lang.org/api/latest/String.html#delete_at%28index%3AInt%29%3AString-instance-method
[insert]: https://crystal-lang.org/api/latest/String.html#insert%28index%3AInt%2Cother%3AString%29%3AString-instance-method

## Instructions

In this exercise, you are going to help high school sweethearts profess their love on social media by generating an ASCII heart with their initial:

```
❤ J.  +  M. ❤
```

## 1. Clean up the name

Implement the `HighSchoolSweetheart.clean_up_name` method.
It should take a name and remove all `-` characters from it and replace them with a space.
It should also remove any whitespace from the beginning and end of the name.

```crystal
HighSchoolSweetheart.clean_up_name("Jane-Ann")
# => "Jane Ann"
```

## 2. Get the name's first letter

Implement the `HighSchoolSweetheart.first_letter` method.
It should take a name and return its first letter.
Make sure to reuse `HighSchoolSweetheart.clean_up_name` that you defined in the previous step.

```crystal
HighSchoolSweetheart.first_letter("Jane")
# => "J"
```

## 3. Format the first letter as an initial

Implement the `HighSchoolSweetheart.initial` method.
It should take a name and return its first letter, uppercase, followed by a dot.
Make sure to reuse `HighSchoolSweetheart.first_letter` that you defined in the previous step.

```crystal
HighSchoolSweetheart.initial("Robert")
# => "R."
```

## 4. Put the initials inside of the heart

Implement the `HighSchoolSweetheart.pair` method.
It should take two names and return the initials with emoji hearts around.
Make sure to reuse `HighSchoolSweetheart.initial` that you defined in the previous step.

```crystal
HighSchoolSweetheart.pair("Blake Miller", "Riley Lewis")
# => "❤ B.  +  R. ❤"
```

## Source

### Created by

- @meatball133

### Contributed to by

- @neenjaw