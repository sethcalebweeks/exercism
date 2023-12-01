unit module Darts;

sub score-dart ( :$x, :$y ) is export {
    given sqrt($x ** 2 + $y ** 2) {
        when 0..1 {10}
        when 1..5 {5}
        when 5..10 {1}
        default {0}
    }
}
