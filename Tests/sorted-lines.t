#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;

use Test::File::IsSorted ();

# TEST
Test::File::IsSorted::are_sorted( [ ".gitignore", ], "Files are sorted" );
