unit module Lasagna;

constant $EXPECTED-MINUTES-IN-OVEN = 40;

sub remaining-minutes-in-oven ($actual-minutes-in-oven) is export {
	$EXPECTED-MINUTES-IN-OVEN - $actual-minutes-in-oven	
}

sub preparation-time-in-minutes ($number-of-layers) is export {
	2 * $number-of-layers
}

sub total-time-in-minutes ( $number-of-layers, $actual-minutes-in-oven ) is export {
	$actual-minutes-in-oven + preparation-time-in-minutes($number-of-layers)
}

sub oven-alarm () is export {
	"Ding!"
}
