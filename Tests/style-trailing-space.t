#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use Test::TrailingSpace 0.0201;

{

    my $finder = Test::TrailingSpace->new(
        {
            root           => '.',
            filename_regex =>
qr/(?:(?:\.(?:bash|atom|c|cfg|cgi|cmake|conf|cook|cpp|css|desktop|dsl|dtd|ent|fo|ggr|h|hs|htm|ini|jinja|m|mak|markdown|md|ml|opml|pod|pov|quicktask|rb|rc|rng|Rss|sass|scm|sh|slides|spec|svg|t|tex|tt|ttml|txt|vim|wml|wmlrc|xsl|xslt|yaml|yml|t|pm|pl|PL|yml|json|(?:x?html)|wml|xml|js|mak))|README|Changes|Makefile)\z/,
            abs_path_prune_re => qr%
            \A(?:
            (?:
            # (?:htdocs)/(?:lecture/(?:CMake|HTML-Tutorial/v1/xhtml1/hebrew)|(?:js/MathJax.*?\z))
            )
            |
            # We add node_modules due to Travis-CI build failures. Do not
            # remove!
            node_modules
            )
            %msx,
        },
    );

    # TEST
    $finder->no_trailing_space("No trailing space was found.");
}

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
