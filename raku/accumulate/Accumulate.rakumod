unit module Accumulate;

sub accumulate ( @list, &function ) is export {
	(&function($_) for @list)
}
