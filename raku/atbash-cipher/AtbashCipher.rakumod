unit module AtbashCipher;

sub encode ($phrase) is export {
    my @encodedCodepoints = reverseCodepoints($phrase);
    loop (my $i = 5; $i < @encodedCodepoints.elems; $i += 6) {
        @encodedCodepoints.splice($i, 0, ' ');
    }
    return @encodedCodepoints.join;
}

sub decode ($phrase) is export {
    reverseCodepoints($phrase).join;
}

sub reverseCodepoints ($phrase) {
    $phrase.lc.comb(/<[a..z\d]>/)>>.ord>>.&({$_ ~~ 97..122 ?? (110 - $_) * 2 + $_ - 1 !! $_})>>.chr
}