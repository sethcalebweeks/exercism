unit module Leap;

sub is-leap-year ($year) is export {
	$year % 400 == 0 or ($year % 4 == 0 and $year % 100 != 0)
}
