unit module Text::Levenshtein:ver<0.2.4>:auth<zef:thundergnat>;

sub distance ($s, *@t) is export {

    my $n = $s.chars;
    my @result;

    for @t -> $t {
        @result.push(0)  and next if $s eq $t;
        @result.push($n) and next unless my $m = $t.chars;
        @result.push($m) and next unless $n;

        my @d;

        map { @d[$_; 0] = $_ }, 1 .. $n;
        map { @d[0; $_] = $_ }, 0 .. $m;

        for 1 .. $n -> $i {
            my $s_i = $s.substr($i-1, 1);
            for 1 .. $m -> $j {
                @d[$i; $j] = min @d[$i-1; $j] + 1, @d[$i; $j-1] + 1,
                  @d[$i-1; $j-1] + ($s_i eq $t.substr($j-1, 1) ?? 0 !! 1)
            }
        }
        @result.push: @d[$n; $m];
    }
    @result
}


=begin pod
=head1 NAME

Text::Levenshtein - A port of the Perl 5 Text::Levenshtein

=head1 SYNOPSIS

Find the Levenshtein edit distance.

This is a direct port of the Perl 5 version and should be close to 100% similar
other then some Raku idioms. The fastdistance routine was not ported since the
logic was buggy and the code to fix it made it the same speed as the regular
distance routine.

=begin code :lang<raku>

use Text::Levenshtein qw(distance);

print distance("foo","four");
# prints "2"

my @words=("four","foo","bar");
my @distances=distance("foo",@words);

print "@distances";
# prints "2 0 3"

=end code


=head1 DESCRIPTION

This module implements the Levenshtein edit distance.
The Levenshtein edit distance is a measure of the degree of proximity between two strings.
This distance is the number of substitutions, deletions or insertions ("edits")
needed to transform one string into the other one (and vice versa).
When two strings have distance 0, they are the same.
A good point to start is: L<http://www.merriampark.com/ld.htm>

=head1 AUTHOR

Copyright 2002 Dree Mistrut <F<dree@friul.it>>

Raku port: 2010 Steve Schulze

This package is free software and is provided "as is" without express
or implied warranty.  You can redistribute it and/or modify it under
the same terms as Perl itself.

=end pod
