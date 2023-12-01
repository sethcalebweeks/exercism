sub giga-later ($date) is export {
    DateTime.new($date.posix + 1000000000)
}