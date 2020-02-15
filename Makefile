# Copyright 2018 by Shlomi Fish
#
# This program is distributed under the MIT / Expat License:
# L<http://www.opensource.org/licenses/mit-license.php>
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#

SHELL = /bin/bash

all: genhtml

USER = shlomif
REMOTE = $(USER)@web.sourceforge.net:/home/project-web/pysolfc/htdocs/

HTML_PIVOT = htdocs/index.html
PYSOL_SOURCE = ../PySolFC
PYSOL_GAMES_HTML_SOURCE = $(PYSOL_SOURCE)/docs/all_games.html

LOGO_SRC = $(PYSOL_SOURCE)/html-src/images/high_res/logo.png

mga8_webp_src = htdocs/img/PySolFC-mageia8-plasma5--shlomif--grandfathers-clock-lossless.webp
mga8_webp_dest = htdocs/img/PySolFC-mageia8-plasma5--shlomif--grandfathers-clock--reduced.webp
LOGO_DEST      = htdocs/img/pysolfc-logo.webp
REDUCED_IMGS = $(mga8_webp_dest) $(LOGO_DEST)

genhtml: $(HTML_PIVOT) $(REDUCED_IMGS)

INPUTS = $(patsubst %,templates/%,all_games.html index.html screenshots.html _all_games_inc.jinja _header.jinja)

templates/_all_games_inc.jinja: $(PYSOL_GAMES_HTML_SOURCE)
	cp -f $< $@

$(HTML_PIVOT): $(INPUTS)
	python3 pysolfc_static_jinja.py
	bin/batch-inplace-html-minifier -c bin/html-min-cli-config-file.conf --keep-closing-slash htdocs/*.html

# download:
#	rsync -a -v --progress $(REMOTE) ./htdocs

upload:
	rsync -a -v --progress ./htdocs/ $(REMOTE)

test: all
	prove Tests/*.{py,t}

LOGO_HEIGHT = 50

$(LOGO_DEST): $(LOGO_SRC)
	gm convert -resize x$(LOGO_HEIGHT) $< $@

$(mga8_webp_dest): $(mga8_webp_src)
	gm convert -define webp:target-size=230000 $< $@
