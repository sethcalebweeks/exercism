sub series ($string, $length) is export {
    die "argument error" if $length > $string.chars || $length <= 0;
    my @result;
    loop (my $i = 0; $i <= ($string.chars - $length); $i++) {
        @result.push(substr($string, $i..($i + $length - 1)));
    }
    return @result;
}