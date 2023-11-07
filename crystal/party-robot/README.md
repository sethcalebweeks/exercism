# Party Robot

Welcome to Party Robot on Exercism's Crystal Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Crystal has a type known as [`String`][strings] which is used to represent text.
Crystal strings are sequences of unicode characters.
Strings are immutable, meaning they cannot be changed once created.
This means that every time you do a modification on a string a new string is created, thereby the original string is not modified.

To define a string you can use double quotes `"`.

```crystal
"Hello World"
```

## Concatenation

To concatenate two strings you can use the `+` operator.
The `+` operator will return a new string that is the combination of the two strings given.

```crystal
hello = "Hello"
hello + " World"
# => "Hello World"
```

## Conversation between Strings and numbers

A string can be converted to a number using the `to_i` method, which will return an integer.
Alternatively, the `to_f` method can be used to return a floating point number.
If the string can't be converted to a number then an `ArgumentError` will be raised.

```crystal
"1".to_i
# => 1

"1.0".to_f
# => 1.0

"Hello".to_i
# => ArgumentError: Invalid integer: Hello
```

An integer or floating point number can be converted to a string using the `to_s` method.

```crystal
1.to_s
# => "1"

1.0.to_s
# => "1.0"
```

## Interpolation

Interpolation is a convenient way to combine strings and embeds expressions in strings.
To interpolate a string you can use the `#` character followed by curly braces `{}` with the expression inside the braces.

```crystal
name = "World"
"Hello #{name}!"
# => "Hello World!"
```

Crystal will automatically convert the result of the expression to a string.

```crystal
"Hello #{1 + 1}!"
# => "Hello 2!"
```

## Size

When you need to know the number of characters in a string you can use the `size` method, which will return the length of the string as an integer.
The size of a string is a stored property of the string, so it doesn't have to calculate the size every time you call the method, making it very fast.

```crystal
"Hello World".size
# => 11
```

## Indexing

Indexing is when you want to get a specific character from a string.
To get a character from a string you can use familiar bracket notation.

~~~~exercism/note
`[]` is actually implemented as a String instance method, where the index is the method argument.
~~~~

In Crystal is the first character in a string at index 0.

```crystal
"Hello World"[0]
# => 'H'

"Hello World"[6]
# => 'W'
```

To get a character from the end of a string you can take the length of the string minus one to get the index of the last character and to get the second last character you can take the length of the string minus two and so on.
There is a shortcut for this and that is to simply use a negative index, where the last character is at index -1, the second last character is at index -2, and so on.

```crystal
name = "Hello World"
name[name.size - 1]
# => 'd'

name[-1]
# => 'd'
```

## Escaping

Some characters can't be written in a string directly, instead, you have to use an escape sequence.
For example, if you want to use double quotes in a string, then you have to escape the double quotes.
To write an escape sequence you can use the `\` character followed by the character you want to escape.

These are the special characters in Crystal:

| Value    | Description                   |
| -------- | ----------------------------- |
| `\a`     | Alert                         |
| `\b`     | Backspace                     |
| `\e`     | Escape                        |
| `\f`     | Form feed                     |
| `\n`     | Line feed or newline          |
| `\r`     | Carriage return               |
| `\t`     | Horizontal tab                |
| `\v`     | Vertical tab                  |
| `\\`     | Backslash                     |
| `\'`     | Single quote                  |
| `\"`     | Double quote                  |
| `\377`   | Octal ASCII character         |
| `\xFF`   | Hexadecimal ASCII character   |
| `\uFFFF` | Hexadecimal unicode character |

```crystal
puts "Hello \"World\""
# => Hello "World"

puts "Hello \nWorld"
# => Hello
# => World
```

## Multi-line strings

To write a multi-line string you simply use the same syntax as a single-line string but make a new line for every line you want in the string.

```crystal
"Hello
World"
# => "Hello\nWorld"
```

[strings]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/string.html

## Instructions

Once there was an eccentric programmer living in a strange house with barred windows.
One day he accepted a job from an online job board to build a party robot. The
robot is supposed to greet people and help them to their seats. The first edition
was very technical and showed the programmer's lack of human interaction. Some of
which also made it into the next edition.

## 1. Welcome a new guest to the party

Implement the `welcome` method to return a welcome message using the given name:

```crystal
PartyRobot.welcome("Christiane")
# => Welcome to my party, Christiane!
```

## 2. Welcome a new guest to the party whose birthday is today

Implement the `happy_birthday` method to return a birthday message using the given name and age of the person.
Unfortunately the programmer is a bit of a show-off, so the robot has to demonstrate its knowledge of every guest's birthday.

```crystal
PartyRobot.happy_birthday("Frank", 58)
# => Happy birthday Frank! You are now 58 years old!
```

## 3. Give directions

Implement the `assign_table` function to give directions.
It should accept 5 parameters.

- The name of the new guest to greet (`String`)
- The table number (`Int`)
- The name of the seatmate (`String`)
- The direction where to find the table (`String`)
- The distance to the table (`Float64`)

The exact result format can be seen in the example below.

The seatmate's should be shorted to the first and last letter of the name.
Frank becomes Fk, Christian becomes Cn, and so on.

The robot provides the table number.
The robot also mentions the distance of the table.
Fortunately only with a precision that's limited to 1 digit.

```crystal
PartyRobot.assign_table("Christiane", "on the left", 27, 23.7834298, "Frank")
# =>
# Welcome to my party, Christiane!
# You have been assigned to table 27. Your table is on the left, exactly 23.8 meters from here.
# You will be sitting next to Fk.
```

## Source

### Created by

- @meatball133

### Contributed to by

- @glennj