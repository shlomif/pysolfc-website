#!/usr/bin/perl

use strict;
use warnings;

package Test::HTML::Tidy::Recursive::Tidy5;

use MooX qw/ late /;
use HTML::Tidy5;

extends('Test::HTML::Tidy::Recursive');

sub calc_tidy
{
    my $self = shift;

    return HTML::Tidy5->new( { output_xhtml => 1, } );
}

package main;

my %whitelist = ( map { $_ => 1 } (), );

Test::HTML::Tidy::Recursive::Tidy5->new(
    {
        filename_filter => sub {
            my $fn = shift;
            return
                not( exists $whitelist{$fn} or $fn =~ m#\A htdocs/(?: doc/ ) #x,
                );
        },
        targets => ['./htdocs'],
    }
)->run;

__END__

=head1 COPYRIGHT & LICENSE

Copyright 2018 by Shlomi Fish

This program is distributed under the MIT / Expat License:
L<http://www.opensource.org/licenses/mit-license.php>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=cut
