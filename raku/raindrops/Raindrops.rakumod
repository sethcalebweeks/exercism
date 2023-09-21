unit module Raindrops;

sub raindrop ($num) is export {
	my $output = '';
	if $num % 3 == 0 { $output ~= 'Pling' };
	if $num % 5 == 0 { $output ~= 'Plang' };
       	if $num % 7 == 0 { $output ~= 'Plong' };
	if $output.chars == 0 { $output = "$num" };
	$output
}
