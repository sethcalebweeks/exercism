unit module Luhn;

sub is-luhn-valid ($input) is export {
    return False if $input ~~ /<-[\d\s]>/;
    my @digits = $input.comb(/\d/).reverse>>.unival;
    return False if @digits ~~ [0];
    my @even = @digits[1, 3 ... *]>>.&({$_ * 2 > 9 ?? $_ * 2 - 9 !! $_ * 2});
    return (@digits[0, 2 ... *].sum + @even.sum) % 10 == 0;
}
