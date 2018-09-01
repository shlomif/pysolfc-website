#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.

"""

"""

from staticjinja import make_site

make_site(outpath='./htdocs/', rules=[(r'^.*~$', lambda f, x:None)]).render()
