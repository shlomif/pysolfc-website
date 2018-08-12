all: genhtml

USER = shlomif
REMOTE = $(USER)@web.sourceforge.net:/home/project-web/pysolfc/htdocs/

HTML_PIVOT = htdocs/index.html

genhtml: $(HTML_PIVOT)

$(HTML_PIVOT): templates/all_games.html templates/index.html templates/screenshots.html templates/_header.jinja
	staticjinja build --outpath htdocs/

# download:
#	rsync -a -v --progress $(REMOTE) ./htdocs

upload:
	rsync -a -v --progress ./htdocs/ $(REMOTE)
