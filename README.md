[![Actions Status](https://github.com/thundergnat/Text-Levenshtein/actions/workflows/test.yml/badge.svg)](https://github.com/thundergnat/Text-Levenshtein/actions)

NAME
====

Text::Levenshtein - A port of the Perl 5 Text::Levenshtein

SYNOPSIS
========

Find the Levenshtein edit distance.

This is a direct port of the Perl 5 version and should be close to 100% similar other then some Raku idioms. The fastdistance routine was not ported since the logic was buggy and the code to fix it made it the same speed as the regular distance routine.

```raku
use Text::Levenshtein qw(distance);

print distance("foo","four");
# prints "2"

my @words=("four","foo","bar");
my @distances=distance("foo",@words);

print "@distances";
# prints "2 0 3"
```

DESCRIPTION
===========

This module implements the Levenshtein edit distance. The Levenshtein edit distance is a measure of the degree of proximity between two strings. This distance is the number of substitutions, deletions or insertions ("edits") needed to transform one string into the other one (and vice versa). When two strings have distance 0, they are the same. A good point to start is: [http://www.merriampark.com/ld.htm](http://www.merriampark.com/ld.htm)

AUTHOR
======

Copyright 2002 Dree Mistrut <dree@friul.it>

Raku port: 2010 Steve Schulze

This package is free software and is provided "as is" without express or implied warranty. You can redistribute it and/or modify it under the same terms as Perl itself.

